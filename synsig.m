function [syn_xo, io] = synsig(x, ~, ~, params)
%% Perform one time step simulation of a synapse

% Inputs:
% x : [1, #neuron], current neural activity
% params :  
            % MDP : scalar or [#neuron, #neuron], mid activation potential
            % SCALE : scalar or [#neuron, #neuron], activation profile
            % E : scalar or [#neuron, #neuron], reversal potential
            % W : [#neuron, #neuron], weight matrix (conductances)

% Outputs:
% syn_xo : not used here
% io : [1, #neuron], resulting synaptic currents
%
% Written by Marc Javin

    syn_xo = [];
    n_neur = size(x, 2);
    pre_x = repmat(x, n_neur, 1);
    post_x = repmat(x', 1, n_neur);
    activation = 1 ./ (1 + exp((pre_x - params.MDP) ./ params.SCALE));
    curs = (params.E - post_x) .* activation;
    io = sum(params.W .* curs, 1);
    
end