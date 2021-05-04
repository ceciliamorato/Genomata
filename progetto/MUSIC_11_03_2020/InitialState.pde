public static int cz = GRID_DEPTH /2-1;
public static int cy = GRID_HEIGHT/2-1;
public static int cx = GRID_WIDTH/2-1;

public interface InitialState {
  void setInitialState();
}

public class CubeState implements InitialState { // 5 stati
  
  Grid g; //five random states
  int randomStateOne;
  int randomStateTwo;
  int randomStateThree;
  int randomStateFour; 
  int randomStateFive;
  
  CubeState(Grid g){
    this.g = g;
    randomStateOne = (int)random (1,4);
    randomStateTwo = (int)random (5,8);
    randomStateThree = (int)random (9,12);
    randomStateFour = (int)random (13,16);
    randomStateFive = (int)random (17,20);
  }
    
  @Override
  void setInitialState(){
    
    this.g.setCellArray(cz, cy, cx, 4); 
    
    this.g.setCellArray(cz+1, cy, cx, randomStateOne);
    this.g.setCellArray(cz-1, cy, cx, randomStateOne);
    this.g.setCellArray(cz, cy+1, cx, randomStateOne);
    this.g.setCellArray(cz, cy-1, cx, randomStateOne);
    this.g.setCellArray(cz, cy, cx+1, randomStateOne);
    this.g.setCellArray(cz, cy, cx-1, randomStateOne);
    
    this.g.setCellArray(cz+1, cy, cx+1, randomStateThree);
    this.g.setCellArray(cz-1, cy, cx+1, randomStateThree);
    this.g.setCellArray(cz+1, cy+1, cx, randomStateThree);
    this.g.setCellArray(cz+1, cy-1, cx, randomStateThree);
    this.g.setCellArray(cz-1, cy+1, cx, randomStateThree);
    this.g.setCellArray(cz-1, cy-1, cx, randomStateThree);
    this.g.setCellArray(cz, cy-1, cx-1, randomStateThree);
    this.g.setCellArray(cz, cy-1, cx+1, randomStateThree);
    this.g.setCellArray(cz, cy+1, cx-1, randomStateThree);
    this.g.setCellArray(cz, cy+1, cx+1, randomStateThree);
    
    this.g.setCellArray(cz+1, cy, cx-1, randomStateThree);
    this.g.setCellArray(cz-1, cy, cx-1, randomStateThree);

    this.g.setCellArray(cz+1, cy+1, cx+1, randomStateThree);
    this.g.setCellArray(cz+1, cy-1, cx+1, randomStateThree);
    this.g.setCellArray(cz-1, cy+1, cx+1, randomStateThree);
    
    this.g.setCellArray(cz+1, cy-1, cx-1, randomStateThree); 
    this.g.setCellArray(cz+1, cy+1, cx-1, randomStateThree);
    this.g.setCellArray(cz-1, cy+1, cx-1, randomStateThree);
    this.g.setCellArray(cz-1, cy-1, cx-1, randomStateThree);
    this.g.setCellArray(cz-1, cy-1, cx+1, randomStateThree);
    
    // STRATO INTORNO AI 3 LIVELLI DI Z CON STATO 4 (z+1)
    this.g.setCellArray(cz+1, cy+2, cx, randomStateTwo);
    this.g.setCellArray(cz+1, cy+2, cx-1, randomStateTwo);
    this.g.setCellArray(cz+1, cy+2, cx+1, randomStateTwo);
    this.g.setCellArray(cz+1, cy-2, cx, randomStateTwo);
    this.g.setCellArray(cz+1, cy-2, cx-1, randomStateTwo);
    this.g.setCellArray(cz+1, cy-2, cx+1, randomStateTwo);
    this.g.setCellArray(cz+1, cy+2, cx+2, randomStateTwo); 
    this.g.setCellArray(cz+1, cy+1, cx+2, randomStateTwo);
    this.g.setCellArray(cz+1, cy, cx+2, randomStateTwo);
    this.g.setCellArray(cz+1, cy+2, cx-2, randomStateTwo);
    this.g.setCellArray(cz+1, cy+1, cx-2, randomStateTwo);
    this.g.setCellArray(cz+1, cy-2, cx+2, randomStateTwo);
    this.g.setCellArray(cz+1, cy-1, cx+2, randomStateTwo);
    this.g.setCellArray(cz+1, cy-2, cx-2, randomStateTwo);
    this.g.setCellArray(cz+1, cy-1, cx-2, randomStateTwo);
    this.g.setCellArray(cz+1, cy, cx-2, randomStateTwo);
    
    // STRATO INTORNO AI 3 LIVELLI DI Z CON STATO 4 (z)
    this.g.setCellArray(cz, cy+2, cx, randomStateTwo);
    this.g.setCellArray(cz, cy+2, cx-1, randomStateTwo);
    this.g.setCellArray(cz, cy+2, cx+1, randomStateTwo);
    this.g.setCellArray(cz, cy-2, cx, randomStateTwo);
    this.g.setCellArray(cz, cy-2, cx-1, randomStateTwo);
    this.g.setCellArray(cz, cy-2, cx+1, randomStateTwo);
    this.g.setCellArray(cz, cy+2, cx+2, randomStateTwo); 
    this.g.setCellArray(cz, cy+1, cx+2, randomStateTwo);
    this.g.setCellArray(cz, cy, cx+2, randomStateTwo);
    this.g.setCellArray(cz, cy+2, cx-2, randomStateTwo);
    this.g.setCellArray(cz, cy+1, cx-2, randomStateTwo);
    this.g.setCellArray(cz, cy-2, cx+2, randomStateTwo);
    this.g.setCellArray(cz, cy-1, cx+2, randomStateTwo);
    this.g.setCellArray(cz, cy-2, cx-2, randomStateTwo);
    this.g.setCellArray(cz, cy-1, cx-2, randomStateTwo);
    this.g.setCellArray(cz, cy, cx-2, randomStateTwo);
    
    // STRATO INTORNO AI 3 LIVELLI DI Z CON STATO 4 (z-1)
    this.g.setCellArray(cz-1, cy+2, cx, randomStateFour);
    this.g.setCellArray(cz-1, cy+2, cx-1, randomStateFour);
    this.g.setCellArray(cz-1, cy+2, cx+1,randomStateFour);
    this.g.setCellArray(cz-1, cy-2, cx,randomStateFour);
    this.g.setCellArray(cz-1, cy-2, cx-1, randomStateFour);
    this.g.setCellArray(cz-1, cy-2, cx+1, randomStateFour);
    this.g.setCellArray(cz-1, cy+2, cx+2,randomStateFour); 
    this.g.setCellArray(cz-1, cy+1, cx+2,randomStateFour);
    this.g.setCellArray(cz-1, cy, cx+2, randomStateFour);
    this.g.setCellArray(cz-1, cy+2, cx-2,randomStateFour);
    this.g.setCellArray(cz-1, cy+1, cx-2, randomStateFour);
    this.g.setCellArray(cz-1, cy-2, cx+2, randomStateFour);
    this.g.setCellArray(cz-1, cy-1, cx+2,randomStateFour);
    this.g.setCellArray(cz-1, cy-2, cx-2, randomStateFour);
    this.g.setCellArray(cz-1, cy-1, cx-2, randomStateFour);
    this.g.setCellArray(cz-1, cy, cx-2, randomStateFour);
    
    // z+2 layer
    this.g.setCellArray(cz+2, cy+2, cx, randomStateFive);
    this.g.setCellArray(cz+2, cy+2, cx-1, randomStateFive);
    this.g.setCellArray(cz+2, cy+2, cx+1,randomStateFive);
    this.g.setCellArray(cz+2, cy-2, cx, randomStateFive);
    this.g.setCellArray(cz+2, cy-2, cx-1, randomStateFive);
    this.g.setCellArray(cz+2, cy-2, cx+1, randomStateFive);
    this.g.setCellArray(cz+2, cy+2, cx+2, randomStateFive); 
    this.g.setCellArray(cz+2, cy+1, cx+2, randomStateFive);
    this.g.setCellArray(cz+2, cy, cx+2, randomStateFive);
    this.g.setCellArray(cz+2, cy+2, cx-2, randomStateFive);
    this.g.setCellArray(cz+2, cy+1, cx-2, randomStateFive);
    this.g.setCellArray(cz+2, cy-2, cx+2, randomStateFive);
    this.g.setCellArray(cz+2, cy-1, cx+2, randomStateFive);
    this.g.setCellArray(cz+2, cy-2, cx-2, randomStateFive);
    this.g.setCellArray(cz+2, cy-1, cx-2, randomStateFive);
    this.g.setCellArray(cz+2, cy, cx-2, randomStateFive);
    
    this.g.setCellArray(cz+2, cy+1, cx-1, randomStateThree);
    this.g.setCellArray(cz+2, cy+1, cx+1, randomStateThree);
    this.g.setCellArray(cz+2, cy+1, cx, randomStateThree);
    this.g.setCellArray(cz+2, cy, cx-1, randomStateThree);
    this.g.setCellArray(cz+2, cy, cx+1, randomStateThree);
    this.g.setCellArray(cz+2, cy, cx, randomStateThree);
    this.g.setCellArray(cz+2, cy-1, cx-1, randomStateThree);
    this.g.setCellArray(cz+2, cy-1, cx+1, randomStateThree);
    this.g.setCellArray(cz+2, cy-1, cx, randomStateThree);
    
    // z-2 layer
    this.g.setCellArray(cz-2, cy+2, cx, randomStateTwo);
    this.g.setCellArray(cz-2, cy+2, cx-1, randomStateTwo);
    this.g.setCellArray(cz-2, cy+2, cx+1, randomStateTwo);
    this.g.setCellArray(cz-2, cy-2, cx, randomStateTwo);
    this.g.setCellArray(cz-2, cy-2, cx-1, randomStateTwo);
    this.g.setCellArray(cz-2, cy-2, cx+1, randomStateTwo);
    this.g.setCellArray(cz-2, cy+2, cx+2, randomStateTwo); 
    this.g.setCellArray(cz-2, cy+1, cx+2,randomStateTwo );
    this.g.setCellArray(cz-2, cy, cx+2, randomStateTwo);
    this.g.setCellArray(cz-2, cy+2, cx-2, randomStateTwo);
    this.g.setCellArray(cz-2, cy+1, cx-2, randomStateTwo);
    this.g.setCellArray(cz-2, cy-2, cx+2, randomStateTwo);
    this.g.setCellArray(cz-2, cy-1, cx+2, randomStateTwo);
    this.g.setCellArray(cz-2, cy-2, cx-2, randomStateTwo);
    this.g.setCellArray(cz-2, cy-1, cx-2, randomStateTwo);
    this.g.setCellArray(cz-2, cy, cx-2, randomStateTwo);
    
    this.g.setCellArray(cz-2, cy+1, cx-1, randomStateThree);
    this.g.setCellArray(cz-2, cy+1, cx+1, randomStateThree);
    this.g.setCellArray(cz-2, cy+1, cx, randomStateThree);
    this.g.setCellArray(cz-2, cy, cx-1, randomStateThree);
    this.g.setCellArray(cz-2, cy, cx+1, randomStateThree);
    this.g.setCellArray(cz-2, cy, cx, randomStateThree);
    this.g.setCellArray(cz-2, cy-1, cx-1, randomStateThree);
    this.g.setCellArray(cz-2, cy-1, cx+1, randomStateThree);
    this.g.setCellArray(cz-2, cy-1, cx, randomStateThree);
  }
}

