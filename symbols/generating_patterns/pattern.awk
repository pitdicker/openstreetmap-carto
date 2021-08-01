BEGIN {
	style = ""
	i = 0
	path = ""
}

#! /bin/awk -f
{
	if (/^Size: /) {
		size = substr($0, 7) + 0
		printf("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n")
		printf("<svg version=\"1.1\" width=\"%i\" height=\"%i\" viewBox=\"0 0 %i %i\" xmlns=\"http://www.w3.org/2000/svg\">\n", size, size, size, size)
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
	} else if (/^Background: /) {
		background = substr($0, 13)
		printf("  <rect width=\"%i\" height=\"%i\" fill=\"%s\"/>\n", size, size, background)
	} else if (/^jsdotpattern: /) {
		#ignore
	} else if (/.+/) {
	    points[i] = $0
		if (length(path) < 7) {
			printf("M%s %s", points[i], path)
		} else {
			printf("  <path d=\"M%s %s\" %s/>\n", points[i], path, style)
		}
		i++
	}
}


END {
	if (length(path) < 7) {
		printf("\" %s/>\n", style)
	}
	printf("</svg>")
}
