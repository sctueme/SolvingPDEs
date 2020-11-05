function [y] = sol_e(x,t)

%Funcion de la solucion para la animacion.

%La funcion es periodica para cada t = 2n.
b = mod(t,2);

    for i=1:length(x)
        if b > 1  %La funcion esta definida solo para x en [-1,1]. Hacemos este ajuste para que no haya un desfase grande.
        y(i) = U0(x(i)-2*b+2); 
            else 
             y(i) = U0(x(i)-2*b);   
        end

    end
end

