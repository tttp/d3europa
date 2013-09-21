
var file1 = require ("./"+process.argv[2]);
var file2 = require ("./"+process.argv[3]);

for (prop in file2.objects) { 
   file1.objects[prop] = file2.objects[prop];
}

process.stdout.write(JSON.stringify(file1));
process.stdout.write("\n");
