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

  telegram[25] = byte('\r');  // Formatzeichen "CR"

  telegram_parity = calculate_parity(telegram, 0, 25);
  telegram[26] = telegram_parity;

  



  
  return telegram;
}
