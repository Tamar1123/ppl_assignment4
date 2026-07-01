/*
 * **********************************************
 * Printing result depth
 *
 * You can enlarge it, if needed.
 * **********************************************
 */
maximum_printing_depth(100).

:- current_prolog_flag(toplevel_print_options, A),
   (select(max_depth(_), A, B), ! ; A = B),
   maximum_printing_depth(MPD),
   set_prolog_flag(toplevel_print_options, [max_depth(MPD)|B]).



% Signature: sub_list(Sublist, List)/2
% Purpose: All elements in Sublist appear in List in the same order.
% Precondition: List is fully instantiated (queries do not include variables in their second argument).

sub_list([], _).
sub_list([X|Xs], [X|Ys]) :- sub_list(Xs, Ys).
sub_list([X|Xs], [_|Ys]) :- sub_list([X|Xs], Ys).



% Signature: swap_list(List, InversedList)/2
% Purpose: InversedList is the ‘mirror’ representation of List, i.e, each item in the list is recursively replaced with the item at the position, with refers to the beginning and the end of the list.   

swap_list([H|T], InversedList) :-
    !,
    swap_list(H, RevH),
    swap_list(T, RevT),
    app(RevT, [RevH], InversedList).
swap_list(X, X).

% Helper for swap_list: An implementation of append/3.
% Signature: app(List1, List2, Result)/3
% Purpose: Concatenates List1 and List2 into Result
app([], L, L).
app([H|T], L, [H|R]) :- app(T, L, R).


% Signature: sub_tree(Subtree, Tree)/2
% Purpose: Tree contains Subtree.

sub_tree(T, T).
sub_tree(Sub, tree(_, Left, _)) :- sub_tree(Sub, Left).
sub_tree(Sub, tree(_, _, Right)) :- sub_tree(Sub, Right).



% Signature: swap_tree(Tree, InversedTree)/2
% Purpose: InversedTree is the �mirror� representation of Tree.

swap_tree(void, void).
swap_tree(tree(Root, Left, Right), tree(Root, InvRight, InvLeft)) :-
    swap_tree(Left, InvLeft),
    swap_tree(Right, InvRight).