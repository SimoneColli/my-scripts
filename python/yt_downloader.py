#required:
#pytube -> pip install pytube
#progressbar -> pip install progress

from pytube import YouTube
#from progress.bar import Bar


def progress_bar():
    pass

def dw_video(url):
    yt = YouTube(url)
    yt = yt.streams.get_highest_resolution()
    print("Download.....")
    try:
        yt.download()
        print("Download completed")
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
