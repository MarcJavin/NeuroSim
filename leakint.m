function xo = leakint(x, i, dt, params)

    dx = ((params.E - x) .* params.G + i) .* dt / params.Cm;
    xo = x + dx;

end