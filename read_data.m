%path ='Î¢²©.txt';
%read_text(path);

function result=read_data(path)
f=fopen(path,'r','n','utf-8');
s=fgets(f);
fclose(f);
%a=fileread(path,'utf-8');
b=strsplit(s,"'");
num=floor(length(b)/2);
c=[];
index=1:1:num;
content=[];
readings=[];
for i=1:num
    c{1,i}=string(b(2*i));
    temp=strsplit(c{1,i},'\\n');
    index(i)=temp(1);
    content{1,i}=temp(2);
    readings{1,i}=temp(3);
end
content=char(cellstr(string(content)));
readings=char(cellstr(string(readings)));
index=char(cellstr(string(index)));

result={index,content,readings};
end



