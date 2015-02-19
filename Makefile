all:
	dpkg-deb --build powerman
	mv powerman.deb dist/
	@echo "Package dist/powerman.deb created successfuly!"
