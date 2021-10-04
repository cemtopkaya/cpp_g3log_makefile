OPTIMIZE_FLAG = -O0
BUILD_ROOT = .
CCFLAGS = -g -std=c++14 -Wall -Wunused-parameter $(OPTIMIZE_FLAG) \
                   -I$(BUILD_ROOT)/src \
                   -I/usr/include/g3log

LDFLAGS = -lg3logger

CC = g++ -pg

all: prereqs build

prereqs:
	@apt-get install -y g3log

build:
	@if [ "$(VERBOSE)" = "on" ]; then echo $(CC) ./src/main.cpp $(LDFLAGS) $(CCFLAGS); fi
	$(CC) ./src/main.cpp $(LDFLAGS) $(CCFLAGS)
