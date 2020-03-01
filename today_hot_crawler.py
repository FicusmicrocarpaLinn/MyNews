import requests
import re
from bs4 import BeautifulSoup
import json,sys,os


class downloader(object):
    def get_contents(self):
        headers1={
            #use a special cookies
			'User-Agent':"xxxx"
			
        }
        try:
            req = requests.get(url=self.url, headers=headers1)
            html = req.text
            div_bf = BeautifulSoup(html, "lxml")
            div = div_bf.find_all('div', class_="cc-cd")
        except :
            return 1 # requests error
        else:
            example = []

            for content in div:
                text = self.get_text(str(content))
                temp = re.split('\n\n \n\n|\n\n\n\n\n\n\n\n', text)
                example.append(temp)
            state = self.store_content(example)
            return state

    def get_text(self, content):
        # 去除<>
        reg = re.compile('<[^>]*>')
        texts = reg.sub('', content)
        return texts

    def store_content(self,contents):
        # 存储路径获取
        file_path = sys.argv[0]
        path=os.path.dirname(file_path)
        for i in contents:
            title=i[0].split("\n\n\n\n\n")[1]
            title=title.replace(' ','')
            content=i[1:]
            # name the file
            file_name=path+"/"+title+".txt"
            try:
                with open(file_name, 'w', encoding='utf-8') as f:
                    f.write(str(content))
            except IOError:
                return 2  # 文件存储出错
            else:
                continue
        return 0

def hot_craw_test(url):
    dl=downloader()
    dl.url = url
    state=dl.get_contents()
    return state
