papername=meeting_proposal
viewcmd=open


${papername}.pdf : ${papername}.aux *.tex ${papername}.bib
	pdflatex ${papername}

${papername}.aux : *.tex ${papername}.bib
	pdflatex ${papername} && bibtex ${papername} && pdflatex ${papername}

clean :
	rm -f *bbl *blg *log *aux *Notes.bib ${papername}.tar ${papername}_flat.* *fgx *tbx *vdx *out

view : ${papername}.pdf
	${viewcmd} ${papername}.pdf
