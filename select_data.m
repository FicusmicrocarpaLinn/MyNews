function txtname=select_data(num)
source=["֪��","�ٶ�","΢��","΢��"];

if(num>4)
    %ȫ������
else
    txtname=[];
    for i=1:num
        txtname{1,i}=source(i)+".txt";
    end
end
end