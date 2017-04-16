# nonproc
Homework assignments for Nonprocedural Programming at Matfyz, Charles University in Prague.

*Why?* The reason I decided to publish my solutions to these "simple" educational tasks is my belief that one of the most efficient learning method is learning by examples, and I hope that students consulting Google and Stack Overflow for solutions for help with their own homework might come across this repository and get inspiration :)

## List of tasks
1.	(HW 1-1 Prolog) Implement division of two numbers in Prolog in succesor notation
	`hw1-1_arithmetics.pl` (includes all basic arithmetical operations)
	
	    add(+X, +Y, ?Z)
	    sub(+X, +Y, ?Z)
	    mod(+X, +Y, ?Z)
	    div(+X, +Y, ?D, ?R)    % x div y = d, x mod y = r
		log2(+X, ?N)           % n is a base integer of log_2(x)
	
	
	
1.	(HW 1-2 Prolog) Implement predicate for _n_-th Fibonacci's number
	`hw1-2_generalisedFibbonacci.pl` (includes "generalised version" enabling to define first two elements of the sequence)
	

	    fib(+N, ?F)    % f is the n-th Fibbonaci's number
	    gFib(+N, +F0, +F1, ?R)    % r is the n-th "Fibonacci's number" in a sequence starting with _f0_ and _f1_
	
1.	(HW 2-1 Prolog) Implement list flattening.
	
	    flat(+List, ?Result)
		
		====================
		
		% Examples
		?- flat([], R).
		R = [].
		
		?- flat([[]], R).
		R = [].
		
		?- flat([a,b,c], R).
		R = [a,b,c].
		
		?- flat([a,[[],b,[]],[c,[d]]], R).
		R = [a,b,c,d].
	    
	
1.	(HW 2-2 Prolog) Implement (rectangular) matrix transposition.
	

	    transp(+Matrix, ?Result)
		
		========================
		
		% Examples
		?-  transp([[a,b],[c,d],[e,f]], R).
		R = [[a,c,e],[b,d,f]].
		
1.	(HW 4-1 Haskell) Implement functions *on*, *while* and *pairwise*:
	1.	`on f g`applies g on both arguments and then applies f
		```haskell
		on :: (b -> b -> c) -> (a -> b) -> a -> a -> c
		> (max `on` abs) (-5) 4
		5
		```
	1.	`while c f a` applies function f on pairs in a given list and results puts in a new list;
		if the list length is odd, the last element is not changed

		```haskell
		while :: (a -> Bool) -> (a -> a) -> a -> a
		> while (<100) (*2) 1
		128
		```
	1.	`pairwise f` applies function f on pairs in a given list and results puts in a new list;
		if the list length is odd, the last element is not changed

		```haskell
		pairwise :: (a -> a -> a) -> [a] -> [a]
		> pairwise (+) [1..9]
		[3,7,11,15,9]
		```
