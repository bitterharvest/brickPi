{--
This is a program for rotating two motors attached to Port A and Port B. The program rotates the motors forward or backward, repeatedly. The function motor is the main body of the program. When the value of rot is 1, the motors rotate forward, otherwise, backward. The value of time is duration of rotating. time is increased when the motors rotating forward. When it reaches 300, the rotation direction is changed to backward. time is decreased when the motors move backward. When it reaches 0, the direction is changed to forward.

Compile: ghc --make LEGO-Motor-Test.hs BrickPi.o tick.o
July 12, 2015
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
      setMotorEnable port_a 1
      setMotorEnable port_b 1
      result1 <- brickPiSetupSensors
      print "BrickPiSetupSensors:" 
      print (show result1)
      delay 10000
      motor 0 1
      return ()

motor time rot = do
  let time1 = if rot == 1 then time + 1 else time - 1 
  if rot == 1 then do
      setMotorSpeed port_a 200
      setMotorSpeed port_b 200
    else do
      setMotorSpeed port_a (-200)
      setMotorSpeed port_b (-200)
  brickPiUpdateValues
  delay 10000
  if time1 > 300 then 
      motor time1 0
    else if time1 < 0 then 
             motor time1 1
           else 
             motor time1 rot