# PATTERN GENERATION SCRIPT
# License: CC0 or MIT, (c) 2021 Paul Dicker
#
# Please note: This is a very basic script that doesn't make any attempt to
# handle invalid inputs, or any complexity that was not necessary for the
# current patterns.

BEGIN {
	INDIVIDUAL_PATH_LIMIT = 40
	size = 0
	style = ""
	i = 0
	path = ""
	id = ""
	id_counter = 0
	current_x = 0
	current_y = 0
}

#! /bin/awk -f
{
	if (/^Size: /) {
		if (size == 0) {
			size = substr($0, 7) + 0
			printf("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n")
			printf("<svg version=\"1.1\" width=\"%i\" height=\"%i\" viewBox=\"0 0 %i %i\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\">\n", size, size, size, size)
		}
	} else if (/^Style: /) {
		style = substr($0, 8)
	} else if (/^Path: /) {
		if (path != "") {
			if (length(path) < INDIVIDUAL_PATH_LIMIT) {
				printf("\"/>\n")
			}
		}
		path = substr($0, 7)
		if (length(path) < INDIVIDUAL_PATH_LIMIT) {
			printf("  <path %s d=\"", style)
		} else {
			id = FILENAME
			id_counter++
			sub(/\.txt/, id_counter, id)
			printf("  <defs>\n    <path id=\"%s\" %s d=\"%s\"/>\n  </defs>\n", id, style, path)
		}
	} else if (/^Casing: /) {
		n = split(substr($0, 9), parts, " ")
		y = parts[1] + 0
		casing["top"] = y
		casing["left"] = 1000
		casing["right"] = -1000
		for (j=2; j<=n; j++) {
			if (split(parts[j], left_right, "|") != 2)
				printf("ERROR: invalid casing pair %s\n", xy)
			left = left_right[1]
			right = left_right[2]
			if (left < casing["left"])
				casing["left"] = left
			if (right > casing["right"])
				casing["right"] = right
			casing[y, "left"] = left
			casing[y, "right"] = right
			y++
		}
		casing["bottom"] = y - 1
	} else if (/^Background: /) {
		background = substr($0, 13)
		printf("  <rect width=\"%i\" height=\"%i\" fill=\"%s\"/>\n", size, size, background)
	} else if (/^jsdotpattern: /) {
		#ignore
	} else if (/.+/) {
		# Special case the wetland patterns
		if (path == "h7" && "top" in casing) {
			if (split($0, xy, ",") != 2)
				printf("ERROR: invalid coordinate %s\n", $0) >> "/dev/stderr"
			x1 = xy[1]
			y = xy[2]
			x2 = x1 + 7
			for (p=0; p<i; p++) {
				symbol_x = points_x[p]
				symbol_y = points_y[p]
				if (y < symbol_y + casing["top"] || y > symbol_y + casing["bottom"] || x2 < symbol_x + casing["left"] || x1 > symbol_x + casing["right"]) {
					continue
				}
				index_y = int(y) - symbol_y
				if (x1 >= symbol_x + casing[index_y, "left"] && x2 <= symbol_x + casing[index_y, "right"]) {
					# line is completely behind this symbol
					break
				}
				if (x2 > symbol_x + casing[index_y, "right"]) {
					if (x1 < symbol_x + casing[index_y, "left"]) {
						x3 = symbol_x + casing[index_y, "left"]
						# Special case: the line is broken in two by the symbol
						if (x3 - x1 > 1) {
							move_xy(x1, y)
							printf(" h%g", x3 - x1)
							current_x = x3
						}
					}
					x1 = max(symbol_x + casing[index_y, "right"], x1)
				} else if (x1 < symbol_x + casing[index_y, "left"]) {
					x2 = min(symbol_x + casing[index_y, "left"], x2)
				}
			}
			if (x2 - x1 > 1 && p == i) {
				move_xy(x1, y)
				printf(" h%g", x2 - x1)
				current_x = x2
			}
		} else {
			if (split($0, xy, ",") != 2)
				printf("ERROR: invalid coordinate %s\n", $0) >> "/dev/stderr"
			points_x[i] = xy[1]
			points_y[i] = xy[2]
			if (length(path) < INDIVIDUAL_PATH_LIMIT) {
				# TODO: generalize this hack
				if (path == "h7") {
					move_xy(xy[1], xy[2])
					printf(" h7")
					current_x += 7
				} else {
					printf("\nM%s %s", $0, path)
				}
			} else {
#				printf("  <path d=\"M%s %s\" %s/>\n", $0, path, style)
				printf("  <use x=\"%g\" y=\"%g\" xlink:href=\"#%s\"/>\n", points_x[i], points_y[i], id)
			}
			i++
		}
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
	if (length(path) < INDIVIDUAL_PATH_LIMIT) {
		printf("\"/>\n")
	}
	printf("</svg>")
}
