byte calculate_parity(byte[] data, int start_position, int end_position) {
  int parity = 0;

  for (int i = start_position; i < end_position; i++) {
    parity = parity ^ data[i];
  }

  byte end_parity = byte(0x7F - parity);
  return end_parity;
}

/*
void send_telegram() {
  print("[ ][+] Telegram senden ");
  printDate();

  // Open Connection
  try {

    // COM, BAUD, PARITY, DATABITS, STOPBITS
    Wandler = new Serial(this, WANDLER_COM_PORT, 1200, 'E', 7, 2);
    com_port = true;
  }
  catch (RuntimeException err) {
    //err.printStackTrace();
    com_port = false;
    println("[ ][!] Ein Fehler beim Verbindungsaufbau zum Wandler ist aufgetreten");
  }
  if (!com_port) return;

  // Telegram zu Wandler senden
  Wandler.write(ds009_24_telegram());



  
  

  Wandler.stop();

  print("[<][-] Telegram gesendet ");
  printDate();
}
*/