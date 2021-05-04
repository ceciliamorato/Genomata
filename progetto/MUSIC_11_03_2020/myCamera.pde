/* Regulates rotation and zoom of the Processing camera. */

public class MyCamera {

  float goFarFar;
  Rotate r;
  boolean goFar;

  MyCamera() {
    this.goFarFar = centreZ *2/3;
    this.goFar = true;
    zoomCamera();
    moveCamera();
  }

  public void zoomCamera() {
    camera(centreX, centreY, this.goFarFar, 0, 0, 0, 0, 1, 0);
  }

  public synchronized void turnCameraRight() {
    yAngle += RADIANTE*(energy_buffer_at_index_buffer/5*(0.5)/1000);
    controller.getGrid().setAngleY(yAngle);
    if (this.goFar) {
      this.goFarFar++;
      if ( this.goFarFar > 1000) { 
        this.goFar = false;
      }
    } else {    
      this.goFarFar--;
      if ( this.goFarFar < 300) { 
        this.goFar = true;
      }
    }
  }

  public synchronized void turnCameraUp() {
    zAngle += RADIANTE*(energy_buffer_at_index_buffer/5*(0.5)/1000);
    controller.getGrid().setAngleZ(zAngle);
  }

  public void moveCamera() {
    r = new Rotate(this);
    r.start();
  }
}

public class Rotate extends Thread {

  MyCamera cam;

  public Rotate(MyCamera c) {
    this.cam = c;
  }

  @Override
    public void run() {
    for (;; delay(int(tempo/10))) {
      if (!controller.stop) {
        this.cam.turnCameraRight();
        this.cam.turnCameraUp();
      }
    }
  }
}
