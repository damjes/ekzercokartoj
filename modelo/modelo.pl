:- encoding(utf8).

:- use_module(library(memo)).

:- volatile_memo tagoj_sekundoj(+number, -number).
:- volatile_memo substrekigu(+atom, -atom).
:- volatile_memo persistency_nomoj(+atom, +atom, -atom).

:- mutex_create(_, [alias(datumbaza)]).

tagoj_sekundoj(Tagoj, Sekundoj) :-
	Sekundoj is Tagoj * 24 * 60 * 60.

plus_tagoj(Tagoj, Estonteca) :-
	get_time(Nuna),
	tagoj_sekundoj(Tagoj, Sekundoj),
	Estonteca is Nuna + Sekundoj.

substrekigu(Atomo, Komenco) :- % komenco de identigilo
	atom_concat(Atomo, '_', Komenco).

persistency_nomoj(Farado, Tipo, Nomo) :- % kreado de: assert_iaTipo
	atom_concat(Farado, '_', FaradoKun),
	atom_concat(FaradoKun, Tipo, Nomo).

persistency_faru(Objekto) :-
	%writeln(Objekto),
	Objekto =.. [Farado, TipoKunDatumoj],
	%writeln(TipoKunDatumoj),
	TipoKunDatumoj =.. [Tipo | Datumoj],
	persistency_nomoj(Farado, Tipo, NovaNomo),
	Celo =.. [NovaNomo | Datumoj],
	call(Celo), !.

anstatauigi(Malnova, Nova) :-
	with_mutex(
		datumbaza,
		[
			persistency_faru(retractall(Malnova)),
			persistency_faru(assert(Nova))
		]
	), !.

nova(Novajho) :-
	Novajho =.. [Nomo, ID | _],
	substrekigu(Nomo, Komenco),
	gensym(Komenco, ID),
	persistency_faru(assert(Novajho)), !.

uzanto_haketo(Nomo, Pasvorto, uzanto(_, Nomo, Haketo)) :-
	sha_hash(Pasvorto, Haketo, [algorithm(sha512)]).

uzanta_id(Nomo, Pasvorto, ID) :-
	Uzanto = uzanto(ID, _, _),
	uzanto_haketo(Nomo, Pasvorto, Uzanto),
	call(Uzanto).

nova_uzanto(Nomo, Pasvorto, ID) :-
	Uzanto = uzanto(ID, _, _),
	uzanto_haketo(Nomo, Pasvorto, Uzanto),
	nova(Uzanto).
