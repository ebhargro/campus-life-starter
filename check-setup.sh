#!/bin/bash

echo "Checking Git version..."
git --version && echo "✅ Git is installed." || { echo "❌ Git not installed."; exit 1; }

echo "Checking for SSH keys..."
if ls ~/.ssh/id_*.pub > /dev/null 2>&1; then
  echo "✅ SSH key found."
else
  echo "❌ No SSH key found."; exit 1;
fi

echo "Testing SSH connection to GitHub..."
SSH_OUTPUT=$(ssh -T git@github.com 2>&1)
if echo "$SSH_OUTPUT" | grep -q "successfully authenticated"; then
  echo "✅ SSH connection successful."
else
  echo "❌ SSH connection failed."; exit 1;
fi

echo "Checking VS Code command line access..."
code --version && echo "✅ VS Code CLI is available." || { echo "❌ VS Code CLI not installed."; exit 1; }

echo "🎉 Environment looks good!"