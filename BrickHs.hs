{-# LANGUAGE ForeignFunctionInterface #-}
module BrickHs where

import Foreign.C -- get the C types

--AUTHOR : Kenji Ohmori
--DATE   : July 7 2015


port_a = 0 :: Int
port_b = 1 :: Int
port_c = 2 :: Int
port_d = 3 :: Int

port_1 = 0 :: Int
port_2 = 1 :: Int
port_3 = 2 :: Int
port_4 = 3 :: Int

{--
mask_d0_m 0x01
mask_d1_m 0x02
mask_9v   0x04
mask_d0_s 0x08
mask_d1_s 0x10
--}

byte_msg_type = 0 :: Int
msg_type_change_addr = 1 :: Int 
msg_type_sensor_type = 2 :: Int
msg_type_values = 3 :: Int
msg_type_e_stop = 4 :: Int
msg_type_timeout_settings = 5 :: Int

byte_new_address = 1 :: Int
  
byte_sensor_1_type = 1 :: Int
byte_sensor_2_type = 2 :: Int
  
byte_timeout = 1 :: Int

type_motor_pwm = 0 :: Int
type_motor_speed = 1 :: Int
type_motor_position = 2 :: Int

type_sensor_raw = 0 :: Int
type_sensor_light_off = 0 :: Int
{--
type_sensor_light_on = (mask_d0_m | mask_d0_s)
--}
type_sensor_touch = 32 :: Int
type_sensor_ultrasonic_cont = 33 :: Int
type_sensor_ultrasonic_ss = 34 :: Int
type_sensor_rcx_light = 35 :: Int
type_sensor_color_full = 36 :: Int
type_sensor_color_red = 37 :: Int
type_sensor_color_green = 38 :: Int
type_sensor_color_blue = 39 :: Int
type_sensor_color_none = 40 :: Int
type_sensor_i2c = 41 :: Int
type_sensor_i2c_9v = 42 :: Int


type_sensor_ev3_us_m0 = 43 :: Int
type_sensor_ev3_us_m1 = 44 :: Int
type_sensor_ev3_us_m2 = 45 :: Int
type_sensor_ev3_us_m3 = 46 :: Int
type_sensor_ev3_us_m4 = 47 :: Int
type_sensor_ev3_us_m5 = 48 :: Int
type_sensor_ev3_us_m6 = 49 :: Int

type_sensor_ev3_color_m0 = 50 :: Int
type_sensor_ev3_color_m1 = 51 :: Int
type_sensor_ev3_color_m2 = 52 :: Int
type_sensor_ev3_color_m3 = 53 :: Int
type_sensor_ev3_color_m4 = 54 :: Int
type_sensor_ev3_color_m5 = 55 :: Int

type_sensor_ev3_gyro_m0 = 56 :: Int
type_sensor_ev3_gyro_m1 = 57 :: Int
type_sensor_ev3_gyro_m2 = 58 :: Int
type_sensor_ev3_gyro_m3 = 59 :: Int
type_sensor_ev3_gyro_m4 = 60 :: Int

type_sensor_ev3_infrared_m0 = 61 :: Int
type_sensor_ev3_infrared_m1 = 62 :: Int
type_sensor_ev3_infrared_m2 = 63 :: Int
type_sensor_ev3_infrared_m3 = 64 :: Int
type_sensor_ev3_infrared_m4 = 65 :: Int
type_sensor_ev3_infrared_m5 = 66 :: Int

type_sensor_ev3_touch_0	= 67 :: Int

{--
bit_i2c_mid  0x01  
bit_i2c_same 0x02 
--}

index_red = 0 :: Int
index_green = 1 :: Int
index_blue  = 2 :: Int
index_blank = 3 :: Int

i2c_speed = 10 :: Int
us_i2c_idx = 0 :: Int

{--
lego_us_i2c_addr = 0x02
lego_us_i2c_data_reg = 0x42
--}

foreign import ccall "BrickPi.h BrickPiSetup" c_brickPiSetup :: IO CInt
brickPiSetup :: IO Int
brickPiSetup = fmap fromIntegral c_brickPiSetup

foreign import ccall "BrickPi.h BrickPiSetupSensors" c_brickPiSetupSensors :: IO CInt
brickPiSetupSensors :: IO Int
brickPiSetupSensors = fmap fromIntegral c_brickPiSetupSensors

foreign import ccall "BrickPi.h BrickPiUpdateValues" c_brickPiUpdateValues :: IO CInt
brickPiUpdateValues :: IO Int
brickPiUpdateValues = fmap fromIntegral c_brickPiUpdateValues

foreign import ccall "BrickPi.h BrickPiSetTimeout" c_brickPiSetTimeout :: IO CInt
brickPiSetTimeout :: IO Int
brickPiSetTimeout = fmap fromIntegral c_brickPiSetTimeout

foreign import ccall "tick.h ClearTick" c_clearTick :: IO CInt
clearTick :: IO Int
clearTick = fmap fromIntegral c_clearTick

foreign import ccall "tick.h CurrentTickMs" c_currentTickMs :: IO CULong
currentTickMs :: IO Int
currentTickMs = fmap fromIntegral c_currentTickMs

foreign import ccall "tick.h CurrentTickUs" c_currentTickUs :: IO CULong
currentTickUs :: IO Int
currentTickUs = fmap fromIntegral c_currentTickUs

foreign import ccall "BrickPi.h SetAddress" c_setAddress :: CInt -> CUChar -> IO () 
setAddress :: Int -> Int -> IO ()
setAddress i v = c_setAddress (fromIntegral i) (fromIntegral v)

foreign import ccall "BrickPi.h SetTimeout " c_setTimeout  :: CULong -> IO () 
setTimeout  :: Int -> IO ()
setTimeout  v = c_setTimeout  (fromIntegral v)

foreign import ccall "BrickPi.h SetMotorSpeed" c_setMotorSpeed :: CInt -> CInt -> IO () 
setMotorSpeed :: Int -> Int -> IO ()
setMotorSpeed i v = c_setMotorSpeed (fromIntegral i) (fromIntegral v)

foreign import ccall "BrickPi.h SetMotorEnable" c_setMotorEnable :: CInt -> CUChar -> IO () 
setMotorEnable :: Int -> Int -> IO ()
setMotorEnable i v = c_setMotorEnable (fromIntegral i) (fromIntegral v)

foreign import ccall "BrickPi.h SetEncoderOffset" c_setEncoderOffset :: CInt -> CLong -> IO () 
setEncoderOffset :: Int -> Int -> IO ()
setEncoderOffset i v = c_setEncoderOffset (fromIntegral i) (fromIntegral v)

foreign import ccall "BrickPi.h SetEncoder" c_setEncoder :: CInt -> CLong -> IO () 
setEncoder :: Int -> Int -> IO ()
setEncoder i v = c_setEncoder (fromIntegral i) (fromIntegral v)

foreign import ccall "BrickPi.h SetSensor" c_setSensor :: CInt -> CLong -> IO () 
setSensor :: Int -> Int -> IO ()
setSensor i v = c_setSensor (fromIntegral i) (fromIntegral v)

foreign import ccall "BrickPi.h SetSensorArray" c_setSensorArray :: CInt -> CLong -> IO () 
setSensorArray :: Int -> Int -> IO ()
setSensorArray i v = c_setSensorArray (fromIntegral i) (fromIntegral v)

foreign import ccall "BrickPi.h SetSensorType" c_setSensorType :: CInt -> CUChar -> IO () 
setSensorType :: Int -> Int -> IO ()
setSensorType i v = c_setSensorType (fromIntegral i) (fromIntegral v)

foreign import ccall "BrickPi.h SetSensorSettings" c_setSensorSettings :: CInt -> CUChar -> IO () 
setSensorSettings :: Int -> Int -> IO ()
setSensorSettings i v = c_setSensorSettings (fromIntegral i) (fromIntegral v)

foreign import ccall "BrickPi.h SetSensorI2CDevices" c_setSensorI2CDevices :: CInt -> CUChar -> IO () 
setSensorI2CDevices :: Int -> Int -> IO ()
setSensorI2CDevices i v = c_setSensorI2CDevices (fromIntegral i) (fromIntegral v)

foreign import ccall "BrickPi.h SetSensorI2CSpeed" c_setSensorI2CSpeed :: CInt -> CUChar -> IO () 
setSensorI2CSpeed :: Int -> Int -> IO ()
setSensorI2CSpeed i v = c_setSensorI2CSpeed (fromIntegral i) (fromIntegral v)

foreign import ccall "BrickPi.h SetSensorI2CAddr" c_setSensorI2CAddr :: CInt -> CUChar -> IO () 
setSensorI2CAddr :: Int -> Int -> IO ()
setSensorI2CAddr i v = c_setSensorI2CAddr (fromIntegral i) (fromIntegral v)

foreign import ccall "BrickPi.h SetSensorI2CWrite" c_setSensorI2CWrite :: CInt -> CUChar -> IO () 
setSensorI2CWrite :: Int -> Int -> IO ()
setSensorI2CWrite i v = c_setSensorI2CWrite (fromIntegral i) (fromIntegral v)

foreign import ccall "BrickPi.h SetSensorI2CRead" c_setSensorI2CRead :: CInt -> CUChar -> IO () 
setSensorI2CRead :: Int -> Int -> IO ()
setSensorI2CRead i v = c_setSensorI2CRead (fromIntegral i) (fromIntegral v)

foreign import ccall "BrickPi.h SetSensorI2COut" c_setSensorI2COut :: CInt -> CUChar -> IO () 
setSensorI2COut :: Int -> Int -> IO ()
setSensorI2COut i v = c_setSensorI2COut (fromIntegral i) (fromIntegral v)

foreign import ccall "BrickPi.h SetSensorI2CIn" c_setSensorI2CIn :: CInt -> CUChar -> IO () 
setSensorI2CIn :: Int -> Int -> IO ()
setSensorI2CIn i v = c_setSensorI2CIn (fromIntegral i) (fromIntegral v)

foreign import ccall "BrickPi.h GetAddress" c_getAddress :: CInt -> IO CUChar
getAddress :: Int -> IO Int
getAddress i = fmap fromIntegral $ c_getAddress (fromIntegral i) 

foreign import ccall "BrickPi.h GetTimeout " c_getTimeout  :: IO CULong 
getTimeout  :: IO Int
getTimeout  = fmap fromIntegral c_getTimeout

foreign import ccall "BrickPi.h GetMotorSpeed" c_getMotorSpeed :: CInt -> IO CInt 
getMotorSpeed :: Int -> IO Int
getMotorSpeed i = fmap fromIntegral $ c_getMotorSpeed (fromIntegral i) 

foreign import ccall "BrickPi.h GetMotorEnable" c_getMotorEnable :: CInt -> IO CUChar
getMotorEnable :: Int -> IO Int
getMotorEnable i = fmap fromIntegral $ c_getMotorEnable (fromIntegral i) 

foreign import ccall "BrickPi.h GetEncoderOffset" c_getEncoderOffset :: CInt -> IO CLong
getEncoderOffset :: Int -> IO Int
getEncoderOffset i = fmap fromIntegral $ c_getEncoderOffset (fromIntegral i) 

foreign import ccall "BrickPi.h GetEncoder" c_getEncoder :: CInt -> IO CLong
getEncoder :: Int -> IO Int
getEncoder i = fmap fromIntegral $ c_getEncoder (fromIntegral i) 

foreign import ccall "BrickPi.h GetSensor" c_getSensor :: CInt -> IO CLong
getSensor :: Int -> IO Int
getSensor i = fmap fromIntegral $ c_getSensor (fromIntegral i) 

foreign import ccall "BrickPi.h GetSensorArray" c_getSensorArray :: CInt -> IO CLong
getSensorArray :: Int -> IO Int
getSensorArray i = fmap fromIntegral $ c_getSensorArray (fromIntegral i) 

foreign import ccall "BrickPi.h GetSensorType" c_getSensorType :: CInt -> IO CUChar
getSensorType :: Int -> IO Int
getSensorType i = fmap fromIntegral $ c_getSensorType (fromIntegral i) 

foreign import ccall "BrickPi.h GetSensorSettings" c_getSensorSettings :: CInt -> IO CUChar
getSensorSettings :: Int -> IO Int
getSensorSettings i = fmap fromIntegral $ c_getSensorSettings (fromIntegral i) 

foreign import ccall "BrickPi.h GetSensorI2CDevices" c_getSensorI2CDevices :: CInt -> IO CUChar
getSensorI2CDevices :: Int -> IO Int
getSensorI2CDevices i = fmap fromIntegral $ c_getSensorI2CDevices (fromIntegral i) 

foreign import ccall "BrickPi.h GetSensorI2CSpeed" c_getSensorI2CSpeed :: CInt -> IO CUChar
getSensorI2CSpeed :: Int -> IO Int
getSensorI2CSpeed i = fmap fromIntegral $ c_getSensorI2CSpeed (fromIntegral i) 

foreign import ccall "BrickPi.h GetSensorI2CAddr" c_getSensorI2CAddr :: CInt -> IO CUChar
getSensorI2CAddr :: Int -> IO Int
getSensorI2CAddr i = fmap fromIntegral $ c_getSensorI2CAddr (fromIntegral i) 

foreign import ccall "BrickPi.h GetSensorI2CWrite" c_getSensorI2CWrite :: CInt -> IO CUChar
getSensorI2CWrite :: Int -> IO Int
getSensorI2CWrite i = fmap fromIntegral $ c_getSensorI2CWrite (fromIntegral i) 

foreign import ccall "BrickPi.h GetSensorI2CRead" c_getSensorI2CRead :: CInt -> IO CUChar
getSensorI2CRead :: Int -> IO Int
getSensorI2CRead i = fmap fromIntegral $ c_getSensorI2CRead (fromIntegral i) 

foreign import ccall "BrickPi.h GetSensorI2COut" c_getSensorI2COut :: CInt -> IO CUChar
getSensorI2COut :: Int -> IO Int
getSensorI2COut i = fmap fromIntegral $ c_getSensorI2COut (fromIntegral i) 

foreign import ccall "BrickPi.h GetSensorI2CIn" c_getSensorI2CIn :: CInt -> IO CUChar
getSensorI2CIn :: Int -> IO Int
getSensorI2CIn i = fmap fromIntegral $ c_getSensorI2CIn (fromIntegral i) 
