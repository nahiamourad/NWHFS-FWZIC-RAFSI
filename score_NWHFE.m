function [S_NW,std_NWE]=score_NWHFE(NWHFE)
alpha=0.5;
HFE=NWHFE{1};
NWE=NWHFE{2};

n=max(size(HFE));
mean_HFE=mean(HFE);
std_HFE=sqrt(sum((HFE-mean_HFE).^2)/n);

L=NWE(:,1);
M=NWE(:,2);
U=NWE(:,3);
mean_NWE=(L+M+U)/3;
std_NWE=sqrt(L.^2+M.^2+U.^2-L.*M-L.*U-M.*U);
S_NW=alpha*(mean_HFE-std_HFE)+(1-alpha)*(sum(mean_NWE-std_NWE)/n);
end