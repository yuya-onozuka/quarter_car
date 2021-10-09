%% quarter_car_sim.m 

clc;
clear all;

%% Variables for Model

Ks = 40000;              %Suspension spring rate (N/m)
Cs = 2000;               %Suspension damping coefficient
Kt = 200000;              %Tire spring rate (N/m)
Ct = 0;              %Tire damping coefficient 
Mt = 5000;               %Total mass (kg)
quarterMt = 5000/4.0;               %quarter mass (kg)
Ms = quarterMt*15.0/17.0;               %Sprung mass (kg)
Mu = quarterMt*2.0/17.0;                %Unsprung mass (kg)
gz = -9.81/6;         %gravity of z axis on moon (m/s^2)
Fsus = 0.0;
initial_shrink = (Mu+Ms)*abs(gz)/Kt;

% road parameter
speed = 15;            %speed(km/h)
speed_ms = speed*1000.0/60/60;
rock = false;          %rock or sin
H = 0.05;               %road height
collisionTime = H/speed_ms;
obstacle_interval = 3;      %(m)
interval_time = obstacle_interval/speed_ms;
freqR = 2*pi/interval_time; %road frequency (rad/sec)             

%% Run Simulink Model

sim('quarter_car_model.slx');

%% Create Figures

createfigure(ans.output.time,ans.output.signals.values(:,1:2));
legend('Ground load','Ground load w/o unsprung inertial force');
ylabel('Ground Load[N]');
saveas(gcf,'ground_load.emf');

createfigure(ans.output.time,ans.output.signals.values(:,3:6));
legend('Elasitc force','Damping force','Unsprung inertial force','Gravity force');
ylabel('Ground Load Factor[N]');
saveas(gcf,'ground_load_factor.emf');

createfigure(ans.output.time,ans.output.signals.values(:,7:9))
legend('Zs','Zu','Zr');
ylabel('Z-axis displacement[m]');
saveas(gcf,'displacement.emf');