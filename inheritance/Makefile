CC=gcc

FRAMEWORKS:= -framework Foundation
LIBRARIES:= -lobjc

SOURCE=main.m

LDFLAGS=$(LIBRARIES) $(FRAMEWORKS)
OUT=main

build: clean
	
	$(CC) $(LDFLAGS) $(SOURCE) -o $(OUT)
	./$(OUT)

clean:
	rm -f $(OUT)