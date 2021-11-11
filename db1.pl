/*DB1 Derek Russell*/

male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

parent_of(abraham, herb).
parent_of(abraham, homer).
parent_of(mona, herb).
parent_of(mona, homer).
parent_of(clancy, marge).
parent_of(clancy, patty).
parent_of(clancy, selma).
parent_of(jackie, marge).
parent_of(jackie, patty).
parent_of(jackie, selma).
parent_of(homer, bart).
parent_of(homer, lisa).
parent_of(homer, maggie).
parent_of(marge, bart).
parent_of(marge, lisa).
parent_of(marge, maggie).
parent_of(selma, ling).


father_of(X, Y) :-
    parent_of(X, Y),
    male(X).

mother_of(X, Y) :-
    parent_of(X, Y),
    female(X).

grandfather_of(X, Y) :-
    father_of(X, Z),
    parent_of(Z, Y).
    
grandmother_of(X, Y) :-
    mother_of(X, Z),
    parent_of(Z, Y).
    
sister_of(X, Y) :-
    female(X),
    father_of(Z, Y),
    father_of(Z, X),
    mother_of(W, Y),
    mother_of(W, X),
    Y \= X.
    
brother_of(X, Y) :-
    male(X),
    father_of(Z, Y),
    father_of(Z, X),
    mother_of(W, Y),
    mother_of(W, X),
    Y \= X.
    
aunt_of(X, Y) :-
    female(X),
    parent_of(Z, Y),
    sister_of(X, Z).
    
uncle_of(X, Y) :-
    male(X),
    parent_of(Z, Y),
    brother_of(X, Z).
    
    
who_are_barts_grandmothers :-
    grandmother_of(X, bart),
    format('~w is barts grandmother ~n',[X]).
    
who_are_my_grandchildren(X) :-
    parent_of(X, Y),
    parent_of(Y, Z),
    format('~w is my grandchild ~n',[Z]).
    
who_are_my_aunts(X) :-
    aunt_of(Y, X), 
    format('~w is my aunt ~n',[Y]).
    
who_are_my_grandparents(X) :-
    parent_of(Y, X),
    parent_of(Z, Y),
    format('~w is my grandparent ~n',[Z]).
    
who_are_my_siblings(X) :- 
    father_of(Z, X),
    father_of(Z, Y),
    mother_of(W, X),
    mother_of(W, Y),
    Y \= X,
    format('~w is my sibling ~n',[Y]).