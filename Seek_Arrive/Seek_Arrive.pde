
import hypermedia.net.*;
UDP udpr;  // define the UDP object;
UDP udps;  // define the UDP object;
String message;
float mx=0.0;
float my=0.0;

void setup() {
  noLoop();
  // create a new datagram connection on port 6000
  // and wait for incomming message
  udpr = new UDP( this, 7000);
  udps = new UDP( this, 6999);
}

void draw() {
  mx = random(3);
  my = random(6);
  
  float [] test = {0,1,2};
  
  
  
  String message2  = mx + ";" + my + ";" + test[2];
  String ip       = "127.0.0.1";	// the remote IP address
  int port        = 7001;		// the destination port
  print(message2);
  udps.send( message2, ip, port );
  
}

