import de.voidplus.leapmotion.*;    

LeapMotion leap;

PImage paa,tyoki,goo,title;

void setup() {
  size(800, 500, P3D);
  background(255);
  
  leap = new LeapMotion(this);

  paa = loadImage("paa.png");
  tyoki = loadImage("tyoki.png");
  goo = loadImage("goo.png");
  title = loadImage("title.png");
}


boolean isHand = false;
void draw() {
  background(255);
  ArrayList<Hand> hands = leap.getHands ();
  int handNum = hands.size();      // 現在認識している手の数を得る
  Hand h1,h2;
  if (handNum <= 0){
    println("title");
    image(title,0,0,width,height);
    isHand = false;
    return;
  }else{
      h1 = hands.get(0);
      h1.draw();

      //pushMatrix();
      translate(width/2,height/2);
      //popMatrix();
  
      Finger f1,f2;
      f1 = h1.getFinger(2);
    
      ArrayList<Finger> fings;
      fings = h1.getOutstretchedFingers();
      zyanken(fings.size());
      isHand = true;
  }
}


void zyanken(int num){
  switch(num){
    case 0: println("goo  "); num = 0; image(paa,-200,-200,400,400); break;    
    case 2: println("tyoki  "); num = 1; image(goo,-200,-200,400,400); break;
    case 5: println("paa  "); num = 2; image(tyoki,-200,-200,400,400); break;
    default:println("title"); image(title,-width/2,-height/2,width,height); break;
  }
  
  /*
  int numcp = (int)random(0,3);
  switch(numcp){
    case 0: print("goo  "); break;
    case 1: print("tyoki  "); break;
    case 2: print("paa  "); break;
  }
  
  if(num == numcp){
      println("aiko");
  }
  else if(num == 2 && numcp == 0){
      println("WIN");
  }
  else if(num == 0 && numcp == 2){
      println("LOSE");
  }
  else if(num < numcp){
      println("WIN");
  }
  else if(num > numcp){
      println("LOSE");
  }
  */
  
  //delay(100);
  
}