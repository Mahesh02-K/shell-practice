#!/bin/bash

MOVIES=("SALAAR" "KALKI2898AD" "SAAHO" "RAJASAAB")

echo "First movie is :: ${MOVIES[0]}"
echo "Fourth movie is :: ${MOVIES[3]}"
echo "Fifth movie is ::${MOVIES[5]}"

echo "All movies are :: ${MOVIES[@]}"