void list_ports() {
  String[] Ports = Serial.list();
  println("[>][1] Serial Ports avaliable: ");

  for (byte i = 0; i < Ports.length; i++) {
    text(Ports[i], 0 + 20*i, 20);
    println(Ports[i]);
  }

  
  //printArray(Serial.list());
  println("[<][1] Serial Ports");



}
