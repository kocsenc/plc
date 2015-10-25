(* 
Kocsen Chung
Programming Language Concepts (CSCI)
Programming Assignment #4 - Learning Standard ML

Time spent: 1h
Collaborators: N/A
*)

(* Exercise 3 - Sigma *)
fun sigma (m, n) =
	if m = n then
		m
	else
		m + sigma(m + 1, n);
	

(* Exercise 4a - exp *)
fun exp (m, n) =
	if n = 0 then
		1
	else
		m * exp(m, n - 1);

(* Exercise 4b log *)
fun log_helper(m, n, l) = 
	if exp(m, l)> n then
		l - 1
	else
		log_helper(m, n, l + 1);
	

fun log(m, n) =
	log_helper(m, n, 1);

(* Exercise 5 - choose *)
fun choose(n, k) =
	if n < 0 andalso k < 0 then
		~1
	else if k = 0 orelse k = n then
		1
	else
		(choose(n-1, k) + choose(n-1, k-1));


(* Exercise 6 - fib *)
fun fib(n) = 
	if n = 0 then
		0
	else if n = 1 orelse n = 2 then
		1
	else
		fib (n-1) + fib (n-2);

(* Exercise 7a - Prime *)
fun prime_helper(n, m) =
    if m = 1 then
        true
    else if n mod m > 0 then (*CHECK============*)
        prime_helper(n, m - 1)
    else
        false;

fun prime(n) = 
    if n < 2 then
        false
    else
        prime_helper(n, n-1);

(* Exercise 7b - nth Prime *)
fun nthprime_helper(n, curr, found) =
    if found = n then
        curr - 2
    else if prime(curr) then
         nthprime_helper(n, curr + 2, found + 1)
    else
         nthprime_helper(n , curr + 2, found);

fun nthprime(n) =
    if n < 1 then
        ~1
    else if n = 1 then
         2
    else
         nthprime_helper(n, 3, 1)

(* Exercise 7c - Sumrpimes *)
fun sumprimes_h(n, curr) =
    if n < 2 then
        curr
     else
    	sumprimes_h(n - 1, curr + nthprime(n - 1));

fun sumprimes(n) =
    if n = 0 then
        0
     else
    	sumprimes_h(n, nthprime(n));


(* Exercise 7d - relprime *)
fun relprime_helper (a, b, carriage) =
    if a = 2 then
        if prime(a) andalso prime(b) then
            true
        else
            false
    else if carriage = 1 then
        true
    else if b mod a = 0 then
        false
    else
        if ((b mod carriage) + (a mod carriage)) = 0 then
            false
        else
        	relprime_helper(a,b, carriage-1);

fun relprime (m, n) =
    if m = n then
        false
    else
        if m > n then
            relprime_helper(n,m,n-1)
        else
            relprime_helper(m,n,m-1);


(* Exercise 8 - binary *)
fun binary m = 
	if m = 0 then
		0
	else if m = 1 then
		1
	else
		(m mod 2) + (10 * binary(m div 2));



