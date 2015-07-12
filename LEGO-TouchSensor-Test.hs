{--
This is a test program for a touch sensor. When it is touched, it returns 1, otherwise 0.

Compile: ghc --make LEGO-TouchSensor-Test.hs BrickPi.o tick.o
July 15, 2015
--}

import BrickHs
import Control.Concurrent.Thread.Delay

main = do 
  clearTick
  result <- brickPiSetup
  print "BrickPiSetup: "
  print (show result)
  if result /= 0 then 
      return () 
    else do
      setAddress 0 1
      setAddress 1 2
      setSensorType port_1 type_sensor_touch
      result1 <- brickPiSetupSensors
      print "BrickPiSetupSensors:" 
      print (show result1)
      if result1 /= 0 then
          return ()
      else do
          delay 10000
          touch 
          return ()


touch = do
  result <- brickPiUpdateValues
  if result == 0 then do
      print "Results: " 
      value <- getSensor port_1
      print (show value)
      delay 10000
    else
      delay 10000
  touch
  return ()
  