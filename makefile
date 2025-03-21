# makefile: tex -> pdf
# v 3.0
file_name = multinomial_via_poisson

$(file_name).pdf: $(file_name).tex
	# protection against biber error
	# http://tex.stackexchange.com/questions/140814/
	rm -rf `biber --cache`

	# create pdf
	# will automatically run pdflatex/biber if necessary
	latexmk -xelatex -shell-escape $(file_name).tex

	# clean auxillary files
	latexmk -c $(file_name).tex

# $(file_name).tex : $(file_name).Rnw
#	Rscript -e "library(knitr); knit('$(file_name).Rnw')"


clean:
	-rm $(file_name).pdf $(file_name).fls $(file_name).log $(file_name).out $(file_name).aux $(file_name).fdb_latexmk $(file_name)-concordance.tex
