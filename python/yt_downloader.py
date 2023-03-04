#required:
#pytube -> pip install pytube

from pytube import YouTube
from pytube.cli import on_progress

def complete_message(stream, path):
    
    print("\nDownload completed " + stream.title)

def dw_video(url):
    yt = YouTube(url, on_progress_callback=on_progress, on_complete_callback=complete_message)
    yt = yt.streams.filter(progressive=True).get_highest_resolution()
    try:
        print("\nDownloading " + yt.title + "\n")
        yt.download()
    except:
        print("Download failed")
    
    

url_list = []

while True:
    url = input("Insert video url(for exit 0): ")
    if url == "0":
        break
    url_list.append(url)

while len(url_list) != 0:
    dw_video(url_list.pop(0))
