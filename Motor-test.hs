{--
This is a test program for two motors. It moves the motors to go forward, go backward, turn left and tur right.

Compile: ghc --make Motor-test.hs BrickPi.o tick.o
July 15, 2015
--}

import BrickHs

main = do result <- brickPiSetup
          print (show result)
          setAddress 0 1
          setAddress 1 2
          setMotorEnable 0 1
          setMotorEnable 1 1
          result <- brickPiSetupSensors
          print (show result)
          print "Go Forward"
          setMotorSpeed 0 200
          setMotorSpeed 1 200
          result <- brickPiUpdateValues
          print (show result)
          getLine
          print "Go Backward"
          setMotorSpeed 0 (-200)
          setMotorSpeed 1 (-200)
          result <- brickPiUpdateValues
          print (show result)
          getLine
          print "Turn Left"
          setMotorSpeed 0 (-200)
          setMotorSpeed 1 200
          result <- brickPiUpdateValues
          print (show result)
          getLine
          print "Turn Right"
          setMotorSpeed 1 200
          setMotorSpeed 2 (-200)
          result <- brickPiUpdateValues
          print (show result)
          return ()

