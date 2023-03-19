% clear;
% clc;

n = 5;  %number of simulation, modify as wanted

u_tab1 = [0.86 0.77 0.58 0.13 0.45];    %making and filling array with random numbers in range [0, 1]

%COMMENT OUT THE LINE ABOVE AND UNCOMMENT THE BLOCK BELOW, CHANGE N FOR
%RANDOM SIMULATIONS (RANDOM VALUES != EXAM VALUES)

n = 5;  %number of simulation, modify as wanted

%u_tab1 = [];
% for i = 1:n
%     u_tab1 = [u_tab1 rand];
% end

e_tab1 = [];    %computing simulated exponential value for u_tab1 random values
for i = 1:n
    e_tab1 = [e_tab1 (-1/3)*log(u_tab1(i))];
end

arrival_times = [[09, 00]];     %computing arrival times, rounding minutes to the nearest integer
for i = 1:n
    arrival_times = [arrival_times; [arrival_times(i, 1), arrival_times(i, 2) + round(e_tab1(i) * 60)]];
    
    if arrival_times(i+1, 2) >= 60
        arrival_times(i+1, 1) = arrival_times(i+1, 1) + 1;
        arrival_times(i+1, 2) = mod(arrival_times(i+1, 2), 60);
    end
end
arrival_times([1], :) = [];

u_tab2 = [0.11 0.24 0.42 0.28 0.76];    %making and filling array with random numbers in range [0, 1]

%COMMENT OUT THE LINE ABOVE AND UNCOMMENT THE BLOCK BELOW FOR
%RANDOM SIMULATIONS (RANDOM VALUES != EXAM VALUES)

% for i = 1:n
%     u_tab2 = [u_tab2 rand];
% end

e_tab2 = [];    %computing simulated exponential value for u_tab2 random values
for i = 1:n
    e_tab2 = [e_tab2 (-1/5)*log(u_tab2(i))];
end

repair_times = [];     %computing repair times, rounding minutes to the nearest integer
for i = 1:n
    repair_times = [repair_times, round(e_tab2(i) * 60)];
end

start_repair_times = [arrival_times(1, :)];
end_repair_times = [];

for i = 1:n
    end_repair_times = [end_repair_times; [start_repair_times(i, 1), start_repair_times(i, 2) + repair_times(i)]];
    
    if end_repair_times(i, 2) >= 60
        end_repair_times(i, 1) = end_repair_times(i, 1) + 1;
        end_repair_times(i, 2) = mod(end_repair_times(i, 2), 60);
    end
    
    if i < n
        if (end_repair_times(i, 1) > arrival_times(i+1, 1)) || (end_repair_times(i, 1) == arrival_times(i+1, 1) && end_repair_times(i, 2) > arrival_times(i+1, 2))
            start_repair_times = [start_repair_times; end_repair_times(i, :)];
        else
            start_repair_times = [start_repair_times; arrival_times(i+1, :)];
        end
    end
end

wait_times = [];
for i = 1:n
    if start_repair_times(i, 1) > arrival_times(i, 1)
        start_repair_times(i, 2) = start_repair_times(i, 2) + 60 * (start_repair_times(i, 1) - arrival_times(i, 1));
    end
    
    wait_times = [wait_times; start_repair_times(i, 2) - arrival_times(i, 2)];
end

repair_times = repair_times(:);
 
arrival_times
start_repair_times
repair_times
end_repair_times
wait_times
