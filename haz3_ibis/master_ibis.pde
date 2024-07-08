/* (c) Jojo_gaming_gyt
 * 01.07.2024
 * HAZ 3, IBIS Master
 
 */

/*  IMPORTS     */
import processing.serial.*;

final String WANDLER_COM_PORT = "COM8";

Serial Wandler;

String Haltestelle = "Johannistahl";


byte max_telegram_length = 27;

// Verfügbarkeit COM Port
boolean com_port = false;

// Debugging
final boolean debug = false;


// Platz für gesammtes Telegram

byte telegram_parity;
byte[] message_bytes = new byte[24];





void printDate() {
  int da = day();
  int mo = month();
  int ye = year();
  int ho = hour();
  int mi = minute();
  int se = second();
  int ms = millis();

  print(da);
  print('.');
  print(mo);
  print('.');
  print(ye);
  print(' ');
  print(ho);
  print(':');
  print(mi);
  print(':');
  print(se);
  print(" (");
  print(ms);
  println(")");
}



void setup() {
  print("[+] Startup: ");
  printDate();


  // Window settings
  size(640, 480);
  windowTitle("IBIS Master für HAZ 3");
  background(255, 255, 255);

  println("[ ][+] Serial Ports avaliable: ");
  printArray(Serial.list());
  println("[ ][-] Serial Ports");


  
  
  send_telegram();
  //ds009_24_telegram();
}

void draw() {
}
