function root = NewtonRaphson(fonk,initial)
    
    syms x;
    tolerance = 10^(-5);
    y = initial;
    dervfunc = diff(fonk,x);
    functionval = vpa(subs(fonk, x, y));
    
    while abs(functionval) > tolerance
        
        y = y - vpa(subs(fonk, x, y)) / vpa(subs(dervfunc,x,y));
        functionval = vpa(subs(fonk,x,y));
        
    end
    
    display(sprintf('Root: %f ',y));
end