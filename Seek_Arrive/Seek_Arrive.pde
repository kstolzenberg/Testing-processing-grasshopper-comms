
import hypermedia.net.*;
UDP udpr;  // define the UDP object;
UDP udps;  // define the UDP object;
String message2;
String message1;
float mx=0.0;
float my=0.0;

void delay(int delay)
{
  int time = millis();
  while(millis() - time <= delay);
}

void setup() {
  size(100,100);
  noLoop();
  // create a new datagram connection on port 6000
  // and wait for incomming message
  udpr = new UDP( this, 7000);
  udps = new UDP( this, 6999);
}

void draw() {
  mx = random(3);
  my = random(6);
  
  float [] test = {random(20),random(20),random(20),random(20)}; 
  float [] test2 = {random(20),random(20),random(20),random(20)}; 
  rectMode(CORNER);
  rect(test[0], test[1], test[2], test[3]);
  
  //
  String message1 = test2[0] + ";"+test2[1] + ";"+test2[2] + ";"+test2[3];
  String message2 = test[0] + ";"+test[1] + ";"+test[2] + ";"+test[3];
  //String message2  = mx + ";" + my + ";" + test[2];
  String ip       = "127.0.0.1";	// the remote IP address
  int port        = 7001;		// the destination port
  println(message1);
  println(message2);
  udps.send( message1, ip, port );
  delay(500);
  udps.send( message2, ip, port );
  
}

