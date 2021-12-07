cat $HOME/Documents/fresh_linux_install/packages.txt | while read line; do
	sudo apt -y install $line	
done
