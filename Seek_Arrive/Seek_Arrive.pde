
// import UDP library
import hypermedia.net.*;
UDP udpr;  // define the UDP object;
UDP udps;  // define the UDP object;
String message;
float mx=0.0;
float my=0.0;

void setup() {
  // create a new datagram connection on port 6000
  // and wait for incomming message
  udpr = new UDP( this, 7000);
  udps = new UDP( this, 6999);
  //udp.log( true ); 		// <-- printout the connection activity
  udpr.listen( true );  
}

void draw() {
  mx = random(3);
  my = random(6);
  
  
  String message2  = mx + "," + my + ";";
  String ip       = "127.0.0.1";	// the remote IP address
  int port        = 7001;		// the destination port
  print(message2);
  udps.send( message2, ip, port );
  
}

