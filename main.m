
DT = 0.1;

W = [0 1 0; 
    -1 0 1; 
    0.2 -1.5 0];


params.neurfunc = @leakint;
params.neur.E = 0;
params.neur.G = 1;
params.neur.Cm = 1;
params.synfunc = @synrate;
params.syn.R0 = 5;
params.syn.RMAX = 100;


out = calculate(W, [], [], DT, params);

figure(1)
plot(out)