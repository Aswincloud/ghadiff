#!/bin/bash
# Push ghadiff package to GitHub repository
# Repository: https://github.com/Aswintechie/ghadiff

echo "╔════════════════════════════════════════════════════════════════════╗"
echo "║           Push ghadiff to GitHub                                   ║"
echo "╚════════════════════════════════════════════════════════════════════╝"
echo ""

# Check if we're in the right directory
if [ ! -f "pyproject.toml" ]; then
    echo "Error: pyproject.toml not found. Please run from ghadiff directory."
    exit 1
fi

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Error: git is not installed"
    exit 1
fi

echo "📍 Current directory: $(pwd)"
echo ""

# Check if already a git repository
if [ -d ".git" ]; then
    echo "⚠️  Git repository already exists"
    echo "   Skipping initialization..."
else
    echo "🔧 Initializing git repository..."
    git init
    echo "✅ Repository initialized"
fi

echo ""
echo "🔧 Configuring git..."
git config user.name "Aswintechie"
git config user.email "aswin@example.com"
echo "✅ Git configured"

echo ""
echo "📦 Staging files..."
git add .
echo "✅ Files staged"

echo ""
echo "💾 Creating commit..."
git commit -m "Initial commit: ghadiff - GitHub Actions workflow comparison tool

Features:
- Compare GitHub Actions workflow runs
- Simple CLI: ghadiff RUN_ID_1 RUN_ID_2
- Defaults to tenstorrent/tt-metal repository
- Multiple output formats: text, JSON, markdown, HTML
- Comprehensive job and step-level analysis
- Duration tracking with percentage changes
- Status change detection
- Rate limiting and error handling
- Full documentation and examples
- Ready for PyPI publishing" || echo "⚠️  Commit may have failed (files already committed?)"

echo ""
echo "🔗 Adding remote repository..."
git remote remove origin 2>/dev/null || true
git remote add origin https://github.com/Aswintechie/ghadiff.git
echo "✅ Remote added"

echo ""
echo "🌿 Setting main branch..."
git branch -M main
echo "✅ Branch set to main"

echo ""
echo "📊 Repository status:"
git status

echo ""
echo "╔════════════════════════════════════════════════════════════════════╗"
echo "║                     READY TO PUSH                                  ║"
echo "╚════════════════════════════════════════════════════════════════════╝"
echo ""
echo "To push to GitHub, run:"
echo ""
echo "  git push -u origin main"
echo ""
echo "Authentication required:"
echo "  - Username: Aswintechie"
echo "  - Password: (use GitHub Personal Access Token)"
echo ""
echo "To create a token:"
echo "  1. Go to: https://github.com/settings/tokens"
echo "  2. Generate new token (classic)"
echo "  3. Select 'repo' scope"
echo "  4. Copy and use as password"
echo ""
echo "After pushing, your package will be available at:"
echo "  https://github.com/Aswintechie/ghadiff"
echo ""
