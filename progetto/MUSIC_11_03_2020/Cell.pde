
/* Cells of the automata*/
/* Colours are controlled by valence, loudness, danceability, energy */

private class Cell {

    private final int mX;
    private final int mY;
    private final int mZ;
    private final int left;
    private final int right;
    private final int above;
    private final int below;
    private final int inFront;
    private final int behind;
    
    private color mColour;
    private int strokeValue;
    private boolean intoGeneration; /* this tell us if the cells is contained in a generation ArrayList*/
    
    private int state; /* state = 0 if the cells is dead*/

    
    Cell(int x, int y, int z) {
      
        this.mX = x;
        this.mY = y;
        this.mZ = z;
        
        this.state=0;
        
        if (x-1 < 0) {this.left = int(GRID_WIDTH -1);} else {this.left = x-1;}
        if (x+1 == GRID_WIDTH ) {this.right = 0;} else {this.right = x+1;}      
        if (y-1 < 0) {this.above = int(GRID_HEIGHT -1);} else {this.above = y-1;}
        if (y+1 == GRID_HEIGHT ) {this.below = 0;} else { this.below = y+1;}
        if (z+1 == GRID_DEPTH) {this.behind =0;} else {this.behind = z+1;}      
        if (z-1 <0) {this.inFront = int(GRID_DEPTH -1);} else {this.inFront = z-1;}
    }
    
    public void setState(int s){ 
      if(s==0){ this.die();}
      else{
        this.state = s;
        this.mColour = setColorFromState();
        this.strokeValue = 200;
        }
      }
      
      //ritorna vero se la cella è gia inclusa in una generazione
     public boolean inIntoGeneration(){
       return this.intoGeneration;
     }
     
     public void setIntoGeneration(){
       this.intoGeneration = true;
     }
     
     public void notIntoGeneration(){
       this.intoGeneration = false;
     }
    
    
    /* hue is controlled by valence */
    /* loudness control by Saturation */
    /* danceability control brightness */ // 360/20STATI = 18 ====>>>>>> this.state*danceability*18
    private color setColorFromState(){
      return color(hue_i, this.state*loudness, this.state*18*danceability, transparency); 
    } 
       
    public void die() {
        this.state=0;
        this.mColour = color(100,0);
        this.strokeValue = 0;
    }
    
    public boolean isActive() {
      if(this.state > 0) {return true;}
       return false;
    }
    
   public void drawCell(int size) {
        pushMatrix();
        stroke(0,strokeValue);
        fill(mColour);
        translate(mX * size, mY * size, mZ * size);
        box(size*en_size);
        popMatrix();
    }    
    
    public int getLeft(){ return this.left;}
    public int getRight(){return this.right;}
    public int getAbove(){return this.above;}
    public int getBelow(){return this.below;}
    public int getInFront(){return this.inFront;}
    public int getBehind(){return this.behind;}  
    public int getState(){return this.state;}    
}
