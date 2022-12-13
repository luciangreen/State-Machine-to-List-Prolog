:-include('../SSI/ssi.pl').

sm_to_lp(Algorithm1,Algorithm2) :-
	sm_to_lp(Algorithm1,[],Algorithm2).
	
sm_to_lp([],Algorithm,Algorithm) :- !.
sm_to_lp(Algorithm1,Algorithm2,Algorithm3) :-
	Algorithm1=[Function1|Functions],
	(Function1=[_Number,Name,Arguments1,Symbol1,Body1]
	->%symbol(Symbol1,Symbol2),
	(
	get_up_to_next_chunk(Body1,%Body2,
	[],Body2),
	(Arguments1=[]->
	append(Algorithm2,[[%Number,
	Name,Symbol1,Body2]],Algorithm4);
	append(Algorithm2,[[%Number,
	Name,Arguments1,Symbol1,Body2]],Algorithm4)

	)
	)
	/*;
	(trace,Function1=[_Number,Name|Arguments1],
	
	%get_up_to_next_chunk(Body1,%Body2,
	%[],Body2),
	(Arguments1=[]->
	append(Algorithm2,[[%Number,
	Name]],Algorithm4);
	append(Algorithm2,[[%Number,
	Name,Arguments1]],Algorithm4)

	)
	)
	*/),
	sm_to_lp(Functions,Algorithm4,Algorithm3).
	
	
 %gets next chunk (section) including up to a chunk, then goes over it and searches for more chunks *

% get_up_to_next_chunk(B,[],Commands).

get_up_to_next_chunk([],C,C) :- !.
get_up_to_next_chunk(B,C1,C2) :-

 get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
 get_lang_word("v",Dbw_v1),Dbw_v1=Dbw_v,
get_lang_word("on_true",Dbw_on_true1),Dbw_on_true1=Dbw_on_true,
get_lang_word("on_false",Dbw_on_false1),Dbw_on_false1=Dbw_on_false,
get_lang_word("go_after",Dbw_go_after1),Dbw_go_after1=Dbw_go_after,get_lang_word("go_to_predicates",Dbw_go_to_predicates1),Dbw_go_to_predicates1=Dbw_go_to_predicates,
get_lang_word("not",Dbw_not1),Dbw_not1=Dbw_not,
get_lang_word("or",Dbw_or1),Dbw_or1=Dbw_or,
get_lang_word("findall",Dbw_findall1),Dbw_findall1=Dbw_findall,


 append(A,C,B),
 
C=[C111|D],

C111=[_Number,[Dbw_on_true,_Statements1_number],[Dbw_go_after,_Statements2_number],[Dbw_on_false,_Return_line_false],[Dbw_go_to_predicates,_Predicates],[Dbw_n_or_v1,F]|_Arguments],
(Dbw_n_or_v1=Dbw_n->true;Dbw_n_or_v1=Dbw_v),
%trace,
(
(F="[]"->true;(F=Dbw_not->true;(F=Dbw_or->true;(F="->"->true;(F=Dbw_findall)))))
->
(
convert_chunk(A,E),
append(C1,E,C3),
%* append E
%trace,
append(C,[],CD),
get_chunks(CD,[],C22),
append(C3,C22,C2)
)
;
(
%trace,
%not((
%(F="[]"->true;(F=Dbw_not->true;(F=Dbw_or->true;(F="->"->true;(F=Dbw_findall))))))),

%trace,
/*convert_chunk(B,E),
*/
%trace,
append(A,[C111],AC),
convert_chunk(AC,E),
append(C1,E,C3),
%* append E
%trace,
%append(C,[],CD),
get_up_to_next_chunk(D,[],C22),
append(C3,C22,C2)

))
,!
.


get_chunks([],C,C) :- !.

get_chunks(CD,C1,C2) :-

 get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
  get_lang_word("v",Dbw_v1),Dbw_v1=Dbw_v,
get_lang_word("on_true",Dbw_on_true1),Dbw_on_true1=Dbw_on_true,
get_lang_word("on_false",Dbw_on_false1),Dbw_on_false1=Dbw_on_false,
get_lang_word("go_after",Dbw_go_after1),Dbw_go_after1=Dbw_go_after,get_lang_word("go_to_predicates",Dbw_go_to_predicates1),Dbw_go_to_predicates1=Dbw_go_to_predicates,
 %get_lang_word("not",Dbw_not1),Dbw_not1=Dbw_not,
%get_lang_word("or",Dbw_or1),Dbw_or1=Dbw_or,
%get_lang_word("findall",Dbw_findall1),Dbw_findall1=Dbw_findall,

CD=[[Number,[Dbw_on_true,_Statements1_number],[Dbw_go_after,_Statements2_number],[Dbw_on_false,_Return_line_false],[Dbw_go_to_predicates,_Predicates],[Dbw_n_or_v1,F]|_Arguments]|D],

