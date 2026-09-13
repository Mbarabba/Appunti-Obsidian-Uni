:- dynamic graph/1.
:- dynamic vertex/2.
:- dynamic arc/4.
:- dynamic heap/2.
:- dynamic heap_entry/4.
:- dynamic node/3.
:- dynamic dist/3.
:- dynamic visited/2.
:- dynamic previous/3.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
graph(pippo).
vertex(pippo, a).
vertex(pippo, b).
vertex(pippo, c).
vertex(pippo, d).
vertex(pippo, e).
vertex(pippo, f).

arc(pippo, a, b, 2).
arc(pippo, b, c, 10).
arc(pippo, c, d, 1).
arc(pippo, a, f, 3).
arc(pippo, f, e, 7).
arc(pippo, e, d, 5).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

new_graph(G) :- graph(G), !.
new_graph(G) :- assert(graph(G)), !.

delete_graph(G) :- retract(G).


add_vertex(G, V) :- vertex(G, V), !.
add_vertex(G, V) :- assert(vertex(G, V)), !.


add_arc(G, U, V, Weight) :- arc(G, U, V, Weight), !.
add_arc(G, U, V, Weight) :- assert(arc(G, U, V, Weight)), !.
add_arc(G, U, V) :- add_arc(G, U, V, 1), !.



%vertices(G, [vertex(G, pippo)]).
vertices(G, Vs) :- findall(V, vertex(G, V), Vs).

list_vertices(G) :- graph(G), listing(vertex(G, _)).

%arcs(G, [arc(G, pippo, pluto, _)]).
arcs(G, Es) :- findall(arc(G, U, V, _), arc(G, U, V, _), Es).


neighbors(G, V, Ns) :- vertex(G, V), findall(arc(G, V, U, D), arc(G, V, U, D), Ns).

list_arcs(G) :- graph(G), listing(arc(G, _, _, _)).

list_graph(G) :- graph(G), listing(vertex(G, _)), listing(arc(G, _, _, _)).


% implementazione heap%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




new_heap(H) :- heap(H, _S), !.
new_heap(H) :- assert(heap(H, 0)), !.

new_heap(H, S) :- heap(H, S), !.
new_heap(H, S) :- assert(heap(H, S)), !.


delete_heap(H) :-  retractall(heap_entry(H, _, _, _)), retract(heap(H, _)).

heap_size(H, S) :- heap(H, S).



empty(H) :- heap_size(H, 0).

not_empty(H) :- not(empty(H)).

list_heap(H) :- listing(heap_entry(H, _, _, _)).



%size(P)
insert(H, K, V) :- heap(H, S), retract(heap(H, _)), Som is S + 1, new_heap(H, Som),
                   assert(heap_entry(H,  Som, K, V)), assert(node(H, K, V)), heapify(H, Som).

heapify(_H, K) :- K = 1, !.
heapify(H, K) :- heap_entry(H, K, K1, _V1),Div is floor(K/2), heap_entry(H, Div, K2, _V2),
                     K1 >= K2, !.
heapify(H, K) :- heap_entry(H, K, K1, V1),Div is floor(K/2), heap_entry(H, Div, K2, V2), K1 < K2,
                 retract(heap_entry(H, K, K1, V1)), retract(heap_entry(H, Div, K2, V2)),
                 assert(heap_entry(H, K, K2, V2)), assert(heap_entry(H, Div, K1, V1)), heapify(H, Div).




head(H, K, V) :-  heap_entry(H, 1, K, V).

extract(H, K, V) :- retract(node(H, K, V)), delete_heap(H), new_heap(H, 0),
                    findall(K1, node(H, K1, V1), Lk), findall(V1, node(H, K1, V1), Lv), inserisci(H, Lk, Lv).
inserisci(_H, [], []) :- !.
inserisci(H, [K|Ks], [V|Vs]) :- insert(H, K, V), inserisci(H, Ks, Vs).



/*
modify_key(H, NewKey, OldKey) :- heap_entry(H, _, OldKey, V), retract(node(H, OldKey, V)), assert(node(H, NewKey, V )),
                                 delete_heap(H), new_heap(H, 0),
                                 findall(K1, node(H, K1, V1), Lk), findall(V1, node(H, K1, V1), Lv), inserisci2(H, Lk, Lv), !.
*/

modify_key(H, NewKey, OldKey, V) :- heap_entry(H, _, OldKey, V), retract(node(H, OldKey, V)), assert(node(H, NewKey, V )),
                                 delete_heap(H), new_heap(H, 0),
                                 findall(K1, node(H, K1, V1), Lk), findall(V1, node(H, K1, V1), Lv), inserisci2(H, Lk, Lv), !.


