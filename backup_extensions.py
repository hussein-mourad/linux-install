import getpass
import os

username = getpass.getuser()
file_path= "/home/"+username+"/Documents/fresh_linux_install/extensions.txt"
extensions_path = "/home/"+username+"/.local/share/gnome-shell/extensions/"
entries = os.listdir(extensions_path)
with open(file_path,"w") as f:
    for entry in entries:
        f.write(entry+"\n")

