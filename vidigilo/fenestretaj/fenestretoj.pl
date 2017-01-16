:- encoding(utf8).

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

forigjesiga_fenestreto(Akcio, Teksto) -->
	html(
		\fenestreta_formularo(
			forigu,
			Akcio,
			'Usuwanie',
			[
				p(
					[
						'Czy na pewno chcesz usunąć ',
						Teksto,
						' ',
						&(bdquo),
						span(id=nomo_por_forigi, x),
						&(rdquo),
						'?'
					]
				),
				\kashita_id_kampo
			],
			\sendbutono(danger, trash, 'Usuń')
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
