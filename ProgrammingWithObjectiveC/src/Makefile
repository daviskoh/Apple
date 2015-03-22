CC=gcc

FRAMEWORKS:= -framework Foundation
LIBRARIES:= -lobjc
ARC:= -fobjc-arc

SOURCE=main.m

LDFLAGS=$(LIBRARIES) $(FRAMEWORKS) $(ARC)
OUT=main

build: clean notes
	
	$(CC) $(LDFLAGS) $(SOURCE) -o $(OUT)
	./$(OUT)

notes:
	notey 

clean:
	rm -f $(OUT)

.PHONY: notes
