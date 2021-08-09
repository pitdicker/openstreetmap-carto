# Vector pattern generation


## Basic hatches

### `allotments.svg`
![Preview](../landuse/allotments.svg)
Tiles of 8×8px.
Dots with a radius of 0.95px in a rectangular 8×8 grid (color: `#f2efe9`).

### `orchard.svg`
![Preview](../landuse/orchard.svg)
Tiles of 8×8px.
Square dots of 1px in a rectangular 8×8 grid (color: `#759e6c`).

### `danger_red_hatch.png`
![Preview](../landuse/danger_red_hatch.svg)
Tiles of 32×32px.
Diagonal lines with a horizontal distance of 16px on top of a background of `#ff5555` with 10% opacity.
Every line has a width of 2√2px (color: `#ff5555` and 10% opacity).

### `military_red_hatch.png`
![Preview](../landuse/military_red_hatch.svg)
Tiles of 32×32px.
Diagonal lines with a horizontal distance of 16px on top of a background of `#ff5555` with 8% opacity.
Every line has a width of ½√2px (color: `#ff5555` and 12% opacity).

### `grey_vertical_hatch.png`
![Preview](../landuse/grey_vertical_hatch.svg)
Tiles of 32×32px.
Vertical lines with a distance of 16px on top of a background of `#8e8e8e` with 14% opacity.
Every line has a width of 3px (color: `#8e8e8e` and 33% opacity).

### `intermittent_water.png`
![Preview](../landuse/intermittent_water.svg)
Tiles of 32×32px.
Horizontal lines with a width of 2px, repeated every 4px (color: `#aad3df`).


## Random dot patterns

### `plant_nursery.svg`
![Preview](../landuse/plant_nursery.svg)
Tiles of 128×128px.
Square dots of 1px in a triangular grid with a 6px distance (color: `#0e5500` and 57.5% opacity).
Positions generated with [jsdotpattern](http://www.imagico.de/map/jsdotpattern.php#x,128,jdp32360;gv,6,32,32;rd,1,0,0,pixel,0.125,4,4,0,jdp23814,749d6c,aedea3;)
The positions are rounded down, sorted by y-coordinates, and saved in `plant_nursery.txt`.
Final svg generated with `pattern.awk` from `plant_nursery.txt`.

### `salt_dots.svg`
![Preview](../landuse/salt_dots.svg)
Tiles of 256×256px.
Dots in a random pattern (color: `#ffffff`).
Positions generated with [jsdotpattern](http://www.imagico.de/map/jsdotpattern.php#x,256,jdp68152;g,5,32,32;rx,25,2,32,32;rx,25,2,32,32;rx,25,2,32,32;rd,0,0,0,dot,0.125,10,9,0,jdp48264,ffffff,cdebb0;).
The positions are rounded to two decimals, repeated across tile boundaries, and saved in `salt_dots.txt`.
The dots are offset by -0.05,-0.05px to align with a pre-existing svg.
The coordinates have to be offset with -0.05,-0.05 because the circle in jsdotpattern is not correctly aligned. Final svg generated with `pattern.awk` from `salt_dots.txt`.

### `beach.svg`
![Preview](../landuse/beach.svg)
Tiles of 128×128px.
Dots in a random pattern (color: `#685d45` and 40% opacity).
Positions generated with [jsdotpattern](http://www.imagico.de/map/jsdotpattern.php#x,128,jdp59980;g,2.25,16,16;rx,250,2,8,8;rx,250,2,8,8;s,jdp58799;s,jdp49103;rx,250,2,8,8;rd,0,0,1,scree,0.1,5,10,0,jdp31724,dbb677,fff1ba;), rounded to two decimals and repeated across tile boundaries.
⅔th of the dots have a radius of 0.85px, ⅙th of 0.8px, and ⅙th of 1px.
Their distribution is based on the appearence of a pre-existing svg, with the positions saved in `beach.txt`.
Final svg generated with `pattern.awk` from `beach.txt`.

### `scree.svg`
![Preview](../landuse/scree.svg)
Tiles of 256×256px.
Dots and lines in a random pattern (color: `#cbc9c6`).
Positions generated with jsdotpattern, command sequence unknown.
⅔th of the dots have a radius of 1px, ⅙th of 1.2px, and ⅙th are a short line of 0.8px wide.
Their distribution is based on the appearence of a pre-existing svg, with the positions saved in `scree.txt`.
Final svg generated with `pattern.awk` from `scree.txt`.

### `reef.svg`
![Preview](../landuse/reef.svg)
Tiles of 256×256px.
Based on `scree.svg`, color: `#549ccd`.

### `beach_coarse.svg`
![Preview](../landuse/beach_coarse.svg)
Tiles of 256×256px.
Based on `scree.svg`, color: `#969696`.


## Patterns with symbols

### `dog_park.svg`
![Preview](../landuse/dog_park.svg)
Tiles of 32x32px.
Two dog paw prints based on `shop/pet.svg`, scaled to 10x10px (color: `#a6e0ab`and 70% opacity).

### `scrub.svg`
![Preview](../landuse/scrub.svg)
512x512 tiles.
Random pattern of scrub symbols (color: `#b0be93`).
Positions generated with  [jsdotpattern](http://www.imagico.de/map/jsdotpattern.php#x,512,jdp60679;g,24,64,64;rx,25,2,64,64;rx,25,2,64,64;rx,25,2,64,64;rx,25,2,64,64;rd,1,1,0,scrub2,1,5,5,0,jdp97432,b0be93,c8d7ab;).
The positions are rounded down, repeated across tile boundaries, and saved in `scrub.txt`.
Final svg generated with `pattern.awk` from `scrub.txt`.
