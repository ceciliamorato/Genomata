/* Display of initial GUI and gathering of token and playlist ID to send to Python*/ 

import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.Transferable;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.awt.Toolkit;

public class InputFunction {

  SongButton[] buttons;
  String[] inputVals;

  InputFunction() {}
  
  /* Initialization of the array of Strings containing the token and Playlist URIs*/
  boolean initValues() {
    inputVals = new String[tot_inputs-1];
    for (int i = 0; i < tot_inputs-1; i++) {
      inputVals[i] = "";
    }
    return true;
  }
  
  /* Recognition of the clicked button */ 
  int buttonC() {
    for (int i = 0; i< tot_inputs; i++) {
      if (buttons[i].clicked(mouseX, mouseY,buttons[i].r)) {
        return i;
      }
    }
    return tot_inputs;
  }
  
  /* Display of the buttons and text boxes */
  void display() {
    background(0);
    fill(355);
    textFont(font,18);
    textAlign(LEFT, CENTER);
    text("Click on the buttons to paste the content of your clipboard.", 100, 100, 200, 100);
    buttons = new SongButton[tot_inputs];
    buttons[tot_inputs-1] = new SongButton(width*2./5, height-200, "Start Loading");
    buttons[tot_inputs-1].rollover(mouseX, mouseY, buttons[tot_inputs-1].r);
    buttons[tot_inputs-1].display();
    fill(0);
    noStroke();
    rect(width*2./5-120,95,115,370+height*1./60);
    fill(255, 0, 100);
    textFont(font);
    text("Token", width*2./5-60, 100 + height*1./60);
    buttons[0] = new SongButton(width*2./5, 100, inputVals[0]);
    buttons[0].rollover(mouseX, mouseY, buttons[0].r);
    buttons[0].display();
    for (int i=1; i<tot_inputs-1; i++) {  
      fill(255, 0, 100);
      textFont(font);
      text("Playlist URI #"+i, width*2./5-60, 100+height*1./60+30*1.1*i);
      button_name = inputVals[i];
      buttons[i] = new SongButton(width*2./5, 100+30*1.1*i, button_name);
      buttons[i].rollover(mouseX, mouseY, buttons[i].r);
      buttons[i].display();
    }
    if (tryAgain) {
      fill(355);
      textFont(font,16);
      text("This token expired, please select a new token.", width*2./5+width/4.5+170, 98 + height*1./60);
    }
  } 
  
  /* Pasting content of the clipboard into the variables and buttons */
  void action(int i) {
    if (i < tot_inputs-1) {
      String[] val = getTextFromClipboard().split("spotify:playlist:"); 
      if (val.length>1) {
        print(val[1]);
        inputVals[i] = val[1];
      } else {
        print(val[0]);
        inputVals[i] = val[0];
      }
    } else if (i == tot_inputs - 1) {
      sendOSC();
      preloading = false;
      background(0);
    }
  }

  /* Sending of the token and playlist URIs as OSC messages */
  void sendOSC() {
    OscMessage msg = new OscMessage("/data");
    msg.add(inputVals[0]); 
    for (int i = 1; i < tot_inputs-1; i++) {
      if (inputVals[i].length()>20) { 
        msg.add("https://api.spotify.com/v1/playlists/"+inputVals[i]+"/tracks");   
      }
    }
    println(msg);
    oscP5.send(msg, location);
  }

  /* Managing how to get the text from Clipboard */
  
  String getTextFromClipboard () {
    String text = (String) getFromClipboard(DataFlavor.stringFlavor);
    return text;
  }
  
  Object getFromClipboard (DataFlavor flavor) {

    Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard(); 
    Transferable contents = clipboard.getContents(null);
    Object object = null;

    if (contents != null && contents.isDataFlavorSupported(flavor))
    {
      try
      {
        object = contents.getTransferData(flavor);
        //println("Clipboard.getFromClipboard() >> Object transferred from clipboard.");
      }

      catch (UnsupportedFlavorException e1) // Unlikely but we must catch it
      {
        //println("Clipboard.getFromClipboard() >> Unsupported flavor: " + e1);
        //~  e1.printStackTrace();
      }

      catch (java.io.IOException e2)
      {
        //println("Clipboard.getFromClipboard() >> Unavailable data: " + e2);
        //~  e2.printStackTrace();
      }
    }

    return object;
  } 

  final javax.swing.JFrame getJFrame(final PSurface surf) {
    return
      (javax.swing.JFrame)
      ((processing.awt.PSurfaceAWT.SmoothCanvas)
      surf.getNative()).getFrame();
  }
}
