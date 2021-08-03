BEGIN {
	size = 0
	style = ""
	i = 0
	path = ""
}

#! /bin/awk -f
{
	if (/^Size: /) {
		if (size == 0) {
			size = substr($0, 7) + 0
			printf("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n")
			printf("<svg version=\"1.1\" width=\"%i\" height=\"%i\" viewBox=\"0 0 %i %i\" xmlns=\"http://www.w3.org/2000/svg\">\n", size, size, size, size)
		}
	} else if (/^Path: /) {
		if (path != "") {
			if (length(path) < 7) {
				printf("\" %s/>\n", style)
			}
		}
		path = substr($0, 7)
		if (length(path) < 7) {
			printf("  <path d=\"")
		}
	} else if (/^Style: /) {
		style = substr($0, 8)
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
						if (x3 - x1 > 1)
							printf(" M%g,%g h%g", x1, y, x3 - x1)
					}
					x1 = max(symbol_x + casing[index_y, "right"], x1)
				} else if (x1 < symbol_x + casing[index_y, "left"]) {
					x2 = min(symbol_x + casing[index_y, "left"], x2)
				}
			}
			if (x2 - x1 > 1 && p == i) {
				printf(" M%g,%g h%g", x1, y, x2 - x1)
			}
		} else {
			if (split($0, xy, ",") != 2)
				printf("ERROR: invalid coordinate %s\n", $0) >> "/dev/stderr"
			points_x[i] = xy[1]
			points_y[i] = xy[2]
			i++
			if (length(path) < 7) {
				printf("M%s %s", $0, path)
			} else {
				printf("  <path d=\"M%s %s\" %s/>\n", $0, path, style)
			}
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

END {
	if (length(path) < 7) {
		printf("\" %s/>\n", style)
	}
	printf("</svg>")
}