(Dbw_n_or_v1=Dbw_n->true;Dbw_n_or_v1=Dbw_v),
F="[]",
%trace,


 get("[]",Number,D,E,[],C4,_,wrap),


/*
 append(A,C,D),

 C=[C111|E],
 
 C111=[_Number2,[Dbw_on_true,[exit_function,Number]],[Dbw_go_after,_],[Dbw_on_false,[fail_function,Number]],[Dbw_go_to_predicates,_],[Dbw_n,_F2]|_Arguments2],

%convert_chunk
%trace,
append(A,[C111],AC),
get_up_to_next_chunk(AC,[],C31),

C3=[C31], % "[]"

append(C1,C3,C4),
*/

append(C1,C4,C6),
%trace,
get_up_to_next_chunk(E,[],C5),
append(C6,C5,C2)
,!
.

get_chunks(CD,C1,C2) :-

 get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
  get_lang_word("v",Dbw_v1),Dbw_v1=Dbw_v,
get_lang_word("on_true",Dbw_on_true1),Dbw_on_true1=Dbw_on_true,
get_lang_word("on_false",Dbw_on_false1),Dbw_on_false1=Dbw_on_false,
get_lang_word("go_after",Dbw_go_after1),Dbw_go_after1=Dbw_go_after,get_lang_word("go_to_predicates",Dbw_go_to_predicates1),Dbw_go_to_predicates1=Dbw_go_to_predicates,
 get_lang_word("not",Dbw_not1),Dbw_not1=Dbw_not,
%get_lang_word("or",Dbw_or1),Dbw_or1=Dbw_or,
%get_lang_word("findall",Dbw_findall1),Dbw_findall1=Dbw_findall,

CD=[C111|D],

C111=[Number,[Dbw_on_true,_Statements1_number],[Dbw_go_after,_Statements2_number],[Dbw_on_false,_Return_line_false],[Dbw_go_to_predicates,_Predicates],[Dbw_n_or_v1,F]|_Arguments],
(Dbw_n_or_v1=Dbw_n->true;Dbw_n_or_v1=Dbw_v),

F=Dbw_not,
%trace,

get(Dbw_not,Number,D,E,C1,C3,_,wrap),


/*
 append(A,C,D),

 C=[C112|E],

C112=[_Number2,[Dbw_on_true,[exit_function,Number]],[Dbw_go_after,_],[Dbw_on_false,[fail_function,Number]],[Dbw_go_to_predicates,_],[Dbw_n,_F2]|_Arguments2],

%convert_chunk
%trace,
append(A,[C112],AC),
get_up_to_next_chunk(AC,[],C31),

C3=[[[Dbw_n,F],C31]],

*/


append(C1,C3,C4),

get_up_to_next_chunk(E,[],C5),
append(C4,C5,C2)
,!
.


get_chunks(CD,C1,C2) :-

 get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
  get_lang_word("v",Dbw_v1),Dbw_v1=Dbw_v,
get_lang_word("on_true",Dbw_on_true1),Dbw_on_true1=Dbw_on_true,
get_lang_word("on_false",Dbw_on_false1),Dbw_on_false1=Dbw_on_false,
get_lang_word("go_after",Dbw_go_after1),Dbw_go_after1=Dbw_go_after,get_lang_word("go_to_predicates",Dbw_go_to_predicates1),Dbw_go_to_predicates1=Dbw_go_to_predicates,
 %get_lang_word("not",Dbw_not1),Dbw_not1=Dbw_not,
get_lang_word("or",Dbw_or1),Dbw_or1=Dbw_or,
%get_lang_word("findall",Dbw_findall1),Dbw_findall1=Dbw_findall,

CD=[[Number,[Dbw_on_true,_Statements1_number],[Dbw_go_after,_Statements2_number],[Dbw_on_false,_Return_line_false],[Dbw_go_to_predicates,_Predicates],[Dbw_n_or_v1,F]|_Arguments]|D],

(Dbw_n_or_v1=Dbw_n->true;Dbw_n_or_v1=Dbw_v),

F=Dbw_or,
%trace,
 
 get(Dbw_or,Number,D,E1,C1,C3,_,wrap),
 
 /*
 append(A,C,D),

 C=[C111|E],
 
 C111=[_Number2,[Dbw_on_true,[exit_function,Number]],[Dbw_go_after,_],[Dbw_on_false,_Number3],[Dbw_go_to_predicates,_],[Dbw_n,_F2]|_Arguments2],

%convert_chunk
%trace,
append(A,[C111],AC),
%trace,
get_up_to_next_chunk(AC,[],C31),


 append(A1,C11,E),

 C11=[C112|E1],
 
 C112=[_Number31,[Dbw_on_true,[exit_function,Number]],[Dbw_go_after,_],[Dbw_on_false,_Number4],[Dbw_go_to_predicates,_],[Dbw_n,_F3]|_Arguments3],

%convert_chunk
%trace,
append(A1,[C112],AC1),
get_up_to_next_chunk(AC1,[],C311),
%trace,
foldr(append,[C31,C311],C313),
C3=[[[Dbw_n,F],C313]],
*/



