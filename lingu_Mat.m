function [EDM_Fuzzy]=lingu_Mat(EDM,Fuzzy)
EDM_Fuzzy=cell(size(EDM));
n=max(size(Fuzzy));
for i=1:n
    EDM_Fuzzy(EDM==i)=Fuzzy(i);
end