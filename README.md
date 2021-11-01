# Genomata

<p align="center"><img src=https://user-images.githubusercontent.com/36270086/139543202-7fe19e4e-48ff-46be-ab1d-44dc73edf640.png></p>

Genomata is an application implemented with Processing, developed for the Creative Programming and Computing university course, held at Politecnico di Milano. This application spans different topics, including Music Information Retrieval (exploiting the Spotify API for Developers), Genetic Algorithms, 3D Cellular Automata and Particle Systems.

## Creators
* Cecilia Morato
* Eleonora Landini
* Nicoletta Brundo

## Music Information Retrieval
The Music Information Retrieval part of the project exploits the Spotify API for developers. It allows:
* Access to a set of playlists on Spotify
* Access to the tracks in these playlists
* To extract a set of audio features for each track

### Features
The features that we are using for this project are: 
* <b>Acousticness</b>: describes the amount of usage of electronic instruments in comparison to acoustic ones
* <b>Danceability</b>: describes how suitable a song is for dancing, based on a combination of its musical elements (rhythm, tempo, beat strength)
* <b>Energy</b>: represents a perceptual measure of intensity and activity
* <b>Loudness</b>: provides an overall loudness of the whole track in dB
* <b>Tempo</b>: provides the overall tempo of a track in beats per minute
* <b>Valence</b>: describes the level of positiveness conveyed by a track

### Instantaneous Features
In addition to the features extracted from Spotify, we also used 3 other parameters, that are directly extracted from each song’s spectrum using a Processing library called Minim:
* Energy
* Entropy
* Centroid

## Genetic Algorithm
The goal of the Genetic Algorithm is to provide the user new sets of songs, according to the previous choices.
For each track we identify:

* **Genotype**: an array of length 6, containing float numbers
* **Genes**: each single element of the genotype. These float numbers represent the values of the 6 features gathered from the track
* **Phenotype**: the song itself, as represented by the 6 features extracted using the API
* **Fitness Function**: the amount of time the user spends listening to each track in the population

How it works: 

1. [**start**] The initial population is chosen by randomly selecting 10 songs from the tracks in our playlists
1. [**fitness**] The fitness function is computed for every track in the population
1. [**new population**] A new population is generated, by applying the next steps until the population is completed:
    1.  [selection] Parents are selected according to their fitness function: the more the song has been listened to, the higher the fitness function, the higher the probability of that song to be selected as a parent for the generation of a new child
    2.  [crossover] The new child is the result of the crossover between the two selected parents: since we are using track’s features as genes, we use an arithmetic crossover function, which generates the new child song by computing the arithmetic mean of each of the parents’ features
    3.  [mutation]  To introduce some variability into the new population, mutation is performed. In this case, since we are working with real values, mutation consists in 	adding/subtracting a small number to each gene of the new child, with a defined (small) mutation probability

## Cellular Automata

The main components of the 3D cellular automata are:
* **Grid**: the grid has dimensions 36x36x36 in the (x,y,z) coordinates and each element is a Cell object. Cells are boxes, and each one of them is associated to a state value
* **Rules**: rules are generated and then applied to every cell whose state is zero, in order to generate its next state value. The generation of new state values depends on the number of neighbours of each of these cells
* **Threads**: the growth and disruption of the cellular automata are governed by two distinguished threads, that call on the increase() and decrease() methods, checking the dimension of the current generation automata

### Mapping
The features extracted from Spotify control some characteristics of the automata: 

