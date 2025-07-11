function T = polyIntegralProgress(xv, yv, x0, y0, fhandle)
    % Returns detailed steps per triangle in a table
    n = numel(xv);
    rows = struct( ...
        'i',{}, 'j',{}, ...
        'l1',{}, 'l2',{}, 'l3',{}, ...
        'p',{}, 'Area',{}, ...
        'xc',{}, 'yc',{}, ...
        'f_i',{}, 'f_0',{}, 'f_j',{}, 'f_c',{}, ...
        'J_i',{}, 'I_acc',{} ...
    );
    Iacc = 0;
    for i = 1:n
        if i < n
            j = i+1;
        else
            j = 1;
        end
        l1  = hypot(xv(i)-x0,   yv(i)-y0);
        l2  = hypot(xv(j)-x0,   yv(j)-y0);
        l3  = hypot(xv(j)-xv(i),yv(j)-yv(i));
        p   = (l1 + l2 + l3)/2;
        A   = sqrt(p*(p-l1)*(p-l2)*(p-l3));
        xc  = (xv(i) + x0 + xv(j))/3;
        yc  = (yv(i) + y0 + yv(j))/3;
        f_i = fhandle(xv(i),yv(i));
        f_0 = fhandle(x0,   y0   );
        f_j = fhandle(xv(j),yv(j));
        f_c = fhandle(xc,   yc   );
        Ji  = A/12 * (f_i + f_0 + f_j + 9*f_c);
        Iacc = Iacc + Ji;
        rows(end+1) = struct( ...
            'i',i, 'j',j, ...
            'l1',l1, 'l2',l2, 'l3',l3, ...
            'p',p, 'Area',A, ...
            'xc',xc,'yc',yc, ...
            'f_i',f_i,'f_0',f_0,'f_j',f_j,'f_c',f_c, ...
            'J_i',Ji,'I_acc',Iacc ...
        );
    end
    T = struct2table(rows);
end
