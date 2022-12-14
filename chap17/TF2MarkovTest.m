% script <a href="matlab:NR_TF2MarkovTest">NR_TF2MarkovTest</a>
% See <a href="matlab:NRweb">Numerical Renaissance: simulation, optimization, & control</a>, Section 20.3.3.
% Part of <a href="matlab:help NRC">Numerical Renaissance Codebase 1.0</a>, <a href="matlab:help NRchap20">Chapter 20</a>; please read the <a href="matlab:help NRcopyleft">copyleft</a>.

clear, n=5, m=3, b=rand(1,m), a=[1 rand(1,n-1)], MarkovFromTF=NR_TF2Markov(b,a)
[A,B,C,D]=NR_TF2SS(b,a,'Controller');                    MarkovFromSS=NR_SS2Markov(A,B,C,D,n)

disp(' '); disp('Next <a href="matlab:help NRchap20">NRchap20</a> demo: <a href="matlab:NR_SS2MarkovTest">NR_SS2MarkovTest</a>'), disp(' ')
% end script NR_TF2MarkovTest