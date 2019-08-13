DOCS = main.pdf

FIGS = ./figure/*

BIBLIO = bib/GW_DA.bib

BYPROD = *.aux *.log *.out *.dvi *.blg *.bbl __tmp *~

TEX = tex/*.tex 

default: git-tag $(DOCS)

.PHONY : git-tag

git-tag:
	./git-tag.sh

main.pdf : main.tex  $(FIGS) $(BIBLIO) $(TEX)
	xelatex $(@:.pdf=) && biber --debug $(@:.pdf=) && xelatex $(@:.pdf=) && xelatex $(@:.pdf=) 
	#pdflatex $(@:.pdf=) && pdflatex $(@:.pdf=) && pdflatex $(@:.pdf=)
	#pdflatex $(@:.pdf=) && bibtex $(@:.pdf=) && pdflatex $(@:.pdf=) && pdflatex $(@:.pdf=)

clean :
	rm -f $(BYPROD)

