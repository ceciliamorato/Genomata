/* Maps and initializes all the features from spotify and from minim */
/* Contains static methods*/

public static class Features {

  public static void initializeFeaturesSpotify() {
    energy_array = new float[tot_buttons];
    loudness_array = new float[tot_buttons];
    valence_array = new float[tot_buttons];
    tempo_array = new float[tot_buttons];
    danceability_array = new float[tot_buttons];
    acousticness_array = new float[tot_buttons];
  }

  public static void currentSongFeatures(int i) {
    danceability = danceability_array[i];
    energy = energy_array[i];
    loudness = loudness_array[i];
    valence = valence_array[i];
    tempo = tempo_array[i];     
    acousticness = acousticness_array[i];
  }

  public static void mapFeatures(int i, IntList L) {
    loudness = map(loudness, -30, 0, 9, 30);
    acousticness = round(acousticness*10);
    transparency = map(energy, 0, 1, 70, 255);
    hue_i = hue_val[L.get(i)];
  }

  public static void firstInitialFeatureSong(IntList l) {
    for (int i=0; i<tot_buttons; i++) {
      danceability_array[i] = float_params[0][l.get(i)];
      energy_array[i] = float_params[1][l.get(i)];
      loudness_array[i] = float_params[2][l.get(i)];
      valence_array[i] = float_params[3][l.get(i)];
      tempo_array[i] = float_params[4][l.get(i)];
      acousticness_array[i] = float_params[5][l.get(i)];
    }
  }


  //valence usato in cell
  public static void mapColorValence() {
    for (int i =0; i<tot_songs; i++) {
      if (float_params[3][i] <= 0.25) {
        hue_val[i] = map(float_params[3][i], 0.01, 0.25, 250, 163);
      } else if (float_params[3][i] > 0.25 && float_params[3][i] <= 0.5) {
        hue_val[i] = map(float_params[3][i], 0.251, 0.5, 162, 70);
      } else if (float_params[3][i] > 0.5 &&  float_params[3][i] <= 0.75) {
        hue_val[i] = map(float_params[3][i], 0.501, 0.75, 69, 0);
      } else {
        hue_val[i] = map(float_params[3][i], 0.751, 1, 294, 360);
      }
    }
  }
}
