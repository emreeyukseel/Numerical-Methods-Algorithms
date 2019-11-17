function root = FixedPoint(fx,gx,initial,tolerance)
    syms x;
    dervgx = diff(gx,x);
    root=initial;

    if abs(vpa(subs(dervgx,x,1))) < 1
      while abs(vpa(subs(fx,x,root))) > tolerance
            root = vpa(subs(gx,x,root)); 
      end
      
    else
        display('g(x) does not provide converging condition (x=g(x))');
    end
    
end