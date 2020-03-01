function txtname=select_data(num)
source=["知乎","百度","微博","微信"];

if(num>4)
    %全部数据
else
    txtname=[];
    for i=1:num
        txtname{1,i}=source(i)+".txt";
    end
end
end