public class DiamondState implements InitialState { // 6 stati
 
  Grid g; // four random states + 2
  int randomStateOne;
  int randomStateTwo;
  int randomStateThree;
  int randomStateFour;
  int random1, random2, random3;
  
  DiamondState (Grid g){
    this.g = g;
    randomStateOne = (int)random (1,5);
    randomStateTwo = (int)random (6,10);
    randomStateThree = (int)random (11,15);
    randomStateFour = (int)random (16,20);
    
    random1 = (int)random (1,5);
    random2 = (int)random (6,10);
    random3 = (int)random (11,15);
  }
  
  @Override
  void setInitialState(){
    
    // base on cy = 0
    this.g.setCellArray(cz, cy, cx, random3);
    this.g.setCellArray(cz, cy, cx-1, randomStateFour);
    this.g.setCellArray(cz, cy, cx-2, randomStateFour);
    this.g.setCellArray(cz, cy, cx-3, randomStateFour);
    this.g.setCellArray(cz, cy, cx+1, randomStateFour);
    this.g.setCellArray(cz, cy, cx+2, randomStateFour);
    this.g.setCellArray(cz, cy, cx+3, randomStateFour);
    
    this.g.setCellArray(cz-1, cy, cx-1, random3 );
    this.g.setCellArray(cz-1, cy, cx-2, randomStateTwo );
    this.g.setCellArray(cz-1, cy, cx-3, randomStateTwo );
    this.g.setCellArray(cz-1, cy, cx, randomStateTwo );
    this.g.setCellArray(cz-1, cy, cx+1, randomStateTwo );
    this.g.setCellArray(cz-1, cy, cx+2, randomStateTwo );
    this.g.setCellArray(cz-1, cy, cx+3, randomStateTwo );
    
    this.g.setCellArray(cz-2, cy, cx-1, random3);
    this.g.setCellArray(cz-2, cy, cx-2, randomStateThree);
    this.g.setCellArray(cz-2, cy, cx-3, randomStateThree);
    this.g.setCellArray(cz-2, cy, cx, randomStateThree);
    this.g.setCellArray(cz-2, cy, cx+1, randomStateThree);
    this.g.setCellArray(cz-2, cy, cx+2, randomStateThree);
    this.g.setCellArray(cz-2, cy, cx+3, randomStateThree);
    
    this.g.setCellArray(cz-3, cy, cx-1, random3 );
    this.g.setCellArray(cz-3, cy, cx-2, randomStateOne );
    this.g.setCellArray(cz-3, cy, cx-3, randomStateOne );
    this.g.setCellArray(cz-3, cy, cx, randomStateOne );
    this.g.setCellArray(cz-3, cy, cx+1, randomStateOne );
    this.g.setCellArray(cz-3, cy, cx+2, randomStateOne );
    this.g.setCellArray(cz-3, cy, cx+3, randomStateOne );
    
    this.g.setCellArray(cz+1, cy, cx-1, random3);
    this.g.setCellArray(cz+1, cy, cx-2, random1);
    this.g.setCellArray(cz+1, cy, cx-3, random1);
    this.g.setCellArray(cz+1, cy, cx, random1);
    this.g.setCellArray(cz+1, cy, cx+1, random1);
    this.g.setCellArray(cz+1, cy, cx+2, random1);
    this.g.setCellArray(cz+1, cy, cx+3, random1);
    
    this.g.setCellArray(cz+2, cy, cx-1, random3 );
    this.g.setCellArray(cz+2, cy, cx-2, randomStateOne );
    this.g.setCellArray(cz+2, cy, cx-3, randomStateOne );
    this.g.setCellArray(cz+2, cy, cx, randomStateOne );
    this.g.setCellArray(cz+2, cy, cx+1, randomStateOne );
    this.g.setCellArray(cz+2, cy, cx+2, randomStateOne );
    this.g.setCellArray(cz+2, cy, cx+3, randomStateOne );
    this.g.setCellArray(cz+3, cy, cx-1, randomStateFour);
    this.g.setCellArray(cz+3, cy, cx-2, randomStateFour);
    this.g.setCellArray(cz+3, cy, cx-3, randomStateFour);
    this.g.setCellArray(cz+3, cy, cx, randomStateFour);
    this.g.setCellArray(cz+3, cy, cx+1, randomStateFour);
    this.g.setCellArray(cz+3, cy, cx+2, randomStateFour);
    this.g.setCellArray(cz+3, cy, cx+3, randomStateFour);
    // cy=-1, cz>o
    this.g.setCellArray(cz, cy-1, cx, random3);
    this.g.setCellArray(cz, cy-1, cx-1, random2);
    this.g.setCellArray(cz, cy-1, cx-2, random2);
    this.g.setCellArray(cz, cy-1, cx+1, random2);
    this.g.setCellArray(cz, cy-1, cx+2, random2);
    this.g.setCellArray(cz+1, cy-1, cx, random2);
    this.g.setCellArray(cz+1, cy-1, cx-1, random2);
    this.g.setCellArray(cz+1, cy-1, cx-2, random2);
    this.g.setCellArray(cz+1, cy-1, cx+1, random2);
    this.g.setCellArray(cz+1, cy-1, cx+2, random2);
    this.g.setCellArray(cz+2, cy-1, cx, random2);
    this.g.setCellArray(cz+2, cy-1, cx-1, random2);
    this.g.setCellArray(cz+2, cy-1, cx-2, random2);
    this.g.setCellArray(cz+2, cy-1, cx+1, random2);
    this.g.setCellArray(cz+2, cy-1, cx+2, random2);
    // cy=-1, cz<0
    this.g.setCellArray(cz-1, cy-1, cx, random3);
    this.g.setCellArray(cz-1, cy-1, cx-1, random2);
    this.g.setCellArray(cz-1, cy-1, cx-2, random2);
    this.g.setCellArray(cz-1, cy-1, cx+1, random2);
    this.g.setCellArray(cz-1, cy-1, cx+2, random2);
    this.g.setCellArray(cz-2, cy-1, cx, random2);
    this.g.setCellArray(cz-2, cy-1, cx-1, random2);
    this.g.setCellArray(cz-2, cy-1, cx-2, random2);
    this.g.setCellArray(cz-2, cy-1, cx+1, random2);
    this.g.setCellArray(cz-2, cy-1, cx+2, random2);
    // cy=-2, cz>0
    this.g.setCellArray(cz, cy-2, cx, random3);
    this.g.setCellArray(cz, cy-2, cx-1, randomStateThree);
    this.g.setCellArray(cz, cy-2, cx+1, randomStateThree);
    this.g.setCellArray(cz+1, cy-2, cx, randomStateThree);
    this.g.setCellArray(cz+1, cy-2, cx-1, randomStateThree);
    this.g.setCellArray(cz+1, cy-2, cx+1, randomStateThree);
    // cy=-2, cz<0
    this.g.setCellArray(cz-1, cy-2, cx, randomStateThree);
    this.g.setCellArray(cz-1, cy-2, cx-1, randomStateThree);
    this.g.setCellArray(cz-1, cy-2, cx+1, randomStateThree);
    // summit
    this.g.setCellArray(cz, cy-3, cx, randomStateOne);
    this.g.setCellArray(cz, cy-4, cx, randomStateOne);
    
    // cy>0
    this.g.setCellArray(cz, cy+1, cx, random3);
    this.g.setCellArray(cz, cy+1, cx-1, random2);
    this.g.setCellArray(cz, cy+1, cx-2, random2);
    this.g.setCellArray(cz, cy+1, cx+1, random2);
    this.g.setCellArray(cz, cy+1, cx+2, random2);
    this.g.setCellArray(cz+1, cy+1, cx, random2);
    this.g.setCellArray(cz+1, cy+1, cx-1, random2);
    this.g.setCellArray(cz+1, cy+1, cx-2, random2);
    this.g.setCellArray(cz+1, cy+1, cx+1, random2);
    this.g.setCellArray(cz+1, cy+1, cx+2, random2);
    this.g.setCellArray(cz+2, cy+1, cx, random2);
    this.g.setCellArray(cz+2, cy+1, cx-1, random2);
    this.g.setCellArray(cz+2, cy+1, cx-2, random2);
    this.g.setCellArray(cz+2, cy+1, cx+1, random2);
    this.g.setCellArray(cz+2, cy+1, cx+2, random2);
    // cy=1, cz<0
    this.g.setCellArray(cz-1, cy+1, cx, random3);
    this.g.setCellArray(cz-1, cy+1, cx-1, random2);
    this.g.setCellArray(cz-1, cy+1, cx-2, random2);
    this.g.setCellArray(cz-1, cy+1, cx+1, random2);
    this.g.setCellArray(cz-1, cy+1, cx+2, random2);
    this.g.setCellArray(cz-2, cy+1, cx, random2);
    this.g.setCellArray(cz-2, cy+1, cx-1, random2);
    this.g.setCellArray(cz-2, cy+1, cx-2, random2);
    this.g.setCellArray(cz-2, cy+1, cx+1, random2);
    this.g.setCellArray(cz-2, cy+1, cx+2, random2);
    // cy=2, cz>0
    this.g.setCellArray(cz, cy+2, cx, random3);
    this.g.setCellArray(cz, cy+2, cx-1, randomStateThree);
    this.g.setCellArray(cz, cy+2, cx+1, randomStateThree);
    this.g.setCellArray(cz+1, cy+2, cx, randomStateThree);
    this.g.setCellArray(cz+1, cy+2, cx-1, randomStateThree);
    this.g.setCellArray(cz+1, cy+2, cx+1, randomStateThree);
    // cy=2, cz<0
    this.g.setCellArray(cz-1, cy+2, cx, randomStateThree);
    this.g.setCellArray(cz-1, cy+2, cx-1, randomStateThree);
    this.g.setCellArray(cz-1, cy+2, cx+1, randomStateThree);
    // summit
    this.g.setCellArray(cz, cy+3, cx, randomStateOne );
    this.g.setCellArray(cz, cy+4, cx, randomStateOne );
  }
}

