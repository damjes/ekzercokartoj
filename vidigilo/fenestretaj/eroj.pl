:- encoding(utf8).

kashita_id_kampo -->
	html(
		input(
			[
				id=id_por_forigi,
				type=text % hidden
			]
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
