all: ../landcover/beach.svg ../landcover/leaftype_broadleaved.svg ../landcover/leaftype_leafless.svg ../landcover/leaftype_mixed.svg ../landcover/leaftype_needleleaved.svg ../landcover/leaftype_unknown.svg ../landcover/plant_nursery.svg ../landcover/quarry.svg ../landcover/salt_dots.svg ../landcover/salt_pond.svg ../landcover/scrub.svg ../landcover/vineyard.svg ../landcover/wetland.svg ../landcover/wetland_bog.svg ../landcover/wetland_mangrove.svg ../landcover/wetland_marsh.svg ../landcover/wetland_reed.svg ../landcover/wetland_swamp.svg

../landcover/beach.svg: pattern.awk beach.txt
	awk -f pattern.awk beach.txt > ../landcover/beach.svg

../landcover/leaftype_broadleaved.svg: pattern.awk leaftype_broadleaved.txt
	awk -f pattern.awk leaftype_broadleaved.txt > ../landcover/leaftype_broadleaved.svg

../landcover/leaftype_leafless.svg: pattern.awk leaftype_leafless.txt
	awk -f pattern.awk leaftype_leafless.txt > ../landcover/leaftype_leafless.svg

../landcover/leaftype_mixed.svg: pattern.awk leaftype_mixed.txt
	awk -f pattern.awk leaftype_mixed.txt > ../landcover/leaftype_mixed.svg

../landcover/leaftype_needleleaved.svg: pattern.awk leaftype_needleleaved.txt
	awk -f pattern.awk leaftype_needleleaved.txt > ../landcover/leaftype_needleleaved.svg

../landcover/leaftype_unknown.svg: pattern.awk leaftype_unknown.txt
	awk -f pattern.awk leaftype_unknown.txt > ../landcover/leaftype_unknown.svg

../landcover/plant_nursery.svg: pattern.awk plant_nursery.txt
	awk -f pattern.awk plant_nursery.txt > ../landcover/plant_nursery.svg

../landcover/quarry.svg: pattern.awk quarry.txt
	awk -f pattern.awk quarry.txt > ../landcover/quarry.svg

../landcover/salt_dots.svg: pattern.awk salt_dots.txt
	awk -f pattern.awk salt_dots.txt > ../landcover/salt_dots.svg

../landcover/salt_pond.svg: pattern.awk salt_pond.txt
	awk -f pattern.awk salt_pond.txt > ../landcover/salt_pond.svg

../landcover/scrub.svg: pattern.awk scrub.txt
	awk -f pattern.awk scrub.txt > ../landcover/scrub.svg

../landcover/vineyard.svg: pattern.awk vineyard.txt
	awk -f pattern.awk vineyard.txt > ../landcover/vineyard.svg

../landcover/wetland.svg: pattern.awk wetland.txt
	awk -f pattern.awk wetland.txt > ../landcover/wetland.svg

../landcover/wetland_bog.svg: pattern.awk wetland512.txt bog.txt
	awk -f pattern.awk bog.txt wetland512.txt > ../landcover/wetland_bog.svg

../landcover/wetland_mangrove.svg: pattern.awk wetland512.txt mangrove.txt
	awk -f pattern.awk mangrove.txt wetland512.txt > ../landcover/wetland_mangrove.svg

../landcover/wetland_marsh.svg: pattern.awk wetland512.txt marsh.txt
	awk -f pattern.awk marsh.txt wetland512.txt > ../landcover/wetland_marsh.svg

../landcover/wetland_reed.svg: pattern.awk wetland512.txt reed.txt
	awk -f pattern.awk reed.txt wetland512.txt > ../landcover/wetland_reed.svg

../landcover/wetland_swamp.svg: pattern.awk wetland512.txt swamp.txt
	awk -f pattern.awk swamp.txt wetland512.txt > ../landcover/wetland_swamp.svg
