all: ui-build i18n

ui-build:
	pyside6-rcc icon.qrc -o icon_rc.py
	pyside6-uic --from-imports kindle.ui -o ui_kindle.py

i18n: ui-build
	pylupdate6 . -ts translations_en_US.ts
	pyside6-rcc translations.qrc -o translations_rc.py
	lrelease -compress translations_en_US.ts -qm translations_en_US.qm

clean:
	rm -f icon_rc.py
	rm -f ui_kindle.py
