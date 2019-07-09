
% time step
DT = 0.1;

% weight matrix
W = [0 1.4 0; 
    -1.2 0 3; 
    0.2 -1.5 0];


%neural model and parameters
params.neurfunc = @leakint;
params.neur.E = 0;
params.neur.G = 1;
params.neur.Cm = 1;

%synaptic model and parameters
params.synfunc = @synrate;
params.syn.R0 = 5;
params.syn.RMAX = 100;

%computation
INIT = [];
INJ = zeros(100,3);
% INJ(:,1) = 0.2*sin(1:100);
INJ(:,2) = 0.05;
% INJ(:,3) = 0.0001 * (1:100) .* (1:100)
INJ = [];
out = calculate(W, INIT, INJ, DT, params);

%plotting
figure(1)
plot(out)