public class PyramidState implements InitialState {
 
  
  Grid g; // 5 random states
  int randomStateOne;
  int randomStateTwo;
  int randomStateThree;
  int randomStateFour;
  int randomStateFive;
  
  PyramidState(Grid g){
    this.g = g;
   randomStateOne = (int)random (1,4);
    randomStateTwo = (int)random (5,randomStateOne);
    randomStateThree = (int)random (9,12);
    randomStateFour = (int)random (13,16);
    randomStateFive = (int)random (17,20);}
  
  @Override
  void setInitialState(){
    
    // base on cz=-5
    // cy>0
    this.g.setCellArray(cz-5, cy+5, cx, randomStateOne);
    this.g.setCellArray(cz-5, cy+5, cx+1, randomStateOne);
    this.g.setCellArray(cz-5, cy+5, cx+2, randomStateOne);
    this.g.setCellArray(cz-5, cy+5, cx+3, randomStateOne);
    this.g.setCellArray(cz-5, cy+5, cx+4, randomStateOne);
    this.g.setCellArray(cz-5, cy+5, cx+5, randomStateOne);
    this.g.setCellArray(cz-5, cy+5, cx-1, randomStateOne);
    this.g.setCellArray(cz-5, cy+5, cx-2, randomStateOne);
    this.g.setCellArray(cz-5, cy+5, cx-3, randomStateOne);
    this.g.setCellArray(cz-5, cy+5, cx-4, randomStateOne);
    this.g.setCellArray(cz-5, cy+5, cx-5, randomStateOne);
    // cy<0
    this.g.setCellArray(cz-5, cy-5, cx, randomStateThree);
    this.g.setCellArray(cz-5, cy-5, cx+1, randomStateThree);
    this.g.setCellArray(cz-5, cy-5, cx+2, randomStateThree);
    this.g.setCellArray(cz-5, cy-5, cx+3, randomStateThree);
    this.g.setCellArray(cz-5, cy-5, cx+4, randomStateThree);
    this.g.setCellArray(cz-5, cy-5, cx+5, randomStateThree);
    this.g.setCellArray(cz-5, cy-5, cx-1, randomStateThree);
    this.g.setCellArray(cz-5, cy-5, cx-2, randomStateThree);
    this.g.setCellArray(cz-5, cy-5, cx-3, randomStateThree);
    this.g.setCellArray(cz-5, cy-5, cx-4, randomStateThree);
    this.g.setCellArray(cz-5, cy-5, cx-5, randomStateThree);
    // cx>0
    this.g.setCellArray(cz-5, cy, cx+5, randomStateTwo);
    this.g.setCellArray(cz-5, cy+1, cx+5, randomStateTwo);
    this.g.setCellArray(cz-5, cy+2, cx+5, randomStateTwo);
    this.g.setCellArray(cz-5, cy+3, cx+5, randomStateTwo);
    this.g.setCellArray(cz-5, cy+4, cx+5, randomStateTwo);
    this.g.setCellArray(cz-5, cy-1, cx+5, randomStateTwo);
    this.g.setCellArray(cz-5, cy-2, cx+5, randomStateTwo);
    this.g.setCellArray(cz-5, cy-3, cx+5, randomStateTwo);
    this.g.setCellArray(cz-5, cy-4, cx+5, randomStateTwo);
    // cx<0
    this.g.setCellArray(cz-5, cy, cx-5, randomStateTwo);
    this.g.setCellArray(cz-5, cy+1, cx-5, randomStateTwo);
    this.g.setCellArray(cz-5, cy+2, cx-5, randomStateTwo);
    this.g.setCellArray(cz-5, cy+3, cx-5, randomStateTwo);
    this.g.setCellArray(cz-5, cy+4, cx-5, randomStateTwo);
    this.g.setCellArray(cz-5, cy-1, cx-5, randomStateTwo);
    this.g.setCellArray(cz-5, cy-2, cx-5, randomStateTwo);
    this.g.setCellArray(cz-5, cy-3, cx-5, randomStateTwo);
    this.g.setCellArray(cz-5, cy-4, cx-5, randomStateTwo);
    // quadrante sinistro in alto
    this.g.setCellArray(cz-4, cy+4, cx-4, randomStateFour);
    this.g.setCellArray(cz-3, cy+3, cx-3, randomStateFour);
    this.g.setCellArray(cz-2, cy+2, cx-2, randomStateFour);
    this.g.setCellArray(cz-1, cy+1, cx-1, randomStateFour);
    // quadrante sinistro in basso
    this.g.setCellArray(cz-1, cy-1, cx-1, randomStateFour);
    this.g.setCellArray(cz-2, cy-2, cx-2, randomStateFour);
    this.g.setCellArray(cz-3, cy-3, cx-3, randomStateFour);
    this.g.setCellArray(cz-4, cy-4, cx-4, randomStateFour);
    // quadrante destro in alto
    this.g.setCellArray(cz-4, cy+4, cx+4, randomStateFive);
    this.g.setCellArray(cz-3, cy+3, cx+3, randomStateFive);
    this.g.setCellArray(cz-2, cy+2, cx+2, randomStateFive);
    this.g.setCellArray(cz-1, cy+1, cx+1, randomStateFive);
    // quadrante destro in basso
    this.g.setCellArray(cz-4, cy-4, cx+4, randomStateFive);
    this.g.setCellArray(cz-3, cy-3, cx+3, randomStateFive);
    this.g.setCellArray(cz-2, cy-2, cx+2, randomStateFive);
    this.g.setCellArray(cz-1, cy-1, cx+1, randomStateFive);
    // summit
    this.g.setCellArray(cz, cy, cx, 5);
    // figura speculare
    this.g.setCellArray(cz+4, cy+4, cx-4, randomStateFour);
    this.g.setCellArray(cz+3, cy+3, cx-3, randomStateFour);
    this.g.setCellArray(cz+2, cy+2, cx-2, randomStateFour);
    this.g.setCellArray(cz+1, cy+1, cx-1, randomStateFour);
    
    this.g.setCellArray(cz+1, cy-1, cx-1, randomStateFour);
    this.g.setCellArray(cz+2, cy-2, cx-2, randomStateFour);
    this.g.setCellArray(cz+3, cy-3, cx-3, randomStateFour);
    this.g.setCellArray(cz+4, cy-4, cx-4, randomStateFour);
    // quadrante destro in alto
    this.g.setCellArray(cz+4, cy+4, cx+4, randomStateFour);
    this.g.setCellArray(cz+3, cy+3, cx+3, randomStateFour);
    this.g.setCellArray(cz+2, cy+2, cx+2, randomStateFour);
    this.g.setCellArray(cz+1, cy+1, cx+1, randomStateFour);
    // quadrante destro in basso
    this.g.setCellArray(cz+4, cy-4, cx+4, randomStateFour);
    this.g.setCellArray(cz+3, cy-3, cx+3, randomStateFour);
    this.g.setCellArray(cz+2, cy-2, cx+2, randomStateFour);
    this.g.setCellArray(cz+1, cy-1, cx+1, randomStateFour);
    
    // quadrante cz=5
    this.g.setCellArray(cz+5, cy+5, cx, randomStateFive);
    this.g.setCellArray(cz+5, cy+5, cx+1, randomStateFive);
    this.g.setCellArray(cz+5, cy+5, cx+2, randomStateFive);
    this.g.setCellArray(cz+5, cy+5, cx+3, randomStateFive);
    this.g.setCellArray(cz+5, cy+5, cx+4, randomStateFive);
    this.g.setCellArray(cz+5, cy+5, cx+5, randomStateFive);
    this.g.setCellArray(cz+5, cy+5, cx-1, randomStateFive);
    this.g.setCellArray(cz+5, cy+5, cx-2, randomStateFive);
    this.g.setCellArray(cz+5, cy+5, cx-3, randomStateFive);
    this.g.setCellArray(cz+5, cy+5, cx-4, randomStateFive);
    this.g.setCellArray(cz+5, cy+5, cx-5, randomStateFive);
    // cy<0
    this.g.setCellArray(cz+5, cy-5, cx, randomStateThree);
    this.g.setCellArray(cz+5, cy-5, cx+1, randomStateThree);
    this.g.setCellArray(cz+5, cy-5, cx+2, randomStateThree);
    this.g.setCellArray(cz+5, cy-5, cx+3, randomStateThree);
    this.g.setCellArray(cz+5, cy-5, cx+4, randomStateThree);
    this.g.setCellArray(cz+5, cy-5, cx+5, randomStateThree);
    this.g.setCellArray(cz+5, cy-5, cx-1, randomStateThree);
    this.g.setCellArray(cz+5, cy-5, cx-2, randomStateThree);
    this.g.setCellArray(cz+5, cy-5, cx-3, randomStateThree);
    this.g.setCellArray(cz+5, cy-5, cx-4, randomStateThree);
    this.g.setCellArray(cz+5, cy-5, cx-5, randomStateThree);
    // cx>0
    this.g.setCellArray(cz+5, cy, cx+5, randomStateTwo);
    this.g.setCellArray(cz+5, cy+1, cx+5, randomStateTwo);
    this.g.setCellArray(cz+5, cy+2, cx+5, randomStateTwo);
    this.g.setCellArray(cz+5, cy+3, cx+5, randomStateTwo);
    this.g.setCellArray(cz+5, cy+4, cx+5, randomStateTwo);
    this.g.setCellArray(cz+5, cy-1, cx+5, randomStateTwo);
    this.g.setCellArray(cz+5, cy-2, cx+5, randomStateTwo);
    this.g.setCellArray(cz+5, cy-3, cx+5, randomStateTwo);
    this.g.setCellArray(cz+5, cy-4, cx+5, randomStateTwo);
    // cx<0
    this.g.setCellArray(cz+5, cy, cx-5, randomStateTwo);
    this.g.setCellArray(cz+5, cy+1, cx-5, randomStateTwo);
    this.g.setCellArray(cz+5, cy+2, cx-5, randomStateTwo);
    this.g.setCellArray(cz+5, cy+3, cx-5, randomStateTwo);
    this.g.setCellArray(cz+5, cy+4, cx-5, randomStateTwo);
    this.g.setCellArray(cz+5, cy-1, cx-5, randomStateTwo);
    this.g.setCellArray(cz+5, cy-2, cx-5, randomStateTwo);
    this.g.setCellArray(cz+5, cy-3, cx-5, randomStateTwo);
    this.g.setCellArray(cz+5, cy-4, cx-5, randomStateTwo);
  }
}

