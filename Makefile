ifneq ($(shell command -v xelatex 2>/dev/null),)
  COMPILE_EXAM = xelatex -interaction=nonstopmode -halt-on-error exam.tex && xelatex -interaction=nonstopmode -halt-on-error exam.tex
  COMPILE_KEY  = xelatex -interaction=nonstopmode -halt-on-error answer_key.tex && xelatex -interaction=nonstopmode -halt-on-error answer_key.tex
else
  COMPILE_EXAM = tectonic exam.tex
  COMPILE_KEY  = tectonic answer_key.tex
endif

all: exam.pdf answer_key.pdf

exam.pdf: exam.tex gaokao-exam.sty
	$(COMPILE_EXAM)

answer_key.pdf: answer_key.tex gaokao-exam.sty
	$(COMPILE_KEY)

clean:
	rm -f *.aux *.log *.out *.xdv *.synctex.gz

.PHONY: all clean
