function show_filters(app)
current_dir1=pwd;
current_dir1=strcat(current_dir1,"\\");
path = strcat(current_dir1,"filter.txt");
%path='filter.txt';
f=fopen(path,'r','n','utf-8');
s=fgets(f);
words=strsplit(s," ");
fclose(f);
newData=[];
filters_num=length(words);
for i=1:filters_num
    newData=[newData;words(i)];
    set(app.UITable2,'Data',newData);   
end
end