public class SphereState implements InitialState { // randomStateOne stati
   
  Grid g; //three random states
  int randomStateOne;
  int randomStateTwo;
  int randomStateThree;
  int randomStateFour; 
  int randomStateFive;
  int randomState;
  
  SphereState(Grid g){
    this.g = g;
    randomStateOne = (int)random (1,4);
    randomStateTwo = (int)random (5,randomStateOne);
    randomStateThree = (int)random (9,12);
    randomStateFour = (int)random (13,16);
    randomStateFive = (int)random (17,20);
    randomState = (int)random (1,20);
    
  }
  
  @Override
  void setInitialState(){
    // base
    this.g.setCellArray(cz, cy, cx-4, randomStateOne);
    this.g.setCellArray(cz, cy, cx-3, randomStateOne);
    this.g.setCellArray(cz, cy, cx-2, randomStateOne);
    this.g.setCellArray(cz, cy, cx-1, randomStateOne);
    this.g.setCellArray(cz, cy, cx, randomStateOne);
    this.g.setCellArray(cz, cy, cx+1, randomStateOne);
    this.g.setCellArray(cz, cy, cx+2, randomStateOne);
    this.g.setCellArray(cz, cy, cx+3, randomStateOne);
    this.g.setCellArray(cz, cy, cx+4, randomStateOne);
    this.g.setCellArray(cz, cy+1, cx-4, randomStateOne);
    this.g.setCellArray(cz, cy+1, cx-3, randomStateOne);
    this.g.setCellArray(cz, cy+1, cx-2, randomStateOne);
    this.g.setCellArray(cz, cy+1, cx-1, randomStateOne);
    this.g.setCellArray(cz, cy+1, cx, randomStateOne);
    this.g.setCellArray(cz, cy+1, cx+1, randomStateOne);
    this.g.setCellArray(cz, cy+1, cx+2, randomStateOne);
    this.g.setCellArray(cz, cy+1, cx+3, randomStateOne);
    this.g.setCellArray(cz, cy+1, cx+4, randomStateOne);   
    this.g.setCellArray(cz, cy-1, cx-4, randomStateOne);
    this.g.setCellArray(cz, cy-1, cx-3, randomStateOne);
    this.g.setCellArray(cz, cy-1, cx-2, randomStateOne);
    this.g.setCellArray(cz, cy-1, cx-1, randomStateOne);
    this.g.setCellArray(cz, cy-1, cx, randomStateOne);
    this.g.setCellArray(cz, cy-1, cx+1, (int)random(1,20));
    this.g.setCellArray(cz, cy-1, cx+2, randomStateOne);
    this.g.setCellArray(cz, cy-1, cx+3, randomStateOne);
    this.g.setCellArray(cz, cy-1, cx+4, randomStateOne);
    this.g.setCellArray(cz, cy+2, cx-3, randomStateOne);
    this.g.setCellArray(cz, cy+2, cx-2, randomStateOne);
    this.g.setCellArray(cz, cy+2, cx-1, randomStateOne);
    this.g.setCellArray(cz, cy+2, cx, (int)random(1,20));
    this.g.setCellArray(cz, cy+2, cx+1, randomStateOne);
    this.g.setCellArray(cz, cy+2, cx+2, randomStateOne);
    this.g.setCellArray(cz, cy+2, cx+3, randomStateOne);
    this.g.setCellArray(cz, cy-2, cx-3, randomStateOne);
    this.g.setCellArray(cz, cy-2, cx-2, randomStateOne);
    this.g.setCellArray(cz, cy-2, cx-1, randomStateOne);
    this.g.setCellArray(cz, cy-2, cx, randomStateOne);
    this.g.setCellArray(cz, cy-2, cx+1, randomStateOne);
    this.g.setCellArray(cz, cy-2, cx+2, randomStateOne);
    this.g.setCellArray(cz, cy-2, cx+3, randomStateOne);
    this.g.setCellArray(cz, cy+3, cx-2, randomStateOne);
    this.g.setCellArray(cz, cy+3, cx-1, randomStateOne);
    this.g.setCellArray(cz, cy+3, cx, randomStateOne);
    this.g.setCellArray(cz, cy+3, cx+1, (int)random(1,20));
    this.g.setCellArray(cz, cy+3, cx+2, randomStateOne);
    this.g.setCellArray(cz, cy-3, cx-2, randomStateOne);
    this.g.setCellArray(cz, cy-3, cx-1, randomStateOne);
    this.g.setCellArray(cz, cy-3, cx, randomStateOne);
    this.g.setCellArray(cz, cy-3, cx+1, randomStateOne);
    this.g.setCellArray(cz, cy-3, cx+2, randomStateOne);
    this.g.setCellArray(cz, cy+4, cx-1, randomStateOne);
    this.g.setCellArray(cz, cy+4, cx, randomStateOne);
    this.g.setCellArray(cz, cy+4, cx+1, randomStateOne);
    this.g.setCellArray(cz, cy-4, cx-1, randomStateOne);
    this.g.setCellArray(cz, cy-4, cx, randomStateOne);
    this.g.setCellArray(cz, cy-4, cx+1, randomStateOne);
    
    // cz=1
    this.g.setCellArray(cz+1, cy, cx-3, randomStateTwo);
    this.g.setCellArray(cz+1, cy, cx-2, randomStateTwo);
    this.g.setCellArray(cz+1, cy, cx-1, randomStateTwo);
    this.g.setCellArray(cz+1, cy, cx, (int)random(1,20));
    this.g.setCellArray(cz+1, cy, cx+1,randomStateTwo);
    this.g.setCellArray(cz+1, cy, cx+2, randomStateTwo);
    this.g.setCellArray(cz+1, cy, cx+3, randomStateTwo);
    this.g.setCellArray(cz+1, cy+1, cx-3, randomStateTwo);
    this.g.setCellArray(cz+1, cy+1, cx-2, randomStateTwo);
    this.g.setCellArray(cz+1, cy+1, cx-1, randomStateTwo);
    this.g.setCellArray(cz+1, cy+1, cx, randomStateTwo);
    this.g.setCellArray(cz+1, cy+1, cx+1, randomStateTwo);
    this.g.setCellArray(cz+1, cy+1, cx+2, randomStateTwo);
    this.g.setCellArray(cz+1, cy+1, cx+3, randomStateTwo);
    this.g.setCellArray(cz+1, cy-1, cx-3, randomStateTwo);
    this.g.setCellArray(cz+1, cy-1, cx-2, (int)random(1,20));
    this.g.setCellArray(cz+1, cy-1, cx-1, randomStateTwo);
    this.g.setCellArray(cz+1, cy-1, cx, randomStateTwo);
    this.g.setCellArray(cz+1, cy-1, cx+1, randomStateTwo);
    this.g.setCellArray(cz+1, cy-1, cx+2, randomStateTwo);
    this.g.setCellArray(cz+1, cy-1, cx+3, randomStateTwo);
    this.g.setCellArray(cz+1, cy+2, cx-2, randomStateTwo);
    this.g.setCellArray(cz+1, cy+2, cx-1, randomStateTwo);
    this.g.setCellArray(cz+1, cy+2, cx, randomStateThree);
    this.g.setCellArray(cz+1, cy+2, cx+1, randomStateThree);
    this.g.setCellArray(cz+1, cy+2, cx+2, randomStateThree);
    this.g.setCellArray(cz+1, cy-2, cx-2, randomStateThree);
    this.g.setCellArray(cz+1, cy-2, cx-1, randomStateThree);
    this.g.setCellArray(cz+1, cy-2, cx, randomStateThree);
    this.g.setCellArray(cz+1, cy-2, cx+1, randomStateThree);
    this.g.setCellArray(cz+1, cy-2, cx+2, (int)random(1,20));
    this.g.setCellArray(cz+1, cy+3, cx-1, randomStateThree);
    this.g.setCellArray(cz+1, cy+3, cx, randomStateThree);
    this.g.setCellArray(cz+1, cy+3, cx+1, randomStateThree);
    this.g.setCellArray(cz+1, cy-3, cx-1, randomStateThree);
    this.g.setCellArray(cz+1, cy-3, cx, randomStateThree);
    this.g.setCellArray(cz+1, cy-3, cx+1, randomStateThree);
    
    // cz=-1
    this.g.setCellArray(cz-1, cy, cx-3, randomStateFour);
    this.g.setCellArray(cz-1, cy, cx-2, randomStateFour);
    this.g.setCellArray(cz-1, cy, cx-1, randomStateFour);
    this.g.setCellArray(cz-1, cy, cx, randomStateFour);
    this.g.setCellArray(cz-1, cy, cx+1, (int)random(1,20));
    this.g.setCellArray(cz-1, cy, cx+2, randomStateFour);
    this.g.setCellArray(cz-1, cy, cx+3, randomStateFour);
    this.g.setCellArray(cz-1, cy+1, cx-3, randomStateFour);
    this.g.setCellArray(cz-1, cy+1, cx-2, randomStateFour);
    this.g.setCellArray(cz-1, cy+1, cx-1, randomStateFour);
    this.g.setCellArray(cz-1, cy+1, cx, randomStateFour);
    this.g.setCellArray(cz-1, cy+1, cx+1, randomStateFour);
    this.g.setCellArray(cz-1, cy+1, cx+2, randomStateFour);
    this.g.setCellArray(cz-1, cy+1, cx+3, randomStateFour);
    this.g.setCellArray(cz-1, cy-1, cx-3, randomStateFour);
    this.g.setCellArray(cz-1, cy-1, cx-2, randomStateFour);
    this.g.setCellArray(cz-1, cy-1, cx-1, randomStateFour);
    this.g.setCellArray(cz-1, cy-1, cx, randomStateFour);
    this.g.setCellArray(cz-1, cy-1, cx+1, randomStateFour);
    this.g.setCellArray(cz-1, cy-1, cx+2, randomStateFour);
    this.g.setCellArray(cz-1, cy-1, cx+3, randomStateFour);
    this.g.setCellArray(cz-1, cy+2, cx-2, randomStateFour);
    this.g.setCellArray(cz-1, cy+2, cx-1, randomStateFour);
    this.g.setCellArray(cz-1, cy+2, cx, randomStateFour);
    this.g.setCellArray(cz-1, cy+2, cx+1, (int)random(1,20));
    this.g.setCellArray(cz-1, cy+2, cx+2, randomStateFour);
    this.g.setCellArray(cz-1, cy-2, cx-2, randomStateFour);
    this.g.setCellArray(cz-1, cy-2, cx-1, randomStateFour);
    this.g.setCellArray(cz-1, cy-2, cx, randomStateFour);
    this.g.setCellArray(cz-1, cy-2, cx+1, randomStateFour);
    this.g.setCellArray(cz-1, cy-2, cx+2, (int)random(1,20));
    this.g.setCellArray(cz-1, cy+3, cx-1, randomStateFour);
    this.g.setCellArray(cz-1, cy+3, cx, randomStateFour);
    this.g.setCellArray(cz-1, cy+3, cx+1, randomStateFour);
    this.g.setCellArray(cz-1, cy-3, cx-1, randomStateFour);
    this.g.setCellArray(cz-1, cy-3, cx, randomStateFour);
    this.g.setCellArray(cz-1, cy-3, cx+1, randomStateFour);
    
    // cz=2
        this.g.setCellArray(cz+2, cy, cx-2, randomState);
    this.g.setCellArray(cz+2, cy, cx-1, randomState);
    this.g.setCellArray(cz+2, cy, cx, randomState);
    this.g.setCellArray(cz+2, cy, cx+1, randomState);
    this.g.setCellArray(cz+2, cy, cx+2, randomState);
    this.g.setCellArray(cz+2, cy+1, cx-2, randomState);
    this.g.setCellArray(cz+2, cy+1, cx-1, randomState);
    this.g.setCellArray(cz+2, cy+1, cx, randomState);
    this.g.setCellArray(cz+2, cy+1, cx+1, randomState);
    this.g.setCellArray(cz+2, cy+1, cx+2, randomState);
    this.g.setCellArray(cz+2, cy-1, cx-2, randomState);
    this.g.setCellArray(cz+2, cy-1, cx-1, randomState);
    this.g.setCellArray(cz+2, cy-1, cx, randomState);
    this.g.setCellArray(cz+2, cy-1, cx+1, randomState);
    this.g.setCellArray(cz+2, cy-1, cx+2, randomState);

    this.g.setCellArray(cz+2, cy+2, cx-1, randomState);
    this.g.setCellArray(cz+2, cy+2, cx, randomState);
    this.g.setCellArray(cz+2, cy+2, cx+1, randomState);

    this.g.setCellArray(cz+2, cy-2, cx-1, randomState);
    this.g.setCellArray(cz+2, cy-2, cx, randomState);
    this.g.setCellArray(cz+2, cy-2, cx+1, randomState);
    // cz=-2
        this.g.setCellArray(cz-2, cy, cx-2, randomState);
    this.g.setCellArray(cz-2, cy, cx-1, randomState);
    this.g.setCellArray(cz-2, cy, cx, randomState);
    this.g.setCellArray(cz-2, cy, cx+1, randomState);
    this.g.setCellArray(cz-2, cy, cx+2, randomState);
    this.g.setCellArray(cz-2, cy+1, cx-2, randomState);
    this.g.setCellArray(cz-2, cy+1, cx-1, randomState);
    this.g.setCellArray(cz-2, cy+1, cx, randomState);
    this.g.setCellArray(cz-2, cy+1, cx+1, randomState);
    this.g.setCellArray(cz-2, cy+1, cx+2, randomState);
    this.g.setCellArray(cz-2, cy-1, cx-2, randomState);
    this.g.setCellArray(cz-2, cy-1, cx-1, randomState);
    this.g.setCellArray(cz-2, cy-1, cx, randomState);
    this.g.setCellArray(cz-2, cy-1, cx+1, randomState);
    this.g.setCellArray(cz-2, cy-1, cx+2, randomState);
    this.g.setCellArray(cz-2, cy+2, cx-1, randomState);
    this.g.setCellArray(cz-2, cy+2, cx, randomState);
    this.g.setCellArray(cz-2, cy+2, cx+1, randomState);
    this.g.setCellArray(cz-2, cy-2, cx-1, randomState);
    this.g.setCellArray(cz-2, cy-2, cx, randomState);
    this.g.setCellArray(cz-2, cy-2, cx+1, randomState);
    
    // cz=3
        this.g.setCellArray(cz+3, cy, cx-1, randomStateFive);
    this.g.setCellArray(cz+3, cy, cx, randomStateFive);
    this.g.setCellArray(cz+3, cy, cx+1, randomStateFive);

    this.g.setCellArray(cz+3, cy+1, cx-1, randomStateFive);
    this.g.setCellArray(cz+3, cy+1, cx, randomStateFive);
    this.g.setCellArray(cz+3, cy+1, cx+1, randomStateFive);

    this.g.setCellArray(cz+3, cy-1, cx-1, randomStateFive);
    this.g.setCellArray(cz+3, cy-1, cx, randomStateFive);
    this.g.setCellArray(cz+3, cy-1, cx+1, randomStateFive);
    // cz=-3
    this.g.setCellArray(cz-3, cy, cx-1, randomStateFive);
    this.g.setCellArray(cz-3, cy, cx, randomStateFive);
    this.g.setCellArray(cz-3, cy, cx+1, randomStateFive);

    this.g.setCellArray(cz-3, cy+1, cx-1, randomStateFive);
    this.g.setCellArray(cz-3, cy+1, cx, randomStateFive);
    this.g.setCellArray(cz-3, cy+1, cx+1, randomStateFive);
    this.g.setCellArray(cz-3, cy-1, cx-1, randomStateFive);
    this.g.setCellArray(cz-3, cy-1, cx, randomStateFive);
    this.g.setCellArray(cz-3, cy-1, cx+1, randomStateFive);
    // summit
    this.g.setCellArray(cz+4, cy, cx, (int)random(1,20));
    this.g.setCellArray(cz-4, cy, cx, (int)random(1,20));
  }
}

