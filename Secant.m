function root = Secant(fonksiyon, y1, y2)
    
    t = cputime;
    syms x;
    y3=0;
    fonk = fonksiyon;
    tolerance = 10^(-5);
    functionval = vpa(subs(fonk,x,y2));
    itnum=0;
    
    while abs(functionval) > tolerance
        
      itnum=itnum+1; 
      
      y3 = y2 - (vpa(subs(fonk,x,y2)) * (y2-y1)) / (vpa(subs(fonk,x,y2)) - vpa(subs(fonk,x,y1)));
      functionval = vpa(subs(fonk,x,y3));
      
      y1 = y2;
      y2 = y3;
        
    end
    display(sprintf('Root: %d ',y3));
    display(sprintf('Iteration Number: %d ',itnum));
    
    surf(peaks(40));
    e = cputime-t;
    
    display(sprintf('Elapsed CPU time: %f ',e));
    
end

