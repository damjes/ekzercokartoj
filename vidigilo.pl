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

malplena_vico -->
	html(
		div(class=row, &(nbsp))
	).

bildeto(Nomo) -->
	html(
		span(class='glyphicon glyphicon-'+Nomo, [])
	).

bildeto_teksto(Bildeto, Teksto) -->
	html(
		[
			\bildeto(Bildeto),
			&(nbsp),
			Teksto
		]
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

butono_por_fenestreto(Largheco, Klaso, Bildeto, FenestretaID, Teksto) -->
	html(
		div(
			class='col-md-'+Largheco,
			button(
				[
					class='btn btn-block btn-lg btn-'+Klaso,
					'data-target'="#"+FenestretaID,
					'data-toggle'=modal,
					type=button
				],
				\bildeto_teksto(Bildeto, Teksto)
			)
		)
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

tekstokampo(Tipo, ID, Priskribo) -->
	html(
		div(
			class='form-group',
			[
				label(for=ID, Priskribo),
				input(
					[
						class='form-control',
						id=ID,
						placeholder=Priskribo,
						type=Tipo
					],
					[]
				)
			]
		)
	).

sendbutono(Klaso, Bildeto, Teksto) -->
	html(
		button(
			[
				class='btn btn-'+Klaso,
				type=submit
			],
			\bildeto_teksto(Bildeto, Teksto)
		)
	).

fenestreto(ID, Enhavo) -->
	html(
		div(
			[
				class='modal fade',
				id=ID,
				tabindex='-1',
				role=dialog
			],
			div(
				[
					class='modal-dialog',
					role=document
				],
				div(
					class='modal-content',
					Enhavo
				)
			)
		)
	).

fenestreta_fermilo_x -->
	html(
		button(
			[
				aria-label="Close",
				class=close,
				'data-dismiss'=modal,
				type=button
			],
			span(
				'aria-hidden'=true,
				&(times)
			)
		)
	).

fenestreta_enhavo(Titolo, Enhavo, Subo) -->
	html(
		[
			div(
				class='modal-header',
				[
					\fenestreta_fermilo_x,
					h4(
						class='modal-title',
						Titolo
					)
				]
			),
			div(class='modal-body', Enhavo),
			div(class='modal-footer', Subo)
		]
	).

fenestreta_fermilo_butono(Klaso, Bildeto, Teksto) -->
	html(
		button(
			[
				class='btn btn-'+Klaso,
				'data-dismiss'=modal,
				type=button
			],
			\bildeto_teksto(Bildeto, Teksto)
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

fenestreta_formularo(ID, Akcio, Titolo, Kampoj, Akceptilo) -->
	html(
		\fenestreto(
			ID,
			form(
				[
					action=Akcio,
					method='POST'
				],
				\fenestreta_enhavo(
					Titolo,
					Kampoj,
					[
						\fenestreta_fermilo_butono(default, remove, 'Zamknij'),
						Akceptilo
					]
				)
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
			\fenestreta_formularo(
				ensalutu,
				'/',
				'Zaloguj',
				[
					\tekstokampo(text, uzanto, 'Użytkownik'),
					\tekstokampo(password, pasvorto, 'Hasło')
				],
				\sendbutono(primary, ok, 'Zaloguj')
			),
			\fenestreta_formularo(
				registrigu,
				'/',
				'Zarejestruj się',
				[
					\tekstokampo(text, uzanto, 'Użytkownik'),
					\tekstokampo(password, pasvorto, 'Hasło'),
					\tekstokampo(text, invitkodo, 'Kod zaproszenia')
				],
				\sendbutono(success, user, 'Załóż konto')
			),
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
						\butono_por_fenestreto(6, 'success', 'log-in', ensalutu, 'Zaloguj'),
						\butono_por_fenestreto(6, 'primary', user, registrigu, 'Załóż konto')
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
					\malplena_vico,
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
					\malplena_vico,
					div(class=row, \largha_butono(12, default, '/ensalutita', 'Zakończ podejście'))
				]
			)
		]
	).
