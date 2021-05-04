import processing.sound.*;
import peasy.*;
import processing.opengl.*;
import com.hamoid.*;
import java.util.Timer;
import java.util.TimerTask;
import oscP5.*;
import netP5.*;
import ddf.minim.*;

private static final int FPS=30;
//Boolean to start drawing
private boolean isRunning; /* true when the grid is ready */
//Variables to rotate the grid
public static float zAngle; 
public static float yAngle; 
private static final float RADIANTE = PI / 180.0;

//feature spotify
public static float[] danceability_array, energy_array, loudness_array, valence_array, tempo_array, acousticness_array, hue_params, hue_val;
public static float danceability; //controlla la brightness
public static float energy; // controlla grandezza celle , trasprency e camera
public static float loudness; // controlla saturation
public static float valence; // controlla la hue
public static float tempo; //BPM
public static float acousticness = 0.3;
public static float transparency;
public static float hue_i;
public static float en_size;

public String[] song_names;
public String[] song_artists;
public static int tot_songs;
public static int tot_buttons;


//automa
private static int NUM_STATES = 20; 
public static float probability = 0.18; 
public static Rules currentRule;

//Features from minim
public static float energy_buffer_at_index_buffer;
public static float entropy_buffer_at_index_buffer;
public static float centroid_buffer_at_index; 
public static float MAX_ENERGY;

//TOKEN + PLAYLIST
public boolean preloading = true;
InputFunction input;
public int tot_inputs;
public boolean getval = false;
public boolean tryAgain = false;

public boolean clicked = false;
public boolean loading = true;
public boolean clearScreen = false;
public boolean inReasoning = true;

public String str = "";
public String flo ="";

static float[][] float_params;
public String[][] string_params;
public String[] preview_url;

public int bottone_giusto;
public int bottone_ora;
public int last_i;
public int time1;
public int counter = 1;

public float[] fitness;
public int[] index_array;
public float mutationRate;
public Population population;
public IntList randB;

Agent a;
OscP5 oscP5;
NetAddress location;
Minim minim;
AudioPlayer player1;
AgentFeature feat;

MyCamera camera;
Controller controller;/* Controller of the threads for the grid */
ParticleSystem system; /* stars in the background */

public String button_name;
public IntList ind = new IntList();
PFont font;

// Animation during loading
Animation animation;

void setup() {

  background(0);
  size(displayWidth, displayHeight, P3D);
  colorMode(HSB, 360, 100, 100, 255);
  frameRate(FPS);
  
  isRunning = false;
  
  energy_buffer_at_index_buffer = 0;
  entropy_buffer_at_index_buffer = 0;
  centroid_buffer_at_index = 0;
  MAX_ENERGY = 0; 
  
  currentRule = new Rules();
  controller = new Controller();
  camera = new MyCamera();

  a = new Agent();
  OscProperties properties = new OscProperties();
  location = new NetAddress("127.0.0.1", 6449); // out proc, in osc
  properties.setRemoteAddress("127.0.0.1", 6449);
  properties.setListeningPort(6448); //in di processing, out osc
  properties.setDatagramSize(16000);
  oscP5 = new OscP5(this, properties);
  println(properties);

  tot_buttons = 10;
  minim = new Minim(this);
  player1 = minim.loadFile("https://p.scdn.co/mp3-preview/ad46dcd0d8d89ec2ad56e8e77f40a8c2c5269d6b?cid=774b29d4f13844c495f206cafdad9c86", 1024);
  feat = new AgentFeature(player1.bufferSize(), player1.sampleRate());
  bottone_giusto = tot_buttons+2;
  last_i = tot_buttons+2;

  //TOKEN + PLAYLIST
  input = new InputFunction();
  tot_inputs = 12;
  bottone_ora = tot_inputs;

  Features.initializeFeaturesSpotify();

  font = createFont("Georgia", 14);
  fitness = new float[tot_buttons];
  index_array = new int[tot_buttons];
  mutationRate = 0.05;
  
  animation = new Animation();
  
}


void draw() {
  if (isRunning) {
    hint(DISABLE_DEPTH_TEST);
    system.drawParticles();
    hint(ENABLE_DEPTH_TEST);
    camera.zoomCamera();
    controller.getGrid().drawGrid();
    if (!inReasoning) {feat.reasoning(player1.mix);}
  }

  hint(DISABLE_DEPTH_TEST);
  camera();
  if (preloading) {
    if (!getval) {
      getval = input.initValues();
    } else {
      input.display();
    }
  } else if (loading && !preloading) {
    bottone_ora = tot_buttons+2;
    SongButton load = new SongButton(width*2./5, height/2-200, "Loading songs ...");
    load.displayL();
    animation.display();
    if (clearScreen) {
      background(0);
      clearScreen = false;
      loading = false;
    }
  } else {
    fill(0);
    rect(0, 55, width/4.5, 30);
    fill(360); 
    textFont(font, 18);
    textAlign(CENTER, CENTER); 
    text ("Please select a song:", 130, 70);
    if (player1.isPlaying() && ((millis()-time1) >= 30000*counter) && bottone_ora!=tot_buttons+2) { 
      player1 = minim.loadFile(preview_url[ind.get(bottone_ora)], 1024);
      MAX_ENERGY=0;
      player1.play(); 
      counter++;
    } 
    a.planning(ind);
  }
  hint(ENABLE_DEPTH_TEST);
}

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/song_info")) {
    loading = true;
    a.reasoning(theOscMessage);
  } else if (theOscMessage.checkAddrPattern("/done")) {
    a.fitnessF(tot_buttons);
    Features.mapColorValence();
    ind = a.random_array(tot_songs);
    Features.firstInitialFeatureSong(ind);
    AddSong.setOld(randB);
    population = new Population(mutationRate, tot_buttons, randB, float_params); 
    clearScreen = true;
    tryAgain = false;
  } else if (theOscMessage.checkAddrPattern("/num_songs")) {
    tot_songs = theOscMessage.get(0).intValue();
    hue_val = new float[tot_songs]; /* map valence to hue, just initialization */
    float_params = new float[7][tot_songs];/* Features of playlist */
    string_params = new String[3][tot_songs];/* name of songs and artists */
    preview_url = new String[tot_songs];/* url of songs */
  } else if (theOscMessage.checkAddrPattern("/typetags")) {
    str = theOscMessage.get(0).stringValue();
    flo = theOscMessage.get(1).stringValue();
  } else if (theOscMessage.checkAddrPattern("/token_expired")) {
    preloading = true;
    input.inputVals[0] = "";
    tryAgain = true;
  }
}


void mousePressed() {
  if (preloading) {
    println(preloading);
    bottone_ora = input.buttonC();
    input.action(bottone_ora);
  } else if (!loading && !preloading) {
    bottone_ora = a.buttonC();
    a.action(bottone_ora, ind);
  }
}
