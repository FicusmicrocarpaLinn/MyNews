import sys,os

class Filters(object):
    def add_filters(self,words):
        # 存储路径获取
        file_path = sys.argv[0]
        path = os.path.dirname(file_path)
        filename=path+'/filter.txt'

        state=int(words)
        sys.exit(state)

        # 存储
        try:
            for word in words:
                with open(filename, 'a', encoding='utf-8') as f:
                    f.write(word+' ')
        except IOError:
            for word in words:
                with open(filename, 'w', encoding='utf-8') as f:
                    f.write(word+' ')
            return 2
        else:
            return 0

if __name__=='__main__':
    textfilter=Filters()
    state=textfilter.add_filters(sys.argv[1])
    sys.exit(state)