public class SquareState implements InitialState { // 9 stati
  
  Grid g; // four random state + random state 
  int randomStateOne;
  int randomStateTwo;
  int randomStateThree;
  int randomStateFour;

  
  SquareState(Grid g){
    this.g = g;
    randomStateOne = (int)random (1,5);
    randomStateTwo = (int)random (6,10);
    randomStateThree = (int)random (11,15);
    randomStateFour = (int)random (16,20);
    
 }
  
  @Override
  void setInitialState(){
    
    // empty square on cy = 0
    this.g.setCellArray(cz+3, cy, cx, 1 ); // 1
    this.g.setCellArray(cz+3, cy, cx-1, randomStateOne );
    this.g.setCellArray(cz+3, cy, cx-2, randomStateOne );
    this.g.setCellArray(cz+3, cy, cx-3, randomStateOne );
    this.g.setCellArray(cz+3, cy, cx+1, (int)random(1,20));
    this.g.setCellArray(cz+3, cy, cx+2, randomStateOne );
    this.g.setCellArray(cz+3, cy, cx+3, randomStateOne );
    
    this.g.setCellArray(cz-3, cy, cx, 7); // 7
    this.g.setCellArray(cz-3, cy, cx-1, randomStateOne ); // 7
    this.g.setCellArray(cz-3, cy, cx-2, randomStateOne ); // 7
    this.g.setCellArray(cz-3, cy, cx-3, randomStateOne ); // 7
    this.g.setCellArray(cz-3, cy, cx+1, (int)random(1,20) ); // 7
    this.g.setCellArray(cz-3, cy, cx+2, randomStateOne ); // 7
    this.g.setCellArray(cz-3, cy, cx+3, randomStateOne ); // 7
    
    this.g.setCellArray(cz+3, cy, cx-3, randomStateTwo); // 2
    this.g.setCellArray(cz+2, cy, cx-3, randomStateTwo);
    this.g.setCellArray(cz+1, cy, cx-3, randomStateTwo);
    this.g.setCellArray(cz, cy, cx-3,  (int)random(1,20)); 
    this.g.setCellArray(cz-1, cy, cx-3, randomStateTwo);
    this.g.setCellArray(cz-2, cy, cx-3, randomStateTwo);
    this.g.setCellArray(cz-3, cy, cx-3, randomStateTwo); // 2
    
    this.g.setCellArray(cz+3, cy, cx+3, randomStateFour);
    this.g.setCellArray(cz+2, cy, cx+3, (int)random(1,20));
    this.g.setCellArray(cz+1, cy, cx+3, randomStateFour);
    this.g.setCellArray(cz, cy, cx+3, 2); // 9
    this.g.setCellArray(cz-1, cy, cx+3, randomStateFour);
    this.g.setCellArray(cz-2, cy, cx+3, randomStateFour);
    this.g.setCellArray(cz-3, cy, cx+3, randomStateFour);
    
    this.g.setCellArray(cz+3, cy, cx, 6); // 3
    this.g.setCellArray(cz+3, cy+1, cx, randomStateTwo);
    this.g.setCellArray(cz+3, cy+2, cx, randomStateTwo);
    this.g.setCellArray(cz+3, cy+3, cx, randomStateTwo);
    this.g.setCellArray(cz+3, cy-1, cx, (int)random(1,20));
    this.g.setCellArray(cz+3, cy-2, cx, randomStateTwo);
    this.g.setCellArray(cz+3, cy-2, cx, randomStateTwo);
   
    this.g.setCellArray(cz-3, cy, cx, 6);
    this.g.setCellArray(cz-3, cy-1, cx, randomStateTwo); // 6
    this.g.setCellArray(cz-3, cy-2, cx, randomStateTwo);
    this.g.setCellArray(cz-3, cy-3, cx, randomStateTwo);
    this.g.setCellArray(cz-3, cy+1, cx, (int)random(1,20));
    this.g.setCellArray(cz-3, cy+2, cx, randomStateTwo);
    this.g.setCellArray(cz-3, cy+3, cx, randomStateTwo); // 6
   
    this.g.setCellArray(cz+3, cy+3, cx, randomStateThree); // 1
    this.g.setCellArray(cz+2, cy+3, cx, randomStateThree);
    this.g.setCellArray(cz+1, cy+3, cx, randomStateThree);
    this.g.setCellArray(cz, cy+3, cx, 1);
    this.g.setCellArray(cz-1, cy+3, cx, randomStateThree);
    this.g.setCellArray(cz-2, cy+3, cx, (int)random(1,20));
    this.g.setCellArray(cz-3, cy+3, cx, randomStateThree);
    
    this.g.setCellArray(cz+3, cy-3, cx, randomStateThree);
    this.g.setCellArray(cz+2, cy-3, cx, randomStateThree);
    this.g.setCellArray(cz+1, cy-3, cx, randomStateThree);
    this.g.setCellArray(cz, cy-3, cx, (int)random(1,20)); // randomStateOne
    this.g.setCellArray(cz-1, cy-3, cx, randomStateThree);
    this.g.setCellArray(cz-2, cy-3, cx, randomStateThree);
    this.g.setCellArray(cz-3, cy-3, cx, randomStateThree);
  }
}

