#---------------------------------- VARIABLES ----------------------------------

CC=g++
CFLAGS=-std=c++14 -Wall -Wextra -g -Wunreachable-code -Wuninitialized 
INCLUDE=-Iinclude

SOURCES=$(wildcard src/*.cpp)
TEMP=$(patsubst %.cpp,%.o,$(SOURCES))
OBJECTS=$(patsubst src/%,build/%,$(TEMP))

EXE=./bin/Testprogram.out

#----------------------------------- TARGETS -----------------------------------

run: build
	$(info ######### RUNNING #########)
	@$(EXE)

build: $(EXE)

$(EXE): $(OBJECTS)
	$(info ######## BUILDING #########)
	$(CC) $(CFLAGS) $(INCLUDE) $(OBJECTS) -o $(EXE)

build/%.o: src/%.cpp
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

clean:
	$(info ######## CLEANING  ########)
	rm -f build/*.o
	rm -f $(EXE)

#------------------------------------ PHONY ------------------------------------

.PHONY: run build clean 
