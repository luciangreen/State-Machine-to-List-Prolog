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

* For example, convert a List Prolog test algorithm to SM form and  back to LP form.  (Replace [1] with the list of test numbers below.)

``` A=[1],findall(B,(member(B,A),test(B,Q,F,R),query_box(Q,Query1,F,Functions1),convert_to_grammar_part1(Functions1,[],Functions2,_),add_line_numbers_to_algorithm1(Functions2,Functions2a),find_pred_numbers(Functions2a,[],Pred_numbers),find_state_machine1(Functions2a,Functions3,Pred_numbers),sm_to_lp(Functions3,Functions2b),writeln1(Functions2),writeln1(Functions2b)),C),!.                  

[[[n,query_box_1],":-",[[[n,function]]]],[[n,function],":-",[[[n,equals4_on]]]]]
[[[n,query_box_1],":-",[[[n,function]]]],[[n,function],":-",[[[n,equals4_on]]]]]
```

* The original and converted algorithm are the same, showing the converter has worked.

# Authors

Lucian Green - Initial programmer - <a href="https://www.lucianacademy.com/">Lucian Academy</a>

# License

I licensed this project under the BSD3 License - see the <a href="LICENSE">LICENSE.md</a> file for details