public class OctagonState implements InitialState { // 10 stati
  
  Grid g;
  int randomStateOne;
  int randomStateTwo;
  int randomStateThree;
  int randomStateFour;
  int random1, random2;
  
  OctagonState(Grid g){
    this.g = g;
    randomStateOne = (int)random (1,5);
    randomStateTwo = (int)random (6,10);
    randomStateThree = (int)random (11,15);
    randomStateFour = (int)random (16,20);
    random1 = (int)random (1,20);
    random2 = (int)random (1,20);}
  
  @Override
  void setInitialState(){
    
    // octagonal shape on cz = 0
    this.g.setCellArray(cz, cy+3, cx, 1);
    
    this.g.setCellArray(cz, cy+3, cx+1, randomStateThree);
    this.g.setCellArray(cz, cy+3, cx-1, randomStateThree);
    this.g.setCellArray(cz, cy+3, cx+2, (int)random(1,20));
    this.g.setCellArray(cz, cy+3, cx-2, randomStateThree);
    
    this.g.setCellArray(cz, cy+2, cx+3, randomStateOne);
    this.g.setCellArray(cz, cy+2, cx+4, randomStateOne);
    this.g.setCellArray(cz, cy+2, cx-3, random1);
    this.g.setCellArray(cz, cy+2, cx-4, randomStateOne);
    
    this.g.setCellArray(cz, cy+1, cx+5, randomStateThree);
    this.g.setCellArray(cz, cy+1, cx+6, randomStateThree);
    this.g.setCellArray(cz, cy+1, cx-5, random2);
    this.g.setCellArray(cz, cy+1, cx-6, randomStateThree);
    
    this.g.setCellArray(cz, cy, cx+5, randomStateOne);
    this.g.setCellArray(cz, cy, cx+6, randomStateOne);
    this.g.setCellArray(cz, cy, cx-5, (int)random(1,20));
    this.g.setCellArray(cz, cy, cx-6, randomStateOne);
    
    this.g.setCellArray(cz, cy-3, cx, randomStateTwo);
    this.g.setCellArray(cz, cy-3, cx+1,randomStateTwo);
    this.g.setCellArray(cz, cy-3, cx-1, random1 );
    this.g.setCellArray(cz, cy-3, cx+2, randomStateTwo);
    this.g.setCellArray(cz, cy-3, cx-2, randomStateTwo);
    
    this.g.setCellArray(cz, cy-2, cx+3, randomStateOne);
    this.g.setCellArray(cz, cy-2, cx+4, random1 );
    this.g.setCellArray(cz, cy-2, cx-3, randomStateOne);
    this.g.setCellArray(cz, cy-2, cx-4, randomStateOne);
    
    this.g.setCellArray(cz, cy-1, cx+5, randomStateFour);
    this.g.setCellArray(cz, cy-1, cx+6, (int)random(1,20));
    this.g.setCellArray(cz, cy-1, cx-5, randomStateFour);
    this.g.setCellArray(cz, cy-1, cx-6, randomStateFour);
  }
}

