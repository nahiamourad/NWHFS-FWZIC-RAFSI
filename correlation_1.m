function [WS rw]=correlation_1(x,y)
N=length(x);
s=0;
s1=0;
for i=1:N
    %%Rank similarity coefficient 
    s=s+(2^-x(i))*(abs(x(i)-y(i))/max([abs(x(i)-1),abs(x(i)-N)]));
    %%Weighted Spearman's rank correlation coefficient 
    s1=s1+((x(i)-y(i))^2)*((N-x(i)+1)+(N-y(i)+1));
end
WS=1-s;
rw=1-((6*s1)/((N^4)+(N^3)-(N^2)-(N)));