
% time step
DT = 0.1;

% weight matrix
W = [0 1.4 0; 
    -1.2 0 3; 
    0.2 -1.5 0];

%neural model and parameters
params.neur.func = @leakint;
params.neur.E = 0;
params.neur.G = 1;
params.neur.Cm = 1;

%synaptic model and parameters
params.syn.func = @synrate;
params.syn.R0 = 5;
params.syn.RMAX = 100;
% weight matrix
params.syn.W = W;
            
%gap junction model and parameters
params.gap.func = @gap;
% weight matrix
params.gap.W = [0 2 0; 
                0 0 0; 
                0 0 0];

%computation
INIT = [];
INJ = ones(100,3);
% INJ(:,1) = 0.2*sin(1:100);
% INJ(:,2) = 0.05;
% INJ(:,3) = 0.0001 * (1:100) .* (1:100)
out = calculate(INIT, INJ, DT, params);

%plotting
figure()
plot(out)