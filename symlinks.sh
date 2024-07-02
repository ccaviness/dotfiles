#!/bin/sh

for d in */ ; do
    stow --verbose --restow "${d}"
done
