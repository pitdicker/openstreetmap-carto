# PATTERN GENERATION SCRIPT
# License: CC0 or MIT, (c) 2021 Paul Dicker
#
# Please note: This is a very basic script that doesn't make any attempt to
# handle invalid inputs, or any complexity that was not necessary for the
# current patterns.

BEGIN {
	INDIVIDUAL_PATH_LIMIT = 38
	TRUE = 1
	FALSE = 0
	HORIZONTAL = 1
	VERTICAL = 0
	size = 0
	i = 0
	id = ""
	id_counter = 0
	pat_nr = 0
	clip = FALSE
	canvas = FALSE
}

#! /bin/awk -f
{
	if (/^Size: /) {
		new_size = substr($0, 7) + 0
		if (size == 0) {
			size = new_size
		} else if (new_size != size) {
			# Concatenating two patterns is allowed, but only if they are the same size
			printf("ERROR: Found two patterns with different tile sizes\n") >> "/dev/stderr"
			exit
		}
	} else if (/^Workaround: /) {
		if (split($0, workaround, /[, ]/) > 2) {
			off_x = workaround[2]
			off_y = workaround[3]
		}
		if (/clip/) clip = TRUE
		if (/canvas/) canvas = TRUE
	} else if (/^Style: /) {
		finish_pattern()
		Pattern[pat_nr, "style"] = substr($0, 8)
	} else if (/^Path: /) {
		finish_pattern()
		path = substr($0, 7)
		if (path ~ /.*[MZLHVCSQTA].*/) {
			printf("ERROR: Found path with absolute commands\n") >> "/dev/stderr"
			exit
		}
		if (match(path, /^m\-?[\.0-9]+,\-?[\.0-9]+/) != 0) {
			moveto = substr(path, 2, RLENGTH-1)
			path = substr(path, RLENGTH+1)
			sub(/^ */, "", path)
			if (split(moveto, xy, ",") != 2)
				printf("ERROR: invalid coordinate %s\n", $0) >> "/dev/stderr"
			Pattern[pat_nr, "off_x"] = xy[1]
			Pattern[pat_nr, "off_y"] = xy[2]
		} else {
			printf("ERROR: Found path with missing moveto: \"%s\"\n", path) >> "/dev/stderr"
		}
		Pattern[pat_nr, "path"] = path

		id = FILENAME
		id_counter++
		sub(/.*\//, "", id)
		sub(/\.txt/, id_counter, id)
		Pattern[pat_nr, "id"] = id
	} else if (/^Casing: /) {
		finish_pattern()
		n = split(substr($0, 9), parts, " ")
		y = parts[1] + 0
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
		x = xy[1] + off_x
		y = xy[2] + off_y
		if (clip == TRUE) {
			x = (x + size) % size
			y = (y + size) % size
		}
		Pattern[pat_nr, i, "x"] = x
		Pattern[pat_nr, i, "y"] = y
		i++
	}
}

function finish_pattern() {
	if ((pat_nr, 0, "x") in Pattern) {
		Pattern[pat_nr, "coords"] = i
		pat_nr++
		i = 0
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

function move_xy(x, y, direction) {
	if (direction == HORIZONTAL && y != current_y || direction == VERTICAL && x != current_x) {
		printf("\nM%g,%g", x + Pattern[pat_nr, "off_x"], y + Pattern[pat_nr, "off_y"])
	} else {
		printf(" m%g,%g", x - current_x, y - current_y)
	}
	current_y = y
	current_x = x
}

END {
	finish_pattern()
	pattern_count = pat_nr

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
	printf("<svg xmlns=\"http://www.w3.org/2000/svg\"%s width=\"%i\" height=\"%i\" viewBox=\"0 0 %i %i\">\n", xlink, size, size, size, size)

	if (use_def == TRUE) {
		printf("  <defs>\n")
		for (pat_nr = 0; pat_nr < pattern_count; pat_nr++) {
			if (length(Pattern[pat_nr, "path"]) > INDIVIDUAL_PATH_LIMIT) {
				printf("    <path id=\"%s\" %s d=\"m%g,%g %s\"/>\n", Pattern[pat_nr, "id"], Pattern[pat_nr, "style"], Pattern[pat_nr, "off_x"], Pattern[pat_nr, "off_y"], Pattern[pat_nr, "path"])
			}
		}
		printf("  </defs>\n")
	}

	if (canvas == TRUE) {
		printf("  <rect id=\"mapnik_workaround\" width=\"%i\" height=\"%i\" fill=\"none\"/>\n", size, size)
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
						# Try to move the symbol to an adjacent tile if there is no match
						if (symbol_x + right < x1) {
							symbol_x += size
						} else if (symbol_x + left > x2) {
							symbol_x -= size
						}
						if (symbol_y + bottom < y) {
							symbol_y += size
						} else if (symbol_y + top > y) {
							symbol_y -= size
						}
						# Quick check if the line falls inside the boundig box of the symbol
						if (y <= symbol_y + top || y >= symbol_y + bottom ||
						    x2 <= symbol_x + left || x1 >= symbol_x + right) {
							continue
						}
						# Apply the casing
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
									move_xy(x1, y, HORIZONTAL)
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
				# Draw te line, wrapping around on the tile edge
				if (x2 - x1 > 1) {
					if (x2 > size) {
						move_xy(x1, y, HORIZONTAL)
						printf(" h%g", size - x1)
						current_x = size
						move_xy(0, y, HORIZONTAL)
						printf(" h%g", x2 - size)
						current_x = x2 - size
					} else {
						move_xy(x1, y, HORIZONTAL)
						printf(" h%g", x2 - x1)
						current_x = x2
					}
				}
			}
			printf("\"/>\n")
		} else {
			printf("  <path %s d=\"", Pattern[pat_nr, "style"])
			for (i = 0; i < Pattern[pat_nr, "coords"]; i++) {
				if (Pattern[pat_nr, "path"] ~ /^[vh] *-?[0-9\.]+$/) {
					len = substr(Pattern[pat_nr, "path"], 2) +0
					x1 = Pattern[pat_nr, i, "x"]
					y1 = Pattern[pat_nr, i, "y"]
					if (Pattern[pat_nr, "path"] ~ /v.*/) {
						if (clip == TRUE && y1 + len > size - Pattern[pat_nr, "off_y"]) {
							move_xy(x1, y1, VERTICAL)
							printf(" v%g", size - Pattern[pat_nr, "off_y"] - y1)
							current_y = size
							move_xy(x1, 0, VERTICAL)
							printf(" v%g", y1 + len - size + Pattern[pat_nr, "off_y"])
							current_y = y1 + len - size + Pattern[pat_nr, "off_y"]
						} else {
							move_xy(x1, y1, VERTICAL)
							current_y += len
							printf(" v%g", len)
						}
					} else {
						if (clip == TRUE && x1 + len > size - Pattern[pat_nr, "off_x"]) {
							move_xy(x1, y1, HORIZONTAL)
							printf(" h%g", size - Pattern[pat_nr, "off_x"] - x1)
							current_x = size
							move_xy(0, y1, HORIZONTAL)
							printf(" h%g", x1 + len - size + Pattern[pat_nr, "off_x"])
							current_x = x1 + len - size + Pattern[pat_nr, "off_x"]
						} else {
							move_xy(x1, y1, HORIZONTAL)
							current_x += len
							printf(" h%g", len)
						}
					}
				} else {
					printf("\nM%g,%g %s", Pattern[pat_nr, i, "x"] + Pattern[pat_nr, "off_x"], Pattern[pat_nr, i, "y"] + Pattern[pat_nr, "off_y"], Pattern[pat_nr, "path"])
				}
			}
			printf("\"/>\n")
		}
	}

	printf("</svg>\n")
}
