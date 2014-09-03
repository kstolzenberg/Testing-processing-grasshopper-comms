import hypermedia.net.*;
UDP udpr;  // define the UDP object;
UDP udps;  // define the UDP object;
String message2;
String message1;


void setup() {
  size(100,100);
  noLoop();
  // create a new datagram connection on port 6000
  // and wait for incomming message
  udpr = new UDP( this, 7000);
  udps = new UDP( this, 6999);
}

void draw() {  
  float [] test = {random(20),random(20),random(20),random(20)}; 
  float [] test2 = {random(20),random(20),random(20),random(20)}; 
  float [] test3 = {random(20),random(20),random(20),random(20)}; 
  rectMode(CORNER);
  rect(test[0], test[1], test[2], test[3]);
  
  //in game of life, store rectangles in an 2D array/list of arrays for each shape
  //write a for loop that pulls from an array to a string message to send to GH.

  
  /*for (int i= 0; i<test3.length; i++){
    String message 1 = join();
    //String message1 = str(test[i]); 
    println(message1);
  }*/
  
  //how to make this more compact?
  String message2 = join(nf(test,0,0),";") + ";" +join(nf(test2,0,0),";")+";"+join(nf(test3,0,0),";");
  String ip       = "127.0.0.1";	// the remote IP address
  int port        = 7001;		// the destination port
  println(message2);
  udps.send(message2, ip, port );
}

