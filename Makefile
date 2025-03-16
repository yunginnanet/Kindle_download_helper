all: dep ui
	pyinstaller -F -w -i resource/kindle.icns -n kindle_download_helper kindle_gui.py

i18n: ui-build
	lrelease -compress gui/translations_en.ts -qm gui/translations_en_US.qm
	pyside6-rcc gui/translations.qrc -o gui/translations_rc.py

dep:
	pip install -r requirements.txt

gui_dep:
	pip install -r requirements_gui.txt

ui: gui_dep
	$(MAKE) -C gui -f Makefile all

clean: clean-dist
	$(MAKE) -C gui -f Makefile $@

clean-dist:
	rm -rf dist build kindle_gui.spec

.PHONY: all dep gui_dep ui clean
