StringList eIds;
StringList eX;
StringList eY;
int i=0;
float x,y;
boolean mv=false;
boolean mf=false;

float easing = 0.001;
float  aSt=-1.557;
color bg;

int iMode=0;
int popal=0;

import fisica.*;

FWorld world;
FCircle obstacle;

FCircle enemy;

PImage ship1Pic;

void gActivePartIni(){
   
  ship1Pic=loadImage("src/g855-3-6-1.png");
  
  eIds = new StringList();
  eX = new StringList();
  eY = new StringList();
  
  x=width-50;
  y=height-50;
  
  //x=width/2;
  //y=height/2;
  
  bg=color(50,50,255);
  color bg2=color(50,50,255);
  
  Fisica.init(this);

  world = new FWorld();
  
  world.setGravity(0,0);

  obstacle = new FCircle(110);
  //obstacle.setRotation(PI/4);
  //obstacle.setPosition(width/2, height/2);
  obstacle.setStatic(true);
  obstacle.setFill(0,0,0,20);
  obstacle.setNoStroke();
  obstacle.setRestitution(0);
  world.add(obstacle);
  
    enemy = new FCircle(5);
    //enemy.setPosition(width/2, 50);
    enemy.setPosition(random(50, width-100), 50);
    enemy.setDamping(0);
    enemy.setVelocity(0, 5);
    enemy.setRestitution(0);
    enemy.setNoStroke();
    enemy.setFill(255, 0, 0);
    world.add(enemy);
}

void gActivePart(){
  
  
  if (mv){
    
    float tx=float(eX.get(i-1));
    float ty=float(eY.get(i-1));
    
    strokeWeight(1);
    stroke(100,255,100);
    fill(bg);
    if (cos(millis()/100)>0)
    rect(tx-5,ty-5,10,10);    
    else
    rect(tx-10,ty-10,20,20);
    
    strokeWeight(2);
    //stroke(255);
  
    point(tx,ty);
    
   
 
    
   }
  
  if (mf){
  float targetX = float(eX.get(i-1));
  float dx = targetX - x;
  x += dx * easing;
  
  float targetY = float(eY.get(i-1));
  float dy = targetY - y;
  y += dy * easing; 
    
  }
  
  pushMatrix();
  strokeWeight(0);
  translate(x, y);
  
  //a = atan2(mouseY-y, mouseX-x);
  if (!mv) { 
  //aSt=-1.557;
  }
  else {
  float a = atan2(float(eY.get(i-1))-y, float(eX.get(i-1))-x);
  //if (frameCount % 100==0){
  float targetA = a;
  float dA = targetA - aSt;
  aSt += dA*0.01;
  //fill(255);
  //text(dA,20,20);
  
  if (dA>-0.2 && dA<0.2)mf=true;
  
  
  //}
  /*
  float targetY = float(eY.get(i-1));
  float dy = targetY - y;
  y += dy * easing; 
  */
  }
  rotate(aSt);
  fill(255,0,0);
  //triangle(0, 5, 8, -8, -10, 5);
  fill(255);
  //rect(-10, -2.5, 20, 5);
  image(ship1Pic,-17, -4.5);
  popMatrix();

 obstacle.setPosition(x, y);
  
  
   
  for(int i=0; i<eIds.size();i++){
    //point(float(eX.get(i)),float(eY.get(i)));
  }
  String iSStr="";
  if (iMode==0)
  iSStr="Itersepter is Ready";
  if (iMode==1)
  iSStr="Itersepter is Activated";
  
  if (iMode==2)
  iSStr="Itersepter is Moving to Target";
  
  if (iMode==4)
  iSStr="Itersepter Completed the Mission";
  
  if (iMode!=4 && mv) iMode=1;
  
  if (iMode!=4 && mf) iMode=2;
    
  if (mf && cos(millis()/200)>0)
  fill(100,255,100);
  //text("",width/2-textWidth(iSStr)/2,50);
  else
  fill(255);
  
  text(iSStr,width/2-textWidth(iSStr)/2,50);
  
   if (iMode!=4){
   fill(0,0,0,0);
   stroke(255,0,0,255);
   strokeWeight(2);
   if (cos(millis()/100)*20>0)circle(enemy.getX(),enemy.getY(),20);
   }
  //float test=enemy.getX();
  
   world.draw();
   world.step();
   
  strokeWeight(1);
  stroke(255);
  ArrayList contacts = obstacle.getContacts();
  for (int i=0; i<contacts.size(); i++) {
    FContact c = (FContact)contacts.get(i);
    stroke(random(10,255));
    if (cos(millis()/50)>0)
    line(c.getBody1().getX(), c.getBody1().getY(), c.getBody2().getX(), c.getBody2().getY());
  }
  
   
  
}

void setup() {
  
    size(700,400);
    
    gActivePartIni();
 

}

void draw() {
  
  background(bg);  
  //gameGo();
  gActivePart();
  

  
}


void contactPersisted(FContact c) {
  FBody ball = null;
  if (c.getBody1() == obstacle) {
    ball = c.getBody2();
    popal++;
  } else if (c.getBody2() == obstacle) {
    ball = c.getBody1();
    popal++;
  }
  
  if (ball == null) {
    return;
  }
  
  ball.setFill(30, 190, 200);
  if (popal>20){
  world.remove(ball);
  //mf=false;
  //mv=false;
  iMode=4;
  }
  
  fill(255);
  text(popal,20,20);
}

void mousePressed(){
  mv=true;
  mf=false;
  eIds.append(str(i));
  eX.append(str(mouseX));
  eY.append(str(mouseY));
  i++;
}

void keyPressed(){
  //int item = int(eIds.get(i));
  /*
  eIds.append(str(i));
  eX.append(str(random(20,width-40)));
  eY.append(str(random(20,height-40)));
  i++;
  */
}


void gameGo(){
  
  
  
}
