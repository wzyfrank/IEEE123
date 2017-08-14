function load_output = load_process(Voltage_profile, phaseMap, Vbase)

% number of loads
% init the output load data
load_output = zeros(phaseMap.Count, 1);

% import the load data
[num,txt,raw] = xlsread('loads data.csv');
N_loads = size(num, 1);

%% 2. change polar to vector
Voltages = zeros(N_loads, 3);
for k = 1 : N_loads
    Voltages(k,1) = Voltage_profile(k,1) * cosd(Voltage_profile(k,2)) + 1i * Voltage_profile(k,1) * sind(Voltage_profile(k,2));
    Voltages(k,2) = Voltage_profile(k,3) * cosd(Voltage_profile(k,4)) + 1i * Voltage_profile(k,3) * sind(Voltage_profile(k,4));
    Voltages(k,3) = Voltage_profile(k,5) * cosd(Voltage_profile(k,6)) + 1i * Voltage_profile(k,5) * sind(Voltage_profile(k,6));
end

% change from per unit to real values
Voltages = Voltages * Vbase;

%% 3. apply the ratios
for k =1 : N_loads
    % Wye connected load
    if (raw{k,2}(1) == 'Y')
        rA = abs(Voltages(k,1)) / Vbase;
        rB = abs(Voltages(k,2)) / Vbase;
        rC = abs(Voltages(k,3)) / Vbase;
        % constant I
        if(raw{k,2}(3) == 'I')
            raw{k, 3} = raw{k, 3} * rA;
            raw{k, 4} = raw{k, 4} * rA;
            raw{k, 5} = raw{k, 5} * rB;
            raw{k, 6} = raw{k, 6} * rB;
            raw{k, 7} = raw{k, 7} * rC;
            raw{k, 8} = raw{k, 8} * rC;
        % constant Z    
        elseif(raw{k,2}(3) == 'Z')
            raw{k, 3} = raw{k, 3} * rA^2;
            raw{k, 4} = raw{k, 4} * rA^2;
            raw{k, 5} = raw{k, 5} * rB^2;
            raw{k, 6} = raw{k, 6} * rB^2;
            raw{k, 7} = raw{k, 7} * rC^2;
            raw{k, 8} = raw{k, 8} * rC^2;            
        end
        
    % Delta connected load
    else
        if(raw{k,2}(3) == 'P')
            %1. L-L voltages
            Vab = Voltages(k,2) - Voltages(k,1);
            Vbc = Voltages(k,3) - Voltages(k,2);
            Vca = Voltages(k,1) - Voltages(k,3);
            %2. L-L currents
            Iab = (raw{k, 3} + 1i * raw{k, 4})' / (Vab');
            Ibc = (raw{k, 5} + 1i * raw{k, 6})' / (Vbc');
            Ica = (raw{k, 7} + 1i * raw{k, 8})' / (Vca');
 
        % constant I    
        elseif(raw{k,2}(3) == 'I')
            %1. L-L voltages
            Vab_raw = Vbase * sqrt(3) * (cosd(-150) + 1i * sind(-150));
            Vbc_raw = Vbase * sqrt(3) * (cosd(90) + 1i * sind(90));
            Vca_raw = Vbase * sqrt(3) * (cosd(-30) + 1i * sind(-30));
            %2. L-L currents
            Iab_mag = abs((raw{k, 3} + 1i * raw{k, 4}) / (Vab_raw));
            Ibc_mag = abs((raw{k, 5} + 1i * raw{k, 6}) / (Vbc_raw));
            Ica_mag = abs((raw{k, 7} + 1i * raw{k, 8}) / (Vca_raw));
            % voltage LL angles
            delta_ab = angle(Voltages(k,2) - Voltages(k,1));
            delta_bc = angle(Voltages(k,3) - Voltages(k,2));
            delta_ca = angle(Voltages(k,1) - Voltages(k,3));
            % power angles 
            theta_ab = angle(raw{k, 3} + 1i * raw{k, 4});
            theta_bc = angle(raw{k, 5} + 1i * raw{k, 6});
            theta_ca = angle(raw{k, 7} + 1i * raw{k, 8});
            % L-L current phasors
            Iab = Iab_mag * (cos(delta_ab - theta_ab) + 1i * sin(delta_ab - theta_ab));
            Ibc = Ibc_mag * (cos(delta_bc - theta_bc) + 1i * sin(delta_bc - theta_bc));
            Ica = Ica_mag * (cos(delta_ca - theta_ca) + 1i * sin(delta_ca - theta_ca));
        
        % constant Z    
        elseif(raw{k,2}(3) == 'Z')
            %0. impedances
            Zab = 3 * Vbase^2 / ((raw{k, 3} + 1i * raw{k, 4})');
            Zbc = 3 * Vbase^2 / ((raw{k, 5} + 1i * raw{k, 6})');
            Zca = 3 * Vbase^2 / ((raw{k, 7} + 1i * raw{k, 8})');
            %1. L-L voltages
            Vab = Voltages(k,2) - Voltages(k,1);
            Vbc = Voltages(k,3) - Voltages(k,2);
            Vca = Voltages(k,1) - Voltages(k,3);
            %2. L-L currents
            Iab = Vab / Zab;
            Ibc = Vbc / Zbc;
            Ica = Vca / Zca;         
        end  
        
        %3. phase currents
        Ia = -(Iab - Ica);
        Ib = -(Ibc - Iab);
        Ic = -(Ica - Ibc);
        %4. reconstruct phase power
        Sa = Voltages(k,1) * (Ia');
        Sb = Voltages(k,2) * (Ib');
        Sc = Voltages(k,3) * (Ic');
        %5. save to loads
        raw{k, 3} = real(Sa);
        raw{k, 4} = imag(Sa);
        raw{k, 5} = real(Sb);
        raw{k, 6} = imag(Sb);
        raw{k, 7} = real(Sc);
        raw{k, 8} = imag(Sc);
    end
end

%% 4. output the loads
for k =1 : N_loads
    PhaseA = strcat(num2str(raw{k,1}), '.1');
    PhaseB = strcat(num2str(raw{k,1}), '.2');
    PhaseC = strcat(num2str(raw{k,1}), '.3');
    
    % phase A
    if isKey(phaseMap, PhaseA)
        load_output(phaseMap(PhaseA)) = load_output(phaseMap(PhaseA)) + raw{k,3} + 1i * raw{k,4};
    end
    % phase B
    if isKey(phaseMap, PhaseB)
        load_output(phaseMap(PhaseB)) = load_output(phaseMap(PhaseB)) + raw{k,5} + 1i * raw{k,6};
    end
    % phase C
    if isKey(phaseMap, PhaseC)
        load_output(phaseMap(PhaseC)) = load_output(phaseMap(PhaseC)) + raw{k,7} + 1i * raw{k,8};
    end
end

%% 5. change from kW to W
load_output = load_output * 1000;