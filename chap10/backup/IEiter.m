function [x,t,s]=NR_IEiter(R,x,t,s,p,v,SimPlot)
% function [x,t,s]=NR_IEiter(R,x,t,s,p,v,SimPlot)
% Simulate x'=f(x), with f implmented in R, using the iterative IE method with an EE
% predictor.  t contains the initial t on input and the final t on output. x contains
% the most recent value of x on input,
% and the 2 most recent values of x on output (facilitating a call to NR_BDF2iter).
% The simulation parameters are s.MaxTime, s.MaxSteps, s.MaxIters, s.h (timestep).
% The function parameters p, whatever they are, are simply passed along to R.
% If v<>0, SimPlot is called at each timestep to make interactive plots.
% See <a href="matlab:NRweb">Numerical Renaissance: simulation, optimization, & control</a>, Section 10.5.3.1.
% Part of <a href="matlab:help NRC">Numerical Renaissance Codebase 1.0</a>, <a href="matlab:help NRchap10">Chapter 10</a>; please read the <a href="matlab:help NRcopyleft">copyleft</a>.
% See also NR_BDF2iter, NR_BDF3iter, NR_BDF4iter, NR_BDF5iter, NR_BDF6iter.  Verify with NR_BDFtest.

for n=1:min((s.MaxTime-t)/s.h,s.MaxSteps)
  x(:,2)=x(:,1); f=feval(R,x(:,2),p);                       % Predict with EE
  x(:,1)=x(:,2)+s.h*f;                                    
  for m=1:s.MaxIters, f=feval(R,x(:,1),p);                  % Iteratively correct with IE
    x(:,1)=x(:,2)+s.h*f;                       
  end
  t=t+s.h; if v, feval(SimPlot,x(:,2),x(:,1),t-s.h,t,s.h,s.h,v); end
end
end % function NR_IEiter
