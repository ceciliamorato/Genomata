import java.io.*;

/* Generates new set of rules for the automata */

public interface RuleRunner{
  void runRule(int state,int face, int edge, int corner);}


public class Rules{
  
  private int [] ruleOne; 
  private final int numFace = 6+1 ;
  private final int numEdge = 12+1;
  private final int numCorner = 8+1;

  
  Rules(){}
  
  
  void ForEach(RuleRunner runner){
    
    int state=0, face=0, edge=0, corner=0;
    
    for ( int i = 0; i < NUM_STATES* this.numFace*this.numEdge*this.numCorner; i++){
      runner.runRule(state, face, edge, corner); state++;
      if(state%NUM_STATES == 0 ){ face++; state=0;
        if(state%NUM_STATES == 0 && face%this.numFace==0){
            face=0; state=0; edge++;
            if(state%NUM_STATES == 0 && face%this.numFace==0 && edge%this.numEdge ==0){
              edge=0; face=0; state=0; corner++;}
        }
      }
    }
  }
      
  private void generateRule(){
    
    this.ruleOne = new int[NUM_STATES*numFace*numEdge*numCorner];
    
    ForEach(new RuleRunner() { 
            @Override
            public void runRule(int state, int face,int edge, int corner) {
                    int pos = position(state,face,edge,corner);
                    if (random(1)<probability){ruleOne[pos]= round(random(1,NUM_STATES));}
                    else{ruleOne[pos]=0;}
                 }
              });        
  } 
  
  public int position(int state, int face,int edge, int corner){
    return state + face*NUM_STATES + edge*NUM_STATES*this.numFace + corner*NUM_STATES*this.numFace*this.numEdge;
  }
   
  public int  getRule(int s, int f, int e, int c){
    return this.ruleOne[this.position(s,f,e,c)];} 
}
