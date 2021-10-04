OPTIMIZE_FLAG = -O0
BUILD_ROOT = .
CCFLAGS = -g -std=c++14 -Wall -Wunused-parameter $(OPTIMIZE_FLAG) \
                   -I$(BUILD_ROOT)/src \
                   -I/usr/include/g3log

LDFLAGS = -lg3logger

CC = g++ -pg

all:
	@echo $(CC) -o $(LDFLAGS) $(CCFLAGS)
	$(CC) ./src/main.cpp $(LDFLAGS) $(CCFLAGS)