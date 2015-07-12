# brickPi
Collection of Haskell programs of LEGO motors and sensors on Raspberry Pi through BrickPi

This library provides you with foreign function interfaces to control LEGO motors and sensors using Haskell. The bourdon in hardware and software that occurs when connecting Raspberry Pi with LEGO motors and sensors is drastically reduced. But, Haskell users cannot take advantage of BrickPi since only development libraries for C language and Python are provided. 

The library consists of C language programs, foreign function interfaces and test programs. C language programs are created by modifying the original C language development tools, where the programs are provided as header programs BrickPi.h and tick.h. These programs are divided into BrickPi.h, BrickPi.c, tick.h and tick.c by separating function declarations and programing codes. As the original program BrickPi.h has user defined data structure, setters and getters are provided to access the data structure. The new BrickPi.h and BrickPi.c have the setters and getters.

The foreign function interface to BrickPi.h and tick.h is provided as Haskell program BrickHs.hs. Application programs written in Haskell has to call BrickHs.ha when using LEGO motors and sensors. 

Test programs are provided for testing motors, an ultra-sonic sensor, touch sensor and color sensor. You can compile a test program by the following command.

ghc –make test-program.hs BrickPi.o tick.o

You may use BrickPi.c and tick.c instead of BrickPi.o and tick.o.  

As we can get the foreign function interfaces, we will develop an intelligent bot using reactive functional programming.
