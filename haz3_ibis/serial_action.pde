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
