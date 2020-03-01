function result = analysis(txtname,show_num)
all_result=[];
source_num=[];
temp=0;
for i =1:length(txtname)
   path = string(txtname(i)); 
   current_result=read_data(path);
   a{i,1}=string(current_result{1,2});
   b{i,1}=string(current_result{1,1});
   c{i,1}=string(current_result{1,3});
   source_num(1,i)=temp+length(a{i,1});
   temp=temp+length(a{i,1});
   all_result=[all_result;a{i,1}];
end
num=0;
del_index=[];
if exist('filter.txt','file')
    for i=1:length(all_result)
        fword=get_fword(char(all_result(i,1)));
        if fword==1
            num=num+1;
            del_index(num,1)=i;
        end
    end
end

    
for i=1:length(all_result)
    for j=i+1:length(all_result)
        sim=compute_sim(all_result(i,1),all_result(j,1));
        if sim==1
            num=num+1;
            del_index(num,1)=j;
        end
    end
end
del_index = unique(del_index);
num=length(del_index);
for j=num:-1:1
    del_id=del_index(j,1);
    flag=0;
    for i=1:length(txtname)
        if source_num(1,i)>=del_id && flag==0
            if i~=1
                id=del_id-source_num(1,i-1);
            else
                id=del_id;
            end
            a{i,1}(id,:)=[];
            c{i,1}(id,:)=[];
            b{i,1}(id,:)=[];
            flag=1;
        end
    end
end
content=[];
index=[];
readings=[];
num1=1;
%每个来源依次算一个
for i=1:show_num
    x=mod(i-1,length(txtname))+1;
    
    content{1,i}=a{x,1}(num1,1);
    index{1,i}=b{x,1}(num1,1);
    readings{1,i}=c{x,1}(num1,1);
    if mod(i,length(txtname))==0
        num1=num1+1;
    end
end
content=char(cellstr(string(content)));
readings=char(cellstr(string(readings)));
index=char(cellstr(string(1:1:show_num)));

result={index,content,readings};
end

function sim = compute_sim(stra,strb)
ca=strtrim(char(stra));
cb=strtrim(char(strb));
num=0;
no_sense=['的','地','得','了','如何','评价','有','哪些','什么','关于','目前'];
for j=1:length(no_sense)
    ca = strrep(ca,no_sense(j),'');
    cb = strrep(cb,no_sense(j),'');
end
la = length(ca);
lb = length(cb);
thre = floor(2*max(la,lb)/3);
for i =1:la
    if contains(cb,ca(i))
        num=num+1;
    end
end
if thre<num
    sim=1;
else
    sim=0;
end
end

function fword=get_fword(word)

path='filter.txt';
f=fopen(path,'r','n','utf-8');
s=fgets(f);
words=strsplit(s," ");
words=string(words);
words(find(words==""))=[];
fclose(f);
filter_num=length(words);
for i=1:filter_num
    if ~contains(word,string(words(i)))
        fword=0;
    else
        fword=1;
    end
end
end