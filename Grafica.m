x=0:101/100:100;
y=[Gamboa3S.L1.VelR;Gamboa3S.L2.VelR;Gamboa3S.L3.VelR];
ymean=mean(y);
upperBoundary = max(y);
lowerBoundary = min(y);
lightGray = [0.8, 0.8, 0.8];
figure
hold on
patch([x fliplr(x)], [upperBoundary  fliplr(lowerBoundary)], lightGray, 'LineStyle', 'none');
plot(x,ymean,'k-', 'LineWidth', 1)


Gamboa3S.L1=L1;
Gamboa3S.L2=L2;
Gamboa3S.L3=L3;
Gamboa3S.N1=N1;
Gamboa3S.N2=N2;
Gamboa3S.N3=N3;
Gamboa3S.R1=R1;
Gamboa3S.R2=R2;
Gamboa3S.R3=R3;