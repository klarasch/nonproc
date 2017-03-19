% List flattening
% ===============
%
% example:
% ? flat([a,[[],b,[]],[c,[d]]], R).
% R = [a,b,c,d].
%
% L ... list
% R ... result

flat(L, R) :-
    flat(L, [], R).

% A ... accumulator
% When we reach an empty list, A contains the result.
flat([], A, A).

% If the list is not empty, flatten the list's tail.
% The output is TR ("tail-and-result"), which is used
% to instantiate the accumulator while flattening the head of the list.
flat([H|T], A, R) :-
    flat(T, A, TR),
    flat(H, TR, R).

% (Not just because) the first argument might not be a list (the
% previous rule calls flat for a head which does not have to be a list),
% therefore we handle this case by simply adding such term to the front
% of the accumulator.
flat(X, A, [X|A]) :-
    X \= [],
    X \= [_|_].

