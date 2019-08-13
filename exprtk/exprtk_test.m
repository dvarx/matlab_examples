%check if compiled mex function already available
dirconts=ls;
if(isempty(strfind(dirconts,'exprtk_eval.mexa64')))
    mex exprtk_eval.cpp;
end

ts=linspace(0,10,1000);
expression='switch{case t<1: 1;case t<2: 2; default: 5*sin(t)*exp(-t);}';
ys=exprtk_eval(expression,ts);

if any(isnan(ys))
    fprintf("Warning: Expression could not be evaluated for certain t.\n");
end

plot(ts,ys);
grid();
ylabel("Expression expr(t)");
xlabel("Time t [s]");