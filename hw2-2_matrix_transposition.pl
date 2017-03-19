% Matrix Transposition
% ====================
% transp(+M, ?R)
%
% Transposes any valid rectangular matrix M (represented as a list of
% lists) into a matrix R.
%
% The core idea of the program below is that the program determines column
% by column in the original matrix and turns them into rows in the result.
% That is done by taking first elements in rows of input matrix, then
% the first column in the input is "deleted", and the process is repeated. 

% Transposition of an empty matrix is an empty matrix.
transp([], []) :- !.

transp([[] | Rows], []) :- !,
    transp(Rows, []).

transp(M, [FirstCol | R]) :-
    firstcol(M, FirstCol, RestRows), !,
    transp(RestRows, R).

% Predicate >>>firstcol(+Rows, ?Col, ?RestRows)<<< is satisfied,
% if Col is the first column in the matrix Rows and RestRows are rows
% in the matrix Rows except for the first ("returns" the first column).

firstcol([[X | Row] | Rows], [X| Col], [Row | RestRows]) :- !,
    firstcol(Rows, Col, RestRows).

% First column of an empty matrix is an empty column (= empty matrix).

firstcol([], [], []).
