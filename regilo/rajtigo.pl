:- encoding(utf8).

ensalutu(Sukceso) :-
	http_parametroj([uzanto(Uzanto), pasvorto(Pasvorto)]),
	uzanto(ID, Uzanto, Haketo),
	(
		sha_hash(Pasvorto, Haketo, [algorithm(sha512)])
	*->
		http_session_retractall(_),
		http_session_assert(uzanto(ID)),
		call(Sukceso)
	;
		ne_ensalutita
	).

kreu_konton :-
	http_parametroj([uzanto(Uzanto), pasvorto(Pasvorto), invitkodo("szybolet")]),
	\+ uzanto(_, Uzanto, _),
	nova_uzanto(Uzanto, Pasvorto, ID),
	http_session_retractall(_),
	http_session_assert(uzanto(ID)),
	ne_ensalutita.

ensalutita(Sukceso) :-
	(
		http_session_data(uzanto(_))
	*->
		call(Sukceso)
	;
		ne_ensalutita
	).

elsalutu :-
	http_session_retractall(_),
	ne_ensalutita.
