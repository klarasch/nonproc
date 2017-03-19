% Matrix Transposition
% ====================
%
% transp(+M, ?R)
% Transposes any valid rectangular matrix M (represented as a list of
% lists) into a matrix R.
%
% Core idea of the program below is that the program determines a column
% by column (rows in the result) in the original matrix by going row by
% row in matrixes which don't have the columns which were already dealt
% with.

% Transposition of an empty matrix is an empty matrix.
transp([], []) :- !.

transp([[] | Rows], []) :- !,
    transp(Rows, []).

transp(M, [FirstCol | R]) :-
    firstcol(M, FirstCol, RestRows), !,
    transp(RestRows, R).

% Predicate firstcol(+Rows, ?Col, ?RestRows) is satisfied,
% if Col is the first column in the matrix Rows and RestRows are rows
% in the matrix Rows except for the first ("returns" the first column)
firstcol([[X | Row] | Rows], [X| Col], [Row | RestRows]) :- !,
    firstcol(Rows, Col, RestRows).

% First column of an empty matrix is an empty column (= empty matrix).
firstcol([], [], []).
