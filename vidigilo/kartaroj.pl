:- encoding(utf8).

kartaro(L) -->
	html(
		tr(
			[
				td(L),
				td(
					a(
						href='/demando',
						\bildeto(play)
					)
				),
				td(
					a(
						href='kartaro',
						\bildeto(pencil)
					)
				),
				td(
					\ligilo_por_fenestreto(
						[],
						forigu,
						\bildeto(trash)
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
			class='table table-hover',
			[
				tr(
					class='hidden-xs',
					[
						th('Nazwa'),
						th('Sprawdź'),
						th('Edytuj'),
						th('Usuń')
					]
				),
				\listo_da_kartaroj(Koj)
			]
		)
	).
