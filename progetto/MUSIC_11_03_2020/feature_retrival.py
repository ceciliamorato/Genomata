try:
    import requests
except:
    print("If you read this message, it means you need to install the package requests by using pip3 install requests --user")
import numpy as np
import json
import matplotlib.pyplot as plt
from IPython.display import Audio as play_wave
import getpass

import urllib.request
from pythonosc import dispatcher, osc_server, udp_client

class AgentOSC():
    def __init__(self, ip="127.0.0.1", port_in=6449, port_out=6448, name_in="/data"):
        self.name_in=name_in        
        self.dispatcher = dispatcher.Dispatcher()
        self.dispatcher.map(self.name_in, self.reasoning)
        self.client = udp_client.SimpleUDPClient(ip, port_out)

        self.server = osc_server.ThreadingOSCUDPServer((ip, port_in), self.dispatcher)
        self.url = []
        self.url1="https://api.spotify.com/v1/audio-features"
        self.all_songs = []

    def reasoning(self, name, *msg):
        print(msg)
        self.token = msg[0]
        print("TOKEN ")
        print(len(msg))
        print(self.url)
        for i in range(1,len(msg)):
            self.url.append(msg[i])
        print(self.url)
        self.headers={"User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/68.0.3440.106 Safari/537.36",
                 'Content-Type': 'application/json',
                 'Accept': 'application/json',
                 "Authorization": "Bearer %s"%self.token}
        print(self.headers)
        self.computeFeatures()

    def computeFeatures(self):
        for o in range(len(self.url)):
            req = requests.get(url=self.url[o],headers=self.headers)

            # TOKEN EXPIRED
            if (req.status_code == 401):
                self.client.send_message("/token_expired",0)
                self.url = []
                break

            assert req.status_code==200, req.content
            answer = req.json()
            
            items = answer["items"]
            print(str(len(items))+ " songs in playlist " + str(o))

            # A maximum of 100 objects can be sent at once

            #  Check of null preview and removing said songs from playlist
            for i in range(len(items)):
                song_id = items[i]["track"]["id"]
                print(items[i]["track"]["name"])
                if (str(items[i]["track"]["preview_url"])== "None"):
                    removed_song = '{"tracks":[{"uri": "spotify:track:'+song_id+'" }] }'
                    print(items[i]["track"]["name"])
                    delete = requests.delete(url=self.url[o], headers=self.headers, data=removed_song);
                    assert delete.status_code==200, delete.content
                    answer1 = delete.json()
            
            req = requests.get(url=self.url[o],headers= self.headers)
            assert req.status_code==200, req.content
            answer=req.json()
            
            items = answer["items"]            

            i = 0
            j = 0

            for i in range(len(items)):
                songs_list = []

                song_id = items[i]["track"]["id"]        
                print(str(i) + " "+ items[i]["track"]["name"]+" "+str(items[i]["track"]["preview_url"]))
                songs_list.append(str(items[i]["track"]["preview_url"]))
                songs_list.append(items[i]["track"]["id"])
                songs_list.append(items[i]["track"]["name"])  
                songs_list.append(items[i]["track"]["album"]["artists"][0]["name"])  

                params = {"ids": song_id}
                req=requests.get(url=self.url1, params=params, headers=self.headers)
                audio_features=req.json()["audio_features"][0]

                for feature in ["danceability", "energy", "loudness", "valence", "tempo", "acousticness"]:
                    songs_list.append(audio_features[feature])

                self.all_songs.append(songs_list)

        length = len(self.all_songs)
        self.all_songs = list(map(list,zip(*self.all_songs)))
        self.sendMessages(length, self.all_songs)



    def sendMessages(self, length, all_songs):
        string_array = ""
        float_array = ""
        for i in range(length):
            string_array=string_array+"s"
            float_array=float_array+"f"

        type_tag_array = []
        type_tag_array.append(string_array)
        type_tag_array.append(float_array)
        
        self.client.send_message("/typetags", type_tag_array)
        
        self.client.send_message("/num_songs", length)
        
        for i in range(len(all_songs[0])):
            self.client.send_message("/song_info", all_songs[0][i])
            print("message %d -sent - song url." %i)
            
        for i in range(1,len(all_songs)):
            self.client.send_message("/song_info", all_songs[i])
            print("message %d sent - strings." %i)
            
            if i == len(all_songs)-1:
                self.client.send_message("/done", 1)
    

    def action(self):
        print("... serving")
        self.server.serve_forever()



if __name__=="__main__":
    agent=AgentOSC()
    agent.action()

                

