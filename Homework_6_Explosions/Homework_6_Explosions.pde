//------------------------------> Global Variables

int particleSwitch;

ArrayList<Explosion> particles = new ArrayList<Explosion>();
Explosion explosion = new Explosion(0,0,0);

//------------------------------> Explosion Setup

void setup() {
  size(800, 800);
  noStroke();
  smooth();
}

//------------------------------> Explosion Update

void draw() {
  background(200);

  explosion.circleUpdate();
}

//------------------------------> Explosion Mouse Pressed

void mousePressed(){
  particleSwitch += 1;
  
  //Adds a 100 particles on mouse click
  
  for(int i = 0; i < 100; i++){
    particles.add(new Explosion(mouseX, mouseY,particleSwitch));   
  }
  
  if(particleSwitch == 3){
    particleSwitch = 0;
  }
}
