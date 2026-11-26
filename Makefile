XELATEX = xelatex -interaction=nonstopmode -halt-on-error

all: exam.pdf answer_key.pdf

exam.pdf: exam.tex gaokao-exam.sty
	$(XELATEX) exam.tex
	$(XELATEX) exam.tex

answer_key.pdf: answer_key.tex gaokao-exam.sty
	$(XELATEX) answer_key.tex
	$(XELATEX) answer_key.tex

clean:
	rm -f *.aux *.log *.out *.xdv *.synctex.gz

.PHONY: all clean
