/* This class is used to coordinate threads to make the automata increase and decrease */

public class Controller {

  private Grid mGrid;
  private GrowAutomata inc ;
  private DestroyAutomata dec;
  boolean stop; /* stop threads and camera */

  Controller() {
    startTheGrid();
    stop = false;
  }

  public Grid getGrid() {
    return this.mGrid;
  }
  
  /*Create a grid with the settings specified*/
  private void startTheGrid() {
    this.mGrid = new GridBuilder().setWidth(GRID_WIDTH).setHeight(GRID_HEIGHT).setDepth(GRID_DEPTH)
      .setCentreX(centreX).setCentreY(centreY).setCentreZ(centreZ)
      .build();
    currentRule.generateRule(); /* Restart the grid with a new rule */
  }

  /* Start currents thread inc and dec */
  public void startNewThread() {
    startTheGrid();
   // isRunning = true;
    this.inc = new GrowAutomata(this.mGrid);
    this.dec = new DestroyAutomata(this.mGrid);
    this.inc.start();
    this.dec.start();
    isRunning = true;
  }
  
  
  /* Method to set parameters to stop and restart threads*/
  public synchronized void setgo() {
    this.stop = !this.stop;
    this.dec.go = !this.dec.go;
    this.inc.go = !this.inc.go;
  }

  /* If a thread has been stopped, this method restart it*/
  public synchronized void restart() {
    if (!stop) { 
      if (this.mGrid.turnIncrease) {
        this.inc = new GrowAutomata(this.mGrid); 
        this.inc.start();
      } else if (!this.mGrid.turnIncrease) {
        this.dec = new DestroyAutomata(this.mGrid); 
        this.dec.start();
      }
    }
  }


  //Create automata
  public class GrowAutomata extends Thread {

    Grid grid;
    boolean go ; /* set true when the thread is alive*/
    
    public GrowAutomata(Grid g) {
      this.grid = g; 
      this.go = true;
    }

    @Override
      public void run() {
      try {
        while (this.go) {
          this.grid.increaseCells();
          delay(int(tempo*4)); /*multiple of BPM*/
        }
      }
      catch(InterruptedException e ) {
      }
    }
  }

  //Destroy automata
  public class DestroyAutomata extends Thread {

    Grid grid;
    boolean go;
    public DestroyAutomata(Grid g) {
      this.grid = g; 
      this.go = false;
    }


    @Override
      public void run() {
      try {
        while (!this.go) {
          this.grid.decreaseCells();
          delay(int(tempo*4));
        }
      }
      catch(InterruptedException e ) {
      }
    }
  }
}
