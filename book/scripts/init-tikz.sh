#!/bin/sh

# must be executed in the chapter where tikz needs to be initialized

mkdir -p tikz
cd tikz
ln -s ../../../templates/tikz-Makefile Makefile
ln -s ../../../templates/tikz2figure.tex .
cp -i ../../../templates/figure-list.mk .
cp -i ../../../templates/demo.tikz .
