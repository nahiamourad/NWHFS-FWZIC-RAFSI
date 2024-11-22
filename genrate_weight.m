function [W alph]=genrate_weight(w0,nbin)
n=length(w0);
alph=w0./(1-max(w0));
[~,id]=max(w0);
deltaLb=-max(w0);
deltaUb=1-max(w0);
L=(deltaUb-deltaLb)/nbin;
for i=1:nbin
    if i==1
    delta(i)=deltaLb;
    else 
      delta(i)= delta(i-1)+L;
    end
end
delta=[delta deltaUb];
for i=1:nbin
  W(i,:)=w0-delta(i)*alph;
end
W(:,id)=0 ;
W(:,id)=1-sum(W,2);
W=[W;0.00001*ones(1,n)];
W(end,id)=1-0.00001*(n-1);
W=[w0;W];