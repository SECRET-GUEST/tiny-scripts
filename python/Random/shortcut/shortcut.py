import time, webbrowser, subprocess, threading

#Run server
def main():

    batch_file_path = r"HERE PUT THE PATH OF webui-user.bat"
    working_directory = r"HERE PUT THE PATH OF THE FOLDER CONTAINING webui-user.bat"
    
    subprocess.run(batch_file_path, cwd=working_directory, shell=True)


#Launch a new tab in your browser or whatever with the adress of the server
def webtab():
    #Wait 8 seconds (by default), the time the local server is initialized to launch google
    time.sleep(8)

    #Open a new tab with the specified link of your server
    url = "HERE PUT THE LINK YOU GET FROM THE CMD"

    webbrowser.get("HERE PUT THE PATH OF firefox.exe, ... %s").open(url)



if __name__ == "__main__":
    #Create threads to run the functions in parallel
    main_thread = threading.Thread(target=main)
    google_thread = threading.Thread(target=webtab)

    #Start threads
    main_thread.start()
    google_thread.start()

    #Wait threads to finish
    main_thread.join()
    google_thread.join()
