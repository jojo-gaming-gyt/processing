#include <ArduinoBLE.h>
//#include <string>
//#include <vector>


const char* deviceServiceUuid = "19b10000-e8f2-537e-4f6c-d104768a1214";
const char* deviceServiceResponseCharacteristicUuid = "19b10001-e8f2-537e-4f6c-d104768a1216";

BLEService ibisService(deviceServiceUuid);
BLEStringCharacteristic uartInput(deviceServiceResponseCharacteristicUuid, BLENotify, 4);

void setup() {
  Serial.begin(1200, SERIAL_7E2);
  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(LED_BUILTIN, LOW);


  BLE.setDeviceName("IBIS_SLAVE");
  BLE.setLocalName("IBIS_SLAVE");

  if (!BLE.begin()) {
    while (1) {
      digitalWrite(LED_BUILTIN, !digitalRead(LED_BUILTIN));
      delay(250);
    }
  }

  BLE.setAdvertisedService(ibisService);
  ibisService.addCharacteristic(uartInput);
  BLE.addService(ibisService);
  uartInput.writeValue("0");

  BLE.advertise();

  digitalWrite(LED_BUILTIN, HIGH);
}

void abfrage() {
  BLEDevice central = BLE.central();
  delay(500);
  if (!central) return;

  if (!central.connected()) return;

  uint8_t av_char = Serial.available();
  if (av_char < 20) return;


  for (uint8_t i = 0; i < av_char; i++) {
    int zeichen = Serial.read();
    uartInput.writeValue(String(zeichen));
  }


  //servoResponseCharacteristic.setValue(newAngle);
}



void loop() {


  abfrage();
}