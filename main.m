
DT = 0.1;

% weight matrix
W = [0 1 0; 
    -1 0 1; 
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
out = calculate(W, [], [], DT, params);

%plotting
figure(1)
plot(out)