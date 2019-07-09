function io = synrate(x, w, params)
%% Perform one time step simulation of a synapse

% Inputs:
% x : [1, #neuron], current neural activity
% w : [#neuron, #neuron], weight matrix
% params :  
            % R0 : scalar or [1, #neuron], baseline rate
            % RMAX : scalar or [1, #neuron], maximum firing rate

% Outputs:
% io : [1, #neuron], resulting synaptic currents
%
% Written by Marc Javin

    R0 = params.R0;
    RMAX = params.RMAX;
    x = R0.*tanh(x/R0) .* (x < 0) + (RMAX - R0).*tanh(x/(RMAX-R0)) .* (x>=0);
    io = x * w;
    
end