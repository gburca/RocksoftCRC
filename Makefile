.DEFAULT_GOAL = all
.PHONY: all clean test

all: test

ROCKSOFT_SRC = $(wildcard Rocksoft/*.c)
ROCKSOFT_INC = $(wildcard Rocksoft/*.h)

crctable: $(ROCKSOFT_SRC) $(ROCKSOFT_INC)
	gcc $(ROCKSOFT_SRC) -o $@

crc-32: crc-32.c crctable
	./crctable
	gcc $< -o $@

test: crc-32 test.expected
	./crc-32 "123456789" > test.out
	diff -q test.out test.expected

clean:
	rm -rf crctable crctable.out crc-32 test.out

# Debug target to see what all the variables are set to
# make printvars-all > printvars.txt 2>&1
.PHONY: printvars-all printvars

# This debug target prints out all variables, regardless of their origin
printvars-all:
	@$(foreach V,$(sort $(.VARIABLES)), $(warning $V=$($V) ($(value $V))))

# This debug target prints all variables, except the built-in and environment vars.
printvars:
	@$(foreach V,$(sort $(.VARIABLES)), $(if $(filter-out environment% default automatic, $(origin $V)),$(warning $V=$($V) ($(value $V)))))

# This debug target prints the FOO variable when called like: make print-FOO
print-%:
	@echo $*=$($*)
