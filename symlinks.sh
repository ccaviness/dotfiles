#!/bin/sh

for d in */ ; do
    stow --restow "${d}"
done
