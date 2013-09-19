var topojson = require('./ne_50m_admin_0_countries.json');
var iso = [];
topojson.features.forEach(function(v,i,features) {
  iso.push(v.properties.iso_a2);
process.stdout.write("'"+v.properties.iso_a2);
});

console.log(iso);
iso.forEach
