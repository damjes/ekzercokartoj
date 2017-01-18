:- encoding(utf8).

aro(0).
aro(1).
aro(2).
aro(3).

prenu_el(Kartaro, m, K) :-
	get_time(NunaTempo),
	karto(K, Kartaro, _, _, Tempo),
	Tempo \= nova,
	Tempo < NunaTempo.
prenu_el(Kartaro, n, K) :-
	http_session_data(limo(L)), % limo da novaj vortoj por demandado
	L > 0,
	L1 is L-1,
	http_session_retractall(limo(_)),
	http_session_assert(limo(L1)),
	karto(K, Kartaro, _, _, nova).
prenu_el(_, Aro, K) :-
	aro(Aro),
	http_session_assert(aro(Aro, K)).

% a – malbone
iras(_, a, 0).
% b
iras(m, b, 0).
iras(n, b, 0).
iras(0, b, 0).
iras(1, b, 1).
iras(2, b, 2).
iras(3, b, 3).
% c
iras(m, c, 1).
iras(n, c, 1).
iras(0, c, 1).
iras(1, c, 2).
iras(2, c, 3).
iras(3, c, 8).
% d
iras(_, d, 9).

sekva(m, n).
sekva(n, 0).
sekva(0, 1).
sekva(1, 2).
sekva(2, 3).
sekva(3, m).

purigu_demandadon :-
	http_session_retractall(aro(_, _)),
	http_session_retractall(limo(_)).

prenu_sekvan(Kartaro, KomencaAro, AntauaAro, NunaAro, ID) :-
	sekva(AntauaAro, SekvaAro),
	SekvaAro \= KomencaAro, % ni revenas hejmen, do ciklo, do fiasku
	(
		prenu_el(Kartaro, SekvaAro, ID)
	*->
		NunaAro = SekvaAro
	;
		% oni prenis nenion
		prenu_sekvan(Kartaro, KomencaAro, SekvaAro, NunaAro, ID)
	).
