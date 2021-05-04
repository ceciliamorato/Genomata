/* Particles inserite per fare da "contorno" all'automa*/

/* Il valore del centroide dello spettro è mappato su (0,height) e le particles seguono la direzione y di quest'ultimo*/

/* Il valore del centroide è inoltre usato per regolare la brillantezza del colore delle particles*/

/* Il valore dell'energia è utilizzato per dare degli sprint in orizzontale quando questa raggiunge i livelli massimi nel brano*/

/* Le particle si muovono nello spazio con densità e coefficienti di resistenza diversi regolati in base alla denceability e all'acousticness del brano*/

/* Velocità massima limitata dalla densità(0.01,1)*50*/

/* Grandezza particle regolata da en_size*5 , dove en_size(0.4,2)*/


public class ParticleSystem {

  private ArrayList<Particle> particle;
  private int numParticle;
  private Density density;
  private float centroidY; // Vertical position of centroid
  private boolean addEn;
  private float param1 = map(danceability, 0, 1, 1, 0.001); // density 
  private float param2 = map(acousticness/10, 0, 1, 0.01, 1); // coefficiente di resistenza - 0.01-1

  ParticleSystem() {
    this.numParticle = 1000;
    this.addEn = false;
    this.particle = new ArrayList<Particle>(this.numParticle);
    density = new Density(param1, param2);
    generateParticle();
  }

  public void generateParticle() {
    for (int i = 0; i < this.numParticle; i++) {
      particle.add(new Particle(param1, param2));/* p1 velocità e p2 acc */
    }
  }

  public void drawParticles() {
    background(0);
    this.centroidY =  map(centroid_buffer_at_index, 300, 8000, 0, height);/* Centroid position mapped between 0 and height*/
   /* fill(255);
    ellipse(width/2, this.centroidY, 50 ,50);*/ // to see the centroid
    if (energy_buffer_at_index_buffer >= 5*MAX_ENERGY/7) {/* sprint only for max peaks - 1000 to have a bigger range*/
      this.addEn=true;
    }  
    for (Particle p : this.particle) {
      if (this.addEn)  p.energySprint();/* force number2 */      
      p.followCentroid(this.centroidY);/* force number3 */
      density.applyForce(p); /* force number1 */
      p.drawParticle();
    }
    this.addEn = false;
  }  



  private class Particle {

    PVector location;
    PVector velocity;
    PVector acceleration;
    
    color colorParticle;
    private float brightness;/* controlled by centroid */
    
    private PVector energyPoint;
    float mass;
    float LIMIT_VELOCITY;
    int CONSTANT_ACC = 1;
    private PVector centroid;

    private float radius;
    private float p1, p2;


    Particle (float p1, float p2) {
      this.p1 = p1;
      this.p2 = p2;
      LIMIT_VELOCITY = this.p1*100; // max velocity
      this.location = new PVector(random(0, width), random(0, height));
      this.velocity = new PVector(0, random(2));
      this.acceleration =  new PVector (0, random(2)); 
      this.mass = 1;
      this.radius = 2;
      this.centroid = new PVector(0, 0);
      this.energyPoint = new PVector(0, 0);
    }

    public void checkEdges() {
      //controlli per il centroide
      if (this.location.y <= this.centroid.y + radius &&  this.location.y >= this.centroid.y - radius) {      
        this.location.y = random(this.centroid.y, height);
        
        // horizontal random velocity due to entropy
        if (this.location.x < width/2) this.velocity.x = -random(entropy_buffer_at_index_buffer*2) ;
        else this.velocity.x = random(entropy_buffer_at_index_buffer*2);
       
        this.velocity.y = random(2); 
        this.acceleration.y = random(2);
      }
      
      //controlli energi sprint
      if (this.location.x > width) {this.location.x = random(width/2, width); this.location.y =random(this.centroid.y, height);}
      if (this.location.x < 0) {this.location.x = random(0, width/2);this.location.y =random(this.centroid.y, height);}
    }

    public void followCentroid(float y) {  

      this.centroid.x = location.x; 
      this.centroid.y = y;

      checkEdges(); 

      centroid.sub(this.location);
      centroid.normalize();
      centroid.mult(CONSTANT_ACC);

      this.acceleration.add(centroid);
      this.velocity.add(this.acceleration);
      this.velocity.limit(LIMIT_VELOCITY); 
      this.location.add(this.velocity);

      this.acceleration.mult(0);
    }

    // Horizontal force due to energy
    public void energySprint() {      
      this.energyPoint.y = 0; 
      if (this.location.x<width/2)  this.energyPoint.x = -en_size*width/15 +this.location.x;
      else this.energyPoint.x = +en_size*width/15 + this.location.x;     
      this.energyPoint.sub(this.location);
      this.acceleration.add(this.energyPoint);
      this.energyPoint.mult(0);
    }


    void applyForce(PVector force) {    
      this.acceleration.add(PVector.div(force, this.mass*en_size));
    }

  //valence==> hue, loudness ==>saturation, centroidPosition ==> brightness
    public void drawParticle() {
      pushMatrix();
      brightness = map(centroid_buffer_at_index, 300, 8000, 50, 100);
      this.colorParticle = color(hue_i, 20*loudness, brightness); // il centroide indica la brillantezza del suono
      starBuilder(this.location.x, this.location.y, this.mass*en_size,this.colorParticle);
      popMatrix();
    }

    //texture particles
    public void star(float x, float y, float radius1, float radius2, int npoints, int n) {
      float angle = TWO_PI / npoints;
      float halfAngle = angle/2.0;
      beginShape();
      for (float a = 0; a < TWO_PI; a += angle) {
        float sx = x + cos(a) * radius2/n;
        float sy = y + sin(a) * radius2/n;
        vertex(sx, sy);
        sx = x + cos(a+halfAngle) * radius1/n;
        sy = y + sin(a+halfAngle) * radius1/n;
        vertex(sx, sy);
      }
      endShape(CLOSE);
    }

    public void starBuilder(float x, float y, float mult, color c) {
      int m = 10;
      createShape();
      beginShape();
      noStroke();
      fill(c, 30);
      star(x, y, 25*mult, 60*mult, 6, m);
      fill(c, 55);
      star(x, y, 15*mult, 55*mult, 6, m);
      fill(c, 80);
      star(x, y, 10*mult, 50*mult, 6, m);
      fill(c);
      star(x, y, 5*mult, 70*mult, 6, m);
      endShape(CLOSE);
    }
  }

 // Apply forces to the particles to simulate a fluid
  private class Density {

    float rho, C_d;
    float area;
    int radius = 100;

    Density(float p1, float p2) {
      this.rho = p1; // density  
      this.C_d = p2; // drag coefficient- 0.1
      area = 0.001*radius*2*PI; // frontal area
    }

    private void applyForce(Particle M) {
      PVector viscous_force = M.velocity.copy();
      float mag = viscous_force.mag();
      viscous_force.normalize();       
      viscous_force.mult(-0.5*area*this.C_d*this.rho*mag);       
      M.applyForce(viscous_force);
    }
  }
}