public class SineState implements InitialState { // 11 stati
  
  Grid g;
  int randomStateOne;
  int randomStateTwo;
  int randomStateThree;
  int randomStateFour;
  int random1, random2;
  
 SineState (Grid g){
    this.g = g;
    randomStateOne = (int)random (1,5);
    randomStateTwo = (int)random (6,10);
    randomStateThree = (int)random (11,15);
    randomStateFour = (int)random (16,20);
    
    random1 = (int)random (1,20);
    random2 = (int)random (1,20);
  }
  
  @Override
  void setInitialState(){

    // first lobe y > 0, x > 0
    this.g.setCellArray(cz, cy, cx, random1);
    this.g.setCellArray(cz, cy+1, cx+1, random1);
    this.g.setCellArray(cz, cy+2, cx+2, random1);
    this.g.setCellArray(cz, cy+3, cx+3, randomStateTwo);
    this.g.setCellArray(cz, cy+2, cx+4, randomStateTwo);
    this.g.setCellArray(cz, cy+1, cx+5, randomStateTwo);
    this.g.setCellArray(cz, cy, cx+6, (int)random (1,20));
    
    // second (half) lobe y < 0, x > 0
    this.g.setCellArray(cz, cy-1, cx+7, randomStateFour);
    this.g.setCellArray(cz, cy-2, cx+randomStateOne, randomStateFour);
    this.g.setCellArray(cz, cy-3, cx+9, randomStateFour);
    
    // first lobe y > 0, x < 0
    this.g.setCellArray(cz, cy+1, cx-1, randomStateFour);
    this.g.setCellArray(cz, cy+2, cx-2, (int)random (1,20));
    this.g.setCellArray(cz, cy+3, cx-3, randomStateThree);
    this.g.setCellArray(cz, cy+2, cx-4, randomStateThree);
    this.g.setCellArray(cz, cy+1, cx-5, randomStateThree);
    this.g.setCellArray(cz, cy, cx-6, randomStateThree);
    
    // second (half) lobe y < 0, x < 0
    this.g.setCellArray(cz, cy-1, cx-7, randomStateFour);
    this.g.setCellArray(cz, cy-2, cx-randomStateOne, randomStateFour);
    this.g.setCellArray(cz, cy-3, cx-9, (int)random (1,20));
    
    // first lobe y < 0, z > 0
    this.g.setCellArray(cz+1, cy-1, cx, randomStateOne);
    this.g.setCellArray(cz+2, cy-2, cx, randomStateOne);
    this.g.setCellArray(cz+3, cy-3, cx, randomStateOne);
    this.g.setCellArray(cz+4, cy-2, cx, random2);
    this.g.setCellArray(cz+5, cy-1, cx, random1);
    this.g.setCellArray(cz+6, cy, cx, random2);
    
    // second (half) lobe y > 0, z > 0
    this.g.setCellArray(cz+7, cy+1, cx, random2);
    this.g.setCellArray(cz+randomStateOne, cy+2, cx, random2);
    this.g.setCellArray(cz+9, cy+3, cx, random2);
    
    // first lobe y < 0, x < 0
    this.g.setCellArray(cz-1, cy-1, cx, randomStateOne);
    this.g.setCellArray(cz-2, cy-2, cx, randomStateOne);
    this.g.setCellArray(cz-3, cy-3, cx,(int)random (1,20));
    this.g.setCellArray(cz-4, cy-2, cx, randomStateThree);
    this.g.setCellArray(cz-5, cy-1, cx, randomStateThree);
    this.g.setCellArray(cz-6, cy, cx, randomStateThree);
    
    // second (half) lobe y > 0, x < 0
    this.g.setCellArray(cz-7, cy+1, cx, randomStateOne);
    this.g.setCellArray(cz-randomStateOne, cy+2, cx, (int)random (1,20));
    this.g.setCellArray(cz-9, cy+3, cx, randomStateOne);
  }
}

// Gli stati su ogni semiasse che parte dall'origine hanno lo stesso stato
public class CrossState implements InitialState{ // 12 stati
  
  Grid g;
  int randomStateOne;
  int randomStateTwo;
  int randomStateThree;
  int randomStateFour;
  int random1, random2;
  
   CrossState (Grid g){
    this.g = g;
    randomStateOne = (int)random (1,5);
    randomStateTwo = (int)random (6,10);
    randomStateThree = (int)random (11,15);
    randomStateFour = (int)random (16,20);
    
    random1 = (int)random (1,20);
    random2 = (int)random (1,20);
  }
  
  @Override
  void setInitialState(){
    // cella centrale
    this.g. setCellArray(cz,cy,cx,1);
    // celle in verticale sull'asse y
    this.g. setCellArray(cz,cy+1,cx,randomStateOne);
    this.g. setCellArray(cz,cy-1,cx,randomStateOne);
    this.g. setCellArray(cz,cy+2,cx,randomStateOne);
    this.g. setCellArray(cz,cy-2,cx,randomStateOne);
    this.g. setCellArray(cz,cy+3,cx,randomStateOne);
    this.g. setCellArray(cz,cy-3,cx,randomStateOne);
    this.g. setCellArray(cz,cy+4,cx,randomStateOne);
    this.g. setCellArray(cz,cy-4,cx,randomStateOne);
    this.g. setCellArray(cz,cy+5,cx,randomStateTwo);
    this.g. setCellArray(cz,cy-5,cx,randomStateTwo);
    this.g. setCellArray(cz,cy+6,cx,randomStateTwo);
    this.g. setCellArray(cz,cy-6,cx,randomStateTwo);
    this.g. setCellArray(cz,cy+7,cx,randomStateTwo);
    this.g. setCellArray(cz,cy-7,cx,randomStateTwo);
    this.g. setCellArray(cz,cy+8,cx,randomStateTwo);
    this.g. setCellArray(cz,cy-8,cx,randomStateTwo);
    this.g. setCellArray(cz,cy+9,cx,randomStateTwo);
    this.g. setCellArray(cz,cy-9,cx,randomStateTwo);
    
    // celle in orizzontale sull'asse x
    this.g. setCellArray(cz,cy,cx+1,randomStateThree);
    this.g. setCellArray(cz,cy,cx-1,randomStateThree);
    this.g. setCellArray(cz,cy,cx+2,randomStateThree);
    this.g. setCellArray(cz,cy,cx-2,randomStateThree);
    this.g. setCellArray(cz,cy,cx+3,randomStateThree);
    this.g. setCellArray(cz,cy,cx-3,randomStateThree);
    this.g. setCellArray(cz,cy,cx+4,randomStateThree);
    this.g. setCellArray(cz,cy,cx-4,randomStateThree);
    this.g. setCellArray(cz,cy,cx+5,randomStateFour);
    this.g. setCellArray(cz,cy,cx-5,randomStateFour);
    this.g. setCellArray(cz,cy,cx+6,randomStateFour);
    this.g. setCellArray(cz,cy,cx-6,randomStateFour);
    this.g. setCellArray(cz,cy,cx+7,randomStateFour);
    this.g. setCellArray(cz,cy,cx-7,randomStateFour);
    this.g. setCellArray(cz,cy,cx+8,randomStateFour);
    this.g. setCellArray(cz,cy,cx-8,randomStateFour);
    this.g. setCellArray(cz,cy,cx+9,randomStateFour);
    this.g. setCellArray(cz,cy,cx-9,randomStateFour);
    
    // celle allineate sull'asse z
    this.g. setCellArray(cz+1,cy,cx,random1);
    this.g. setCellArray(cz-1,cy,cx,random1);
    this.g. setCellArray(cz+2,cy,cx,random1);
    this.g. setCellArray(cz-2,cy,cx,random1);
    this.g. setCellArray(cz+3,cy,cx,random1);
    this.g. setCellArray(cz-3,cy,cx,random1);
    this.g. setCellArray(cz+4,cy,cx,random1);
    this.g. setCellArray(cz-4,cy,cx,random1);
    this.g. setCellArray(cz+5,cy,cx,random2 );
    this.g. setCellArray(cz-5,cy,cx,random2 );
    this.g. setCellArray(cz+6,cy,cx,random2 );
    this.g. setCellArray(cz-6,cy,cx,random2 );
    this.g. setCellArray(cz+7,cy,cx,random2 );
    this.g. setCellArray(cz-7,cy,cx,random2 );
    this.g. setCellArray(cz+8,cy,cx,random2 );
    this.g. setCellArray(cz-8,cy,cx,random2 );
    this.g. setCellArray(cz+9,cy,cx,random2 );
    this.g. setCellArray(cz-9,cy,cx,random2 );
  }
}

