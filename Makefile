SRC := ./fnl/todo
SRCS := $(wildcard $(SRC)/*.fnl)

OBJ := ./lua/todo
OBJS := $(patsubst $(SRC)/%.fnl, $(OBJ)/%.lua, $(SRCS))

.PHONY: build format clean

build: $(OBJ) $(OBJS)

format: $(SRCS)
	alejandra .

$(OBJ)/%.lua: $(SRC)/%.fnl
	fennel --compile $< > $@

$(SRC)/%.fnl: FORCE
	fnlfmt --fix $@

$(OBJ):
	mkdir -p $(OBJ)

clean:
	rm -r $(OBJ)
	rm result

FORCE:
