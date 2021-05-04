

/*Simple interface to call different method and operations in all the grid cells in a easier way*/
private interface CellRunnable {
    void setCell(int x, int y, int z);
}

/*Class of the grid to draw the automata*/
/*Compute all the operations needed to control and draw it*/

private class Grid {
    
    private final int mWidth; /*Lentgh of a dimension of the matrix*/
    private final int mHeight;
    private final int mDepth;
    
    private final int mCentreX;/* Center position in the space*/
    private final int mCentreY;
    private final int mCentreZ;
    
    //private Rules currentRule;
    private final Cell[][][] cellArray;/*All the cells in the matrix*/
    int nextState [][][] ;/* Next states for cells */
    
    private HashMap<Integer, ArrayList<Cell>> mapGeneration; /* Map this.generation with arraylist of the new active cells*/
    private int generation;
    private ArrayList<Cell> generationCells; // tmp to save cells
    private ArrayList<Cell> allActive; /*All the current active cells*/
    private ArrayList<Cell> tmp ; // mi serve per disegnare in pace
    private int nextActiveCellCount;
    
    private final float maxDensityRatio;
    private final float minDensityRatio;

    
    private InitialState initialState; // strategy pattern!!!

    private float gridAngleX; // angle for rotation of the camera
    private float gridAngleY; // angle for up/down rotation of the camera
    private float gridAngleZ; // angle for rotation of the camera
    
    private boolean turnIncrease;
    
    Grid(int w, int h, int d, int centreX, int centreY, int centreZ) {
      
        this.mWidth = w;// dimension of matrix ( in this case 36 )
        this.mHeight = h;
        this.mDepth = d;
        
        this.mCentreX = centreX; // centre position of the grid in the space 
        this.mCentreY = centreY;
        this.mCentreZ = centreZ;
        
        this.cellArray = new Cell[w][h][d];
        this.nextState = new int [w][h][d];
        
        this.maxDensityRatio = 0.09;
        this.minDensityRatio = 0.00002;
        
        this.turnIncrease = true;
        
        this.nextActiveCellCount=0;
        
        this.generation = 0;
        this.allActive = new ArrayList<Cell>();
        this.generationCells = new ArrayList<Cell>();
        
        this.mapGeneration = new HashMap<Integer,ArrayList<Cell>>();
        
        this.initialise(); // inizializza tutta la griglia
    }
    
    private void forEachCell(CellRunnable runnable) {
        for (int z = 0; z < this.mDepth; z++){
            for (int y = 0; y < this.mHeight; y++){
                for (int x = 0; x < this.mWidth; x++){
                    runnable.setCell(x, y, z);}}}}

   
    private void initialise() {
      forEachCell(new CellRunnable() {
            @Override
            public void setCell(int x, int y, int z) {
               cellArray[x][y][z] = new Cell(x, y, z);
               }});}     
               
         
     /* Choose initial state according to acousticness of the song*/
    private void chooseState(){
      switch (int(acousticness)){ 
        // Regular
        case 0 : this.initialState = new CubeState(this); break;
        case 1 : this.initialState = new DiamondState(this); break;
        case 2 : this.initialState = new PyramidState(this); break;
        case 3 : this.initialState = new SphereState(this); break;
        case 4 : this.initialState = new SquareState(this); break;
        
        // so and so
        case 5 : this.initialState = new OctagonState(this); break;
        case 6 : this.initialState = new SineState(this); break;
        case 7 : this.initialState = new CrossState(this); break;
        
       //random
        case 8 : this.initialState = new EmptySphereState(this); break;
        case 9 : this.initialState = new IrregularState(this); break;
        case 10 : this.initialState= new RandomState(this); break;
      }
        
    this.initialState.setInitialState();
     
    /*count the active cells of the new state*/
    forEachCell(new CellRunnable() {
      @Override
      public void setCell(int x, int y, int z) {
        Cell c = cellArray[x][y][z];
        if(c.isActive()){
           allActive.add(c);
           }}});
     this.generation++; // Start with this.generation = 1
     this.mapGeneration.put(new Integer(this.generation), new ArrayList<Cell>(this.allActive)); 

    }
    
      
  // Set states in cells
   private void setCellArray(int x , int y, int z, int state){
     this.cellArray[x][y][z].setState(state);}

  
  //Count faces,edges and corners in common with the neighbours and update next states according to currentRule
   private synchronized void nextGeneration () {   
     
     /*here cells which are die in this generation and will be alive in the next*/
     this.nextActiveCellCount = 0; // count from zero
     
     forEachCell(new CellRunnable() { 
     @Override
     public void setCell(int x, int y, int z) {
       Cell c = cellArray[x][y][z];
       int cellState = c.getState();
       nextState[x][y][z] =  cellState;
           
       if (cellState==0){ /* COUNT ONLY DIED CELLS TO MAKE AUTOMATA EXPAND FASTER */
         int faceCount = 0;
         int edgeCount = 0;
         int cornerCount = 0;
         //faces
         if (cellArray[x][y][c.getInFront()].getState()>0) {faceCount++;}
         if (cellArray[x][y][c.getBehind()].getState()>0) {faceCount++;}
         if (cellArray[x][c.getAbove()][z].getState()>0) {faceCount++;}
         if (cellArray[x][c.getBelow()][z].getState()>0) {faceCount++;}
         if (cellArray[c.getRight()][y][z].getState()>0) {faceCount++;}
         if (cellArray[c.getLeft()][y][z].getState()>0) {faceCount++;}
         //must have at least 1 face touching
         if (faceCount>0){                        
            //edges
           if (cellArray[x][c.getAbove()][c.getInFront()].getState()>0){edgeCount++;}
           if (cellArray[c.getLeft()][y][c.getInFront()].getState()>0){edgeCount++;}
           if (cellArray[c.getRight()][y][c.getInFront()].getState()>0){edgeCount++;}
           if (cellArray[x][c.getBelow()][c.getInFront()].getState()>0){edgeCount++;}
           if (cellArray[c.getLeft()][c.getAbove()][z].getState()>0){edgeCount++;}
           if (cellArray[c.getRight()][c.getAbove()][z].getState()>0){edgeCount++;}
           if (cellArray[c.getLeft()][c.getBelow()][z].getState()>0){edgeCount++;}
           if (cellArray[c.getRight()][c.getBelow()][z].getState()>0){edgeCount++;}
           if (cellArray[x][c.getAbove()][c.getBehind()].getState()>0){edgeCount++;}
           if (cellArray[c.getLeft()][y][c.getBehind()].getState()>0){edgeCount++;}
           if (cellArray[c.getRight()][y][c.getBehind()].getState()>0){edgeCount++;}
           if (cellArray[x][c.getBelow()][c.getBehind()].getState()>0){edgeCount++;}                         
           //corners
           if (cellArray[c.getLeft()][c.getAbove()][c.getInFront()].getState()>0){cornerCount++;}
           if (cellArray[c.getRight()][c.getAbove()][c.getInFront()].getState()>0){cornerCount++;}
           if (cellArray[c.getLeft()][c.getBelow()][c.getInFront()].getState()>0){cornerCount++;}
           if (cellArray[c.getRight()][c.getBelow()][c.getInFront()].getState()>0){cornerCount++;}
           if (cellArray[c.getLeft()][c.getAbove()][c.getBehind()].getState()>0){cornerCount++;}
           if (cellArray[c.getRight()][c.getAbove()][c.getBehind()].getState()>0){cornerCount++;}
           if (cellArray[c.getLeft()][c.getBelow()][c.getBehind()].getState()>0){cornerCount++;}
           if (cellArray[c.getRight()][c.getBelow()][c.getBehind()].getState()>0){cornerCount++;}
          }
        int next = currentRule.getRule(cellState,faceCount,edgeCount,cornerCount);
        if ( next>0 ){ nextState[x][y][z] = next;  nextActiveCellCount++;}
        }
       }
     });       
   }

             
   //CONTROLLI SULLA CRESCITA DELL'AUTOMA
   
   /* automata must be restrict to a max value of cells for computetional and estethical reasons */
   private synchronized boolean checkMaxDensity(){
     return (1.00*this.allActive.size()/(mWidth*mHeight*mDepth)< this.maxDensityRatio);
   }
   
   /* To avoid an empty grid: this.minDensityRatio == 0.00001 */
   private synchronized boolean checkMinDensity(){
     return (1.00*this.allActive.size()/(mWidth*mHeight*mDepth)<= this.minDensityRatio);
   }
   
   private synchronized boolean checkGrowthRate(){
    return (1.00*(this.nextActiveCellCount)/(this.allActive.size()) <  ExponentialFunction());
   }
   
   //Make the automata grow in a inverse exponential way
   public float ExponentialFunction(){
     return (float)Math.exp( (float)( (-generation/100) - 0.01*generation) );  
   }
  
   
   //Create temporal variable for new Active Cells and generationCells
   public synchronized void newGeneration(){
      this.tmp = new ArrayList<Cell>(); // create new array
           this.generationCells.clear(); // empty everytime
           
           // aggiorno tutto 
           forEachCell(new CellRunnable() { 
            @Override
            public void setCell(int x, int y, int z) {
                Cell cell = cellArray[x][y][z];
                cell.setState(nextState[x][y][z]);
                if (cell.isActive()) {
                    tmp.add(cell); 
                    if(!cell.inIntoGeneration()){ 
                      generationCells.add(cell); // if cell is not contained in any generation, add to this one
                      cell.setIntoGeneration(); // flag to say cell has been added 
                    }
                }
             }});
   }
   
   //update parameters
   public synchronized void updateActiveEndGeneration(){
     this.allActive = this.tmp; //aggiorno le celle attive
     this.generation++;
     this.mapGeneration.put(new Integer(this.generation), new ArrayList<Cell>(this.generationCells));  
   }
  
  // aggiorna per ogni cella lo stato e conta le celle attive
   public synchronized void increaseCells() throws InterruptedException {
     
     while(!this.turnIncrease) wait();

     if(entropy_buffer_at_index_buffer>0.05){ // se l'entropia è troppo bassa non faccio crescere l'automa -- 0.1
       
       if(checkMinDensity()) { /* qua dovrebbe entrare proprio in casi gravi */
         currentRule.generateRule(); chooseState(); }
       
       this.nextGeneration(); // calculate next states for cells   
        
       if(this.nextActiveCellCount>0 && this.checkGrowthRate()){ //vedo se le prossime celle sono maggiori di zero  ma minori del doppio di quelle attuali     
          
           newGeneration(); // calcola i next state e aggiorna la nuova generazione e all active
           
           updateActiveEndGeneration(); // aggiorna tutto         
     
       }else{currentRule.generateRule();}
    
       if(!this.checkMaxDensity()){ this.turnIncrease = false;notifyAll();} 
     
   }else{ /*println("entropia bassa : " + entropy_buffer_at_index_buffer);*/}
  }
       
     
  public synchronized void decreaseCells() throws InterruptedException{ 
 
    while(this.turnIncrease)  wait();
   
    // if I reached the minimum or generation = 2 start to grow again
    if(checkMinDensity() || this.generation == 2) {
      this.turnIncrease = true; 
      currentRule.generateRule(); // start a new automata
      notifyAll();}

    else{  
      this.generationCells = this.mapGeneration.get(this.generation);
      if(this.generationCells!= null){ 
          for(Cell c: this.generationCells){
            if(this.allActive.contains(c) || c.getState()>0) {
              c.die();
              this.allActive.remove(c); 
              c.notIntoGeneration();
            }
        };
      }
      this.mapGeneration.remove(this.generation);
      this.generation--;}
  }
 
   
   /* Draw Grid */
   public synchronized void drawGrid(){
     pushMatrix();
     rotateY(gridAngleY);
     rotateX(gridAngleX);
     rotateZ(gridAngleZ);
     translate(-mCentreX, -mCentreY, -mCentreZ); // Centre grid
     for(Cell c : this.allActive){ 
         if(c!=null){
            c.drawCell(CELL_SIZE);}
        }             
     popMatrix();
  }   
   
   
  /*Parameters to rotate grid */
  public  void setAngleY(float angle) {
    gridAngleY = angle;
  }
  
  public  void setAngleZ(float angle) {
    gridAngleZ = angle;
  }
  
  public void setAngleX(float angle) {
    gridAngleX = angle;
  }
  
 /* Empty grid */
  public void clearGrid(){
   forEachCell(new CellRunnable(){
     @Override
     public void setCell(int x,int y, int z){
       cellArray[x][y][z].die();
     }});}
}
     
