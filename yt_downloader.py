#required pytube -> pip install pytube

from pytube import YouTube
def dw_video(url):
    yt = YouTube(url)
    yt = youtubeObject.streams.get_highest_resolution()
    try:
        youtubeObject.download()
    except:
        print("Error")
    
    print("Download completed")

url_list = []
url = 1
while url != 0:
    url = input("Insert video url: ")
    url_list.append(url)

while str(url_list) != 0:
    dw_video(url_list.pop(0))
