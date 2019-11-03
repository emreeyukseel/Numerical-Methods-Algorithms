function root = Bisection(fonk,a,b)
    
    syms x;
    tolerance = 10^(-5);
    midpoint = (a+b)/2;
    valuemidpoint = vpa(subs(fonk,x,midpoint));
    
    while abs(valuemidpoint) > tolerance
        valuea=vpa(subs(fonk,x,a));
        valueb=vpa(subs(fonk,x,b));
        valuemidpoint=vpa(subs(fonk,x,midpoint));
        
        if valuea * valuemidpoint < 0
            b = midpoint;
            midpoint = (a+b)/2;
            
        elseif valueb * valuemidpoint < 0
            a = midpoint;
            midpoint = (a+b)/2;
        end
    end
    
    display(sprintf('Root: %f ',midpoint));
    
end

