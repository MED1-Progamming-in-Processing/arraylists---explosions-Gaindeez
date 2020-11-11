//------------------------------> Explosion class
class Explosion {

  PVector acceleration = new PVector(0,0.1);
  PVector velocity = new PVector(random(-3,3),random(-4,3));
  PVector positions = new PVector();
  
  int particleType;
  float bounceVertical = -0.85;
  float bounceHorizontal = 2;

//------------------------------> Explosion class Constructor
  
Explosion(float x, float y, int type){
  this.positions.x = x;
  this.positions.y = y;
  this.particleType = type;
}

//------------------------------> Explosion class Update which goes to the main script

void circleUpdate(){

//Updates move and display functions for each particle

  for (int i = particles.size()-1; i >= 0; i--) {
    particles.get(i).move();
    particles.get(i).display();
    
//Removes out of screen particles

    if(particles.get(i).isOffScreen()){
      particles.remove(i);
    }
  }
}

//------------------------------> Explosion class function which handles movement of particles

void move() {
  
//Gravity essentially
  
  velocity.y += acceleration.y;

//Explosion spread
  
  positions.x += velocity.x;
  positions.y += velocity.y;
  
//Ground bounce
    
  if(positions.y + velocity.y > height){
    velocity.y *= bounceVertical;
    velocity.x *= bounceHorizontal; 
  }
}

//------------------------------> Explosion class function which changes between the different particles

void display() {

  if(particleType == 1){
    fill(#0092FF);
    ellipse(positions.x, positions.y, 20, 20);
  }
  else if(particleType == 2){
    fill(#5BFC00);
    triangle(positions.x+10, positions.y, positions.x-10, positions.y, positions.x, positions.y-15);
  }
  else if(particleType == 3){
    fill(#FC6100);
    rect(positions.x, positions.y, 20, 20);
  }
}
  
//------------------------------> Explosion class boolean for checking when particles leave the camera

boolean isOffScreen(){
    return positions.x < 0 || positions.x > width || positions.y < 0 || positions.y > height+50;
  }
}
