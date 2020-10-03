OUTPUT="Flameshot.AppImage"
SOURCE:=$(shell curl -s https://api.github.com/repos/flameshot-org/flameshot/releases/latest \
             | grep -Po 'https://github.com/flameshot-org/flameshot/releases/download/[^}]*\.AppImage' \
             | uniq)




all: clean
	echo "Building: $(OUTPUT) $(TEST)"
	wget --output-document=$(OUTPUT) --continue ${SOURCE}
	chmod +x $(OUTPUT)

clean:
	rm -f $(OUTPUT)