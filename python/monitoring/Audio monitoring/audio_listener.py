from kivy.app import App
from kivy.uix.button import Button
from kivy.uix.boxlayout import BoxLayout
import threading
import os
import time
import subprocess

class sound_monitoring(App):

    def build(self):
        self.b = Button(text ="start")
        self.b.bind(on_press = self.callback)
        self.layout = BoxLayout()
        self.layout.add_widget(self.b)
        return self.layout

    def callback(self, instance):
        self.t = threading.Thread(target=self.monitor_directory)
        self.t.start()

    def list_wav_files(self, directory):
        files = [f for f in os.listdir(directory) if f.endswith('.wav')] # Listen only waves files
        return files

    def play_file(self, file_path):
        subprocess.run(['xdg-open', file_path]) # Open with Debian's default listener


    def monitor_directory(self):
        directory = '/tmp/' # Search new sounds to listen in temp 
        old_file_list = self.list_wav_files(directory)

        while self.layout.children: 
            new_file_list = self.list_wav_files(directory)
            new_files = set(new_file_list) - set(old_file_list)
            for new_file in new_files:
                self.play_file(os.path.join(directory, new_file))
            old_file_list = new_file_list
            time.sleep(5)

if __name__ == '__main__':
    sound_monitoring().run()
