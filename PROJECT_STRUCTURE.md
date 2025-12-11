# Workflow Compare - Project Structure

```
workflow-compare/
├── src/
│   └── workflow_compare/
│       ├── __init__.py       # Package initialization
│       ├── api.py            # GitHub API client
│       ├── cli.py            # Command-line interface
│       ├── comparator.py     # Comparison logic
│       └── reporter.py       # Report generation
├── tests/
│   ├── __init__.py
│   └── test_workflow_compare.py
├── examples/
│   └── usage_example.py
├── pyproject.toml            # Package configuration
├── README.md                 # User documentation
├── PUBLISHING.md             # PyPI publishing guide
├── LICENSE                   # MIT License
├── MANIFEST.in               # Package manifest
├── .gitignore                # Git ignore rules
└── install.sh                # Development setup script
```

## Quick Test

To test locally before publishing:

```bash
# Install in development mode
cd workflow-compare
./install.sh

# Or manually:
python3 -m venv venv
source venv/bin/activate
pip install -e .

# Set GitHub token
export GITHUB_TOKEN=your_token_here

# Test the CLI
workflow-compare --help
```

## Features Implemented

✅ GitHub API client with rate limiting
✅ Workflow run comparison logic
✅ Job and step-level analysis
✅ Multiple output formats (text, JSON, markdown, HTML)
✅ CLI with simple interface: just pass two run IDs
✅ Defaults to tenstorrent/tt-metal repo
✅ Duration calculations and percentage changes
✅ Status change detection
✅ Beautiful formatted reports
✅ PyPI packaging ready
✅ Unit tests
✅ Documentation

## Usage

```bash
# Basic usage (defaults to tenstorrent/tt-metal)
workflow-compare 12345678 12345679

# With custom repo
workflow-compare 12345678 12345679 --repo owner/repo

# Generate HTML report
workflow-compare 12345678 12345679 --format html -o report.html

# Generate markdown report
workflow-compare 12345678 12345679 --format markdown -o report.md

# JSON output
workflow-compare 12345678 12345679 --format json
```
