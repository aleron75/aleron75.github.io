#!/bin/bash
alias jekyll='sudo docker run --rm -v "$PWD:/src" -p 4000:4000 grahamc/jekyll'
sudo docker run --name jekyll -d -v "$PWD:/src" -p 4000:4000 grahamc/jekyll serve -I -H 0.0.0.0
