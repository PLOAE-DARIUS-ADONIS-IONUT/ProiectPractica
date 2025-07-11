function I = polyIntegral(xv, yv, x0, y0, fhandle)
    % POLYINTEGRAL  Approximate ∬_D f(x,y) dxdy over polygon via fan‐triangles
    n = numel(xv);
    I = 0;
    for i = 1:n
        if i < n
            j = i+1;
        else
            j = 1;
        end
        % lungimi l1,l2,l3
        l1 = hypot(xv(i)-x0,   yv(i)-y0);
        l2 = hypot(xv(j)-x0,   yv(j)-y0);
        l3 = hypot(xv(j)-xv(i),yv(j)-yv(i));
        p  = (l1 + l2 + l3)/2;          % semiperimetru
        S  = sqrt(p*(p-l1)*(p-l2)*(p-l3));  % aria
        % centroid
        xc = (xv(i) + x0 + xv(j))/3;
        yc = (yv(i) + y0 + yv(j))/3;
        % regula Simpson‐like pe triunghi
        Ji = S/12 * ( fhandle(xv(i),yv(i)) ...
                    + fhandle(x0,   y0   ) ...
                    + fhandle(xv(j),yv(j)) ...
                    + 9*fhandle(xc,   yc) );
        I = I + Ji;
    end
end
