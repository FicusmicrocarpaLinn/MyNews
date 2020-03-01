# MyNews
Matlab 2018a+Python 3.x

一个基于简单的文本匹配过滤的热搜程序。该程序的GUI基于Matlab GUIDE，而爬虫使用的是Python 3.6。新闻来源基于**今日热榜(tophub.today)**网站的爬虫，通过爬取首页的热搜数据，得到多个网站的热搜信息。随后以自定义的过滤文本过滤不喜欢的信息。

### 使用方法

将代码clone到本地。打开today_hot_crawler.m文件作以下修改

~~~matlab
def get_contents(self):
        headers1={
            #use a special cookies
			'User-Agent':"xxx"
			#将xxx替换为自己的headers
        }
~~~

headers的获取如下：

首先，用firefox或chrome浏览器打开tophub.today网站。右键-检查，然后点击上方的Network。

![](.\example_image\network.JPG)

按Ctrl+R

![](.\example_image\cr.JPG)

然后单击tophub.today这一行，在Request Headers里面找到User-agent。将其复制到代码里。



然后用Matlab运行app1.mlapp即可。

![](.\example_image\app.JPG)

#### 更新热搜

**来源**可以选择前2、4或者全部。前2是微博与知乎的热搜，前4增加了微信和百度。同时选取前可以选取10/25/50条热搜。

点击更新，即可获取最新热搜信息。

#### 添加过滤

这个程序使用最简单的匹配过滤。在new filters后输入想过滤的文本，即可过滤掉含对应文本的热搜。