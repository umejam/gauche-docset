.PHONY: all gauche clean clean-all

all: gauche
	cd Gauche/doc/gauche-refj && \
	ln -s ../../../dashing.json . && \
	ln -s ../../../gauche-icon.png . && \
	dashing build gauche

gauche:
	cd Gauche && \
	./DIST gen && \
	./configure && \
	make && \
	make -C doc htmls

clean:
	cd Gauche/doc/gauche-refj && \
	rm -fr gauche.docset && \
	rm -f dashing.json && \
	rm -f gauche-icon.png

clean-all: clean
	cd Gauche/doc && \
	make clean && \
	cd ../ && \
	make clean
