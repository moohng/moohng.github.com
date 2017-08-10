#!/bin/bash
# Decrypt the private key
openssl aes-256-cbc -K $encrypted_adc0b7f2dba9_key -iv $encrypted_adc0b7f2dba9_iv -in .travis/private_key.enc -out ~/.ssh/id_rsa -d
# Set the permission of the key
chmod 600 ~/.ssh/id_rsa
# Start SSH agent
eval $(ssh-agent)
# Add the private key to the system
ssh-add ~/.ssh/id_rsa
# Copy SSH config
cp .travis/ssh_config ~/.ssh/config
# Set Git config
git config --global user.name "kevin"
git config --global user.email moohng@126.com
# Deploy to GitHub
npm run deploy
