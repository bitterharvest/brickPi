{--
This is a test program for a color sensor. The color sensor is attached to port 4. It detects 6 kinds of colors: black, blue, green, yellow, red, and white. The sensor returns an Int value from 1 to 6: a value 1 corresponds to black, 2 to blue, .. as in the order of the color list. The function color is repeated eternally. It checks the color sensor and reports the result.

Compile: ghc --make LEGO-ColorSensor-Test.hs BrickPi.o tick.o
July 12, 2015
--}

import BrickHs
import Control.Concurrent.Thread.Delay

data Color = Black | Blue | Green | Yellow | Red | White deriving (Show, Eq, Ord)

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
      setSensorType port_4 type_sensor_color_full
      result1 <- brickPiSetupSensors
      print "BrickPiSetupSensors:" 
      print (show result1)
      if result1 /= 0 then
          return ()
      else do
          delay 10000
          color 
          return ()

color = do
  result <- brickPiUpdateValues
  if result == 0 then do
      print "Results: " 
      value <- getSensor port_4
      print (show value)
      case value of 
         1 -> print "Black"
         2 -> print "Blue"
         3 -> print "Green"
         4 -> print "Yellow"
         5 -> print "Red"
         6 -> print "White"
         _ -> print "Others"
      delay 10000
    else
      delay 10000
  color
  return ()
