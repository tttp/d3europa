wget http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/cultural/ne_50m_populated_places.zip
wget http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/50m/cultural/ne_50m_admin_0_countries.zip

unzip ne_50m_populated_places.zip 
unzip ne_50m_admin_0_countries.zip

ogr2ogr -f GeoJSON -where "(continent='Europe' OR subregion ='Western Asia') AND type IN ('Sovereign country','Country')" europe50.js ne_50m_admin_0_countries.shp

topojson --id-property iso_a2 -p name,iso3=iso_a3 --simplify-proportion .3 -o europe50b.json europe50.js

# ogrinfo ne_50m_admin_0_countries.shp  -so ne_50m_admin_0_countries


topojson -p name=NAME,iso=ISO_A2,rank=SCALERANK,type=FEATURECLA -o place.json euplaces50.json
sed  -e 's/Admin-1 //g;s/Admin-1 //g;s/region capital/region_capital/g;s/Populated place//g' place.json > euplace.json

