function [Q, R] = house(A)
    %Intr?ri: A = matricea sistemului
    %Iesiri:
    % Q = matricea ortogonal?
    % R = matricea superior triunghiular?
    [m n] = size(A);
    Q = eye(m);
    
    for k = 1:n
        s = norm(A(k:m,k)).^2;
        if A(k,k) < 0
            s = -s;
        end;
        v = zeros(m,1);
        v(1:k-1) = 0;
        v(k) = A(k,k) + s;
        A(k,k) = -s;
        v(k+1:m) = A(k+1:m,k);
        A(k+1:m,k) = 0;
        p = s * v(k);
        % Ak+1 = Qk * Ak
        for j = k+1:n
            t = v(k:m)' * A(k:m,j) / p;
            A(k:m,j) = A(k:m,j) - t * v(k:m);
        end;
        % Q=Qk * Q
        for j = k+1:n
            t = v(k:m)' * Q(k:m,j) / p;
            Q(k:m,j) = Q(k:m,j) - t * v(k:m);
        end;
    end;
    R = triu(A);
    Q = Q';
end