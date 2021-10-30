# Genomata

![image](https://user-images.githubusercontent.com/36270086/139530079-237ebe9e-0614-4b6c-a266-43470428221b.png)

Genomata is an application implemented with Processing, developed for the Creative Programming and Computing university course, held at Politecnico di Milano. This application spans different topics, including Music Information Retrieval (exploiting the Spotify API for Developers), Genetic Algorithms and 3D Cellular Automata and Particle Systems.

## Creators
* Cecilia Morato
* Eleonora Landini
* Nicoletta Brundo

## Music Information Retrieval
The Music Information Retrieval part of the project exploits the Spotify API for developers; it allows:
* Access to a set of playlists on Spotify;
* Access to the tracks in these playlists;
* To extract a set of audio features for each track.

### Features
The features that we are using for this project are: 
* <b>Acousticness</b>: describes the amount of usage of electronic instruments in comparison to acoustic ones;
* <b>Danceability</b>: describes how suitable a song is for dancing, based on a combination of its musical elements (rhythm, tempo, beat strength);
* <b>Energy</b>: represents a perceptual measure of intensity and activity;
* <b>Loudness</b>: provides an overall loudness of the whole track in dB;
* <b>Tempo</b>: provides the overall tempo of a track in beats per minute;
* <b>Valence</b>: describes the level of positiveness conveyed by a track.
### Instantaneous Features
In addition to the features extracted from Spotify, we also used 3 other parameters, that are directly extracted from each song’s spectrum: 
* Energy;
* Entropy;
* Centroid.     

These features are extracted using the Processing library called Minim. 


<!-- ![image](https://user-images.githubusercontent.com/36270086/139530108-7e4d578e-7d7f-4166-a9fd-4afa14ff2ae0.png) -->
<!-- ![image](https://user-images.githubusercontent.com/36270086/139530138-ce771e9d-105e-4ee5-ac16-cc4aa5ea1651.png) -->
<!-- ![image](https://user-images.githubusercontent.com/36270086/139530153-27ec43a8-30bd-416e-ad90-5f0a839fd48c.png) -->
<!-- ![image](https://user-images.githubusercontent.com/36270086/139530290-2206096e-24cb-47e9-8cb6-561d94181cbf.png) -->
