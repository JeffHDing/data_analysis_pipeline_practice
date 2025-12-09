.PHONY: all dats figs clean-dats clean-figs clean-all

all: docs/index.html

dats: results/isles.dat \
results/abyss.dat \
results/last.dat \
results/sierra.dat

results/isles.dat : scripts/wordcount.py data/isles.txt
	python scripts/wordcount.py \
		--input_file=data/isles.txt \
		--output_file=results/isles.dat
results/abyss.dat : scripts/wordcount.py data/abyss.txt
	python scripts/wordcount.py \
		--input_file=data/abyss.txt \
		--output_file=results/abyss.dat
results/last.dat : scripts/wordcount.py data/last.txt
	python scripts/wordcount.py \
		--input_file=data/last.txt \
		--output_file=results/last.dat
results/sierra.dat : scripts/wordcount.py data/sierra.txt
	python scripts/wordcount.py \
		--input_file=data/sierra.txt \
		--output_file=results/sierra.dat

# plot
figs : results/figure/isles.png \
	results/figure/abyss.png \
	results/figure/last.png \
	results/figure/sierra.png

results/figure/isles.png : scripts/plotcount.py results/isles.dat
	python scripts/plotcount.py \
		--input_file=results/isles.dat \
		--output_file=results/figure/isles.png
results/figure/abyss.png : scripts/plotcount.py results/abyss.dat
	python scripts/plotcount.py \
		--input_file=results/abyss.dat \
		--output_file=results/figure/abyss.png
results/figure/last.png : scripts/plotcount.py results/last.dat
	python scripts/plotcount.py \
		--input_file=results/last.dat \
		--output_file=results/figure/last.png
results/figure/sierra.png : scripts/plotcount.py results/sierra.dat
	python scripts/plotcount.py \
		--input_file=results/sierra.dat \
		--output_file=results/figure/sierra.png

# write the report
docs/index.html : report/count_report.qmd figs
	cd report && quarto render count_report.qmd --output-dir ../docs --output index.html

clean-dats :
	rm -f results/isles.dat \
		results/abyss.dat \
		results/last.dat \
		results/sierra.dat

clean-figs :
	rm -f results/figure/isles.png \
	results/figure/abyss.png \
	results/figure/last.png \
	results/figure/sierra.png

clean-all : clean-dats \
	clean-figs
	rm -f docs/index.html
	rm -rf docs/count_report_files
