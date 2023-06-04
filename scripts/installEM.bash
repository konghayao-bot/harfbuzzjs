#!/bin/bash
# This script installs emscripten to ~/.emsdk
if [[ -d "~/.emsdk" ]]
then # Update
  echo "Updating emscripten SDK..."
  cd ~/.emsdk && git pull
else # Install
  echo "Installing emscripten SDK..."
  git clone https://github.com/emscripten-core/emsdk.git ~/.emsdk
fi
# Install & activate latest SDK
# See https://emscripten.org/docs/getting_started/downloads.html for more details
cd ~/.emsdk
./emsdk install latest 
./emsdk activate latest    
# Add to .bashrc and .zshrc
if [[ -f "~/.bashrc" ]]; then echo -e "\nsource ~/.emsdk/emsdk_env.sh" >> ~/.bashrc; fi
if [[ -f "~/.zshrc" ]]; then echo -e "\nsource ~/.emsdk/emsdk_env.sh" >> ~/.zshrc; fi