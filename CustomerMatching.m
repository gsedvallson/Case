load ('DistanceKunder.mat');
load ('kundinfo.mat');

StoppTillKunder = zeros(1248,44);
k = 1;
for i = k:1248
    for j = 1:44
        if DistanceKunder(i,j) < 25
            StoppTillKunder(i,j) = i;
        end
    end
    k = k + 1;
end

kund1stopp = zeros(1248,1);
stoppCount = 0;
for i = 1:1248
    temps = 0;
    for j = 1:44
        if StoppTillKunder(i,j) > 0
            stoppCount = stoppCount + 1;
            temps = j;
            if stoppCount > 1
                temps = 0;
            end
        end
    end
    
    if stoppCount == 1
        kund1stopp(i) = temps;
    end
    stoppCount = 0;
end

%%
clear;

load ('kundinfo.mat');
load ('truckstopinfo.mat');
load ('DistanceKunder.mat');

KundKoppling = zeros(1248,1);

for i = 1:1248
    [row, col] = min(DistanceKunder(i,:));
    KundKoppling(i) = col;
end

StoppTillKunder = zeros(1248,44);

for k = 1:44
    temp = 1;
    for i = 1:1248
        if(KundKoppling(i)==k)
            StoppTillKunder(temp,k) = i;
            temp = temp + 1;
        end
    end
end

StoppTillKunder = StoppTillKunder(any(StoppTillKunder,2),:);
temp_vector = zeros(1248,1); %Temporär vektor för att ta in truckstops

for i = 1:length(StoppTillKunder(1,:))
        num_cust_(i) = length(StoppTillKunder(:,1)) - sum(StoppTillKunder(:,i)==0); 
end

disp('Skriv in hur få kunder per truckstop')
minsta_antal = 1;
n = 1;
for i = 1:length(num_cust_)
    if num_cust_(i) <= minsta_antal
        fa_kunder(n) = StoppTillKunder(1,i); 
        stop(n) = i;
        n = n+1;
    end
end

for i = 1:length(fa_kunder)
    tempor = (DistanceKunder(fa_kunder(i),:));
    [out,idx] = sort(tempor);
    val = out(2);index = idx(2);
    if(val <= 25)
        for k = 1:length(StoppTillKunder(:,index))
            if(StoppTillKunder(k,index) == 0)
                StoppTillKunder(k,index) = fa_kunder(i);
                StoppTillKunder(1,stop(i)) = 0;
                break
            end
        end
    else 
        disp(['Finns inget kortare avstånd för kund ', fa_kunder(i)])
    end
end

