# perform wordcout on novels
python scripts/wordcount.py \
    --input_file=data/isles.txt \
    --output_file=results/isles.dat

# create plots
python scripts/plotcount.py \
    --input_file=results/isles.dat \
    --output_file=results/figure/isles.png