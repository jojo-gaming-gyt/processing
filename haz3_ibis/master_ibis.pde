/* (c) Jojo_gaming_gyt
 * 01.07.2024
 * HAZ 3, IBIS Master
 
 */

/*  IMPORTS     */
import processing.serial.*;

Serial Wandler;




byte max_telegram_length = 27;

// Verfügbarkeit COM Port
boolean com_port = false;
// Platz für gesammtes Telegram
byte[] telegram = new byte[max_telegram_length];



// Platz für gesammte Nachricht
//char[] message_char = new char[(max_telegram_length - 3)];
char[] message_char = {'H', 'a', 'l', 'l', 'o'};



// DS009 24C Telegram
void ds009_24_telegram() {
  telegram[0] = byte('v');    // Datensatz 009

  byte[] message_bytes = byte(message_char);  //  convert to bytes

  for (byte i = 0; i < message_char.length; i++) {
    telegram[i + 1] = message_bytes[i];
  }

  telegram[25] = calculate_parity(telegram);

  telegram[26] = byte('\r');  // Formatzeichen "CR"

  for (byte i = 0; i < telegram.length; i++) {
    println(telegram[i]);
  }

  send_telegram();
}




byte calculate_parity(byte[] data) {
  int parity = 0;

  for (byte i = 0; i < data.length; i++) {
    parity = parity ^ data[i];
  }

  byte end_parity = byte(0x7F - parity);
  print("Parity: ");
  println(end_parity);
  return end_parity;
}

void send_telegram() {
}

void printDate() {
  int da = day();
  int mo = month();
  int ye = year();
  int ho = hour();
  int mi = minute();
  int se = second();

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
  println(se);
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

  // Mit Leerzeichen füllen
  for (byte i = 0; i < max_telegram_length; i++) {
    telegram[i] = 32;
  }

  try {

    // COM, BAUD, PARITY, DATABITS, STOPBITS
    Wandler = new Serial(this, "COM4", 1200, 'N', 8, 1);
    com_port = true;

    if (com_port) {
      Wandler.write(65);
      ds009_24_telegram();
    }
  }
  catch (RuntimeException err) {
    err.printStackTrace();
    com_port = false;
  }
}

void draw() {
}
