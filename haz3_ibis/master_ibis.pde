/* (c) Jojo_gaming_gyt
 * 01.07.2024
 * HAZ 3, IBIS Master
 
 */

/*  IMPORTS     */
import processing.serial.*;
Serial Wandler;


/*  CONSTANTS */
final String WANDLER_COM_PORT = "COM8";

/* Programm-Variablen */
boolean debug= false;

/* Funktions-Variablen */
String Haltestelle = "Johannistahl";  // Anzuzeigender Text
boolean com_port = false;             // Verfügbarkeit COM Port
byte telegram_parity;


//byte max_telegram_length = 27;
//byte[] message_bytes = new byte[24];





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
  print("[>][0] Startup: ");
  printDate();


  // Window settings
  size(640, 480);
  windowTitle("IBIS Master für HAZ 3");
  background(255, 255, 255);


  list_ports();
  
  delay(20000);
  
  exit();

  
  
  send_telegram();
  //ds009_24_telegram();

  print("[<][0] End Startup: ");
  printDate();
}

void draw() {
}
