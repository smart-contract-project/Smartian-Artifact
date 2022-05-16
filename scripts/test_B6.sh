#!/bin/bash

SCRIPTDIR=$(dirname $0)
OUTDIR=$(realpath $SCRIPTDIR/../output)

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <iterN>"
    exit
fi

if ls $OUTDIR/B6-* 1> /dev/null 2>&1; then
    echo "$OUTDIR/B6-* exists, please remove it."
    exit 1
fi

if ls $OUTDIR/result-B6-compare 1> /dev/null 2>&1; then
    echo "$OUTDIR/result-B6-compare exists, please remove it."
    exit 1
fi

# mkdir -p $OUTDIR/result-B6

# Run smartian, ilf, sFuzz, manticore, and mythril.
for i in $(seq $1); do
    python $SCRIPTDIR/run_experiment.py B6 smartian 3600
    # python $SCRIPTDIR/run_experiment.py B6 ilf 300
    # python $SCRIPTDIR/run_experiment.py B6 sFuzz 300
    # python $SCRIPTDIR/run_experiment.py B6 manticore 3600 B6
    # python $SCRIPTDIR/run_experiment.py B6 mythril 3600
done
# mkdir -p $OUTDIR/result-B6-compare/smartian
# mv $OUTDIR/B6-smartian-* $OUTDIR/result-B6-compare/smartian/
# mkdir -p $OUTDIR/result-B6-compare/ilf
# mv $OUTDIR/B6-ilf-* $OUTDIR/result-B6-compare/ilf/
# mkdir -p $OUTDIR/result-B6-compare/sFuzz
# mv $OUTDIR/B6-sFuzz-* $OUTDIR/result-B6-compare/sFuzz/
# mkdir -p $OUTDIR/result-B6-compare/manticore
# mv $OUTDIR/B6-manticore-* $OUTDIR/result-B6-compare/manticore/
# mkdir -p $OUTDIR/result-B6-compare/mythril
# mv $OUTDIR/B6-mythril-* $OUTDIR/result-B6-compare/mythril/
