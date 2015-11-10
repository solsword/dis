#!/bin/sh
sed "s/^.*%.*NON-HEVEA$//" < dis.tex | sed "s/% HEVEA://" > hev.tex
./cpl hev
./cpl hev
sed -f hev.sed hev.tex > hevcr.tex
hevea hevcr.tex
hevea hevcr.tex