append(C1,C3,C4),

get_up_to_next_chunk(E1,[],C5),
append(C4,C5,C2)
,!
.


get_chunks(CD,C1,C2) :-

 get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
  get_lang_word("v",Dbw_v1),Dbw_v1=Dbw_v,
get_lang_word("on_true",Dbw_on_true1),Dbw_on_true1=Dbw_on_true,
get_lang_word("on_false",Dbw_on_false1),Dbw_on_false1=Dbw_on_false,
get_lang_word("go_after",Dbw_go_after1),Dbw_go_after1=Dbw_go_after,get_lang_word("go_to_predicates",Dbw_go_to_predicates1),Dbw_go_to_predicates1=Dbw_go_to_predicates,
 %get_lang_word("not",Dbw_not1),Dbw_not1=Dbw_not,
%get_lang_word("or",Dbw_or1),Dbw_or1=Dbw_or,
%get_lang_word("findall",Dbw_findall1),Dbw_findall1=Dbw_findall,
%trace,
CD=[[Number,[Dbw_on_true,_Statements1_number],[Dbw_go_after,_Statements2_number],[Dbw_on_false,_Return_line_false],[Dbw_go_to_predicates,_Predicates],[Dbw_n_or_v1,F]%,[_Argument2]%,[_Argument1,_Argument2]
]|D],

(Dbw_n_or_v1=Dbw_n->true;Dbw_n_or_v1=Dbw_v),

F="->", % 3 args
%trace,

get("->",Number,D,E5,C1,C3,_,wrap),

/*
 append(A,C,D),

 C=[C111|E],
 
%trace,
 C111=[Number2,[Dbw_on_true,_N1],[Dbw_go_after,_],[Dbw_on_false,_Number3],[Dbw_go_to_predicates,_],[Dbw_n,F2]|_Arguments2],
%trace,
(F2="[]"->


 (%append(A,[C111],AC),
 %trace,
 get("[]",Number2,C%AC%E E*
  ,E2,[],C32,nowrap),
  append(C1,C32,C31));

(
%convert_chunk
%trace,
append(A,[C111],AC),
%trace,
get_up_to_next_chunk(AC,[],C31),
E=E2
)),

 append(A1,C11,E2),

 C11=[C112|E1x],
 
 %trace,
 C112=[Number31,[Dbw_on_true,A3],[Dbw_go_after,B],[Dbw_on_false,_Number4],[Dbw_go_to_predicates,_],[Dbw_n,F3]|_Arguments3],

(A3=[exit_function,Number]->true;B=[exit_function,Number]),
(F3="[]"->


 (%append(A1,[C112],AC1),
 get("[]",Number31,%E1%
 C11%,AC1%E*
  ,E3,[]%C1
  ,C311,nowrap));

(

%convert_chunk
%trace,
append(A1,[C112],AC1),
get_up_to_next_chunk(AC1,[],C311)
,E1x=E3
)),


 append(A13,C113,E3),

 C113=[C1131|E4],
 
 %trace,
 C1131=[Number41,[Dbw_on_true,A33],[Dbw_go_after,B3],[Dbw_on_false,_Number43],[Dbw_go_to_predicates,_],[Dbw_n,F33]|_Arguments33],

(A33=[exit_function,Number]->true;B3=[exit_function,Number]),
(F33="[]"->


 (%append(A1,[C112],AC1),
 get("[]",Number41,%E1%
 C113%,AC1%E*
  ,E5,[]%C1
  ,C313,nowrap)
  
  % eliminate ->,2
  %here1
  );

(

%convert_chunk
%trace,
append(A13,[C1131],AC13),
get_up_to_next_chunk(AC13,[],C313)
,E4=E5
)),

%trace,
foldr(append,[C31,C311,C313],C314),
C3=[[[Dbw_n,F],C314]],
*/




append(C1,C3,C4),
%trace,
get_up_to_next_chunk(E5,[],C5),
append(C4,C5,C2)
,!
.


get_chunks(CD,C1,C2) :-

 get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
  get_lang_word("v",Dbw_v1),Dbw_v1=Dbw_v,
get_lang_word("on_true",Dbw_on_true1),Dbw_on_true1=Dbw_on_true,
get_lang_word("on_false",Dbw_on_false1),Dbw_on_false1=Dbw_on_false,
get_lang_word("go_after",Dbw_go_after1),Dbw_go_after1=Dbw_go_after,get_lang_word("go_to_predicates",Dbw_go_to_predicates1),Dbw_go_to_predicates1=Dbw_go_to_predicates,
 %get_lang_word("not",Dbw_not1),Dbw_not1=Dbw_not,
