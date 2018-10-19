function y = recover(x, params)
p1 = params(1);
p2 = params(2);
p3 = params(3);
c = params(4);
y = p1./((x-p2).^2+p3)+c;
end

