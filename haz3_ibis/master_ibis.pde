/* (c) Jojo_gaming_gyt
 * 01.07.2024
 * HAZ 3, IBIS Master
 
 */

/*  IMPORTS     */
import processing.serial.*;
Serial Wandler;


/*  CONSTANTS */
final String WANDLER_COM_PORT = "COM8";
final boolean cycle_telegram = true;

/* Programm-Variablen */
boolean debug = true;
boolean repeat_telegram = true;
boolean telegram_fehler = false;

/* Funktions-Variablen */
String Haltestelle = "Johannisthal";  // Anzuzeigender Text


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


  // Telegram 009 24C senden
  send_telegram("DS009_24", 0);



  //ds003c_telegram(6);

  //send_telegram();
  //ds009_24_telegram();

  print("[<][0] End Startup: ");
  printDate();
}

void draw() {
}