public class IrregularState implements InitialState { // 13 stati
  
  Grid g; /* three state and some random */
  int randomStateOne;
  int randomStateTwo;
  int randomStateThree;

  
  IrregularState(Grid g){
    this.g = g;
    randomStateOne = (int)random (1,7);
    randomStateTwo = (int)random (randomStateOne,15);
    randomStateThree = (int)random (15,20);
  }
    
  @Override
  void setInitialState(){
    
    this.g. setCellArray(cz,cy,cx, randomStateTwo );
    this.g. setCellArray(cz+1,cy,cx,  randomStateThree);
    this.g.setCellArray(cz+2, cy+2, cx, randomStateOne);
    this.g.setCellArray(cz+2, cy-2, cx, (int)random (1,20));
    this.g. setCellArray(cz+3,cy,cx, randomStateTwo );
    this.g. setCellArray(cz-1,cy,cx,  randomStateThree);
    this.g.setCellArray(cz-2, cy-2, cx, randomStateOne);
    this.g.setCellArray(cz-2, cy+2, cx, randomStateOne);
    this.g. setCellArray(cz-3,cy,cx, randomStateTwo);
    this.g. setCellArray(cz,cy+1,cx,  randomStateThree);
    this.g. setCellArray(cz,cy+3,cx, (int)random (1,20) );
    this.g. setCellArray(cz,cy-1,cx,  randomStateThree);
    this.g. setCellArray(cz,cy-3,cx, randomStateTwo );
    this.g. setCellArray(cz,cy,cx+1, randomStateThree);
    this.g.setCellArray(cz, cy+2, cx+2, (int)random (1,20));
    this.g.setCellArray(cz, cy-2, cx+2, randomStateOne);
    this.g. setCellArray(cz,cy,cx+3, randomStateTwo );
    this.g. setCellArray(cz,cy,cx-1,  randomStateThree);
    this.g.setCellArray(cz, cy+2, cx-2, randomStateOne);
    this.g.setCellArray(cz, cy-2, cx-2, randomStateOne);
    this.g. setCellArray(cz,cy,cx-3, randomStateTwo );
    
  }
}

public class EmptySphereState implements InitialState { // 14 states
 
  Grid g; /* five state with some random*/
  int randomStateOne;
  int randomStateTwo;
  int randomStateThree;
  int randomStateFour;
  int randomStateFive;

  
  EmptySphereState(Grid g){
    this.g = g;
    randomStateOne = (int)random (1,4);
    randomStateTwo = (int)random (5,randomStateOne);
    randomStateThree = (int)random (9,12);
    randomStateFour = (int)random (13,16);
    randomStateFive = (int)random (17,20);
  }
  
  @Override
  void setInitialState(){
    // Front cells cz > 0, cy > 0
    this.g.setCellArray(cz, cy+4, cx, randomStateThree );
    this.g.setCellArray(cz+1, cy+3, cx, randomStateThree );
    this.g.setCellArray(cz+2, cy+2, cx, (int)random (1,20) );
    this.g.setCellArray(cz+3, cy+1, cx, randomStateThree );
    this.g.setCellArray(cz+4, cy, cx, randomStateThree );
    // Behind cells cz < 0, cy > 0
    this.g.setCellArray(cz-1, cy+3, cx, randomStateFour);
    this.g.setCellArray(cz-2, cy+2, cx, randomStateFour);
    this.g.setCellArray(cz-3, cy+1, cx, randomStateFour);
    this.g.setCellArray(cz-4, cy, cx, randomStateFour);
    
    // Front cells cz > 0, cy < 0
    this.g.setCellArray(cz, cy-4, cx, randomStateFive);
    this.g.setCellArray(cz+1, cy-3, cx, (int)random (1,20));
    this.g.setCellArray(cz+2, cy-2, cx, randomStateFive);
    this.g.setCellArray(cz+3, cy-1, cx, randomStateFive);
    this.g.setCellArray(cz+4, cy, cx, randomStateFive);
    // Behind cells cz < 0, cy < 0
    this.g.setCellArray(cz-1, cy-3, cx, randomStateFive);
    this.g.setCellArray(cz-2, cy-2, cx, randomStateFive);
    this.g.setCellArray(cz-3, cy-1, cx, randomStateFive);
    this.g.setCellArray(cz-4, cy, cx, randomStateFive);
    
    // Left cells cx > 0, cy > 0
    this.g.setCellArray(cz, cy+3, cx+1, randomStateTwo);
    this.g.setCellArray(cz, cy+2, cx+2, randomStateTwo);
    this.g.setCellArray(cz, cy+1, cx+3, (int)random (1,20));
    this.g.setCellArray(cz, cy, cx+4, randomStateTwo);
    // Left cells cx > 0, cy < 0
    this.g.setCellArray(cz, cy-3, cx+1, randomStateFour);
    this.g.setCellArray(cz, cy-2, cx+2, randomStateFour);
    this.g.setCellArray(cz, cy-1, cx+3, randomStateFour);
    this.g.setCellArray(cz, cy, cx+4, randomStateFour);
    
    // Right cells cx < 0, cy > 0
    this.g.setCellArray(cz, cy+3, cx-1, randomStateTwo);
    this.g.setCellArray(cz, cy+2, cx-2, randomStateTwo);
    this.g.setCellArray(cz, cy+1, cx-3, (int)random (1,20));
    this.g.setCellArray(cz, cy, cx-4, randomStateTwo);
    // Right cells cx < 0, cy < 0
    this.g.setCellArray(cz, cy-3, cx-1, randomStateThree );
    this.g.setCellArray(cz, cy-2, cx-2, randomStateThree );
    this.g.setCellArray(cz, cy-1, cx-3, randomStateThree );
    this.g.setCellArray(cz, cy, cx-4, randomStateThree );
  }
}

public class RandomState implements InitialState { // 15 stati

  Grid g; /* totally random */
  
  RandomState(Grid g){
    this.g = g;
  }
  @Override
  void setInitialState(){
    // esagono
    // cx>0, cy>0
    this.g.setCellArray(cz, cy+4, cx, (int)random (1,20));
    this.g.setCellArray(cz, cy+4, cx+1, (int)random (1,20));
    this.g.setCellArray(cz, cy+3, cx+2, (int)random (1,20));
    this.g.setCellArray(cz, cy+2, cx+3, (int)random (1,20));
    this.g.setCellArray(cz, cy+1, cx+4, (int)random (1,20));
    this.g.setCellArray(cz, cy, cx+5, (int)random (1,20));
    // cx<0, cy>0
    this.g.setCellArray(cz, cy+4, cx-1, (int)random (1,20));
    this.g.setCellArray(cz, cy+3, cx-2, (int)random (1,20));
    this.g.setCellArray(cz, cy+2, cx-3,(int)random (1,20));
    this.g.setCellArray(cz, cy+1, cx-4, (int)random (1,20));
    this.g.setCellArray(cz, cy, cx-5, (int)random (1,20));
    // cx<0, cy<0
    this.g.setCellArray(cz, cy-1, cx-4, (int)random (1,20));
    this.g.setCellArray(cz, cy-2, cx-3, (int)random (1,20));
    this.g.setCellArray(cz, cy-3, cx-2, (int)random (1,20));
    this.g.setCellArray(cz, cy-4, cx-1, (int)random (1,20));
    this.g.setCellArray(cz, cy-4, cx,   (int)random (1,20));
    // cx>0, cy<0
    this.g.setCellArray(cz, cy-4, cx+1, (int)random (1,20));
    this.g.setCellArray(cz, cy-3, cx+2, (int)random (1,20));
    this.g.setCellArray(cz, cy-2, cx+3, (int)random (1,20));
  }
}