%get_lang_word("or",Dbw_or1),Dbw_or1=Dbw_or,
%get_lang_word("findall",Dbw_findall1),Dbw_findall1=Dbw_findall,

CD=[[Number,[Dbw_on_true,_Statements1_number],[Dbw_go_after,_Statements2_number],[Dbw_on_false,_Return_line_false],[Dbw_go_to_predicates,_Predicates],[Dbw_n_or_v1,F]%,[_Argument1,_Argument2]
]|D],

(Dbw_n_or_v1=Dbw_n->true;Dbw_n_or_v1=Dbw_v),

F="->", % 2 args
%trace,

get("->",Number,D,E3,C1,C3,_,wrap),
/*

 append(A,C,D),

 C=[C111|E],
 
%trace,
 C111=[Number2,[Dbw_on_true,_N1],[Dbw_go_after,_],[Dbw_on_false,_Number3],[Dbw_go_to_predicates,_],[Dbw_n,F2]|_Arguments2],
%trace,
(F2="[]"->


 (%append(A,[C111],AC),
 %trace,
 get("[]",Number2,C%AC%E E*
  ,E2,[],C32,nowrap),
  append(C1,C32,C31));

(
%convert_chunk
%trace,
append(A,[C111],AC),
%trace,
get_up_to_next_chunk(AC,[],C31),
E=E2
)),

 append(A1,C11,E2),

 C11=[C112|E1],
 
 %trace,
 C112=[Number31,[Dbw_on_true,A3],[Dbw_go_after,B],[Dbw_on_false,_Number4],[Dbw_go_to_predicates,_],[Dbw_n,F3]|_Arguments3],

(A3=[exit_function,Number]->true;B=[exit_function,Number]),
(F3="[]"->


 (%append(A1,[C112],AC1),
 get("[]",Number31,%E1%
 C11%,AC1%E*
  ,E3,[]%C1
  ,C311,nowrap));

(

%convert_chunk
%trace,
append(A1,[C112],AC1),
get_up_to_next_chunk(AC1,[],C311)
,E1=E3
)),

%trace,
foldr(append,[C31,C311],C313),
C3=[[[Dbw_n,F],C313]],
*/




append(C1,C3,C4),

get_up_to_next_chunk(E3,[],C5),
append(C4,C5,C2)
,!
.


get_chunks(CD,C1,C2) :-

 get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
   get_lang_word("v",Dbw_v1),Dbw_v1=Dbw_v,

get_lang_word("on_true",Dbw_on_true1),Dbw_on_true1=Dbw_on_true,
get_lang_word("on_false",Dbw_on_false1),Dbw_on_false1=Dbw_on_false,
get_lang_word("go_after",Dbw_go_after1),Dbw_go_after1=Dbw_go_after,get_lang_word("go_to_predicates",Dbw_go_to_predicates1),Dbw_go_to_predicates1=Dbw_go_to_predicates,
 %get_lang_word("not",Dbw_not1),Dbw_not1=Dbw_not,
%get_lang_word("or",Dbw_or1),Dbw_or1=Dbw_or,
get_lang_word("findall",Dbw_findall1),Dbw_findall1=Dbw_findall,


CD=[[Number,[Dbw_on_true,_Statements1_number],[Dbw_go_after,_Statements2_number],[Dbw_on_false,_Return_line_false],[Dbw_go_to_predicates,_Predicates],[Dbw_n_or_v1,F],[Argument1,Argument2]]|D],

(Dbw_n_or_v1=Dbw_n->true;Dbw_n_or_v1=Dbw_v),

F=Dbw_findall,
%trace,
get(Dbw_findall,Number,D,E,C1,C3,[Argument1,Argument2],wrap),


 %get_brackets(Number,D,E,[],C4,wrap),


%/*


/*
 append(A,C,D),

 C=[C111|E],
 
 C111=[_Number2,[Dbw_on_true,[Dbw_findall_exit_function,Number]],[Dbw_go_after,_],[Dbw_on_false,[Dbw_findall_fail_function,Number]],[Dbw_go_to_predicates,_],[Dbw_n,_F2]|_Arguments2],

%convert_chunk
%trace,
append(A,[C111],AC),
get_up_to_next_chunk(AC,[],C31),

%C3=[C31], % "[]"
foldr(append,[[Argument1],C31,[Argument2]],Arguments3),
C3=[[[Dbw_n,F],Arguments3]],

*/





%append(C1,C3,C4),
%*/

append(C1,C3,C6),
%trace,
get_up_to_next_chunk(E,[],C5),
append(C6,C5,C2)
,!
.



convert_chunk([],[]) :- !.
convert_chunk(A,B) :-

  get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
  get_lang_word("v",Dbw_v1),Dbw_v1=Dbw_v,
