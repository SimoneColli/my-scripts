#required pytube -> pip install pytube

from pytube import YouTube
def dw_video(url):
    yt = YouTube(url)
    yt = yt.streams.get_highest_resolution()
    try:
        print("Download.....")
        yt.download()
    except:
        print("Download failed")
    
    print("Download completed")

url_list = []

while True:
    url = input("Insert video url: ")
    if url == "0":
        break
    url_list.append(url)

while len(url_list) != 0:
    dw_video(url_list.pop(0))
