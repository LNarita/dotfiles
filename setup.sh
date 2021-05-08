#!/bin/bash

DOT_FILES_PATH="$(pwd)"

echo $DOT_FILES_PATH

echo "ln -s $DOT_FILES_PATH/common/.bashrc ~/.bashrc"
echo "ln -s $DOT_FILES_PATH/common/.zshrc ~/.zshrc"
