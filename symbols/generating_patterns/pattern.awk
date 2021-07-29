BEGIN {
	color = ""
	i = 0
	# SVG encoding methods:
	# 0: multiple paths
	# 1: single path
	# 2: use statements
	method = 0
}

#! /bin/awk -f
{
	if (/^Size: /) {
		size = substr($0, 7) + 0
		printf("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n")
		printf("<svg version=\"1.1\" width=\"%i\" height=\"%i\" viewBox=\"0 0 %i %i\" xmlns=\"http://www.w3.org/2000/svg\">\n", size, size, size, size)
	} else if (/^Path: /) {
		path = substr($0, 7)
	} else if (/^Color: /) {
		color = substr($0, 8)
	} else if (/^Background: /) {
		background = substr($0, 13)
		printf("  <rect width=\"%i\" height=\"%i\" fill=\"%s\"/>\n", size, size, background)
	} else if (/^Method: multiple paths$/) {
		method = 0
	} else if (/^Method: single path$/) {
		method = 1
	} else if (/^jsdotpattern: /) {
		#ignored
	} else if (/.+/) {
		points[i] = $0
		printf("  <path d=\"M%s%s\" fill=\"%s\"/>\n", points[i], path, color)
		i++
	}
}


END {
	n = i
	if (method == 0) {
		for (i=0; i<n; i++) {
#			printf("  <path d=\"M%s%s\" fill=\"%s\"/>\n", points[i], path, color)
		}
	} else if (method == 1) {
		printf("  <path d=\"")
		for (i=0; i<n; i++) {
			if (i != 0)
				printf(" ")
			printf("M%s%s", points[i], path)
		}
		printf("\" fill=\"%s\"/>\n", color)
	}
	printf("</svg>")
}
