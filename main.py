from today_hot_crawler import downloader,hot_craw_test
import sys,os

def fresh():
    url = "https://tophub.today"
    state = hot_craw_test(url)
    sys.exit(state)


if __name__ == "__main__":
    fresh()
