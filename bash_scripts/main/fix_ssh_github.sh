#!/bin/bash

# -----------------------------------------------------------
# Fix GitHub SSH: Permission denied (publickey) Error
#
# 📌 HOW TO USE:
#   1. Save this file as fix_ssh_github.sh
#   2. Make it executable:
#        chmod +x fix_ssh_github.sh
#   3. Run the script:
#        ./fix_ssh_github.sh
#   4. Follow the prompts to enter your GitHub email and add the key
#
# 🔗 Add the generated key at: https://github.com/settings/ssh/new
# -----------------------------------------------------------

KEY_FILE="$HOME/.ssh/id_ed25519"

# Ask user for GitHub email
read -p "📧 Enter your preferred Or GitHub email: " EMAIL

if [ -z "$EMAIL" ]; then
  echo "❌ Email cannot be empty. Exiting."
  exit 1
fi

# Step 1: Generate SSH key if not present
if [ ! -f "$KEY_FILE" ]; then
  echo "🔐 Generating new SSH key for GitHub..."
  ssh-keygen -t ed25519 -C "$EMAIL" -f "$KEY_FILE" -N ""
else
  echo "✅ SSH key already exists: $KEY_FILE"
fi

# Step 2: Start ssh-agent and add key
eval "$(ssh-agent -s)"
ssh-add "$KEY_FILE"

# Step 3: Output public key
echo ""
echo "📋 Copy the SSH public key below and add it to GitHub:"
echo "🔗 https://github.com/settings/ssh/new"
echo "------------------------------------------------------"
cat "${KEY_FILE}.pub"
echo "------------------------------------------------------"

# Step 4: Test GitHub access
echo ""
read -p "Press Enter to test connection to GitHub via SSH..."
ssh -T git@github.com