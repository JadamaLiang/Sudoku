#!/bin/bash

echo "Compiling the code..."

str=$(g++ SudokuGen.cpp main.cpp -o SudokuGen)
if [ -z $str ]; then
    echo "Succesfully compiled :)"

    unamestr=$(uname)
    if [[ "$unamestr" == 'Linux' ]]; then
      platform='linux'
    elif [[ "$unamestr" == 'Darwin' ]]; then
      platform='macos'
    fi

    str="alias 'SudokuGen'='$(pwd)/SudokuGen'"

    if [[ "$platform" == 'linux' ]]; then
      if !(grep -q SudokuGen ~/.bashrc) ; then
        echo $str >> $HOME/.bashrc
      fi
    elif [[ "$platform" == 'macos' ]]; then
      if !(grep -q SudokuGen ~/.bash_profile) ; then
        echo $str >> $HOME/.bash_profile
      fi
    fi
fi