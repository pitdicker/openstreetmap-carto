BEGIN {
	FS = ","
	# offset between coordinates and symbol origin
	off_x = -4
	off_y = 9.5
	# How much does the symbol extend to the left, right, top and bottom (positive is to the outside)?
	left = 0
	right = 7
	top = 5.5
	bottom = 0.5
	# tile size
	width = 512
	height = 512
}

#! /bin/awk -f
{
	x = int($1) + off_x
	y = int($2) + off_y
	if (x + right > 0 && x - left < width && y + bottom > 0 && y - top) {
		printf("%g,%g\n", x, y)
	}
	if (x - left < 0)
		printf("%g,%g\n", x + width, y)
	if (x + right > width)
		printf("%g,%g\n", x - width, y)
	if (y - top < 0)
		printf("%g,%g\n", x, y + height)
	if (y + bottom > height)
		printf("%g,%g\n", x, y - height)

	if (x - left < 0 && y - top < 0)
		printf("%g,%g\n", x + width, y + height)
	if (x - left < 0 && y + bottom > height)
		printf("%g,%g\n", x + width, y - height)
	if (x + right > width && y - top < 0)
		printf("%g,%g\n", x - width, y + height)
	if (x + right > width && y + bottom > height)
		printf("%g,%g\n", x - width, y - height)
}
