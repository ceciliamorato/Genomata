/* Brief animation that shows up while the songs are loading. */

public class Animation {
  float x, y;
  int num_points;
  boolean grow;
  float circle_diameter;
  float plot_radius;
  float angle_increment;
  float lifespan;
  
  Animation() {
    this.num_points = 1;
    this.grow = true;
    this.circle_diameter = 4;
    this.plot_radius = 90;
    this.angle_increment = radians(0);
    this.lifespan = 255; // transparency
  }
  
  public void checkNumberOfPoints() {
    if (this.num_points > 1000) this.grow = false;
    if (this.num_points == 0) {this.grow = true;} 
    if (this.grow) {this.num_points++;}
    else this.num_points--;
  }
  
  public void display() {
    translate(width/2, height/2);
    rotate(radians(this.num_points));
    this.angle_increment = radians(25);
    checkNumberOfPoints();
    for (int i=0; i<this.num_points; i++) {
      float ratio = i*1./num_points;
      float spiral_radius = ratio * plot_radius;
      float angle = i * angle_increment;
      this.x = cos(angle) * spiral_radius;
      this.y = sin(angle) * spiral_radius;
      fill(360, this.lifespan);
      ellipse(this.x, this.y, circle_diameter, circle_diameter);
      this.lifespan -= 0.5;
      if (this.lifespan == 0) this.lifespan = 255;
    }
  }
}
