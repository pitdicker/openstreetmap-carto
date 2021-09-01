src = ../patterns/src
dst = ../patterns

all: $(dst)/beach.svg $(dst)/beach_coarse.svg $(dst)/reef.svg $(dst)/scree.svg $(dst)/leaftype_broadleaved.svg $(dst)/leaftype_leafless.svg $(dst)/leaftype_mixed.svg $(dst)/leaftype_needleleaved.svg $(dst)/leaftype_unknown.svg $(dst)/plant_nursery.svg $(dst)/quarry.svg $(dst)/salt_dots.svg $(dst)/salt_pond.svg $(dst)/scrub.svg $(dst)/vineyard.svg $(dst)/wetland.svg $(dst)/wetland_bog.svg $(dst)/wetland_mangrove.svg $(dst)/wetland_marsh.svg $(dst)/wetland_reed.svg $(dst)/wetland_swamp.svg

$(dst)/beach.svg: pattern.awk $(src)/beach.txt
	awk -f pattern.awk $(src)/beach.txt > $(dst)/beach.svg

$(dst)/beach_coarse.svg: pattern.awk $(src)/beach_coarse.txt
	awk -f pattern.awk $(src)/beach_coarse.txt > $(dst)/beach_coarse.svg

$(dst)/reef.svg: pattern.awk $(src)/reef.txt
	awk -f pattern.awk $(src)/reef.txt > $(dst)/reef.svg

$(dst)/scree.svg: pattern.awk $(src)/scree.txt
	awk -f pattern.awk $(src)/scree.txt > $(dst)/scree.svg

$(dst)/leaftype_broadleaved.svg: pattern.awk $(src)/leaftype_broadleaved.txt
	awk -f pattern.awk $(src)/leaftype_broadleaved.txt > $(dst)/leaftype_broadleaved.svg

$(dst)/leaftype_leafless.svg: pattern.awk $(src)/leaftype_leafless.txt
	awk -f pattern.awk $(src)/leaftype_leafless.txt > $(dst)/leaftype_leafless.svg

$(dst)/leaftype_mixed.svg: pattern.awk $(src)/leaftype_mixed.txt
	awk -f pattern.awk $(src)/leaftype_mixed.txt > $(dst)/leaftype_mixed.svg

$(dst)/leaftype_needleleaved.svg: pattern.awk $(src)/leaftype_needleleaved.txt
	awk -f pattern.awk $(src)/leaftype_needleleaved.txt > $(dst)/leaftype_needleleaved.svg

$(dst)/leaftype_unknown.svg: pattern.awk $(src)/leaftype_unknown.txt
	awk -f pattern.awk $(src)/leaftype_unknown.txt > $(dst)/leaftype_unknown.svg

$(dst)/plant_nursery.svg: pattern.awk $(src)/plant_nursery.txt
	awk -f pattern.awk $(src)/plant_nursery.txt > $(dst)/plant_nursery.svg

$(dst)/quarry.svg: pattern.awk $(src)/quarry.txt
	awk -f pattern.awk $(src)/quarry.txt > $(dst)/quarry.svg

$(dst)/salt_dots.svg: pattern.awk $(src)/salt_dots.txt
	awk -f pattern.awk $(src)/salt_dots.txt > $(dst)/salt_dots.svg

$(dst)/salt_pond.svg: pattern.awk $(src)/salt_pond.txt
	awk -f pattern.awk $(src)/salt_pond.txt > $(dst)/salt_pond.svg

$(dst)/scrub.svg: pattern.awk $(src)/scrub.txt
	awk -f pattern.awk $(src)/scrub.txt > $(dst)/scrub.svg

$(dst)/vineyard.svg: pattern.awk $(src)/vineyard.txt
	awk -f pattern.awk $(src)/vineyard.txt > $(dst)/vineyard.svg

$(dst)/wetland.svg: pattern.awk $(src)/wetland.txt
	awk -f pattern.awk $(src)/wetland.txt > $(dst)/wetland.svg

$(dst)/wetland_bog.svg: pattern.awk $(src)/wetland512.txt $(src)/bog.txt
	awk -f pattern.awk $(src)/bog.txt $(src)/wetland512.txt > $(dst)/wetland_bog.svg

$(dst)/wetland_mangrove.svg: pattern.awk $(src)/mangrove.txt $(src)/wetland512.txt
	awk -f pattern.awk $(src)/mangrove.txt $(src)/wetland512.txt > $(dst)/wetland_mangrove.svg

$(dst)/wetland_marsh.svg: pattern.awk $(src)/marsh.txt $(src)/wetland512.txt
	awk -f pattern.awk $(src)/marsh.txt $(src)/wetland512.txt > $(dst)/wetland_marsh.svg

$(dst)/wetland_reed.svg: pattern.awk $(src)/reed.txt $(src)/wetland512.txt
	awk -f pattern.awk $(src)/reed.txt $(src)/wetland512.txt > $(dst)/wetland_reed.svg

$(dst)/wetland_swamp.svg: pattern.awk $(src)/swamp.txt $(src)/wetland512.txt
	awk -f pattern.awk $(src)/swamp.txt $(src)/wetland512.txt > $(dst)/wetland_swamp.svg
