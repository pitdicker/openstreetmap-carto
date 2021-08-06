# PATTERN GENERATION SCRIPT
# License: CC0 or MIT, (c) 2021 Paul Dicker
#
# Please note: This is a very basic script that doesn't make any attempt to
# handle invalid inputs, or any complexity that was not necessary for the
# current patterns.

BEGIN {
	INDIVIDUAL_PATH_LIMIT = 45
	TRUE = 1
	FALSE = 0
	size = 0
	i = 0
	id = ""
	id_counter = 0
	pat_nr = 0
}

#! /bin/awk -f
{
	if (/^Size: /) {
		new_size = substr($0, 7) + 0
		if (size == 0) {
			size = new_size
		} else if (new_size != size) {
			# Concatenating two patterns is allowed, but only if they are the same size
			printf("ERROR: Found two patterns with different tile sizes\n", $0) >> "/dev/stderr"
			exit
		}
	} else if (/^Style: /) {
		if ((pat_nr, 0, "x") in Pattern) {
			Pattern[pat_nr, "coords"] = i
			pat_nr++
			i = 0
		}
		Pattern[pat_nr, "style"] = substr($0, 8)
	} else if (/^Path: /) {
		if ((pat_nr, 0, "x") in Pattern) {
			Pattern[pat_nr, "coords"] = i
			pat_nr++
			i = 0
		}
		Pattern[pat_nr, "path"] = substr($0, 7)
		id = FILENAME
		id_counter++
		sub(/\.txt/, id_counter, id)
		Pattern[pat_nr, "id"] = id
		if (length(Pattern[pat_nr, "path"]) < INDIVIDUAL_PATH_LIMIT) {
			# FIXME: generalize
			sub(/m0,0 /, "", Pattern[pat_nr, "path"])
		}
	} else if (/^Casing: /) {
		n = split(substr($0, 9), parts, " ")
		y = parts[1] + 0
		if ((pat_nr, 0, "x") in Pattern) {
			Pattern[pat_nr, "coords"] = i
			pat_nr++
			i = 0
		}
		Pattern[pat_nr, "casing", "top"] = y
		Pattern[pat_nr, "casing", "left"] = 1000
		Pattern[pat_nr, "casing", "right"] = -1000
		for (j=2; j<=n; j++) {
			if (split(parts[j], left_right, "|") != 2)
				printf("ERROR: invalid casing pair %s\n", xy)
			left = left_right[1]
			right = left_right[2]
			if (left < Pattern[pat_nr, "casing", "left"])
				Pattern[pat_nr, "casing", "left"] = left
			if (right > Pattern[pat_nr, "casing", "right"])
				Pattern[pat_nr, "casing", "right"] = right
			Pattern[pat_nr, "casing", y, "left"] = left
			Pattern[pat_nr, "casing", y, "right"] = right
			y++
		}
		Pattern[pat_nr, "casing", "bottom"] = y
	} else if (/.+/) {
		if (split($0, xy, ",") != 2)
			printf("ERROR: invalid coordinate %s\n", $0) >> "/dev/stderr"
		Pattern[pat_nr, i, "x"] = xy[1]
		Pattern[pat_nr, i, "y"] = xy[2]
		i++
	}
}

function max(a, b) {
	if (a > b) return a
	else return b
}

function min(a, b) {
	if (a < b) return a
	else return b
}

function move_xy(x, y) {
	if (y != current_y) {
		printf("\nM%g,%g", x, y)
	} else {
		printf(" m%g,0", x - current_x)
	}
	current_y = y
	current_x = x
}

