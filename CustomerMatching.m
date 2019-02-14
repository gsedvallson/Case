% Kom ihåg att kolumn 1 = stopp -44, kolumn 2 = stopp -43 osv

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


% k = 1;
% for i = 1:1248
% [ROW, KOL] = size(find(StoppTillKunder(i,:)));
% test(i) = KOL;
% if test(i) == 1
%     whereIsStop(i) = find(StoppTillKunder(i,:));
% end
% end