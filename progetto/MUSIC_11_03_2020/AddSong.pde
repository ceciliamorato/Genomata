/* Static class with methods to control global variables useful for the algorithm genetic */

public static class AddSong {
  
  public static IntList notAgain = new IntList();/* songs that must not be added again*/
  public static IntList songIndex = new IntList();/*lists of current songs*/
  
  AddSong() {
  }
  public static void addOld(int i) {
    notAgain.append(i);
  }

  public static void clearOld() {
    notAgain.clear();
  }

  public static void addNew(int i) {
    songIndex.append(i);
  }

  public static void clearNew() {
    songIndex.clear();
  }
  
  public static void setList(IntList L){
    songIndex = L;
  }
  
  public static void setOld(IntList L){
    notAgain = L;
  }
  
  public static void change(){
    notAgain = songIndex.copy();
  }
}
