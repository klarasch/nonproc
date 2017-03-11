% "Generalised Fibonacci"
% =======================

% gFib(+N, +F0, +F1, R)
%       N ... queried element of the sequence
%       F0 .. 1st element of the sequence
%       F1 .. 2nd element of the sequence
%       R ... result
% F_n = F_(n-1) + F_(n-2)

gFib(0, F0,  _, F0). % for N = 0, "return" F0 
gFib(1, _,  F1, F1). % for N = 1, "return" F1
gFib(N, F0, F1, R) :-
	N1 is N - 1,
	N2 is N - 2,
	gFib(N1, F0, F1, R1),  % recursion – getting F_(n-1) as R1
	gFib(N2, F0, F1, R2),  % recursion – getting F_(n-2) as R2
	R is R1 + R2.   % "returning" result

% "Normal Fibonnaci"
% ==================

fib(0, 0).           % F_0 = 0
fib(1, 1).           % F_1 = 1
fib(N, R) :-
	N1 is N - 1,
	N2 is N - 2,
	fib(N1, R1),     % recursion – getting F_(n-1) as R1
	fib(N2, R2),     % recursion – getting F_(n-2) as R2
	R is R1 + R2.    % "returning" result
