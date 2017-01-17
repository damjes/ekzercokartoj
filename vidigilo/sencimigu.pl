montru_peton([]) --> [].
montru_peton([duo(Nomo, Valoro) | T]) -->
	html(
		[
			tr(
				[
					td(Nomo),
					td(Valoro)
				]
			),
			\montru_peton(T)
		]
	).

travidebla_ligilo(L) -->
	html(
		a(href=L, L)
	).

petero(Petero, duo(NomoS, ValoroS)) :-
	Petero =.. [Nomo, Valoro],
	with_output_to(string(NomoS), write_canonical(Nomo)),
	with_output_to(string(ValoroS), write_canonical(Valoro)).

post_datumoj(Peto) -->
	{\+ member(method(post), Peto)},
	[].
post_datumoj(Peto) -->
	{
		member(method(post), Peto),
		http_read_data(Peto, S, [to(string)])
	},
	html(
		[
			h2('POST'),
			p(S)
		]
	).

sencimigu(Peto) :-
	maplist(petero, Peto, PetoLista),
	reply_html_page(
		etoso,
		title('Sencimigilo'),
		[
			\jumbo(h1('Sencimigilo')),
			\enhavo(
				[
					\post_datumoj(Peto),
					h2('Peto'),
					table(
						class='table table-hover',
						[
							tr(
								[
									th('Nomo'),
									th('Valoro')
								]
							),
							\montru_peton(PetoLista)
						]
					),
					h2('Ligiloj')
				]
			)
		]
	).
