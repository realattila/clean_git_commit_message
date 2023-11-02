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
  "📦 add:",
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

  read -p "Enter your commit message: " commitMessage

  # Check if the staging area is empty
  if [[ -z $(git diff --cached --exit-code) ]]; then
    git add .
  fi

  formattedCommitMessage="${selectedFormat} ${commitMessage}"

  git commit -m "$formattedCommitMessage"

  if [ $? -ne 0 ]; then
    echo "Error committing changes."
  else
    echo "Git commit successful:"
    echo "$formattedCommitMessage"
  fi
}

promptUser
