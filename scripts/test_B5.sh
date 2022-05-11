#!/bin/bash

SCRIPTDIR=$(dirname $0)
OUTDIR=$(realpath $SCRIPTDIR/../output)

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <iterN>"
    exit
fi

if ls $OUTDIR/B5-* 1> /dev/null 2>&1; then
    echo "$OUTDIR/B5-* exists, please remove it."
    exit 1
fi

if ls $OUTDIR/result-B5-compare 1> /dev/null 2>&1; then
    echo "$OUTDIR/result-B5-compare exists, please remove it."
    exit 1
fi

# mkdir -p $OUTDIR/result-B5

# Run smartian, ilf, sFuzz, manticore, and mythril.
for i in $(seq $1); do
    python $SCRIPTDIR/run_experiment.py B5 smartian 300
    # python $SCRIPTDIR/run_experiment.py B5 ilf 300
    # python $SCRIPTDIR/run_experiment.py B5 sFuzz 300
    # python $SCRIPTDIR/run_experiment.py B5 manticore 3600 B5
    # python $SCRIPTDIR/run_experiment.py B5 mythril 3600
done
# mkdir -p $OUTDIR/result-B5-compare/smartian
# mv $OUTDIR/B5-smartian-* $OUTDIR/result-B5-compare/smartian/
# mkdir -p $OUTDIR/result-B5-compare/ilf
# mv $OUTDIR/B5-ilf-* $OUTDIR/result-B5-compare/ilf/
# mkdir -p $OUTDIR/result-B5-compare/sFuzz
# mv $OUTDIR/B5-sFuzz-* $OUTDIR/result-B5-compare/sFuzz/
# mkdir -p $OUTDIR/result-B5-compare/manticore
# mv $OUTDIR/B5-manticore-* $OUTDIR/result-B5-compare/manticore/
# mkdir -p $OUTDIR/result-B5-compare/mythril
# mv $OUTDIR/B5-mythril-* $OUTDIR/result-B5-compare/mythril/
