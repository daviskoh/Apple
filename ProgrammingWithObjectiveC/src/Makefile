CC=gcc

FRAMEWORKS:= -framework Foundation
LIBRARIES:= -lobjc
ARC:= -fobjc-arc

SOURCE=main.m

LDFLAGS=$(LIBRARIES) $(FRAMEWORKS) $(ARC)
OUT=main

build: clean
	
	$(CC) $(LDFLAGS) $(SOURCE) -o $(OUT)
	./$(OUT)

clean:
	rm -f $(OUT)
