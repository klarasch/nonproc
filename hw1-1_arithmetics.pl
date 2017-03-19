% Arithmetics (in succesor notation)
% ==================================

% Natural numbers definition.
nat(0).
nat(s(X)) :- nat(X).

% "Less than" definition.
lt(0, s(Y)) :- nat(Y).       % y is natural => 0 < y + 1
lt(s(X), s(Y)) :- lt(X, Y).  % x < y => x - 1 < y - 1

% Addition and substraction.
add(0, Y, Y) :- nat(Y).      % y + 0 = y
add(s(X), Y, s(Z)) :-        % x + y = z => x + 1 + y = z + 1
  add(X, Y, Z).
sub(X, Y, R) :- add(Y, R, X). % subtraction is reversed operation

% Multiplication.
mult(0, Y, 0) :- nat(Y).     % y is natural => y*0 = 0
mult(s(X), Y, R) :-          % x * y = r_2 & r_2 + y = r => (x + 1) * y = r
  mult(X, Y, R2),
  add(R2, Y, R).

% Division.
% div(X, Y, D, R)
%     D ... result
%     R ... reminder

div(_, 0, _, _) :- !, fail.
div(X, X, s(0), 0) :- nat(X).   % x div x = 1, x mod x = 0
div(X, Y, 0, X) :- lt(X, Y).    % x < y => x div y = 0, x mod y = x
div(X, s(0), X, 0) :- nat(X).   % x div 1 = x, x mod 1 = 0
div(X, Y, s(D), R) :-           % (x - y) div y = d & (x - y) mod y = r =>
  sub(X, Y, X2),           % => x div y = d + 1 & x mod y = r
  div(X2, Y, D, R).

% Base of log_2

log2(0, _) :- !,fail.
log2(s(0), 0).
log2(X, s(Y)) :-
  div(X, s(s(0)), X0, _),
  !,
  log2(X0, Y).
