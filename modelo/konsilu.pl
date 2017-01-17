:- encoding(utf8).

:- dynamic kartaro/3,
	kartaro/5,
	uzanto/3.

:- [library(persistency)].

:- persistent uzanto(id:text, nomo:text, haketo:list).
:- persistent kartaro(id:text, uzanto:text, nomo:text).
:- persistent karto(id:text, kartaro:text, maldekstra:text, dekstra:text, tempo:atomic).

:- persistent daura_gensym(nomo:text, valoro:number).

:- db_attach('datumbazo.db', []).

:- [modelo].

:- [daura_gensym].
