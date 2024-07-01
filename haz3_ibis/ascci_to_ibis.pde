void formatieren() {
  // Mit Leerzeichen füllen
  for (byte i = 0; i < message_char.length; i++) {
    message_char[i] = 32;
  }

  arrayCopy(message, message_char);
}




void encode_message() {
  formatieren();

  for (byte i = 0; i < message_bytes.length; i++) {
    int zeichen = message_char[i];

    switch (zeichen) {

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
    }
  }
}
