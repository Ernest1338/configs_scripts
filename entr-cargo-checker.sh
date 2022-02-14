#!/bin/bash

# dependencies: rust, cargo, entr, find, clear

find src/ | entr -s 'clear; cargo check'

