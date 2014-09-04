import hypermedia.net.*;
UDP udpr;  // define the UDP object;
UDP udps;  // define the UDP object;
String message;
int i, j, x, y;
int[] report = {};
int[][] reportAll = {};

void print2DArray(int [][] arrayName){
  for (i=0;i<arrayName.length;i++){
    println(arrayName[i]);
  }
}


void setup() {
  //size of site approximately, with feet output
  size(300,620);
  background(255);
  noLoop();
  udpr = new UDP( this, 7000);
  udps = new UDP( this, 6999);
}

void draw() {  
  //start GOL
  int w = 60;
  int columns = (width/w);
  int rows = (height/w);
  color alive = color(0, 0, 0, 170);
  color dead = color(255);
  int [][] board = new int [columns][rows];
  
  for (int x = 0; x<columns; x++) {
    for (int y = 0; y < rows; y++) {
      board[x][y] = int(random(2));
    }
  }
  
  int [][] next = new int[columns][rows];
  for (int x=1; x<columns-1; x++) {
    for (int y=1; y<rows-1;y++) {
      int neighbors = 0;
      for (int i=-1; i<=1; i++) {
        for (int j = -1; j<= 1; j++) {
          neighbors += board[x+i][y+j];
        }
      }   
      neighbors -= board[x][y];

      if ((board[x][y] == 1) && (neighbors < 2)) next [x][y] = 0;
      else if ((board[x][y]==1) && (neighbors >3)) next[x][y] = 0;
      else if ((board[x][y] ==0) && (neighbors ==3)) next[x][y] = 1;
      else next[x][y]= board[x][y];
    }
  }
  board = next;

  for (int i=0; i<columns; i++) {
    for (int j=0; j<rows; j++) {
      if ((board[i][j] == 1)){
        rectMode(CORNER);
        rect(i*w, j*w, w, w);
        //prolly better ways - string/join/nf don't like 2D arrays tho
        //reportAll = (int[][])append(reportAll,report); 
        report = (int[])append(report,(i*w));
        report = (int[])append(report,(j*w));
        report = (int[])append(report,(w));
        report = (int[])append(report,(w));
      }
    }
  }
  
  String message = join(nf(report,0),";");
  println(message);
  String ip       = "127.0.0.1";	// the remote IP address
  int port        = 7001;		// the destination port
  println(message);
  udps.send(message, ip, port );
}

