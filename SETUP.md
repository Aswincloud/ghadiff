# ghadiff - GitHub Actions Diff Tool

**PyPI Package Name**: `ghadiff`  
**Repository**: https://github.com/Aswintechie/ghadiff  
**Command**: `ghadiff`

## 🎉 Package Complete and Ready!

### What is ghadiff?

`ghadiff` is a Python CLI tool to compare two GitHub Actions workflow runs with detailed analysis. It defaults to the `tenstorrent/tt-metal` repository for convenience.

### Quick Install

```bash
# Once published to PyPI
pip install ghadiff

# Or install from source
git clone https://github.com/Aswintechie/ghadiff.git
cd ghadiff
pip install -e .
```

### Quick Start

```bash
# Set GitHub token
export GITHUB_TOKEN=your_token_here

# Compare two workflow runs (defaults to tenstorrent/tt-metal)
ghadiff 12345678 12345679

# Generate HTML report
ghadiff 12345678 12345679 --format html -o report.html

# Use with different repository
ghadiff 12345678 12345679 --repo owner/repo
```

### Features

- ✅ Simple CLI: just pass two run IDs
- ✅ Smart defaults: uses tt-metal repo automatically
- ✅ 4 output formats: text, JSON, markdown, HTML
- ✅ Comprehensive analysis: workflow, job, and step levels
- ✅ Duration tracking with percentages
- ✅ Status change detection
- ✅ Beautiful reports with emojis and colors

### Publishing to PyPI

```bash
# Build
cd ghadiff
python -m build

# Upload to PyPI
python -m twine upload dist/*
```

### Pushing to GitHub

```bash
# Run the setup script
cd /home/ubuntu/ghadiff
chmod +x setup_git.sh
./setup_git.sh

# Then push (you'll need GitHub authentication)
git push -u origin main
```

### Documentation

See the full README.md for complete documentation, examples, and API usage.

---

**Created**: December 11, 2025  
**Version**: 0.1.0  
**License**: MIT