get_lang_word("on_true",Dbw_on_true1),Dbw_on_true1=Dbw_on_true,
get_lang_word("on_false",Dbw_on_false1),Dbw_on_false1=Dbw_on_false,
get_lang_word("go_after",Dbw_go_after1),Dbw_go_after1=Dbw_go_after,get_lang_word("go_to_predicates",Dbw_go_to_predicates1),Dbw_go_to_predicates1=Dbw_go_to_predicates,

findall(A1,(member([_Number,[Dbw_on_true,_Statements1_number],[Dbw_go_after,_Statements2_number],[Dbw_on_false,_Return_line_false],[Dbw_go_to_predicates,_Predicates],[Dbw_n_or_v,F],Arguments],A),(Dbw_n_or_v=Dbw_n->true;Dbw_n_or_v=Dbw_v),
%trace,
(Arguments=[]->A1=[[Dbw_n_or_v,F]];A1=[[Dbw_n_or_v,F],Arguments])
),B).



get("[]",Number,D,E2,C1,C4,_,Wrap) :-

 get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
  get_lang_word("v",Dbw_v1),Dbw_v1=Dbw_v,
get_lang_word("on_true",Dbw_on_true1),Dbw_on_true1=Dbw_on_true,
get_lang_word("on_false",Dbw_on_false1),Dbw_on_false1=Dbw_on_false,
get_lang_word("go_after",Dbw_go_after1),Dbw_go_after1=Dbw_go_after,get_lang_word("go_to_predicates",Dbw_go_to_predicates1),Dbw_go_to_predicates1=Dbw_go_to_predicates,
%trace,
 append(A,C,D),

(Wrap=nowrap->not(A=[]);true),
 C=[C111|E],
 C111=[Number2,[Dbw_on_true,A3],[Dbw_go_after,B],[Dbw_on_false,_],[Dbw_go_to_predicates,_],[Dbw_n_or_v1,F2]|Arguments2],

(Dbw_n_or_v1=Dbw_n->true;Dbw_n_or_v1=Dbw_v),


(A3=[exit_function,Number]->true;B=[exit_function,Number]),
/*
%convert_chunk
%trace,
append(A,[C111],AC),
get_up_to_next_chunk(AC,[],C31),
*/



get_lang_word("not",Dbw_not1),Dbw_not1=Dbw_not,
get_lang_word("or",Dbw_or1),Dbw_or1=Dbw_or,
get_lang_word("findall",Dbw_findall1),Dbw_findall1=Dbw_findall,

%trace,

((F2="[]"->true;(F2=Dbw_not->true;(F2=Dbw_or->true;(F2="->"->true;(F2=Dbw_findall)))))->


 (%append(A,[C111],AC),
 %trace,
 convert_chunk(A,Ax1),
 get(F2,Number2,C%AC%E E*
  ,E2,[],C32,Arguments2,nowrap),
  append(Ax1
  ,C32,C31));

(
%convert_chunk
%trace,
append(A,[C111],AC),
%trace,
get_up_to_next_chunk(AC,[],C31),
E=E2
)),



(Wrap=wrap
->
C3=[C31];
C3=
C31
)
, % "[]"

append(C1,C3,C4).


get(Dbw_not,Number,D,E2,_C1,C3,_,Wrap) :-

F=Dbw_not,

 get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
  get_lang_word("v",Dbw_v1),Dbw_v1=Dbw_v,
get_lang_word("on_true",Dbw_on_true1),Dbw_on_true1=Dbw_on_true,
get_lang_word("on_false",Dbw_on_false1),Dbw_on_false1=Dbw_on_false,
get_lang_word("go_after",Dbw_go_after1),Dbw_go_after1=Dbw_go_after,get_lang_word("go_to_predicates",Dbw_go_to_predicates1),Dbw_go_to_predicates1=Dbw_go_to_predicates,

 get_lang_word("not",Dbw_not1),Dbw_not1=Dbw_not,

%trace,
 append(A,C,D),
(Wrap=nowrap->not(A=[]);true),

 C=[C112|E],

C112=[Number2,[Dbw_on_true,A3],[Dbw_go_after,A4],[Dbw_on_false,_%[fail_function,Number]
],[Dbw_go_to_predicates,_],[Dbw_n_or_v1,F2]|Arguments2],

(Dbw_n_or_v1=Dbw_n->true;Dbw_n_or_v1=Dbw_v),

(A3=[exit_function,Number]->true;A4=[exit_function,Number]),
%convert_chunk
%trace,
/*
append(A,[C112],AC),
get_up_to_next_chunk(AC,[],C31),
*/


get_lang_word("not",Dbw_not1),Dbw_not1=Dbw_not,
get_lang_word("or",Dbw_or1),Dbw_or1=Dbw_or,
get_lang_word("findall",Dbw_findall1),Dbw_findall1=Dbw_findall,

%trace,

