# Name: Kocsen Chung
# Time spent: 1h
# Collaborators: n/a
# Programming assignment #2 - Python and Impcore
import sys
sys.setrecursionlimit(sys.getrecursionlimit())

# Exercise 3
def sigma(m, n):
    if m == n:
        return m
    else:
        return m + sigma(m+1, n)

# Exercise 4a
def exp(m, n):
    if n == 0:
        return 1
    else:
        return m * exp(m, n-1)

# Exercise 4b
def log_helper(m, n, l):
    if exp(m, l) > n:
        return l - 1
    else:
        return log_helper(m, n, l+1)

def log(m, n):
    return log_helper(m, n, 1)


# Exercise 5
def choose(n, k):
    if n < 0 and k < 0:
        return -1
    elif k == 0 or k == n:
        return 1
    else:
        return (choose(n-1, k) + choose(n-1, k-1))

# Exercise 6
def fib(n):
    if n == 0:
        return 0
    elif n==1 or n==2:
        return 1
    return fib(n-1)+fib(n-2)

# Exercise 7a
def prime_helper(n, m):
    if m == 1:
        return True
    elif n % m > 0:
        return prime_helper(n, m - 1)
    else:
        return False

def prime(n):
    if n < 2:
        return False
    else:
        try:
            return prime_helper(n, n-1)
        except:
            print("\t\tYour OS recursion depth is %d and was exceeded." % sys.getrecursionlimit())
            return 1

# Exercise 7b
def nthprime_helper(n, curr, found):
    if found == n:
        return curr - 2
    elif prime(curr):
        return nthprime_helper(n, curr + 2, found + 1)
    else:
        return nthprime_helper(n , curr + 2, found)

def nthprime(n):
    if n < 1:
        return -1
    elif n == 1 :
        return 2
    else:
        return nthprime_helper(n, 3, 1)

# Exercise 7c
def sumprimes_h(n, curr):
    if n < 2:
        return curr
    return sumprimes_h(n - 1, curr + nthprime(n - 1))

def sumprimes(n):
    if n == 0:
        return 0
    return sumprimes_h(n, nthprime(n))

# Exercise 7d
def relprime_helper(a, b, carriage):
    if a == 2:
        if prime(a) and prime(b):
            return True
        else:
            return False
    elif carriage == 1:
        return True
    elif b % a == 0:
        return False
    else:
        if ((b % carriage) + (a % carriage)) == 0:
            return False
        return relprime_helper(a,b, carriage-1)

def relprime(m, n):
    if m == n:
        return False
    else:
        if m > n:
            return relprime_helper(n,m,n-1)
        else:
            return relprime_helper(m,n,m-1)


# Exercise 8
def binary(m):
    if m == 0:
        return 0
    elif m == 1:
        return 1
    elif m == -1:
        return -1
    else:
        try:
            if m < 0:
                ans = -(m%2) + (10 * binary(m/2))
            else:
                ans = (m%2) + (10 * binary(m/2))
            return ans
        except RuntimeError:
            print("\t\tYour OS recursion depth is %d and was exceeded." % sys.getrecursionlimit())
            return 0


