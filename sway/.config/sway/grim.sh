#!/bin/bash
mkdir -p ~/screenshots
grim -g "$(slurp -d)" - &> "${HOME}/screenshots/screenshot-$(date +%Y-%m-%d-%H-%M-%S).png"
