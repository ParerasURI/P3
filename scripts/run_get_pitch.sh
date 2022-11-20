#!/bin/bash

amaxnorm=${1:+-m ${1}}
hu1norm=${2:+-u ${2}}
hzcr=${3:+-z ${3}}
# Put here the program (maybe with path)
GETF0="get_pitch $amaxnorm $hu1norm $hzcr"

for fwav in pitch_db/train/*.wav; do
    ff0=${fwav/.wav/.f0}
    echo "$GETF0 $fwav $ff0 ----"
    $GETF0 $fwav $ff0 > /dev/null || (echo "Error in $GETF0 $fwav $ff0"; exit 1)
done

exit 0
