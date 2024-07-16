// DS009 24C Telegram
byte[] ds003c_telegram(int bloecke) {

  if (bloecke < 1) bloecke = 6;  
  if (bloecke > 6) bloecke = 6;


  int laenge = (2 + 4 * bloecke + 2);
  byte characters = byte(4 * bloecke);
  byte[] telegram = new byte[laenge];
  byte[] message = new byte[characters];

  // Mit Leerzeichen füllen
  for (byte i = 0; i < telegram.length; i++) {
    telegram[i] = 32;
  }

  telegram[0] = byte('z');    // Datensatz 003c
  telegram[1] = byte('I');    // Datensatz 003c, großes i
  
  
  
  //telegram[2] = byte(bloecke);    // Datensatz 003c, H
  String h = str(bloecke);          // convert to ascii
  telegram[2] = byte(h.charAt(0));
  
  
  message = encode_message(characters);

  //byte end_message =
  for (byte i = 0; i < message.length; i++) {
    telegram[i + 3] = message[i];
    //print("I");
    //print(i+3);
    //print(":");
    //println(message[i]);
  }

    
  byte end_parity = byte(4 * bloecke + 1);
  telegram_parity = calculate_parity(telegram, 0, end_parity);
  telegram[26] = telegram_parity;

  telegram[27] = byte('\r');  // Formatzeichen "CR"



  
  return telegram;
}
