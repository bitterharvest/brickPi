{--
This is a test program for two motors. When a character w, a, d, s, or x is input, the motors are rotated that the car that is driven by the two motors goes forward, turns left, turns right, goes backward or stops.

Compile: ghc --make simplebot-simple.hs BrickPi.o tick.o
July 15, 2015
--}


import BrickHs
import Control.Concurrent.Thread.Delay

speed=200
motor1 = port_b
motor2 = port_c

fwd = do 
  setMotorSpeed motor1 speed
  setMotorSpeed motor2 speed
  print "Forward"

left = do
  setMotorSpeed motor1 speed
  setMotorSpeed motor2 (-speed)
  print "Left"

right = do
  setMotorSpeed motor1 (-speed)
  setMotorSpeed motor2 speed
  print "Right"

back = do
  setMotorSpeed motor1 (-speed)
  setMotorSpeed motor2 (-speed)
  print "Back"

stop = do
  setMotorSpeed motor1 0
  setMotorSpeed motor2 0
  print "Stop"

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
      setMotorEnable motor1 1
      setMotorEnable motor2 1
      result1 <- brickPiSetupSensors
      print "BrickPiSetupSensors:" 
      print (show result1)
      setTimeout 3000
      brickPiSetTimeout
      motor
      return ()

motor = do
  s <- getLine
  let a = head s
  case a of 'w' -> fwd
            'a' -> left
            'd' -> right
            's' -> back
            'x' -> stop
            _   -> stop
  brickPiUpdateValues
  delay 10000
  motor
  return ()
