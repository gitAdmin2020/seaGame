 
float x=0;
float y=0;
float easing = 0.05;
float a=0;

smRadar rd = new smRadar();
smRadarBar rdb = new smRadarBar();

boolean showReageon=false;
int regionNum=0;
int regionNumOver=0;

void setup() {
  size(900, 500); 
  //noStroke();
  rdb.wdth=100;
  rdb.ofsX=0;
  rdb.spd=0.01;
  rdb.rbIni(width, height);  
  
  rd.x=200;
  rd.y=200;
  rd.a=random(0.1,7);  
  rdb.systmActiveMsg=false;
}

void draw() { 
  background(51);
  
  
  if (!showReageon)rdb.rbDraw();
  fill(255);
  
  text("квадрат "+regionNumOver,20,height-60);
  
}

void keyPressed(){
  rdb.systmActiveMsg=true;
}
