
class smRadar{
  
  float x=0,y=0,a=0;
  float spd=0.01;
  float wdth=50;
  color cl1=color(0,155,0);
  color cl2=color(0,255,0);
  float strWd=2;
  
  void sRdDraw(){
    
    
    
  strokeWeight(strWd); 
  fill(255,255,255,0);
  stroke(cl1);
  circle(x,y,wdth/2);
  circle(x,y,wdth);
  circle(x,y,wdth*2);
  circle(x,y,wdth*3);
  stroke(cl2);
  push();
  translate(x,y);
  rotate(a);
  a=a+0.01;
  //println(a);
  line(0,0,wdth,wdth);  
  pop();
  
  
  //rect(100,100,200,200);
  
  }
  
  
}
