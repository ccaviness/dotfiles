#!/bin/sh

stow --restow
for d in `ls -d */`;
do
    ( stow --restow $d )
done
