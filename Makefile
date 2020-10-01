OUTPUT="Flameshot.AppImage"
SOURCE:=$(shell curl -s https://api.github.com/repos/flameshot-org/flameshot/releases/latest \
             | grep -Po 'https://github.com/flameshot-org/flameshot/releases/download/[^}]*\.AppImage' \
             | uniq)




all: clean
	echo "Building: $(OUTPUT) $(TEST)"
	wget --output-document=$(OUTPUT) --continue https://github.com/flameshot-org/packages/releases/download/v0.6.0/flameshot_0.6.0_x86_64.appimage	
	chmod +x $(OUTPUT)

clean:
	rm -f $(OUTPUT)