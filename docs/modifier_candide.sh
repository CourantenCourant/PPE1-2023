#!/usr/bin/env bash

cat candide.txt | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' | tr '\n' ' ' | tr -s ' ' | tr ' ' '\n' > mod_candide.txt