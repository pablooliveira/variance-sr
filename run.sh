#!/bin/bash

rm -rf results.tab
export VFC_BACKENDS_LOGFILE='verificarlo.log'
for n in 250 500 1000 2000 4000 8000 16000 32000 64000 128000 256000 512000 1024000 2048000; do
    ./variance_ref $n 1 | sed -e "s/^/$n ref /" >> results.tab

    ./variance_ieee $n 1 | sed -e "s/^/$n binary32 /" >> results.tab

    VFC_BACKENDS="libinterflop_mca.so --mode=rr" ./variance_sr $n 29 | sed -e "s/^/$n sr /" >> results.tab
done
