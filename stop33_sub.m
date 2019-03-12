clear

load ('Kundinfo')
load('stopp_nr33')

for i = 1:length(stopp_nr33)-1
   demand(1,i) = Kundinfo(stopp_nr33(1,i+1),1);
   demand(2,i) = Kundinfo(stopp_nr33(1,i+1),4);
end
K = length(demand(1,:));
size = 2^K-1;
tours_bi = de2bi(1:size);
for i = 1:length(tours_bi(:,1))
    demand_tours(i,:) = tours_bi(i,:).*demand(2,:);
end

demand_tours = demand_tours(sum(demand_tours,2)<=10,:);

tours_stopp3 = demand_tours;
tours_stopp3(tours_stopp3 > 0) = 1;