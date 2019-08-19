DOCS = main.pdf

FIGS = ./figure/*

BIBLIO = bib/GW_DA.bib

TEMPLATE = qbook.cls qbook.cfg

BYPROD = *.aux *.log *.out *.dvi *.blg *.bbl __tmp *~ tex/*.aux

TEX = tex/*.tex 

default: git-tag $(DOCS)

.PHONY : git-tag

git-tag:
	./git-tag.sh

main.pdf : main.tex  $(FIGS) $(BIBLIO) $(TEX) $(TEMPLATE)
	xelatex -no-pdf $(@:.pdf=) && biber --debug $(@:.pdf=) && xelatex $(@:.pdf=) && xelatex $(@:.pdf=) 
	#pdflatex $(@:.pdf=) && pdflatex $(@:.pdf=) && pdflatex $(@:.pdf=)
	#pdflatex $(@:.pdf=) && bibtex $(@:.pdf=) && pdflatex $(@:.pdf=) && pdflatex $(@:.pdf=)

clean :
	rm -f $(BYPROD)

