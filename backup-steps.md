# Backup distro 

When I have to format my Ubuntu I follow this steps:

 1. `dpkg --get-selections > package_list` This creates a text file (`package_list`) with all package installed in your system. You can edit the file if you want to delete some packages.
 2. Backup `/etc/apt/sources.list` file and `/etc/apt/sources.list.d/` folder. Here there are all the repositories.
 
 3. Backup `/home/<username>` folder. 

 4. Format and install new Ubuntu.
 
 5. Restore your repositories (`/etc/apt/sources.list` file and `/etc/apt/sources.list.d/` folder).

 6. `sudo apt-get update && sudo apt-get upgrade`

 7. `sudo dpkg --clear-selections` and `sudo dpkg --set-selections < package_list`. To restore the information of your installed packages.

 8. Install them: `sudo apt-get update && sudo apt-get dselect-upgrade`

 9. Finally, `sudo apt-get autoremove` to clean some packages.

Another solution is to mantain a list with your installed applications, then `sudo apt-get install app-name` (you can create a bash script).