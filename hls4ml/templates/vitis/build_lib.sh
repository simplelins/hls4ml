#!/bin/bash

CC=g++
AR=ar
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    CFLAGS="-O3 -fPIC -std=c++11 -fno-gnu-unique"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    CFLAGS="-O3 -fPIC -std=c++11"
fi
LDFLAGS=
INCFLAGS="-Ifirmware/ap_types/"
PROJECT=myproject
LIB_STAMP=mystamp

${CC} ${CFLAGS} ${INCFLAGS} -c firmware/${PROJECT}.cpp -o ${PROJECT}.o
${CC} ${CFLAGS} ${INCFLAGS} -c ${PROJECT}_bridge.cpp -o ${PROJECT}_bridge.o
${CC} ${CFLAGS} ${INCFLAGS} -c ${PROJECT}_test.cpp -o ${PROJECT}_test.o
${CC} ${CFLAGS} ${INCFLAGS} -shared ${PROJECT}.o ${PROJECT}_bridge.o -o firmware/${PROJECT}-${LIB_STAMP}.so
${AR} -rc lib/${PROJECT}-${LIB_STAMP}.a  ${PROJECT}.o ${PROJECT}_bridge.o

${CC} ${CFLAGS} ${INCFLAGS} ${PROJECT}_test.o  lib/${PROJECT}-${LIB_STAMP}.a -o bin/${PROJECT}
rm -f *.o