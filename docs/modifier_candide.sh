#!/usr/bin/env bash

cat candide.txt | tr '\n' ' ' | tr -s ' ' | tr ' ' '\n' | tr '[:upper:]' '[:lower:]' | tr -d '[:punct:]' > mod_candide.txt