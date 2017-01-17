:- encoding(utf8).

user:body(etoso, Korpo) -->
	html(
		body(
			[
				Korpo,
				\piedo
			]
		)
	).

piedo -->
	html(
		enhavo(
			[
				%hr(class=soften, []),
				br([]),
				footer(
					class='text-center small footer',
					[
						p(
							[
								'copyleft by ',
								a(href='https://matma6.net/', matma6),
								' 2016-2017 under ',
								a(href='https://www.openhub.net/licenses/m6pl', 'M6PL'),
								'.'
							]
						),
						p(
							[
								'Dumnie wspierane przez ',
								a(href='http://www.swi-prolog.org/', 'SWI-Prolog'),
								'. ',
								a(href='https://github.com/matma6/ekzercokartoj', 'Kod źródłowy')
							]
						)
					]
				)
			]
		)
	).
