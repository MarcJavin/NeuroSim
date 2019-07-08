function io = synrate(x, w, params)

    R0 = params.R0;
    RMAX = params.RMAX;
    x = R0.*tanh(x/R0) .* (x < 0) + (RMAX - R0).*tanh(x/(RMAX-R0)) .* (x>=0);
    io = x * w;
    
end