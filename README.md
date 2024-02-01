# State Machine to List Prolog

* Convert State Saving Interpreter State Machines to List Prolog algorithms.


# Getting Started

Please read the following instructions on how to install the project on your computer for converting algorithms.

# Prerequisites

* Please download and install SWI-Prolog for your machine at `https://www.swi-prolog.org/build/`.

* You may need to install gawk using Homebrew.

* Install <a href="https://github.com/soimort/translate-shell">Translation Shell</a> on Mac, etc.
Change line in
```
culturaltranslationtool/ctt2.pl
trans_location("../../../gawk/trans").
```
to correct location of <a href="https://github.com/soimort/translate-shell">trans</a>.

# 1. Install manually

* Download:
* <a href="https://github.com/luciangreen/State-Machine-to-List-Prolog">this repository</a>.
* <a href="https://github.com/luciangreen/SSI">State Saving Interpreter</a>. (Note: see SSI's page for additional repositories needed.)

# 2. Or Install from List Prolog Package Manager (LPPM)

* Download the <a href="https://github.com/luciangreen/List-Prolog-Package-Manager">LPPM Repository</a>:

```
mkdir GitHub
cd GitHub/
git clone https://github.com/luciangreen/List-Prolog-Package-Manager.git
cd List-Prolog-Package-Manager
swipl
['lppm'].
lppm_install("luciangreen","State-Machine-to-List-Prolog").
halt
```

# Running

* In Shell:
`cd State-Machine-to-List-Prolog`
`swipl`
`['sm_to_lp.pl'].`

* For example, convert a List Prolog test algorithm to SM form and  back to LP form and test they have the same result.  (Replace `3` in `numbers(3,1,[],A)` with the  maximum test number below.)

```
?- numbers(10,1,[],A),findall(B,(Debug=off,member(B,A),test(B,Q,F,R),query_box(Q,Query1,F,Functions1),convert_to_grammar_part1(Functions1,[],Functions2,_),add_line_numbers_to_algorithm1(Functions2,Functions2a),find_pred_numbers(Functions2a,[],Pred_numbers),find_state_machine1(Functions2a,Functions3,Pred_numbers),sm_to_lp(Functions3,Functions2b),lucianpl(Debug,Q,F,R1),Functions2b=[[_|_]|Functions2c],lucianpl(off,Q,Functions2c,R2),(R1=R2->Result=success;Result=fail),writeln([B,Result])),C),sort(C,C1),writeln(C1).

[[1,success],[2,success],[3,success],[4,success],[5,success],[6,success],[7,success],[8,success],[9,success],[10,success]]
```

* The original and converted algorithm have the same results, showing the converter has worked.

* To pretty print the converted List Prolog for a test number:

```
A=[250],findall(B,(member(B,A),test(B,Q,F,R),query_box(Q,Query1,F,Functions1),convert_to_grammar_part1(Functions1,[],Functions2,_),add_line_numbers_to_algorithm1(Functions2,Functions2a),find_pred_numbers(Functions2a,[],Pred_numbers),find_state_machine1(Functions2a,Functions3,Pred_numbers),sm_to_lp(Functions3,Functions2b),pp0(Functions2,Functions21),writeln(Functions21),pp0(Functions2b,Functions2b1),writeln(Functions2b1)),C).

[
[[n,query_box_1],[[v,b]],":-",
[
	[[n,a],[[v,b]]]
]],
[[n,a],[[v,b]],":-",
[
	[[n,"->"],
	[
		[
		[[n,c],[[v,c]]]
		],

		[
		[[n,c],[[v,c]]]
		],

		[[n,"->"],
		[
			[
			[[n,c],[[v,c]]]
			],

			[
			[[n,c],[[v,c]]]
			],

			[
			[[n,c],[[v,c]]]
			]
		]]
	]]
]]
]
```

# Authors

Lucian Green - Initial programmer - <a href="https://www.lucianacademy.com/">Lucian Academy</a>

# License

I licensed this project under the BSD3 License - see the <a href="LICENSE">LICENSE.md</a> file for details

