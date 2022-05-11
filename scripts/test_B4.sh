#!/bin/bash

SCRIPTDIR=$(dirname $0)
OUTDIR=$(realpath $SCRIPTDIR/../output)

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <iterN>"
    exit
fi

if ls $OUTDIR/B4-* 1> /dev/null 2>&1; then
    echo "$OUTDIR/B4-* exists, please remove it."
    exit 1
fi

if ls $OUTDIR/result-B4-compare 1> /dev/null 2>&1; then
    echo "$OUTDIR/result-B4-compare exists, please remove it."
    exit 1
fi

# mkdir -p $OUTDIR/result-B4

# Run smartian, ilf, sFuzz, manticore, and mythril.
for i in $(seq $1); do
    python $SCRIPTDIR/run_experiment.py B4 smartian 300
    # python $SCRIPTDIR/run_experiment.py B4 ilf 300
    # python $SCRIPTDIR/run_experiment.py B4 sFuzz 300
    # python $SCRIPTDIR/run_experiment.py B4 manticore 3600 B4
    # python $SCRIPTDIR/run_experiment.py B4 mythril 3600
done
# mkdir -p $OUTDIR/result-B4-compare/smartian
# mv $OUTDIR/B4-smartian-* $OUTDIR/result-B4-compare/smartian/
# mkdir -p $OUTDIR/result-B4-compare/ilf
# mv $OUTDIR/B4-ilf-* $OUTDIR/result-B4-compare/ilf/
# mkdir -p $OUTDIR/result-B4-compare/sFuzz
# mv $OUTDIR/B4-sFuzz-* $OUTDIR/result-B4-compare/sFuzz/
# mkdir -p $OUTDIR/result-B4-compare/manticore
# mv $OUTDIR/B4-manticore-* $OUTDIR/result-B4-compare/manticore/
# mkdir -p $OUTDIR/result-B4-compare/mythril
# mv $OUTDIR/B4-mythril-* $OUTDIR/result-B4-compare/mythril/
