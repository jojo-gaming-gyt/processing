void list_ports() {
  String[] Ports = Serial.list();
  println("[>][1] Serial Ports avaliable: ");

  for (byte i = 0; i < Ports.length; i++) {
    print("[ ][1] [");
    print(i);
    print("] : ");
    print(Ports[i]);
    println("");
  }


  //printArray(Serial.list());
  println("[<][1] Serial Ports");
}

void send_telegram(String telegram_type, int wdh_per_minute) {
  byte[] final_telegram;
  switch (telegram_type) {
  case "DS009_24":
    final_telegram = ds009_24_telegram();
    break;

  case "DS003c_1":
    final_telegram =  ds003c_telegram(1);
    break;

  case "DS003c_2":
    final_telegram =  ds003c_telegram(2);
    break;

  case "DS003c_3":
    final_telegram =  ds003c_telegram(3);
    break;

  case "DS003c_4":
    final_telegram =  ds003c_telegram(4);
    break;

  case "DS003c_5":
    final_telegram =  ds003c_telegram(5);
    break;

  case "DS003c_6":
    final_telegram =  ds003c_telegram(6);
    break;

  default:
    //throw new Exception("Nicht Implementiert");
    return;
  }
  
    if (debug) {
    print("{ ");
    for (byte i = 0; i < final_telegram.length; i++) {
      print(final_telegram[i]);
      print(' ');
    }
    print("} Parity: ");
    print(telegram_parity);
    print(". Decode: >");

    for (byte i = 0; i < final_telegram.length; i++) {
      if (final_telegram[i] == '\r') break;
      print(char(final_telegram[i]));
    }
    println("<");
  }


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
    repeat_telegram = false;
    println("[ ][!] Ein Fehler beim Verbindungsaufbau zum Wandler ist aufgetreten");
  }
  if (!com_port) return;
  //if (!repeat_telegram) return;

  if (wdh_per_minute < 1) {
    Wandler.write(final_telegram);
    Wandler.stop();
    return;
  }

  // Mehrfaches Wiederholen


  //thread("wdh_telegram");
}

/*
void wdh_telegram() {
 try {
 Wandler.write(final_telegram);
 }
 }
 */
