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

NyaPlatser = zeros(length(fa_kunder(:,1)),length(StoppTillKunder(1,:))); 
% Tar bort kunderna ifrån de stopp med för få kunder
for i = 1:length(stop)
    StoppTillKunder(:,stop(i)) = zeros(length(StoppTillKunder(:,1)),1);
end
%
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





