:- encoding(utf8).

kreu_karton(Kartaro) :-
	http_parametroj([maldekstra(Md), dekstra(D)]),
	nova(karto(_, Kartaro, Md, D, nova)),
	listo_da_vortoj(Kartaro).

forigu_karton(Kartaro) :-
	http_parametroj([id(ID)]),
	forigu(karto(ID, _, _, _, _)),
	listo_da_vortoj(Kartaro).

redaktu_karton(Kartaro) :-
	http_parametroj([id(ID), maldekstra(Md), dekstra(D)]),
	anstatauigi(
		karto(ID, Kartaro, _, _, _),
		karto(ID, Kartaro, Md, D, nova)
	),
	listo_da_vortoj(Kartaro).
