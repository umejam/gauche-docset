.PHONY: all docset clean clean-all

DOCDIR := Gauche/doc/gauche-refj

all: docset

docset: $(DOCDIR)/gauche.docset

$(DOCDIR)/gauche.docset: $(DOCDIR)/index.html $(DOCDIR)/dashing.json $(DOCDIR)/gauche-icon.png
	cd $(DOCDIR) && dashing build gauche

$(DOCDIR)/dashing.json: dashing.json
	cd $(DOCDIR) && ln -s ../../../dashing.json .
$(DOCDIR)/gauche-icon.png: gauche-icon.png
	cd $(DOCDIR) && ln -s ../../../gauche-icon.png .

$(DOCDIR)/index.html:
	cd Gauche && \
	./DIST gen && \
	./configure --disable-dependency-tracking --enable-multibyte=utf-8 CC=clang && \
	make && \
	make -C doc htmls

clean:
	cd $(DOCDIR) && \
	rm -fr gauche.docset && \
	rm -f dashing.json && \
	rm -f gauche-icon.png

clean-all: clean
	cd Gauche/doc && \
	make clean && \
	cd ../ && \
	make clean
