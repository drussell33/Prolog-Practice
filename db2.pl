/*DB2 Derek Russell*/

owns_owl(Street, Who) :-
    Street = [_House1, _House2, _House3, _House4, _House5],
    member(house(red, osu_alum, _, _, _), Street),  
    member(house(_, oit_alum, dog, _, _), Street),
    member(house(green, _, _, coffee, _), Street),   
    member(house(_, uofo_alum, _, tea, _), Street),   
    is_right(house(ivory,_,_,_,_), house(green,_,_,_,_),Street),  
    member(house(_, _, snails, _, cookies), Street),   
    member(house(yellow, _, _, _, twinkies), Street),  
    [_,_,house(_,_,_,milk,_),_,_] = Street,    
    [house(_,psu_alum,_,_,_),_,_,_,_] = Street,    
    next_to(house(_,_,_,_,pie), house(_,_,fox,_,_),Street),    
    next_to(house(_,_,_,_,twinkies), house(_,_,horse,_,_),Street),    
    member(house(_, _, _, orange_juice, ice_cream), Street),    
    member(house(_, wou_alum, _, _, cheese_cake), Street),    
    next_to(house(_,psu_alum,_,_,_), house(blue,_,_,_,_),Street),    
    member(house(_, Who, owl, _, _), Street).

    next_to(X, Y, List) :- is_right(X, Y, List).
    next_to(X, Y, List) :- is_right(Y, X, List).
        
    is_right(L,R,[L | [R | _]]).
    is_right(L, R, [_ | Rest]) :- is_right(L, R, Rest).