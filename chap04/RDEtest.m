% script <a href="matlab:NR_RDEtest">NR_RDEtest</a>
% Test <a href="matlab:help NR_RDE">NR_RDE</a> with random F and random Q>0, S>0, simply by marching the NR_RDE to steady
% state and making sure that the result satisfies the corresponding NR_DARE.
% See <a href="matlab:web('http://numerical-renaissance.com')">Numerical Renaissance: simulation, optimization, & control</a>, Section 4.5.4.
% Part of <a href="matlab:help NRC">Numerical Renaissance Codebase 1.0</a>, <a href="matlab:help NRchap04">Chapter 4</a>; please read the <a href="matlab:help NRcopyleft">copyleft</a>.

disp('Now marching NR_RDE to steady state with random F and random Q>0, S>0.')
clear; format compact; n=6; Q=randn(n); Q=Q*Q'; S=randn(n); S=S*S'; F=randn(n);
X=NR_RDE(eye(n),F,S,Q,n,1024), error_NR_RDEsteadystate=norm(F'*X*inv(eye(n)+S*X)*F-X+Q),disp(' ')

% end script NR_RDEtest
