#required pytube -> pip install pytube

from pytube import YouTube

def progress_bar(stream = None, chunk = None, file_handle = None, remaining = None):
    pass

def dw_video(url):
    yt = YouTube(url, on_progress_callback = progress_bar)
    yt = yt.streams.filter(progressive = True, file_extensio = "mp4").get_highest_resolution()
    try:
        print("Download.....")
        yt.download()
    except:
        print("Download failed")
    
    print("Download completed")

url_list = []

while True:
    url = input("Insert video url(for exit 0): ")
    if url == "0":
        break
    url_list.append(url)

while len(url_list) != 0:
    dw_video(url_list.pop(0))
