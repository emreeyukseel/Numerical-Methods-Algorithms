function root = Muller(fonksiyon,x0,x1,x2)

    t = cputime;
    syms x;
    fonk = fonksiyon;
    tolerance = 10^(-5);
    functionval = vpa(subs(fonk,x,x2));
    itnum=0;
    difference=10;
    
    while abs(difference) >= tolerance
        itnum = itnum + 1;
        
        fx0 = vpa(subs(fonk,x,x0));
        fx1 = vpa(subs(fonk,x,x1));
        c = vpa(subs(fonk,x,x2));
        
        b = ((x0-x2)^2 * (fx1-c) - (x1-x2)^2*(fx0-c)) / (x0-x2)*(x1-x2)*(x0-x1);
        a = ((x1-x2)*(fx0-c) - (x0-x2)*(fx1-c)) / (x0-x2)*(x1-x2)*(x0-x1);
        
        if b<0
            x3 = x2 - (2*c)/b-sqrt(b^2-4*a*c);
            
        elseif b>0
            x3 = x2 + (2*c)/b-sqrt(b^2-4*a*c);
            
        end
        
        difference = x3-x2;
        x0 = x1;
        x1 = x2;
        x2 = x3;
        
    end
    
    display(x3);
    display(sprintf('Iteration Number: %d ',itnum));
    
    surf(peaks(40));
    e = cputime-t;
    display(sprintf('Elapsed CPU time: %f ',e));
    
end