inserisci2(_H, [], []) :- !.
inserisci2(H, [K|Ks], [V|Vs]) :- insert2(H, K, V), inserisci2(H, Ks, Vs).
insert2(H, K, V) :- heap(H, S), retract(heap(H, _)), Som is S + 1, new_heap(H, Som),
                    assert(heap_entry(H,  Som, K, V)), heapify(H, Som).

list_node(H) :- listing(node(H, _, _)).



%%%%%%%%%%%%%sssp%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
sssp(G, Source) :- vertex(G, Source), assert(dist(G, Source, 0)), vertices(G, Nodes), ssssp(G, Nodes).
ssssp(_G, []) :- !.
ssssp(G, [X|Xs]) :-  neighbors(G, X, Ns), make_dist(Ns), ssssp(G, Xs).

make_dist([]) :- !.
make_dist([X|Ns]) :- arc(G, S, V, W) = X, not(dist(G,V,_)), assert(previus(G, V, S)), assert(visited(G, V)), dist(G, S, D),
                     Somma is D + W, assert(dist(G,V,Somma)), make_dist(Ns), !.


make_dist([X|Ns]) :- arc(G, _S, V, W) = X, dist(G, V, Dist), previus(G, V, U), dist(G, U, D), Somma is W+D,
                     retract(dist(G, V, Dist)), Min is min(Dist, Somma), assert(dist(G, V, Min)), make_dist(Ns), !.

shortest_path(G, _Source, V, _Path) :- vertex(G, V), findall(dist(G, V1, D), dist(G, V1, D), Ds), write(Ds), new_heap(G, 0), genera_heap(G, Ds).

genera_heap(_H, []) :- !.
genera_heap(H, [X|Ds]) :- dist(_G, V, D) = X, insert(H, D , V), genera_heap(H, Ds).

*/


list_dist(G) :- listing(dist(G, _, _)).
list_visit(G) :- listing(visited(G, _)).
list_prev(G) :- listing(previus(G, _, _)).



sssp(G, Source) :- vertex(G, Source), new_heap(G), vertices(G, Nodes), genera_heap(G, Source, Nodes), heap_size(G, S), genera_dist(G, S).



genera_heap(_, _, []) :- !.

genera_heap(G, Source, [X|Xs]) :- vertex(G, Source) = vertex(G ,X), assert(dist(G, Source, 0)),
	                          insert(G, 0, Source), genera_heap(G, Source, Xs), !.

genera_heap(G, Source, [X|Xs]) :- vertex(G, V) = vertex(G, X),  assert(dist(G, V, 100000)),
	                          insert(G, 100000, V), genera_heap(G, Source, Xs), !.




genera_dist(_, 0) :-  !.
genera_dist(H, S) :- head(H, _, V), neighbors(H, V, Ns), heap_size(H, S), write(S), change_dist(H, Ns).



change_dist(H, []) :- extract(H, _, _), heap_size(H, S), write(S+'----------------------------------------------'), genera_dist(H, S), !.

change_dist(H, [X|Xs]) :- arc(H, S, V, W) = X, dist(G, V, 100000), assert(previus(G, V, S)),
	                  assert(visited(G, V)), dist(G, S, D),
	                  Somma is D + W, retract(dist(G, V, 100000)), assert(dist(G, V, Somma)),
			  modify_key(H, Somma, 100000, V),write('caso 1'), change_dist(H, Xs), !.
/*
change_dist(H, [X|Xs]) :- arc(H, S, V, W) = X, dist(G, V, Dist_V), previus(G, V, U),
			  dist(G, U, D), Somma is D + W, retract(dist(G, V, Dist)),
			   Min is min(Dist, Somma), assert(dist(G, V, Min)),
			  modify_key(H, Min, Dist),write('caso 2'), change_dist(H, Xs), !.*/


change_dist(H, [X|Xs]) :- arc(H, S, V, W) = X, dist(G, V, Dist_V), dist(G, S, Dist_S),
			  Somma is Dist_S + W, retract(dist(G, V, Dist_V)),
			  Min is min(Dist_V, Somma), assert(dist(G, V, Min)),
			  modify_key(H, Min, Dist_V, V), Prev is Min - W, dist(G, PRE, Prev),
			  retract(previus(G, V, _)),assert(previus(G , V, PRE)),write('caso 2'), change_dist(H, Xs), !.














































