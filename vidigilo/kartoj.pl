:- encoding(utf8).

karto(ID, Md, D) -->
	html(
		tr(
			[
				td(Md),
				td(D),
				td(
					\ligilo_por_fenestreto(
						[
							'data-id'=ID,
							'data-maldekstra'=Md,
							'data-dekstra'=D
						],
						redaktu,
						\bildeto(pencil)
					)
				),
				td(
					\ligilo_por_fenestreto(
						[
							'data-id'=ID,
							'data-nomo'=Md+' – '+D
						],
						forigu,
						\bildeto(trash)
					)
				)
			]
		)
	).

kartoj([]) --> [].
kartoj([karto(ID, Md, D)| Koj]) -->
	html(
		[
			\karto(ID, Md, D),
			\kartoj(Koj)
		]
	).

karttabelo(Listo) -->
	html(
		table(
			class='table table-hover',
			[
				tr(
					class='hidden-xs',
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
