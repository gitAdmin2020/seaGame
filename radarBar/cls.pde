
class smRadarBar{
  
  float x=0,y=0,a=0;
  float spd=0.1;
  float wdth=50;
  color cl1=color(0,155,0);
  color cl2=color(0,255,0);
  float strWd=2;
  int stepsX;
  int stepsY;
  
  int ofsX=5;
  
  float [] ang;
  
  float wdd;
  float htt;
  
  boolean systmActiveMsg=true;
  
  boolean mClck = false;
  boolean mOver = false;
  int selected=0;
  int cnt=0;
  int i3=0;
  //float [] ar
  
  void rbIni(float wd, float ht){
    
    htt=ht;
    wdd=wd;
    
    stepsY=round(ht/wdth);
    stepsX=round(wd/wdth);
    stepsY=stepsY-1;
    
    ang=new float [(stepsX*stepsY)];
    
    //println(ang.length);
    
    for (int i=0; i<(stepsX*stepsY); i++){
      //x=i*wdth;
      //rect (x,0,wdth,wdth);
      ang[i]=random(0.1,7);
    }
    
  }
  /// /// /// /// /// /// /// /// /// /// /// /// 
  
  void rbDraw(){
  i3=0;  
  cnt=1; 
  for (int i2=0; i2<stepsY; i2++){ 
   
  y=i2*wdth+wdth/2-ofsX;
  
  for (int i=0; i<stepsX; i++){
  
  x=i*wdth+wdth/2-ofsX;
  float wd=wdth/4;
    
  strokeWeight(strWd); 
  fill(255,255,255,0);
  stroke(cl1);
  circle(x,y,wd/2);
  circle(x,y,wd);
  circle(x,y,wd*2);
  circle(x,y,wd*3);
  stroke(cl2);
  push();
  translate(x,y);
  ang[i3]=ang[i3]+0.05;
  a=ang[i3];
  rotate(a);
  
 
  /*
  ang[i]=ang[i]+spd;
  a=ang[i];
  */
  //println(a);
  //if (cos(millis()/50)*5>0)
  if (cos(ang[i]*10)*5>0)
  stroke(cl2);
  else 
  stroke(cl1);
  line(0,0,wd,wd);  
  pop();
  
  float rX=x-wdth/2;
  float rY=y-wdth/2;
  if (mouseX>rX && mouseX<rX+wdth && mouseY>rY && mouseY< rY +wdth){
  fill(255, 255,0,120);
  
  //mClck = false;
  //mOver = false;
  if (mousePressed == true) {
  selected=cnt;
  showReageon=true;
  regionNum=cnt;
  }
  regionNumOver=cnt;
  //println(selected);
  
  }
  else {
  fill(255,255,255,0);
  }
  stroke(cl1);
  
  rect (x-wdth/2,y-wdth/2,wdth,wdth,10);
  cnt++;
  i3++;  
  }
  
  
   
    
  }
  
  /////////// circle end /////////
  
  if (i3>(stepsX+stepsY)-2)
    i3=0;
    else
    i3++;
    
    if (systmActiveMsg){
    if (cos(millis()/200)*10>0){
    fill(0,0,0,180);
    rect(20,htt/2-30,wdd-40,40,4);
    fill(0,255,0,255);
    textSize(18);
    String lb="System is Active";
    text(lb,width/2-textWidth(lb)/2,htt/2-5);
    }
    }
    
  }
  
}
