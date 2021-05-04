import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.analysis.FFT;

/* This class analyses the features of songs in real time and update global variables of energy, entropy and centroid */

int SMOOTHING_WINDOW = 10; /* array circolare, finestra sulla quale calcoliamo i valori medi nel buffer, lunghezza del buffer */

/* Create a new Buffer*/
float[] create_zero_buffer(){
  float[] buffer = new float[SMOOTHING_WINDOW];
  for (int i=0; i<SMOOTHING_WINDOW; i++){
    buffer[i]=0.;
  }
  return buffer;
}

/*Initialize the buffer with empty values*/
float[] create_zero_buffer_energy(){
  float[] buffer = new float[100];
  for (int i=0; i<100; i++){
    buffer[i]=0.;
  }
  return buffer;
}

/*Computer the entropy of the input song */
/*It is a measure of information */
/* the less is the probability the more is the entropy*/
float compute_entropy(FFT fft){
  float entropy =0;
  for (int i=0; i<fft.specSize(); i++){
     entropy+= fft.getBand(i)*log(fft.getBand(i));
  }
  return entropy/log(fft.specSize());
}

/* Compute the energy of input song*/
float compute_energy(FFT fft) {    
  float energy = 0;
  for(int i = 0; i < fft.specSize(); i++){
    energy+=pow(fft.getBand(i),2);      
  }   
  return energy;
}
/* Compute the Centroid of input song*/
float compute_centroid(FFT fft, float sum_of_spectrum, float[] freqs){
   float centroid=0;
    for(int i = 0; i < fft.specSize(); i++){
      centroid += freqs[i]*fft.getBand(i);
    }
    return centroid/sum_of_spectrum;
}

float compute_sum_of_spectrum(FFT fft){
  float sum_of=0;
  for(int i = 0; i < fft.specSize(); i++)
   {
     sum_of += fft.getBand(i);      
   }
  return sum_of+1e-15; 
}

/*Calculate the average of values in the buffer*/
float get_average(float[] buffer){
  float average=0;
  for(int i=0; i<buffer.length; i++){
      average+=buffer[i];
  }
  return average/buffer.length;
}


class AgentFeature { 
  int index_buffer=0;
  int indexEnergy=0;
  int index=0;
  int bufferSize;
  float sampleRate;
  int specSize;
  FFT fft;

  float[] freqs; // serve per entropy
  float[] sum_of_bands; // serve per entropy
  float[] centroidBuffer;
  float[] entropyBuffer;
  float[] energyBuffer;

  
  AgentFeature(int bufferSize, float sampleRate){
    this.bufferSize=bufferSize;
    this.sampleRate=sampleRate;
    this.fft = new FFT(bufferSize, sampleRate);
    this.fft.window(FFT.HAMMING);
    
    this.specSize=this.fft.specSize();
    this.sum_of_bands = create_zero_buffer();
    this.centroidBuffer = create_zero_buffer();
    this.entropyBuffer = create_zero_buffer();
    this.energyBuffer = create_zero_buffer();
    this.freqs=new float[this.specSize];
    MAX_ENERGY = 0; // inizializzare ogni volta
    
    for(int i=0; i<this.specSize; i++){
      this.freqs[i]= 0.5*(1.0*i/this.specSize)*this.sampleRate;// studia
    }

  }
  
  void reasoning(AudioBuffer mix){
    this.fft.forward(mix);
    
    this.sum_of_bands[this.index_buffer]= compute_sum_of_spectrum(this.fft);
    this.entropyBuffer[this.index_buffer] = compute_entropy(this.fft);  //entropia
    this.centroidBuffer[this.index_buffer] = compute_centroid(this.fft,this.sum_of_bands[this.index_buffer],this.freqs); // centroide
    this.energyBuffer[ this.indexEnergy] = compute_energy(this.fft);
    
    //ENERGY
    energy_buffer_at_index_buffer = compute_energy(this.fft); // single energy current value of energy in the buffer 
    if (energy_buffer_at_index_buffer > MAX_ENERGY){ MAX_ENERGY = energy_buffer_at_index_buffer;} // set every time the MAX Energy
    en_size = map(energy_buffer_at_index_buffer, 2, 120000, 0.4, 2);// Ergy use for particles and cells size
 
    //ENTROPY
    entropy_buffer_at_index_buffer = get_average(this.entropyBuffer);// usa la media dell'entropia
    entropy_buffer_at_index_buffer = map(entropy_buffer_at_index_buffer , -15 , 800, 0, 1); // alcune volte da valori < -2 e supera i 200
    
    
    //CENTROID
    centroid_buffer_at_index = compute_centroid(this.fft,this.sum_of_bands[this.index_buffer],this.freqs);
   
    this.index_buffer = (this.index_buffer+1)%SMOOTHING_WINDOW;
  }
} 
