# This makefile is necessary and useful solely during making changes to the map style.
# It is unnecessary for map rendering.

all: symbols/shields style/road-colors-generated.mss indexes.sql patterns

symbols/shields: scripts/generate_shields.py road-colors.yaml
	python scripts/generate_shields.py

style/road-colors-generated.mss: scripts/generate_road_colours.py road-colors.yaml
	scripts/generate_road_colours.py > style/road-colors-generated.mss

indexes.sql: scripts/indexes.py indexes.yml
	scripts/indexes.py > indexes.sql

src = patterns/src

patterns: patterns/beach.svg patterns/beach_coarse.svg patterns/reef.svg patterns/scree.svg patterns/leaftype_broadleaved.svg patterns/leaftype_leafless.svg patterns/leaftype_mixed.svg patterns/leaftype_needleleaved.svg patterns/leaftype_unknown.svg patterns/plant_nursery.svg patterns/quarry.svg patterns/salt_dots.svg patterns/salt_pond.svg patterns/scrub.svg patterns/vineyard.svg patterns/wetland.svg patterns/wetland_bog.svg patterns/wetland_mangrove.svg patterns/wetland_marsh.svg patterns/wetland_reed.svg patterns/wetland_swamp.svg

patterns/beach.svg: scripts/generate_pattern.py $(src)/beach.txt
	python scripts/generate_pattern.py $(src)/beach.txt > patterns/beach.svg

patterns/beach_coarse.svg: scripts/generate_pattern.py $(src)/beach_coarse.txt
	python scripts/generate_pattern.py $(src)/beach_coarse.txt > patterns/beach_coarse.svg

patterns/reef.svg: scripts/generate_pattern.py $(src)/reef.txt
	python scripts/generate_pattern.py $(src)/reef.txt > patterns/reef.svg

patterns/scree.svg: scripts/generate_pattern.py $(src)/scree.txt
	python scripts/generate_pattern.py $(src)/scree.txt > patterns/scree.svg

patterns/leaftype_broadleaved.svg: scripts/generate_pattern.py $(src)/leaftype_broadleaved.txt
	python scripts/generate_pattern.py $(src)/leaftype_broadleaved.txt > patterns/leaftype_broadleaved.svg

patterns/leaftype_leafless.svg: scripts/generate_pattern.py $(src)/leaftype_leafless.txt
	python scripts/generate_pattern.py $(src)/leaftype_leafless.txt > patterns/leaftype_leafless.svg

patterns/leaftype_mixed.svg: scripts/generate_pattern.py $(src)/leaftype_mixed.txt
	python scripts/generate_pattern.py $(src)/leaftype_mixed.txt > patterns/leaftype_mixed.svg

patterns/leaftype_needleleaved.svg: scripts/generate_pattern.py $(src)/leaftype_needleleaved.txt
	python scripts/generate_pattern.py $(src)/leaftype_needleleaved.txt > patterns/leaftype_needleleaved.svg

patterns/leaftype_unknown.svg: scripts/generate_pattern.py $(src)/leaftype_unknown.txt
	python scripts/generate_pattern.py $(src)/leaftype_unknown.txt > patterns/leaftype_unknown.svg

patterns/plant_nursery.svg: scripts/generate_pattern.py $(src)/plant_nursery.txt
	python scripts/generate_pattern.py $(src)/plant_nursery.txt > patterns/plant_nursery.svg

patterns/quarry.svg: scripts/generate_pattern.py $(src)/quarry.txt
	python scripts/generate_pattern.py $(src)/quarry.txt > patterns/quarry.svg

patterns/salt_dots.svg: scripts/generate_pattern.py $(src)/salt_dots.txt
	python scripts/generate_pattern.py $(src)/salt_dots.txt > patterns/salt_dots.svg

patterns/salt_pond.svg: scripts/generate_pattern.py $(src)/salt_pond.txt
	python scripts/generate_pattern.py $(src)/salt_pond.txt > patterns/salt_pond.svg

patterns/scrub.svg: scripts/generate_pattern.py $(src)/scrub.txt
	python scripts/generate_pattern.py $(src)/scrub.txt > patterns/scrub.svg

patterns/vineyard.svg: scripts/generate_pattern.py $(src)/vineyard.txt
	python scripts/generate_pattern.py $(src)/vineyard.txt > patterns/vineyard.svg

patterns/wetland.svg: scripts/generate_pattern.py $(src)/wetland.txt
	python scripts/generate_pattern.py $(src)/wetland.txt > patterns/wetland.svg

patterns/wetland_bog.svg: scripts/generate_pattern.py $(src)/wetland512.txt $(src)/bog.txt
	python scripts/generate_pattern.py $(src)/bog.txt $(src)/wetland512.txt > patterns/wetland_bog.svg

patterns/wetland_mangrove.svg: scripts/generate_pattern.py $(src)/mangrove.txt $(src)/wetland512.txt
	python scripts/generate_pattern.py $(src)/mangrove.txt $(src)/wetland512.txt > patterns/wetland_mangrove.svg

patterns/wetland_marsh.svg: scripts/generate_pattern.py $(src)/marsh.txt $(src)/wetland512.txt
	python scripts/generate_pattern.py $(src)/marsh.txt $(src)/wetland512.txt > patterns/wetland_marsh.svg

patterns/wetland_reed.svg: scripts/generate_pattern.py $(src)/reed.txt $(src)/wetland512.txt
	python scripts/generate_pattern.py $(src)/reed.txt $(src)/wetland512.txt > patterns/wetland_reed.svg

patterns/wetland_swamp.svg: scripts/generate_pattern.py $(src)/swamp.txt $(src)/wetland512.txt
	python scripts/generate_pattern.py $(src)/swamp.txt $(src)/wetland512.txt > patterns/wetland_swamp.svg
