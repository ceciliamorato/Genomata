/* Defines the DNA used for the Genetic Algorithm. */
/* The genes are the features extracted from Spotify. */
/* The Genotype is an array of float numbers; individual components of the genotype are the genes. */
/* The phenotype is the song represented by the set of features in the genotype. */
/* Crossover is Arithmetic and it merges the genetic information of the parents by performing an algebric mean between their genes. */
/* Mutation consists in adding or subtracting a random small value to each gene of the child with a given small probability. */
/* findSong method is used to associated an actual song in a playlist to the child DNA generated after crossover and mutation. */

int SIZE = tot_songs;
FloatList min = new FloatList();
FloatList sumOfDiff = new FloatList();

class DNA {
  int dna_length = 6;
  float[] genes;

  DNA() {
    genes = new float[dna_length];
    for (int i=0; i<dna_length; i++) {
      genes[i] = 0;
    }
  }

  DNA(float[] newgenes) {
    genes = newgenes;
  }

  DNA(int newgenes, float[][] fp) {
    genes = new float[dna_length];
    for (int i=0; i<dna_length; i++) {
      genes[i] = fp[i][newgenes];
    }
  }

  /* Crossover */
  DNA crossover(DNA partner) {
    float[] child = new float[dna_length];
    for (int i=0; i<dna_length; i++) {
      child[i] = (genes[i] + partner.genes[i])*1./2;
    }
    DNA newgenes = new DNA(child);
    return newgenes;
  }

  /* Mutation */
  void mutate(float m) {
    for (int i=0; i<dna_length; i++) {
      if (random(1)<m) {
        genes[i] += random(-0.05, 0.05);
      }
    }
  }

  int findSong() {
    float sum = 0;
    for (int k=0; k<tot_songs; k++) {
      sumOfDiff.set(k, 0);
    }
    // inizializzazione di min con le differenze rispetto alla prima canzone della lista
    for (int i=0; i<dna_length; i++) {
      min.append(Math.abs(genes[i] - float_params[i][0]));
      sum += min.get(i);
    }
    sumOfDiff.add(0, sum);
    int index = int(random(tot_songs));
    while (AddSong.songIndex.hasValue(index) || AddSong.notAgain.hasValue(index)){
      index = int(random(tot_songs));
    }
    float record = sumOfDiff.get(0);
    for (int k=1; k<tot_songs; k++) {
      int j = 0;
      float s = 0;
      while (j<dna_length) {
        s += Math.abs(genes[j] - float_params[j][k]);
        sumOfDiff.add(k, s);
        j++;
      }
      if (!AddSong.songIndex.hasValue(k) && !AddSong.notAgain.hasValue(k) && sumOfDiff.get(k) != 0) {
        if (sumOfDiff.get(k) < record) {
          record = sumOfDiff.get(k);
          index = k;
        }
      }
    }
    min.clear();
    sumOfDiff.clear();
    return index;
  }
}
