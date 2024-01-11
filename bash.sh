#!/bin/bash
docker build . -t operator 
docker run -it --rm -v ${PWD}:/work -w /work operator bash ./docker.sh




