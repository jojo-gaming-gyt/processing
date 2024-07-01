byte calculate_parity(byte[] data, int end_position) {
  int parity = 0;

  for (int i = 0; i < end_position; i++) {
    parity = parity ^ data[i];
  }

  byte end_parity = byte(0x7F - parity);
  return end_parity;
}


void send_telegram() {
  print("[ ][+] Telegram senden ");
  printDate();

  // Open Connection
  try {

    // COM, BAUD, PARITY, DATABITS, STOPBITS
    Wandler = new Serial(this, "COM4", 1200, 'N', 8, 1);
    com_port = true;
  }
  catch (RuntimeException err) {
    err.printStackTrace();
    com_port = false;
    println("[ ][!] Ein Fehler beim Verbindungsaufbau zum Wandler ist aufgetreten");
  }
  if (!com_port) return;

  ds009_24_telegram();

  if (debug) {
    print("{");
    for (byte i = 0; i < telegram.length; i++) {
      print(telegram[i]);
      print(' ');
    }
    print("} Parity: ");
    print(telegram_parity);
    print(". Decode: >");
    
    for (byte i = 0; i < telegram.length; i++) {
      if (telegram[i] == '\r') break;
      print(char(telegram[i]));
    }
    println("<");
  }

  // Telegram zu Wandler senden
  Wandler.write(telegram);

  Wandler.stop();

  print("[ ][-] Telegram gesendet ");
  printDate();
}
