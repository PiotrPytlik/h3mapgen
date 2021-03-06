CXX = g++
CXXFLAGS = -std=c++11 -pedantic -Wall -Wextra -Wformat -Wfloat-equal -W -Wreturn-type -pedantic-errors -Wundef
LDLIBS =
TARGETS = bin/cellular bin/voronoi

all: $(TARGETS)

bin/cellular: Makefile src/cellular/board.o src/cellular/cellular_terrain.o src/cellular/main.cpp
	 $(CXX) $(CXXFLAGS) -o bin/cellular src/cellular/*.o src/cellular/main.cpp

bin/voronoi: Makefile src/voronoi/Constants.o src/voronoi/Sector.o src/voronoi/Site.o src/voronoi/Tile.o src/voronoi/TileGrid.o src/voronoi/TileGridGenerator.o src/voronoi/Main.cpp
	$(CXX) $(CXXFLAGS) -o bin/voronoi src/voronoi/*.o src/voronoi/Main.cpp

clean:
	find ./src -depth -name *.o -delete

distclean: clean
	rm -f $(TARGETS)
