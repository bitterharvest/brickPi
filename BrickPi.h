

/*
BrickPi.h
*/

int               BrickPiSetTimeout();
int               BrickPiSetupSensors();
int               BrickPiUpdateValues();
int               BrickPiSetup();

void              SetAddress(int Index, unsigned char Value);
void              SetTimeout(unsigned long Value);
void              SetMotorSpeed(int Index, int Value) ;
void              SetMotorEnable(int Index, unsigned char Value);
void              SetEncoderOffset(int Index, long Value) ;
void              SetEncoder(int Index, long Value) ;
void              SetSensor(int Index, long Value) ;
void              SetSensorArray(int Indexi, int Indexj, long Value) ;
void              SetSensorType(int Index, unsigned char Value) ;
void              SetSensorSettings(int Indexi, int Indexj, unsigned char Value) ;
void              SetSensorI2CDevices(int Index, unsigned char Value) ;
void              SetSensorI2CSpeed(int Index, unsigned char Value) ;
void              SetSensorI2CAddr(int Indexi, int Indexj, unsigned char Value) ;
void              SetSensorI2CWrite(int Indexi, int Indexj, unsigned char Value) ;
void              SetSensorI2CRead(int Indexi, int Indexj, unsigned char Value) ;
void              SetSensorI2COut(int Indexi, int Indexj, int Indexk, unsigned char Value) ;
void              SetSensorI2CIn(int Indexi, int Indexj, int Indexk, unsigned char Value) ;

unsigned char     GetAddress(int Index);
unsigned long     GetTimeout();
int               GetMotorSpeed(int Index) ;
unsigned char     GetMotorEnable(int Index);
long              GetEncoderOffset(int Index) ;
long              GetEncoder(int Index) ;
long              GetSensor(int Index) ;
long              GetSensorArray(int Indexi, int Indexj) ;
unsigned char     GetSensorType(int Index) ;
unsigned char     GetSensorSettings(int Indexi, int Indexj) ;
unsigned char     GetSensorI2CDevices(int Index) ;
unsigned char     GetSensorI2CSpeed(int Index) ;
unsigned char     GetSensorI2CAddr(int Indexi, int Indexj) ;
unsigned char     GetSensorI2CWrite(int Indexi, int Indexj) ;
unsigned char     GetSensorI2CRead(int Indexi, int Indexj) ;
unsigned char     GetSensorI2COut(int Indexi, int Indexj, int Indexk) ;
unsigned char     GetSensorI2CIn(int Indexi, int Indexj, int Indexk) ;


