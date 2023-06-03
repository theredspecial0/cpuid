AS = as
LD = gcc
ASFLAGS = --64
LDFLAGS = -no-pie

SRC = cpuid.asm
OBJ = cpuid.o
EXE = cpuid

all: $(EXE)

$(EXE): $(OBJ)
	$(LD) $(LDFLAGS) -o $@ $<

$(OBJ): $(SRC)
	$(AS) $(ASFLAGS) -o $@ $<

run:
	@if [ -f "$(EXE)" ]; then \
		./$(EXE); \
	else \
		make --silent; \
		make run --silent; \
	fi

clean:
	rm -f $(OBJ) $(EXE)
