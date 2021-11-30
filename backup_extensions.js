const fs = require("fs");

let dir = "/home/hussein/.local/share/gnome-shell/extensions"
let files = fs.readdirSync(dir);

var stream = fs.createWriteStream("/home/hussein/Documents/fresh_linux_install/extensions.txt");
stream.once('open', function(fd) {
  files.forEach(file=>{
    stream.write(`${file}\n`);
  }) 
  stream.end();
});