((F2="[]"->true;(F2=Dbw_not->true;(F2=Dbw_or->true;(F2="->"->true;(F2=Dbw_findall)))))->


 (%append(A,[C111],AC),
 %trace,
  convert_chunk(A,Ax1),

 get(F2,Number2,C%AC%E E*
  ,E2,[],C32,Arguments2,nowrap),
  append(Ax1
  ,C32,C31));

(
%convert_chunk
%trace,
append(A,[C112],AC),
%trace,
get_up_to_next_chunk(AC,[],C31),
E=E2
)),

(true%Wrap=wrap
->
C3=[[[Dbw_n,F],C31]];
C3=[[Dbw_n,F],C31]).


get(Dbw_or,Number,D,E3,_C1,C3,_,Wrap) :-

F=Dbw_or,
 get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
  get_lang_word("v",Dbw_v1),Dbw_v1=Dbw_v,
get_lang_word("on_true",Dbw_on_true1),Dbw_on_true1=Dbw_on_true,
get_lang_word("on_false",Dbw_on_false1),Dbw_on_false1=Dbw_on_false,
get_lang_word("go_after",Dbw_go_after1),Dbw_go_after1=Dbw_go_after,get_lang_word("go_to_predicates",Dbw_go_to_predicates1),Dbw_go_to_predicates1=Dbw_go_to_predicates,

get_lang_word("or",Dbw_or1),Dbw_or1=Dbw_or,
%trace,
append(A,C,D),
(Wrap=nowrap->not(A=[]);true),

 C=[C111|E],
 
 C111=[Number2,[Dbw_on_true,[exit_function,Number]],[Dbw_go_after,_],[Dbw_on_false,_Number3],[Dbw_go_to_predicates,_],[Dbw_n_or_v1,F2]|Arguments2],

(Dbw_n_or_v1=Dbw_n->true;Dbw_n_or_v1=Dbw_v),



/* 
%convert_chunk
%trace,
append(A,[C111],AC),
%trace,
get_up_to_next_chunk(AC,[],C31),


 append(A1,C11,E),

 C11=[C112|E1],
 
 C112=[_Number31,[Dbw_on_true,[exit_function,Number]],[Dbw_go_after,_],[Dbw_on_false,_Number4],[Dbw_go_to_predicates,_],[Dbw_n,_F3]|_Arguments3],

%convert_chunk
%trace,
append(A1,[C112],AC1),
get_up_to_next_chunk(AC1,[],C311),
*/






get_lang_word("not",Dbw_not1),Dbw_not1=Dbw_not,
get_lang_word("or",Dbw_or1),Dbw_or1=Dbw_or,
get_lang_word("findall",Dbw_findall1),Dbw_findall1=Dbw_findall,

%trace,

((F2="[]"->true;(F2=Dbw_not->true;(F2=Dbw_or->true;(F2="->"->true;(F2=Dbw_findall)))))->


 (%append(A,[C111],AC),
 %trace,
 convert_chunk(A,Ax1),
 get(F2,Number2,C%AC%E E*
  ,E2,[],C32,Arguments2,nowrap),
  append(Ax1
  ,C32,C31));

(
%convert_chunk
%trace,
append(A,[C111],AC),
%trace,
get_up_to_next_chunk(AC,[],C31),
E=E2
)),



 append(A1,C11,E2),

 C11=[C112|E1],
 
 C112=[Number31,[Dbw_on_true,[exit_function,Number]],[Dbw_go_after,_],[Dbw_on_false,_Number4],[Dbw_go_to_predicates,_],[Dbw_n_or_v2,F3]|Arguments3],
 
 (Dbw_n_or_v2=Dbw_n->true;Dbw_n_or_v2=Dbw_v),

((F3="[]"->true;(F3=Dbw_not->true;(F3=Dbw_or->true;(F3="->"->true;(F3=Dbw_findall)))))->


 (%append(A1,[C112],AC1),
 convert_chunk(A1,Ax),
 get(F3,Number31,%E1%
 C11%,AC1%E*
  ,E3,[]%C1
  ,C3111,Arguments3,nowrap),
  append(Ax,C3111,C311));

(

%convert_chunk
%trace,
append(A1,[C112],AC1),
get_up_to_next_chunk(AC1,[],C311)
,E1=E3
)),


%trace,
foldr(append,[C31,C311],C313),

(true%Wrap=wrap
->
C3=[[[Dbw_n,F],C313]];
C3=[[Dbw_n,F],C313]).


%->,3
get("->",Number,D,E5,_C1,C3,_,Wrap) :-

F="->",
 get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
  get_lang_word("v",Dbw_v1),Dbw_v1=Dbw_v,
