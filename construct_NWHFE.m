function NWHFE=construct_NWHFE(HFE)
n=max(size(HFE));
mean_HFE=mean(HFE);
std_HFE=sqrt(sum((HFE-mean_HFE).^2)/n);
%%%Wiggly parameter
f=@(t)std_HFE*exp(-((t-mean_HFE).^2)./(2*std_HFE^2));

%%%Wiggly Range
range(:,1)=HFE-f(HFE);
range(:,2)=HFE+f(HFE);

%real preference degree
if(mean_HFE~=0.5)
    normalized_HFE=HFE./sum(HFE);
    vec=1:n;
    vec=(n-vec)/(n-1);
    rpd=dot(normalized_HFE,vec);
    if(mean_HFE>0.5)
        rpd=1-rpd;
    end
elseif(mean_HFE==0.5)
    rpd=0.5;
end

%%%Normal wiggly Element
NWE(:,1)=max(range(:,1),0);
NWE(:,2)=(2*rpd-1)*f(HFE)+HFE;
NWE(:,3)=min(range(:,2),1);

%%%Normal Wiggly Hesitant Fuzzy Element
NWHFE={HFE,NWE};
end