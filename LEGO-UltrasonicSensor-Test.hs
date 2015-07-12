{--
This is a test program for an ultra-sonic sensor. It detects the distance between the sensor and an obstacle that the sensor is facing. A return value is a little bit larger than the actual distance in centimeter.

Compile: ghc --make LEGO-UltrasonicSensor-Test.hs BrickPi.o tick.o
July 15, 2015
--}

import BrickHs
import Control.Concurrent.Thread.Delay

us_port = port_3

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
      setSensorType us_port type_sensor_ultrasonic_cont
      result1 <- brickPiSetupSensors
      print "BrickPiSetupSensors:" 
      print (show result1)
      if result1 /= 0 then
          return ()
      else do
          delay 10000
          ultrasonic 
          return ()


ultrasonic = do
  result <- brickPiUpdateValues
  if result == 0 then do
      print "Results: " 
      value <- getSensor us_port
      if value /= 255 && value /= 127 then do
          print (show value)
          delay 10000
        else
          delay 10000
    else
      delay 10000
  ultrasonic
  return ()
  