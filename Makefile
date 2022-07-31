build:
	find . -name "*.fnl" -exec bash ./fnl-to-lua.sh {} \;

format:
	alejandra .
	find . -name "*.fnl" -exec fnlfmt --fix {} \;

.PHONY: build format
