# nonproc
Homework assignments for Nonprocedural Programming at Matfyz, Charles University in Prague

## HW1
1.	Implement division of two numbers in Prolog in succesor notation
	`hw1-1_arithmetics.pl` (includes all basic arithmetical operations)
	
	    add(+X, +Y, ?Z)
	    sub(+X, +Y, ?Z)
	    mod(+X, +Y, ?Z)
	    div(+X, +Y, ?D, ?R)    % x div y = d, x mod y = r
	
	
	
1.	Implement predicate for _n_-th Fibonacci's number
	`hw1-2_generalisedFibbonacci.pl` (includes "generalised version" enabling to define first two elements of the sequence)
	

	    fib(+N, ?F)    % f is the n-th Fibbonaci's number
	    gFib(+N, +F0, +F1, ?R)    % r is the n-th "Fibonacci's number" in a sequence starting with _f0_ and _f1_
	

	