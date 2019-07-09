
% time step
DT = 0.1;

% weight matrix
Ws = [0   1.4  0; 
     -1.2   0  3; 
     0.2 -1.5  0];
Wg = 0;

%% get weights from correlation
CONNS = readtable('data/corr_W.csv');
Ws = csvread('data/corr_W.csv', 1, 1);

%% neural model and parameters
params.neur.func = @leakint;
params.neur.E = 0;
params.neur.G = 1;
params.neur.Cm = 1;

%% use rate synaptic model
params.syn.func = @synrate;
params.syn.R0 = 5;
params.syn.RMAX = 100;

%% use sigmoidal synaptic model
% params.syn.func = @synsig;
% params.syn.E = 10;
% params.syn.MDP = 5;
% params.syn.SCALE = 20;

%% synaptic weight matrix
params.syn.W = Ws;
            
%% gap junction model and parameters
params.gap.func = @gap;
params.gap.W = Wg;

%% computation
% initial activity
INIT = [];
% injected current ([n_time, n_neuron])
INJ = ones(100, size(Ws,1));
%function call
out = calculate(INIT, INJ, DT, params);

%% plotting
figure()
plot(out)