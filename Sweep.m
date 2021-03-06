%Sweep f�r stopp me1d m�nga kunder
clear;

load ('kundinfo.mat');
load ('truckstopinfo.mat');
load ('stopp_nr37');

%===========================================
Stopp = stopp_nr37(:,1);
kunder = stopp_nr37;
kunder(:,1) = [];
MaxKap = 10;
MaxDist = 50;
Antal_dronare = 0;
%=========================================

% Ber�knar demand f�r de akutella kunderna
for i = 1:length(kunder(1,:))
    index = find(Kundinfo(:,1) == kunder(1,i));
    Cust_demand(i) = Kundinfo(index,4);
end

%Ber�knar avst�ndet mellan varje kund samt avst�nde mellan varje kund och
%stopp
for i = 1:length(kunder(1,:))
    dist_stop(i) = sqrt((Stopp(2,1)-kunder(2,i))^2 + (Stopp(3,1)-kunder(3,i))^2);
    if(i~=length(kunder(1,:)))
        dist_next(i) = sqrt((kunder(2,i+1)-kunder(2,i))^2 + (kunder(3,i+1)-kunder(3,i))^2);
    else
    end
end
dist_next(i) = 0;

% Temp vektor f�r att kolla avst�nd & kapaciteten
temp = zeros(2,1);
tp1 = 1; tp2 = 1;
stoppTillKund = dist_stop(1);
for i = 1: length(kunder(1,:))
    
    tot_stracka = temp(1) + stoppTillKund +  dist_next(i) + dist_stop(i);
    
    if(tot_stracka <= MaxDist && temp(2) + Cust_demand(i) <= MaxKap)
        resa(tp2,tp1) = kunder(1,i);
        temp(1) = temp(1) + dist_next(i);
        temp(2) = temp(2) + Cust_demand(i);
        tp2 = tp2+1;
        
    else
        info_resa(1,tp1) = stoppTillKund + temp(1) + dist_stop(i-1) - dist_next(i-1);
        info_resa(2,tp1) = temp(2);
        stoppTillKund = dist_stop(i);
        tp2 = 1; tp1 = tp1 + 1;
        resa(tp2,tp1) = kunder(1,i);
        tp2 = tp2+1;
        temp = zeros(2,1);
        temp(1) =  dist_next(i);
        temp(2) = Cust_demand(i);
    end
end

info_resa(1,tp1) = stoppTillKund + temp(1) + dist_stop(i-1) - dist_next(i-1);
info_resa(2,tp1) = temp(2);

Cost = 2*info_resa(1,:)