* **Thread’s delay time**: the threads act with a delay time that is proportional to the Tempo feature of the song that is currently played
* **Initial state**: there are 10 possible initial state configurations, and the selection among these depends on the acousticness value of the selected song
* **Rotation**: rotation of the automata (through the means of the camera) is regulated by the instantaneous values of energy, thus meaning that higher energy values correspond to faster rotations and viceversa
* **Growth**: the growth of the automata changes depending on the instantaneous entropy values of the current song, meaning that more chaotic tracks are more suitable to grow faster than slower tracks
* **Colour (HSB colour mode)**:
    * the _hue_ value depends on the valence
    * the _saturation_ value is regulated by the loudness and by the cell’s state value
    * the _brightness_ value is controlled by the danceability parameter and by the cell’s state value
    * the _transparency_ factor depends on the energy value, thus meaning that more energic tracks are associated to opaquer colours, while low-energy songs are associated to more transparent ones

## Particle System

The particle system is controlled by the instantaneous features extracted from the spectrum of each track. In particular:

* The **location on the x axis** of each particle depends on the _energy_; if the instantaneous energy of the track reaches the maximum level, the location on the x axis increases towards the edges of the screen with an energy sprint
* The **velocity on the x axis** depends on the instantaneous _entropy_ of the track
* The **acceleration on the x axis** depends on the _energy_ value
* The **location on the y axis** depends on the _instantaneous centroid_ of the current track, mapped over (0, height), and all the particles of the system move towards its position
* The _centroid_ value is also used to control the **brilliance** of the particles

## Message Exchange
The project is developed in Processing and Python: these two languages communicate using the OSC protocol. 

* Processing as client: it sends a Token and the chosen playlists’ IDs, in order to gain access to them, and then obtains from Python the features extracted from the tracks in the selected playlists
* Python as server: starts and listens forever on port 6449; it then sends data back to Processing, who’s listening on port 6448

## GUI
### Loading the Playlists
<p align='center'><img src=https://user-images.githubusercontent.com/36270086/139532930-2980e590-f7fb-4a81-840b-04eba70a989d.png></p>

1. Copy-paste the token, acquired from the [Spotify for Developers API](https://developer.spotify.com/console/get-playlist-tracks/?playlist_id=&market=&fields=&limit=&offset=), by clicking on the first button.
<p align="center"><img src=https://user-images.githubusercontent.com/36270086/139531825-6c897049-b48d-469b-95c4-1d718fe780ca.png></p> 
These checkboxes need to be selected for the application to function correctly:
<p align="center"><img src=https://user-images.githubusercontent.com/36270086/139531864-27a14fb7-5002-4b5e-a8a7-9951beb43e0d.png></p>
2. Copy-paste the URI of the Spotify playlist that you want to use just by clicking on one of the corresponding buttons. <p align="center"><img src=https://user-images.githubusercontent.com/36270086/139534374-f96ca213-8fe1-4114-b2ca-46b604a1bcae.png></p>
3. Start loading the songs by clicking on the <i>Start loading</i> button.

### Main GUI of the Application
<p align="center"><img src=https://user-images.githubusercontent.com/36270086/139530108-7e4d578e-7d7f-4166-a9fd-4afa14ff2ae0.png></p>
Initial random population of songs; click on one of them to here it play and visualize the automata; double click on a song to pause it.

1.
<p align="center"><img src=https://user-images.githubusercontent.com/36270086/139534608-3240fc68-0f2c-4b77-94f1-4022ea64e83c.png></p>

<!-- ![image](https://user-images.githubusercontent.com/36270086/139542547-3f933dd6-1726-4199-978f-0e48a756c155.png) -->


<p align="center"><img src=https://user-images.githubusercontent.com/36270086/139554812-1a1b7201-aa6c-4fe0-bc03-17ea138b23f0.png></p>



<!-- ![image](https://user-images.githubusercontent.com/36270086/139530138-ce771e9d-105e-4ee5-ac16-cc4aa5ea1651.png) -->
<!-- ![image](https://user-images.githubusercontent.com/36270086/139530153-27ec43a8-30bd-416e-ad90-5f0a839fd48c.png) -->
<!-- ![image](https://user-images.githubusercontent.com/36270086/139530290-2206096e-24cb-47e9-8cb6-561d94181cbf.png) -->
