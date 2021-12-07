
class sea{
  
  int wavesQ=20;
  
  float [] waveX;
  float [] waveY;
  float [] wavel;
  boolean [] waveUP;
  int [] waveSpd;
  
  void genProps(){
    
  }
  
  void seaIni(){
    
    waveX=new float [wavesQ];
    waveY=new float [wavesQ];
    wavel=new float [wavesQ];
    waveUP=new boolean [wavesQ];
    waveSpd=new int [wavesQ];
    
    //genProps();
     for (int i=0; i<wavesQ; i++){
      waveX[i]=random(10,width-10);
      waveY[i]=random(10,height-10);
      wavel[i]=random(1,8);
      waveSpd[i]=int(random(1,8));
      
      if (random(0,1)>0)
      waveUP[i]=false;
      else
      waveUP[i]=true;
    }
   
    
  }
  
  void drawSea(){
    
    for (int i=0; i<wavesQ; i++){
      stroke(255,255,255,120);
      
      line(waveX[i]-wavel[i],waveY[i],waveX[i]+wavel[i],waveY[i]);
      
      if (frameCount % waveSpd[i]==0 && waveUP[i]==false)
      wavel[i]=wavel[i]+1;
      
      if (frameCount % waveSpd[i]==0 && waveUP[i]==true)
      wavel[i]=wavel[i]-1;
      
      if (wavel[i]>10){
      waveUP[i]=true;
      }
      
      if (wavel[i]<1){
      waveX[i]=random(10,width-10);
      waveY[i]=random(10,height-10);
      wavel[i]=random(1,5);
      waveUP[i]=false;
      waveSpd[i]=int(random(1,8));
      }
      
    }
    
    
  }
  
}

//////////////// IMPLEMENTATION ////////////////////// IMPLEMENTATION //////////////// 
//////////////// IMPLEMENTATION ////////////////////// IMPLEMENTATION //////////////// 
//////////////// IMPLEMENTATION ////////////////////// IMPLEMENTATION //////////////// 

sea seaPoint = new sea();

void setup() {
  size(640, 360); 
  seaPoint.wavesQ=150;
  seaPoint.seaIni();
  
}

void draw() { 
  background(0,0,151);
  
  seaPoint.drawSea();
  
}
