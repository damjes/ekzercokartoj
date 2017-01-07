:- use_module(library(http/html_write)).

:- [kapo].

user:body(etoso, Korpo) -->
	html(body(Korpo)).

enhavo(E) -->
	html(
		div(
			class=container,
			E
		)
	).

butono(Klaso, Ligilo, Teksto) -->
	html(
		a(
			[
				class='btn btn-block btn-lg btn-'+Klaso,
				role=button,
				href=Ligilo
			],
			Teksto
		)
	).

largha_butono(Largheco, Klaso, Ligilo, Teksto) -->
	html(
		div(
			class='col-md-'+Largheco,
			\butono(Klaso, Ligilo, Teksto)
		)
	).

bildeto(Nomo) -->
	html(
		span(class='glyphicon glyphicon-'+Nomo, [])
	).

karto(Md, D) -->
	html(
		tr(
			[
				td(Md),
				td(D),
				td(\bildeto(pencil)),
				td(\bildeto(remove))
			]
		)
	).

kartoj([]) --> [].
kartoj([karto(Md, D)| Koj]) -->
	html(
		[
			\karto(Md, D),
			\kartoj(Koj)
		]
	).
karttabelo(Listo) -->
	html(
		table(
			class=table,
			[
				tr(
					[
						th('Lewa strona'),
						th('Prawa strona'),
						th('Edytuj'),
						th('Usuń')
					]
				),
				\kartoj(Listo)
			]
		)
	).

kartaro(L) -->
	html(
		tr(
			[
				td(L),
				td(
					a(
						href='/demando',
						\bildeto('eye-open')
					)
				),
				td(
					a(
						href='kartaro',
						\bildeto(pencil)
					)
				)
			]
		)
	).

listo_da_kartaroj([]) --> [].
listo_da_kartaroj([K|Koj]) -->
	html(
		[
			\kartaro(K),
			\listo_da_kartaroj(Koj)
		]
	).

kartartabelo(Koj) -->
	html(
		table(
			class=table,
			[
				tr(
					[
						th('Nazwa'),
						th('Sprawdź'),
						th('Edytuj')
					]
				),
				\listo_da_kartaroj(Koj)
			]
		)
	).

jumbo(Internajho) -->
	html(
		div(class=jumbotron,
			div(class=container, Internajho)
		)
	).

well(Internajho) -->
	html(
		div(
			class='well well-lg',
			p(Internajho)
		)
	).

respondo -->
	html(
		div(
			class='form-group',
			input(
				[
					type=text,
					class='form-control',
					id=respondo,
					placeholder='Twoja odpowiedź'
				],
				[]
			)
		)
	).

duma(_Peto) :-
	reply_html_page(etoso, [], \enhavo(p(costam))).

ne_ensalutita(_Peto) :-
	reply_html_page(
		etoso,
		title('Saluton!'),
		[
			\jumbo(
				[
					h1('Witaj!'),
					p('Lorem ipsum dolor sit amet')
				]
			),
			\enhavo(
				div(
					class=row,
					[
						\largha_butono(6, 'success', '/ensalutita', 'Zaloguj'),
						\largha_butono(6, 'primary', '#', 'Załóż konto')
					]
				)
			)
		]
	).

listo_da_vortoj(_Peto) :-
	reply_html_page(
		etoso,
		title('Lista fiszek'),
		[
			\jumbo(
				[
					h1('Kartoteka: Rumuński A1'),
					h2('Lista fiszek')
				]
			),
			\enhavo(
				[
					\karttabelo(
						[
							karto(kapusta, 'varză'),
							karto(kurczak, pui),
							karto(mysz, 'șoarece')
						]
					),
					\butono(info, '/ensalutita', 'Wróć do listy fiszek'),
					\butono(warning, /, 'Wyloguj')
				]
			)
		]
	).

listo_da_kartaroj(_Peto) :-
	reply_html_page(
		etoso,
		title('Lista kartotek'),
		[
			\jumbo(h1('Lista kartotek')),
			\enhavo(
				[
					\kartartabelo(
						[
							'Rumuński A1',
							'Esperanto A1'
						]
					),
					\butono(warning, /, 'Wyloguj')
				]
			)
		]
	).

demando(_Peto) :-
	reply_html_page(
		etoso,
		title('Kartoteka: Rumuński A1'),
		[
			\jumbo(h1('Rumuński A1')),
			\enhavo(
				[
					\well('brânză'),
					\well(\respondo),
					\butono(info, '/respondo', 'Pokaż odpowiedź')
				]
			)
		]
	).

respondo(_Peto) :-
	reply_html_page(
		etoso,
		title('Kartoteka: Rumuński A1'),
		[
			\jumbo(h1('Rumuński A1')),
			\enhavo(
				[
					\well('brânză'),
					\well(ser),
					div(
						class=row,
						[
							\largha_butono(3, primary, /, 'Bardzo dobrze'),
							\largha_butono(3, success, /, 'Dobrze'),
							\largha_butono(3, warning, /, 'Słabo'),
							\largha_butono(3, danger, /, 'Źle')
						]
					),
					div(class=row, &(nbsp)),
					div(class=row, \largha_butono(12, default, '/ensalutita', 'Zakończ podejście'))
				]
			)
		]
	).
