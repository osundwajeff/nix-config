#!/usr/bin/env bash

echo "🏃Running flake in a test vm"
echo "See https://lhf.pt/posts/demystifying-nixos-basic-flake/"
echo "For a detailed explanation"
rm *.qcow2
nixos-rebuild build-vm --flake .#test && result/bin/run-*-vm

