#!/bin/bash
# Script to initialize git repository and push to GitHub

set -e

echo "Initializing ghadiff repository..."

cd /home/ubuntu/ghadiff

# Initialize git
git init

# Configure git
git config user.name "Aswintechie"
git config user.email "aswin@example.com"

# Add all files
git add .

# Create initial commit
git commit -m "Initial commit: ghadiff - GitHub Actions workflow run comparison tool

- Complete PyPI package for comparing GitHub workflow runs
- CLI command: ghadiff RUN_ID_1 RUN_ID_2
- Defaults to tenstorrent/tt-metal repository
- Multiple output formats: text, JSON, markdown, HTML
- Comprehensive job and step-level analysis
- Duration tracking with percentage changes
- Status change detection
- Rate limiting and error handling
- Full documentation and examples"

# Add remote
git remote add origin https://github.com/Aswintechie/ghadiff.git

# Rename branch to main
git branch -M main

# Show status
git status

echo ""
echo "Repository initialized successfully!"
echo ""
echo "To push to GitHub, run:"
echo "  cd /home/ubuntu/ghadiff"
echo "  git push -u origin main"
echo ""
echo "Note: You may need to authenticate with GitHub"
echo "      Use personal access token for authentication"
