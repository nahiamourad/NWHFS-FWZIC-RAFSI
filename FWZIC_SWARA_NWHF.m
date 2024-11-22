function[weight,EDM_NW,EDM_agg,Score]=FWZIC_SWARA_NWHF(EDM,HFNs)
%%%Input: EDM: Expert Decision Matrix.
%%%       HFNs: Array of cells containing hesitant fuzzy numbers in order.
%%%Output: Weights based on SWARA
[n,m]=size(EDM);
EDM_ling=lingu_Mat(EDM,HFNs);
EDM_NW=cell(n,m);
for i=1:n
    for j=1:m
        EDM_NW{i,j}=construct_NWHFE(EDM_ling{i,j});
    end
end
EDM_agg=cell(m,1);
Score=zeros(1,m);
for j=1:m
 EDM_agg{j}=agg_NWHFWA(EDM_NW(:,j),ones(1,n)/n);
 Score(j)=score_NWHFE(EDM_agg{j});
end
results=swara(Score);
weight=results(end,:);
end