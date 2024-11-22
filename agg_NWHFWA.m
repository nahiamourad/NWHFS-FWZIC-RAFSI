function Agg=agg_NWHFWA(NWHFEs,w)
%%% NWHEs is a column array of cells 
% containing the NWHFEs to be aggregated
n=max(size(w));
if(size(NWHFEs)~=n)
    disp('Incorrect Aggregartion. Check agg_NWHFWA function');
    return
end

[h,s_h,psi]=deal(cell(1,n));
for i=1:n
    NWHFE=NWHFEs{i};
    h{i}=NWHFE{1};
    s_h{i}=1:max(size(h{i}));
    psi{i}=NWHFE{2};
end

possible=cartprod(s_h{1:n});
k=size(possible,1);
Agg_h=ones(1,k);
Agg_psi=ones(k,3);
for j=1:k
    for i=1:n
        Agg_h(j)=Agg_h(j)*(1-h{i}(possible(j,i)))^w(i);
        for LMU=1:3
            Agg_psi(j,LMU)=Agg_psi(j,LMU)*(1-psi{i}(possible(j,i),LMU))^w(i);
        end
    end
end
Agg_h=1-Agg_h;
Agg_psi=1-Agg_psi;
Agg={Agg_h,Agg_psi};
end