get_lang_word("on_true",Dbw_on_true1),Dbw_on_true1=Dbw_on_true,
get_lang_word("on_false",Dbw_on_false1),Dbw_on_false1=Dbw_on_false,
get_lang_word("go_after",Dbw_go_after1),Dbw_go_after1=Dbw_go_after,get_lang_word("go_to_predicates",Dbw_go_to_predicates1),Dbw_go_to_predicates1=Dbw_go_to_predicates,
%trace,
 append(A,C,D),
(Wrap=nowrap->not(A=[]);true),

 C=[C111|E],
 
%trace,
 C111=[Number2,[Dbw_on_true,_N1],[Dbw_go_after,_],[Dbw_on_false,_Number3],[Dbw_go_to_predicates,_],[Dbw_n_or_v1,F2]|Arguments2],

(Dbw_n_or_v1=Dbw_n->true;Dbw_n_or_v1=Dbw_v),

%trace,
get_lang_word("not",Dbw_not1),Dbw_not1=Dbw_not,
get_lang_word("or",Dbw_or1),Dbw_or1=Dbw_or,
get_lang_word("findall",Dbw_findall1),Dbw_findall1=Dbw_findall,

%trace,

((F2="[]"->true;(F2=Dbw_not->true;(F2=Dbw_or->true;(F2="->"->true;(F2=Dbw_findall)))))->


 (%append(A,[C111],AC),
 %trace,
 convert_chunk(A,Ax1),
 get(F2,Number2,C%AC%E E*
  ,E2,[],C32,Arguments2,nowrap),
  append(Ax1
  ,C32,C31));

(
%convert_chunk
%trace,
append(A,[C111],AC),
%trace,
get_up_to_next_chunk(AC,[],C31),
E=E2
)),

 append(A1,C11,E2),

 C11=[C112|E1x],
 
 %trace,
 C112=[Number31,[Dbw_on_true,A3],[Dbw_go_after,B],[Dbw_on_false,_Number4],[Dbw_go_to_predicates,_],[Dbw_n_or_v2,F3]|Arguments3],

(Dbw_n_or_v2=Dbw_n->true;Dbw_n_or_v2=Dbw_v),

(A3=[exit_function,Number]->true;B=[exit_function,Number]),

((F3="[]"->true;(F3=Dbw_not->true;(F3=Dbw_or->true;(F3="->"->true;(F3=Dbw_findall)))))->


 (%append(A1,[C112],AC1),
 convert_chunk(A1,Ax),
 get(F3,Number31,%E1%
 C11%,AC1%E*
  ,E3,[]%C1
  ,C311x,Arguments3,nowrap),
  append(Ax,C311x,C311));

(

%convert_chunk
%trace,
append(A1,[C112],AC1),
get_up_to_next_chunk(AC1,[],C311)
,E1x=E3
)),


 append(A13,C113,E3),

 C113=[C1131|E4],
 
 %trace,
 C1131=[Number41,[Dbw_on_true,A33],[Dbw_go_after,B3],[Dbw_on_false,_Number43],[Dbw_go_to_predicates,_],[Dbw_n_or_v3,F33]|Arguments33],

(Dbw_n_or_v3=Dbw_n->true;Dbw_n_or_v3=Dbw_v),

(A33=[exit_function,Number]->true;B3=[exit_function,Number]),

((F33="[]"->true;(F33=Dbw_not->true;(F33=Dbw_or->true;(F33="->"->true;(F33=Dbw_findall)))))->


 (%append(A1,[C112],AC1),
 convert_chunk(A13,A13x),
 get(F33,Number41,%E1%
 C113%,AC1%E*
  ,E5,[]%C1
  ,C3131,Arguments33,nowrap),
  append(A13x,C3131,C313)
  % eliminate ->,2
  %here1
  );

(

%convert_chunk
%trace,
append(A13,[C1131],AC13),
get_up_to_next_chunk(AC13,[],C313)
,E4=E5
)),

%trace,
foldr(append,[C31,C311,C313],C314),

(true%Wrap=wrap
->
C3=[[[Dbw_n,F],C314]];
C3=[[Dbw_n,F],C314]).

%->,2
get("->",Number,D,E3,_C1,C3,_,Wrap) :-

F="->",
 get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
  get_lang_word("v",Dbw_v1),Dbw_v1=Dbw_v,
get_lang_word("on_true",Dbw_on_true1),Dbw_on_true1=Dbw_on_true,
get_lang_word("on_false",Dbw_on_false1),Dbw_on_false1=Dbw_on_false,
get_lang_word("go_after",Dbw_go_after1),Dbw_go_after1=Dbw_go_after,get_lang_word("go_to_predicates",Dbw_go_to_predicates1),Dbw_go_to_predicates1=Dbw_go_to_predicates,

 append(A,C,D),
(Wrap=nowrap->not(A=[]);true),

 C=[C111|E],
 
%trace,
 C111=[Number2,[Dbw_on_true,_N1],[Dbw_go_after,_],[Dbw_on_false,_Number3],[Dbw_go_to_predicates,_],[Dbw_n_or_v1,F2]|Arguments2],
