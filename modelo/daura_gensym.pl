:- encoding(utf8).

restaurigu_unu(Nomo, Valoro) :-
	recordz('$gensym', Nomo),
	flag(Nomo, _, Valoro).

restaurigu_gensym :-
	(
		daura_gensym(Nomo, Valoro),
		restaurigu_unu(Nomo, Valoro),
		fail
	)
	;
		true.

savkopiu(Nomo) :-
	flag(Nomo, Valoro, Valoro),
	retractall_daura_gensym(Nomo, _),
	assert_daura_gensym(Nomo, Valoro).

savkopiu_gensym :-
	(
		recorded('$gensym', Nomo),
		savkopiu(Nomo),
		fail
	)
	;
		true.

:- at_halt(savkopiu_gensym).

:- restaurigu_gensym.
