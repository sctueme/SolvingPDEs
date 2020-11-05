function [u] = U0(x)


%Funcion U0 definida en el ejercicio de transporte como condicion de
%frontera.

for i = 1:length(x)
    
        if abs(x(i)) <= 1/2
            u(i) = 1-2*abs(x(i));
        else
            u(i) = 0;
        end
end

                 
end
    