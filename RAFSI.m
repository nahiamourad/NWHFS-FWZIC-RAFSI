function [score,rank,s,sh]=RAFSI(DM,W,MM,aI,aN,interval)
n1=interval(1);   n2k=interval(2);
A=(n1+n2k)/2;
H=2/(inv(n1)+inv(n2k));
f=@(C,AI,AN) (((n2k-n1)/(AI-AN))*C)+((AI*n1-AN*n2k)/(AI-AN));
f1=@(C,AI,AN) (((n2k-n1)/(AN-AI))*C)+((AN*n1-AI*n2k)/(AN-AI));
[n,m]=size(DM);
[s,sh]=deal(zeros(n,m));
for i=1:n
    for j=1:m
        if MM(j)==1
            s(i,j)=f(DM(i,j),aI(j),aN(j));
            sh(i,j)=s(i,j)/(2*A);
        else
            s(i,j)=f1(DM(i,j),aI(j),aN(j));
            sh(i,j)=H/(2*s(i,j));
        end
    end
end
score=sum(repmat(W,n,1).*sh,2);
rank=rankWithDuplicates(score)';