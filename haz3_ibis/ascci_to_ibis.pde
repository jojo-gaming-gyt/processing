byte[] encode_message(byte stellen) {


  if (stellen == 0) {
    stellen = 24;
  }

  byte[] message_bytes = new byte[stellen];

  // Mit Leerzeichen füllen
  for (byte i = 0; i < stellen; i++) {
    message_bytes[i] = 32;
  }





  for (byte i = 0; i < stellen; i++) {
    char zeichen;

    // Einzelne Buchstaben auf String auslesen
    if (i >= Haltestelle.length()) {
      zeichen = 32;   // Gegen Overflow
    } else zeichen = Haltestelle.charAt(i);



    switch (zeichen) {

    case '\r':
      message_bytes[i] = 'r';
      break;
    case 'ä':
      message_bytes[i] = 123;    // {
      break;
    case 'ö':
      message_bytes[i] = 124;    // /
      break;
    case 'ü':
      message_bytes[i] = 125;    // }
      break;
    case 'ß':
      message_bytes[i] = 126;    // ~
      break;
    case 'Ä':
      message_bytes[i] = 91;    // [
      break;
    case 'Ö':
      message_bytes[i] = 92;    // \
      break;
    case 'Ü':
      message_bytes[i] = 93;    // ]
      break;

    default:
      message_bytes[i] = byte(zeichen);
    } // end_switch
  } // end_for

  return message_bytes;
}