%trace,

(Dbw_n_or_v1=Dbw_n->true;Dbw_n_or_v1=Dbw_v),

((F2="[]"->true;(F2=Dbw_not->true;(F2=Dbw_or->true;(F2="->"->true;(F2=Dbw_findall)))))->


 (%append(A,[C111],AC),
 %trace,
 convert_chunk(A,Ax1),
 get(F2,Number2,C%AC%E E*
  ,E2,[],C32,Arguments2,nowrap),
  append(Ax1
  ,C32,C31));

(
%convert_chunk
%trace,
append(A,[C111],AC),
%trace,
get_up_to_next_chunk(AC,[],C31),
E=E2
)),

 append(A1,C11,E2),

 C11=[C112|E1],
 
 %trace,
 C112=[Number31,[Dbw_on_true,A3],[Dbw_go_after,B],[Dbw_on_false,_Number4],[Dbw_go_to_predicates,_],[Dbw_n_or_v2,F3]|Arguments3],

(Dbw_n_or_v2=Dbw_n->true;Dbw_n_or_v2=Dbw_v),

(A3=[exit_function,Number]->true;B=[exit_function,Number]),

((F3="[]"->true;(F3=Dbw_not->true;(F3=Dbw_or->true;(F3="->"->true;(F3=Dbw_findall)))))->


 (%append(A1,[C112],AC1),
 convert_chunk(A1,Ax),
 get(F3,Number31,%E1%
 C11%,AC1%E*
  ,E3,[]%C1
  ,C3111,Arguments3,nowrap),
  append(Ax,C3111,C311));

(

%convert_chunk
%trace,
append(A1,[C112],AC1),
get_up_to_next_chunk(AC1,[],C311)
,E1=E3
)),

%trace,
foldr(append,[C31,C311],C313),

(true%Wrap=wrap
->
C3=[[[Dbw_n,F],C313]];
C3=[[Dbw_n,F],C313]).


get(Dbw_findall,Number,D,E2,_C1,C3,[Argument1,Argument2],Wrap) :-

F=Dbw_findall,

 get_lang_word("n",Dbw_n1),Dbw_n1=Dbw_n,
  get_lang_word("v",Dbw_v1),Dbw_v1=Dbw_v,
get_lang_word("on_true",Dbw_on_true1),Dbw_on_true1=Dbw_on_true,
get_lang_word("on_false",Dbw_on_false1),Dbw_on_false1=Dbw_on_false,
get_lang_word("go_after",Dbw_go_after1),Dbw_go_after1=Dbw_go_after,get_lang_word("go_to_predicates",Dbw_go_to_predicates1),Dbw_go_to_predicates1=Dbw_go_to_predicates,

get_lang_word("findall_exit_function",Dbw_findall_exit_function1),Dbw_findall_exit_function1=Dbw_findall_exit_function,
get_lang_word("findall_fail_function",Dbw_findall_fail_function1),Dbw_findall_fail_function1=Dbw_findall_fail_function,

get_lang_word("findall",Dbw_findall1),Dbw_findall1=Dbw_findall,

 append(A,C,D),
(Wrap=nowrap->not(A=[]);true),

 C=[C111|E],
 
 C111=[Number2,[Dbw_on_true,[Dbw_findall_exit_function,Number]],[Dbw_go_after,_],[Dbw_on_false,[Dbw_findall_fail_function,Number]],[Dbw_go_to_predicates,_],[Dbw_n_or_v1,F2]|Arguments2],

(Dbw_n_or_v1=Dbw_n->true;Dbw_n_or_v1=Dbw_v),

%convert_chunk
%trace,
/*
append(A,[C111],AC),
get_up_to_next_chunk(AC,[],C31),
*/



get_lang_word("not",Dbw_not1),Dbw_not1=Dbw_not,
get_lang_word("or",Dbw_or1),Dbw_or1=Dbw_or,
get_lang_word("findall",Dbw_findall1),Dbw_findall1=Dbw_findall,

%trace,

((F2="[]"->true;(F2=Dbw_not->true;(F2=Dbw_or->true;(F2="->"->true;(F2=Dbw_findall)))))->


 (%append(A,[C111],AC),
 %trace,
 convert_chunk(A,Ax1),
 get(F2,Number2,C%AC%E E*
  ,E2,[],C32,Arguments2,nowrap),
  append(Ax1
  ,C32,C31));

(
%convert_chunk
%trace,
append(A,[C111],AC),
%trace,
get_up_to_next_chunk(AC,[],C31),
E=E2
)),


%C3=[C31], % "[]"
foldr(append,[[Argument1],C31,[Argument2]],Arguments3),

(true%Wrap=wrap
->
C3=[[[Dbw_n,F],Arguments3]];
C3=[[Dbw_n,F],Arguments3]).

