// DS009 24C Telegram
byte[] ds009_24_telegram() {

  final byte characters = 24;
  byte[] telegram = new byte[27];
  byte[] message = new byte[characters];

  // Mit Leerzeichen füllen
  for (byte i = 0; i < telegram.length; i++) {
    telegram[i] = 32;
  }

  telegram[0] = byte('v');    // Datensatz 009

  message = encode_message(characters);

  
  for (byte i = 0; i < message.length; i++) {
    telegram[i + 1] = message[i];
  }

  telegram_parity = calculate_parity(telegram, 0, 24);
  telegram[25] = telegram_parity;

  telegram[26] = byte('\r');  // Formatzeichen "CR"


  if (true) {
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
  
  return telegram;
}
