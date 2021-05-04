/* The population is a set of 10 songs. */
/* The initial population is randomly chosen, while the next generations' populations are generated by 
applying selection and reproduction to the current population's elements. */
/* Parents are selected acording to their fitness function. */

class Population {

  float mutationRate;
  DNA[] population;
  ArrayList<DNA> matingPool;
  int generations;

  /* Generate a population */
  Population(float m, int num, IntList L, float[][] fp) {
    mutationRate = m;
    population = new DNA[num];
    matingPool = new ArrayList<DNA>();
    generations = 0;
    for (int i=0; i<population.length; i++) {
      population[i] = new DNA(L.get(i), fp);
    }
  }
  
  /* Selection of the parents */
  void selection() {
    matingPool.clear();
    float checkMaxFitness = getcheckMaxFitness();
    for (int i=0; i<population.length; i++) {
      float fitnessNormal = map(fitness[i], 0, checkMaxFitness, 0, 1);
      int n = (int) (fitnessNormal * 100);
      for (int j=0; j<n; j++) {
        matingPool.add(population[i]);
      }
    }
  }  

  /* Reproduction of the parents by applying crossover and mutation*/
  void reproduction() {
    AddSong.clearNew();
    for (int i=0; i<population.length; i++) {
      int m = int(random(matingPool.size()));
      int d = int(random(matingPool.size()));

      DNA mom = matingPool.get(m);
      DNA dad = matingPool.get(d);

      DNA child = mom.crossover(dad);
      // Mutate their genes
      child.mutate(mutationRate);
      int index = child.findSong();
      AddSong.addNew(index);
      population[i] = child;
    }
    generations++;
  }

  int getGenerations() {
    return generations;
  }

  /* Search the highest fitness */
  float getcheckMaxFitness() {
    float record = 0;
    for (int i=0; i<population.length; i++) {
      if (fitness[i] > record) {
        record = fitness[i];
      }
    }
    return record;
  }
}
