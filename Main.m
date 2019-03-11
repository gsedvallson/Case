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

for k = 1:length(StoppTillKunder(1,:))
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

prompt = 'Skriv in hur få kunder per truckstop';
minsta_antal = input(prompt);

n = 1;
for i = 1:length(num_cust_)
    if num_cust_(i) <= minsta_antal
        fa_kunder(:,n) = StoppTillKunder(:,i);
        stop(n) = i;
        n = n+1;
    end
end

fa_kunder = fa_kunder(any(fa_kunder,2),:);

%avstand(fa_kunder,StoppTillKunder,stop)

NyaPlatser = zeros(length(fa_kunder(:,1)),length(StoppTillKunder(1,:)));
% Tar bort kunderna ifrån de stopp med för få kunder
for i = 1:length(stop)
    StoppTillKunder(:,stop(i)) = zeros(length(StoppTillKunder(:,1)),1);
end

% Skapar matris för de nya stoppen

NyStoppTillKunder = [StoppTillKunder;NyaPlatser];

%Lägger till de borttagna kunderna till nya stopp
for i = 1:length(fa_kunder(:,1))
    for j = 1:length(fa_kunder(1,:))
        if fa_kunder(i,j) ~= 0
            tempor = (DistanceKunder(fa_kunder(i,j),:));
            [out,idx] = sort(tempor);
            narmastStopp = 2;
            val = out(narmastStopp);index = idx(narmastStopp);
            if(val <= 25)
                while(ismember(index,stop) ~= 0)
                    narmastStopp = narmastStopp +1;
                    val = out(narmastStopp);index = idx(narmastStopp);
                    if(val > 25)
                        disp(['Finns inget kortare avstånd för kund ', num2str(fa_kunder(i,j))])
                        break
                    end
                end
            else
                disp(['Finns inget kortare avstånd för kund ', num2str(fa_kunder(i,j))])
                break
            end
            for k = 1:length(NyStoppTillKunder(:,index))
                if(NyStoppTillKunder(k,index) == 0)
                    NyStoppTillKunder(k,index) = fa_kunder(i,j);
                    break
                end
            end
        end
    end
end

% Tar bort överflödiga rader
NyStoppTillKunder = NyStoppTillKunder(any(NyStoppTillKunder,2),:);

demand_stop = zeros(length(NyStoppTillKunder(1,:)),3);

% Beräknar antalet paket per stopp
for i = 1:length(NyStoppTillKunder(:,1))
    for j = 1:length(NyStoppTillKunder(1,:))
        for k = 1:length(Kundinfo(:,1))
            if(NyStoppTillKunder(i,j) == Kundinfo(k,1))
                demand_stop(j) = demand_stop(j) + Kundinfo(k,4);
            end
        end
    end
end
s = 1;
for i = 1:length(demand_stop)
    demand_stop(i,2) =  mod(demand_stop(i,1),60);
    demand_stop(i,3) =  mod(demand_stop(i,1),10);
    if(demand_stop(i,1) < 60 && demand_stop(i,1) ~= 0)
        potential(1,s) = i;
        potential(2,s) = demand_stop(i,2);
        s = s + 1;
    end
end

for i = 1:length(potential(1,:))
    tp1 = 2;
    for j = 1:length(potential(1,:))
        if(i ~= j)
            if(potential(2,i) + potential(2,j) < 60)
                evePotential(1,i) = potential(1,i);
                evePotential(tp1,i) = potential(1,j);
                tp1 = tp1 +1;
            end
        end
    end
end
komihag = evePotential;
tp3 = 1;
klar_Matris = zeros(size(DistanceKunder));
for i = 1:length(evePotential(1,:))
    for j = 2:length(evePotential(:,1))
        if(evePotential(j,i) ~=0 && evePotential(1,i) ~= 0)
            godkand = 0;
            for k = 1:length(NyStoppTillKunder(:,1))
                if(NyStoppTillKunder(k,evePotential(j,i))~= 0)
                    if(DistanceKunder(NyStoppTillKunder(k,evePotential(j,i)),evePotential(1,i)) < 25)
                        godkand = godkand + 1;
                    end
                end
            end
            if(godkand == nnz(NyStoppTillKunder(:,evePotential(j,i))))
                temp1 = nonzeros(NyStoppTillKunder(:,evePotential(1,i)));
                temp2 = nonzeros(NyStoppTillKunder(:,evePotential(j,i)));
                temp_final = temp1;
                anvanda_stopp(tp3) = evePotential(1,i);
                tp3 = tp3+1;
                anvanda_stopp(tp3) = evePotential(j,i);
                tp3 = tp3 +1;
                
                for t = length(temp1):(length(temp2)+length(temp1)-1)
                    temp_final(t+1) = temp2(t+1-length(temp1));
                end
                temp_size = length(klar_Matris(:,1)) - length(temp_final);
                klar_Matris(:,evePotential(1,i)) = [temp_final;zeros(temp_size,1)];
                evePotential(evePotential == evePotential(1,i)) = 0;
                evePotential(evePotential == evePotential(j,i)) = 0;
            end
        end
    end
end

alla_stopp = 1:length(DistanceKunder(1,:));
inte_anvanda_stopp = setdiff(alla_stopp,anvanda_stopp);

for i = 1:length(inte_anvanda_stopp)
    temp_size = length(klar_Matris(:,inte_anvanda_stopp(i)))- length(NyStoppTillKunder(:,inte_anvanda_stopp(i)));
    klar_Matris(:,inte_anvanda_stopp(i)) = [NyStoppTillKunder(:,inte_anvanda_stopp(i));zeros(temp_size,1)];
end
klar_Matris = klar_Matris(any(klar_Matris,2),:);
farre_stopp = sum(klar_Matris(1,:)==0);

disp(['Med krav på minst ', num2str(minsta_antal), ' blir ', num2str(farre_stopp), ' utan kunder']);

X_kunder = Kundinfo(1:1248,2);
Y_kunder = Kundinfo(1:1248,3);
sz1 = 5;
X_stop = truckstopinfo(:,2);
Y_stop = truckstopinfo(:,3);
sz2 = 20;
tp = 1;
for i = 1:length(klar_Matris(1,:))
    if(klar_Matris(1,i)== 0)
        X_non_use(tp) = X_stop(i);
        Y_non_use(tp) = Y_stop(i);
        tp = tp + 1;
        X_stop(i) = [];
        Y_stop(i) = [];
    end
end
scatter(X_kunder,Y_kunder,sz1, 'b')
hold on
scatter(X_stop,Y_stop,sz2,'g')
scatter(X_non_use,Y_non_use,sz2,'r')
