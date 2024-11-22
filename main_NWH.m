clc;
clear;
%%%% Trial EDM and HFNs
EDM=[3	5	2	3	4	4	5
     2	5	1	3	4	4	4
     2	5	1	3	3	4	4];

HFNs{1}=[0.1 0.15 0.2];
HFNs{2}=[0.2 0.3 0.4];
HFNs{3}=[0.4 0.5 0.6];
HFNs{4}=[0.6 0.7 0.8];
HFNs{5}=[0.8 0.9 0.99];
%%%%%%
[W0,EDM_NW,EDM_agg,Score]=FWZIC_SWARA_NWHF(EDM,HFNs);

[W alph]=genrate_weight(W0,8);
return
%%
DM=[1	3	1	1	1	3	3
2	3	3	2	2	3	3
2	3	2	1	1	3	3
1	2	1	1	1	2	1
2	3	2	1	2	3	3
3	2	3	1	3	3	3
1	2	1	1	1	2	1
2	2	3	1	3	3	3
1	2	2	3	2	3	3
2	2	3	1	3	3	3];
[n,m]=size(DM);
MM=[1 1 1 1 1 1 1];
aI=[3 3 3 3 3 3 3];
aN=[1 1 1 1 1 1 1];
interval=[1 4]
 [score,rank,s,sh]=RAFSI(DM,W0,MM,aI,aN,interval);
 
 
 %%             Senstive
 for tr=1:size(W,1)
 [score,rank(:,tr)]=RAFSI(DM,W(tr,:),MM,aI,aN,interval);
end

R=rank;
r=R(:,1);
R=R(:,2:end);
for i=1:9
    cc1(i)=corr(r,R(:,i));
    cc4(i)=corr(r,R(:,i),'type','Spearman');
    [cc2(i) cc3(i)]=correlation_1(r,R(:,i));
end
cc=[cc1' cc2' cc3'];

%%                  plot
 [WP]=genrate_weight(W0,99);
for tr=1:size(WP,1)
[score r]=RAFSI(DM,WP(tr,:),MM,aI,aN,interval);
rrrr(tr)=r(3);
end
subplot(1,2,1)
[X,Y] = meshgrid(0:0.01:1);
  score1=repmat(rrrr,101,1);

h=surf(X,Y,score1)

hold on

h=contour(X,Y,score1)

colorbar
colormap('hsv');
grid on
xlabel('0 \leq W \leq 1')
ylabel('0 \leq W \leq 1')
xlim([0 1])
zlabel('Rank')
title('Rank for A3 alternative')
xticks(0:0.1:1)
subplot(1,2,2)

plot(X(1,:),score1(1,:),'color','red','Linewidth',2)
xlabel('0 \leq W \leq 1')
xticks(0:0.1:1)
ylabel('Rank')
grid on
title('Rank for A3 alternative')