:- encoding(utf8).

karto(Md, D) -->
	html(
		tr(
			[
				td(Md),
				td(D),
				td(\bildeto(pencil)),
				td(
					\ligilo_por_fenestreto([data-id=ajdi, data-nomo=nazwa], forigu, \bildeto(trash))
				)
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