END {
	Pattern[pat_nr, "coords"] = i
	pattern_count = pat_nr + 1

	style = ""
	for (pat_nr = 0; pat_nr < pattern_count; pat_nr++) {
		if (!((pat_nr, "style") in Pattern)) {
			Pattern[pat_nr, "style"] = style
		}
		style = Pattern[pat_nr, "style"]
	}
	
	use_def = FALSE
	for (pat_nr = 0; pat_nr < pattern_count; pat_nr++) {
		if (length(Pattern[pat_nr, "path"]) > INDIVIDUAL_PATH_LIMIT) {
			use_def = TRUE
			break
		}
	}
	if (use_def == TRUE) {
		xlink = " xmlns:xlink=\"http://www.w3.org/1999/xlink\""
	}
	printf("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n")
	printf("<svg version=\"1.1\" width=\"%i\" height=\"%i\" viewBox=\"0 0 %i %i\" xmlns=\"http://www.w3.org/2000/svg\"%s>\n", size, size, size, size, xlink)

	if (use_def == TRUE) {
		printf("  <defs>\n")
		for (pat_nr = 0; pat_nr < pattern_count; pat_nr++) {
			if (length(Pattern[pat_nr, "path"]) > INDIVIDUAL_PATH_LIMIT) {
				printf("    <path id=\"%s\" %s d=\"%s\"/>\n", Pattern[pat_nr, "id"], Pattern[pat_nr, "style"], Pattern[pat_nr, "path"])
			}
		}
		printf("  </defs>\n")
	}

	for (pat_nr = 0; pat_nr < pattern_count; pat_nr++) {
		current_x = 0
		current_y = 0
		if (length(Pattern[pat_nr, "path"]) > INDIVIDUAL_PATH_LIMIT) {
			for (i = 0; i < Pattern[pat_nr, "coords"]; i++) {
				printf("  <use x=\"%g\" y=\"%g\" xlink:href=\"#%s\"/>\n", Pattern[pat_nr, i, "x"], Pattern[pat_nr, i, "y"], Pattern[pat_nr, "id"])
			}
		} else if (Pattern[pat_nr, "path"] == "h7") {
			# Special case the wetland patterns
			printf("  <path %s d=\"", Pattern[pat_nr, "style"])
			for (i = 0; i < Pattern[pat_nr, "coords"]; i++) {
				x1 = Pattern[pat_nr, i, "x"]
				y = Pattern[pat_nr, i, "y"]
				x2 = x1 + 7
				for (p=0; p<pat_nr; p++) {
					if (!(p, "casing", "top") in Pattern) {
						break
					}
					top = Pattern[p, "casing", "top"]
					bottom = Pattern[p, "casing", "bottom"]
					left = Pattern[p, "casing", "left"]
					right = Pattern[p, "casing", "right"]
					for (j = 0; j < Pattern[p, "coords"]; j++) {
						symbol_x = Pattern[p, j, "x"]
						symbol_y = Pattern[p, j, "y"]
						if (y <= symbol_y + top || y >= symbol_y + bottom || x2 <= symbol_x + left || x1 >= symbol_x + right) {
							continue
						}
						index_y = int(y) - int(symbol_y)
						casing_left = Pattern[p, "casing", index_y, "left"]
						casing_right = Pattern[p, "casing", index_y, "right"]
						if (x1 >= symbol_x + casing_left && x2 <= symbol_x + casing_right) {
							# line is completely behind this symbol
							x2 = x1
						} else if (x2 > symbol_x + casing_right) {
							if (x1 < symbol_x + casing_left) {
								x3 = symbol_x + casing_left
								# Special case: the line is broken in two by the symbol
								if (x3 - x1 > 1) {
									move_xy(x1, y)
									printf(" h%g", x3 - x1)
									current_x = x3
								}
							}
							x1 = max(symbol_x + casing_right, x1)
						} else if (x1 < symbol_x + casing_left) {
							x2 = min(symbol_x + casing_left, x2)
						}
					}
				}
				if (x2 - x1 > 1) {
					move_xy(x1, y)
					printf(" h%g", x2 - x1)
					current_x = x2
				}
			}
			printf("\"/>\n")
		} else {
			printf("  <path %s d=\"", Pattern[pat_nr, "style"])
			for (i = 0; i < Pattern[pat_nr, "coords"]; i++) {
				# TODO: generalize this hack
				if (Pattern[pat_nr, "path"] == "h7") {
					move_xy(Pattern[pat_nr, i, "x"], Pattern[pat_nr, i, "y"])
					printf(" h7")
					current_x += 7
				} else {
					printf("\nM%g,%g %s", Pattern[pat_nr, i, "x"], Pattern[pat_nr, i, "y"], Pattern[pat_nr, "path"])
				}
			}
			printf("\"/>\n")
		}
	}

	printf("</svg>")
}
