FILE=citations

$(FILE).pdf: *.tex *.bib
	rubber -d $(FILE)

clean:
	\rm *.aux *.blg *.out *.bbl *.log
