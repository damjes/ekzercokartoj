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
						span(id=nomo_por_forigi, x),
						'?'
					]
				),
				\kashita_id_kampo
			],
			\sendbutono(danger, trash, 'Usuń')
		)
	).
