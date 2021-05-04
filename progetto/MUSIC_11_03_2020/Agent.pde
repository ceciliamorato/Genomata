/* This class manages the received OSC messages, displays the song buttons and regulates what happens when the buttons are clicked*/
class Agent {

  int k, o, j, e; 
  SongButton[] song_buttons;
  int time, time2;
  Agent() {
    k = o = j = e = 0;
    time = 0;
  }
  
  /* Initialization of the fitness values */ 
  void fitnessF(int tot) {
    for (int i = 0; i<tot; i++) {
      fitness[i] = 1000;
    }
  }
  
  /* Reads type tag from osc and fills the arrays with the features received from Python*/
  void reasoning(OscMessage theOscMessage) {

    if (theOscMessage.checkTypetag(str)) {
      for (int i=0; i<tot_songs; i++) {
        string_params[o][i] = theOscMessage.get(i).stringValue();
      }
      o++;
    } else if (theOscMessage.checkTypetag("s")) {
      preview_url[j] = theOscMessage.get(0).stringValue();
      j++;
    } else if (theOscMessage.checkTypetag(flo)) {
      for (int i=0; i<tot_songs; i++) {
        float_params[k][i] = theOscMessage.get(i).floatValue();
      }
      k++;
    }
  }

  /* Displays the song buttons and the ones responsibles for changing the set of songs */
  void planning(IntList l) {
    song_buttons = new SongButton[tot_buttons+2];
    for (int i=0; i<tot_buttons; i++) {
      button_name = string_params[1][l.get(i)] + " - " + string_params[2][l.get(i)];

      song_buttons[i] = new SongButton(width/28, 100+30*1.8*i, button_name);
      song_buttons[i].rollover(mouseX, mouseY, song_buttons[i].r1);

      song_buttons[i].display(fitness[i]*1./1000);
    }
    song_buttons[tot_buttons] = new SongButton(width/28, height-110, "Click here to generate a new set of songs.");
    song_buttons[tot_buttons].rollover(mouseX, mouseY, song_buttons[tot_buttons].r1);
    song_buttons[tot_buttons].displayA();
    song_buttons[tot_buttons+1] = new SongButton(width/28, height-70, "Click here to start from scratch.");
    song_buttons[tot_buttons+1].rollover(mouseX, mouseY, song_buttons[tot_buttons+1].r1);
    song_buttons[tot_buttons+1].displayA();
  } 
  
  /* Generation of a random list of int, representing the random set of songs */ 
  IntList random_array(int l) {
    IntList rand_i = new IntList();
    for (int i = 0; i<l; i++) {
      rand_i.append(i);
    }
    rand_i.shuffle();
    randB = rand_i.getSubset(0, tot_buttons);
    return rand_i;
  }
  
  /* Recognition of the clicked button */
  int buttonC() {
    for (int ii = 0; ii< tot_buttons+2; ii++) {
      if (song_buttons[ii].clicked(mouseX, mouseY, song_buttons[ii].r1)) {
        return ii;
      }
    }
    return tot_buttons+2;
  }

  /* Interaction between the clicked buttons and the automata, particles and player */ 
  void action(int i, IntList L) {
    println(i);
    if (i == tot_buttons) {      // gen a new set
      if (player1.isPlaying()) { //bottone_ora != tot_buttons+2
        player1.pause();
        fitness[last_i] += millis() - a.time;
      }
      population.selection();
      population.reproduction();
      AddSong.clearOld();
      AddSong.change();
      ind = AddSong.songIndex.copy();
      fitnessF(tot_buttons);
      Features.firstInitialFeatureSong(ind);
      action(tot_buttons+2, ind);
      controller.mGrid.clearGrid();
      controller.setgo();
      
    } else if (i == tot_buttons + 1) {     //start from scratch
      player1.pause();
      ind = a.random_array(tot_songs);
      AddSong.clearNew();
      AddSong.clearOld();
      fitnessF(tot_buttons);
      Features.firstInitialFeatureSong(ind);
      AddSong.setOld(randB);
      controller.mGrid.clearGrid();
      a.action(tot_buttons+2, ind);
      
    } else if (i != bottone_giusto && i!=tot_buttons && i!=tot_buttons+1) { // change of song
      if (i == tot_buttons+2) {
        if (player1.isPlaying()) {
          fitness[last_i] += millis() - time;
        }
        player1.pause();
        isRunning = false;
        controller.setgo();
        controller.restart();
      } else {
        if (player1.isPlaying()) {
          fitness[last_i] += millis() - time;
          player1.pause();
          isRunning = false;
          controller.getGrid().clearGrid();
          controller.setgo();
        }
        time =  millis(); 
        time1 = millis();
        counter = 1;
        player1 = minim.loadFile(preview_url[L.get(i)], 1024);
        feat = new AgentFeature(player1.bufferSize(), player1.sampleRate());
        if (inReasoning) {
          feat.reasoning(player1.mix); 
          inReasoning = false;
        }
        Features.currentSongFeatures(i);
        Features.mapFeatures(i, L);
        controller.stop = false;
        system = new ParticleSystem();
        controller.startNewThread();
        controller.mGrid.chooseState();
        player1.play();
      }
      last_i = i;
      bottone_giusto = i;
      
    } else { // i == bottone_giusto => pause or play the same song
      if (i == tot_buttons+2) {
        player1.pause();
        isRunning = false;
      } else {
        if (player1.isPlaying()) {
          fitness[i] += millis() - time;
          time2 = millis();
          player1.pause();
          isRunning = false;
          controller.setgo();
          controller.restart();
        } else {
          player1.play();
          isRunning = true;
          controller.setgo();
          controller.restart();
          time1 += millis()-time2;
          time = millis();
        }
      }
    }
  }
}
