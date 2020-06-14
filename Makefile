SOURCE="https://github.com/torakiki/pdfsam-visual-public/releases/download/v2.1.7/pdfsam-visual_2.1.7_amd64.deb"
DESTINATION="build.deb"
OUTPUT="PDFsamVisual.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget --output-document=$(DESTINATION) --continue $(SOURCE)

	dpkg -x $(DESTINATION) build
	rm -rf AppDir/opt

	mkdir --parents AppDir/application
	cp -r build/opt/pdfsam-visual/* AppDir/application

	chmod +x AppDir/AppRun

	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)
	chmod +x $(OUTPUT)

	rm -f $(DESTINATION)
	rm -rf ./AppDir/application
	rm -rf ./build
