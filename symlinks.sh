#!/bin/sh

for d in `ls -d */`;
do
    ( stow --restow $d )
done
