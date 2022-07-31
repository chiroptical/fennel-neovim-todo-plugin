build:
	find . -name "*.fnl" -exec bash ./fnl-to-lua.sh {} \;

format:
	find . -name "*.fnl" -exec fnlfmt --fix {} \;

.PHONY: build format
