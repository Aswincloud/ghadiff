#!/bin/bash
# Quick installation script for development

set -e

echo "Installing ghadiff in development mode..."

# Check Python version
python3 --version

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
fi

# Activate virtual environment
source venv/bin/activate

# Upgrade pip
pip install --upgrade pip

# Install package in editable mode with dev dependencies
echo "Installing package..."
pip install -e ".[dev]"

echo ""
echo "✅ Installation complete!"
echo ""
echo "To use the package:"
echo "  1. Activate the virtual environment: source venv/bin/activate"
echo "  2. Set your GitHub token: export GITHUB_TOKEN=your_token_here"
echo "  3. Run: ghadiff RUN_ID_1 RUN_ID_2"
echo ""
echo "Example:"
echo "  ghadiff 12345678 12345679"
echo ""
