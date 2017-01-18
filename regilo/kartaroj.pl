:- encoding(utf8).

kreu_kartaron :-
	http_parametroj([nomo(Nomo)]),
	http_session_data(uzanto(Uzanto)),
	nova(kartaro(_, Uzanto, Nomo)),
	listo_da_kartaroj.

forigu_kartaron :-
	http_parametroj([id(ID)]),
	forigu(kartaro(ID, _, _)),
	forigu(karto(_, ID, _, _, _)),
	listo_da_kartaroj.

alinomu_kartaron(ID) :-
	http_parametroj([nomo(Nomo)]),
	http_session_data(uzanto(Uzanto)),
	anstatauigi(kartaro(ID, Uzanto, _), kartaro(ID, Uzanto, Nomo)),
	listo_da_vortoj(ID).
