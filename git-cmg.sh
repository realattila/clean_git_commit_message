#!/bin/bash
# original repo code: https://github.com/realattila/clean_git_commit_message
commitTypes=(
  "⭐ feature:"
  "🛠️ fix:"
  "🔃 refactor:"
  "💫 style:"
  "📄 document:"
  "🧪 test:"
  "🚀 release:"
  "🗑️ remove:"
  "🔼 upgrade:"
  "📦 add:"
  "🧹 chore:"
)

displayCommitTypes() {
  echo "Choose a commit type:"
  for i in "${!commitTypes[@]}"; do
    echo "$((i + 1)). ${commitTypes[i]}"
  done
}

promptUser() {
  displayCommitTypes

  read -p "Enter the number of the commit type: " selectedType
  typeIndex=$((selectedType - 1))

  if ((typeIndex < 0 || typeIndex >= ${#commitTypes[@]})); then
    echo "Invalid selection. Please choose a valid number."
    return
  fi

  selectedFormat="${commitTypes[typeIndex]}"

  # Get optional scope
  read -p "Enter an optional scope (leave empty to skip): " commitScope
  if [ -n "$commitScope" ]; then
    selectedFormat="${selectedFormat}(${commitScope}):"
  fi

  # Get commit description
  read -p "Enter your commit message (description): " commitMessage
  if [ -z "$commitMessage" ]; then
    echo "Description is required."
    return
  fi

  # Get optional body
  read -p "Enter an optional body (leave empty to skip): " commitBody

  # Get optional footer
  read -p "Enter optional footer(s) (e.g., BREAKING CHANGE or references to issues; leave empty to skip): " commitFooter

  # Check if the staging area is empty
  if [[ -z $(git diff --cached --exit-code) ]]; then
    git add .
  fi

  # Format the commit message
  formattedCommitMessage="${selectedFormat} ${commitMessage}"

  if [ -n "$commitBody" ]; then
    formattedCommitMessage="${formattedCommitMessage}\n\n${commitBody}"
  fi

  if [ -n "$commitFooter" ]; then
    formattedCommitMessage="${formattedCommitMessage}\n\n${commitFooter}"
  fi

  # Perform the commit
  git commit -m "$formattedCommitMessage"

  if [ $? -ne 0 ]; then
    echo "Error committing changes."
  else
    echo "Git commit successful:"
    echo -e "$formattedCommitMessage"
  fi
}

promptUser
