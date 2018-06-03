import SimpleOpenNI.*;

ComunicacionOSC comunicacionOSC;
Paleta paleta;
Motor motor;

int estabilidadGeneral = 6;

void setup(){
  size( 800, 600, P2D );
  
  comunicacionOSC = new ComunicacionOSC( this );
  paleta = new Paleta();
  motor = new Motor(this);

}

void draw(){
  frame.setTitle( "fps: " + frameRate ); 
  motor.ejecutar();
  pushStyle();
  fill( 255 );
  textSize( 35 );
  text( "fps: " + nf(frameRate,0,-1), 10, height - 20 );
  popStyle();
}

void keyPressed(){
  motor.keyPressed();
}

void mouseWheel(MouseEvent e){
  motor.mouseWheel( e );
}

//---------------------------------------------- EVENTOS KINECT
void onNewUser(SimpleOpenNI curContext, int userId)
{
  println("onNewUser - userId: " + userId);
  println("\tstart tracking skeleton");

  curContext.startTrackingSkeleton(userId);
  
  motor.addUsuario( userId );

}

void onLostUser(SimpleOpenNI curContext, int userId)
{
  println("onLostUser - userId: " + userId);
  //motor.removerUsuario( userId );
}

void onVisibleUser(SimpleOpenNI curContext, int userId)
{
}