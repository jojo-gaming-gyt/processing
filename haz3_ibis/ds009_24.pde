// DS009 24C Telegram
void ds009_24_telegram() {
  // Mit Leerzeichen füllen
  for (byte i = 0; i < telegram.length; i++) {
    telegram[i] = 32;
  }

  telegram[0] = byte('v');    // Datensatz 009

  encode_message();

  for (byte i = 0; i < message_bytes.length; i++) {
    telegram[i + 1] = message_bytes[i];
  }

  telegram_parity = calculate_parity(telegram, 24);
  telegram[25] = telegram_parity;

  telegram[26] = byte('\r');  // Formatzeichen "CR"
}
