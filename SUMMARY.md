# Workflow Compare - Complete Package Summary

## 🎉 Package Created Successfully!

A complete PyPI package for comparing GitHub workflow runs with a focus on the Tenstorrent tt-metal repository.

## 📦 What's Included

### Core Modules

1. **`api.py`** - GitHub API Client
   - Fetches workflow runs and jobs
   - Handles authentication and rate limiting
   - Defaults to `tenstorrent/tt-metal` repository

2. **`comparator.py`** - Comparison Engine
   - Compares runs at workflow, job, and step levels
   - Calculates duration differences and percentages
   - Detects status changes

3. **`reporter.py`** - Report Generator
   - Text format (human-readable console output)
   - JSON format (machine-readable)
   - Markdown format (documentation-ready)
   - HTML format (beautiful web reports)

4. **`cli.py`** - Command Line Interface
   - Simple usage: `workflow-compare RUN_ID_1 RUN_ID_2`
   - Defaults to tt-metal repo
   - Multiple output formats

### Package Files

- `pyproject.toml` - Modern Python packaging configuration
- `README.md` - Comprehensive user documentation
- `PUBLISHING.md` - Step-by-step PyPI publishing guide
- `LICENSE` - MIT License
- `MANIFEST.in` - Package file inclusion rules
- `.gitignore` - Standard Python gitignore
- `.flake8` - Linter configuration
- `install.sh` - Quick development setup script

### Tests & Examples

- `tests/test_workflow_compare.py` - Unit tests with pytest
- `examples/usage_example.py` - Programmatic usage example
- `.github/workflows/test-and-publish.yml` - CI/CD workflow

## 🚀 Quick Start

### Installation for Development

```bash
cd workflow-compare
./install.sh
source venv/bin/activate
```

Or manually:

```bash
cd workflow-compare
python3 -m venv venv
source venv/bin/activate
pip install -e ".[dev]"
```

### Basic Usage

```bash
# Set GitHub token (required)
export GITHUB_TOKEN=your_github_token

# Compare two workflow runs (defaults to tenstorrent/tt-metal)
workflow-compare 12345678 12345679

# With specific repo
workflow-compare 12345678 12345679 --repo owner/repo

# Generate HTML report
workflow-compare 12345678 12345679 --format html -o report.html

# Generate markdown
workflow-compare 12345678 12345679 --format markdown -o report.md

# JSON output
workflow-compare 12345678 12345679 --format json
```

### Programmatic Usage

```python
from workflow_compare import GitHubAPI, WorkflowComparator, Reporter

# Initialize (defaults to tenstorrent/tt-metal)
api = GitHubAPI(token="your_token")

# Fetch runs
run1 = api.get_workflow_run_full(12345678)
run2 = api.get_workflow_run_full(12345679)

# Compare
comparator = WorkflowComparator(run1, run2)
comparison = comparator.get_full_comparison()

# Generate report
reporter = Reporter(comparison)
print(reporter.to_text())
```

## 📊 Features

✅ **Simple CLI** - Just pass two run IDs as arguments
✅ **Default Repository** - Automatically uses `tenstorrent/tt-metal`
✅ **Multiple Formats** - Text, JSON, Markdown, HTML outputs
✅ **Comprehensive Analysis** - Workflow, job, and step-level comparisons
✅ **Duration Tracking** - Shows time differences and percentages
✅ **Status Detection** - Highlights conclusion changes (success → failure)
✅ **Rate Limiting** - Handles GitHub API rate limits gracefully
✅ **Beautiful Reports** - Color-coded, emoji-enhanced output
✅ **Token Support** - Via environment variable or CLI argument
✅ **Extensible** - Easy to add new comparison metrics

## 📤 Publishing to PyPI

### Prerequisites

```bash
pip install build twine
```

### Build

```bash
cd workflow-compare
python -m build
```

This creates:
- `dist/workflow_compare-0.1.0-py3-none-any.whl`
- `dist/workflow_compare-0.1.0.tar.gz`

### Test on TestPyPI

```bash
python -m twine upload --repository testpypi dist/*
pip install --index-url https://test.pypi.org/simple/ workflow-compare
```

### Publish to PyPI

```bash
python -m twine upload dist/*
```

### After Publishing

Users can install with:

```bash
pip install workflow-compare
```

## 🧪 Testing

```bash
# Run tests
pytest

# With coverage
pytest --cov=workflow_compare

# Linting
flake8 src/

# Format check
black --check src/
```

## 📁 Project Structure

```
workflow-compare/
├── .github/
│   └── workflows/
│       └── test-and-publish.yml    # CI/CD pipeline
├── src/
│   └── workflow_compare/
│       ├── __init__.py              # Package init
│       ├── api.py                   # GitHub API client
│       ├── cli.py                   # CLI interface
│       ├── comparator.py            # Comparison logic
│       └── reporter.py              # Report generation
├── tests/
│   ├── __init__.py
│   └── test_workflow_compare.py    # Unit tests
├── examples/
│   └── usage_example.py             # Usage examples
├── .flake8                          # Linter config
├── .gitignore                       # Git ignore
├── install.sh                       # Dev setup script
├── LICENSE                          # MIT License
├── MANIFEST.in                      # Package manifest
├── PROJECT_STRUCTURE.md             # Structure docs
├── PUBLISHING.md                    # Publishing guide
├── pyproject.toml                   # Package config
├── README.md                        # Main documentation
└── SUMMARY.md                       # This file
```

## 🎯 Use Cases

1. **Performance Regression Detection** - Compare before/after changes
2. **CI/CD Optimization** - Identify slow jobs
3. **Debugging Failures** - Compare failed vs successful runs
4. **Release Validation** - Ensure no timing regressions
5. **Infrastructure Testing** - Validate runner/environment changes

## 🔑 Key Design Decisions

1. **Simple CLI Interface** - Two positional arguments (run1, run2)
2. **Smart Defaults** - Uses tt-metal repo automatically
3. **Multiple Output Formats** - Flexibility for different use cases
4. **Rate Limit Handling** - Automatic retry with backoff
5. **Comprehensive Comparison** - Run, job, and step levels
6. **Duration Analysis** - Both absolute and percentage differences

## 📝 Example Output

### Text Format
```
================================================================================
GitHub Workflow Run Comparison
================================================================================

OVERVIEW
--------------------------------------------------------------------------------
Run 1: #1234 (12345678)
  Branch: main
  SHA: abc1234
  Status: completed / success
  Duration: 45.2m

Run 2: #1235 (12345679)
  Branch: feature-branch
  SHA: def5678
  Status: completed / success
  Duration: 38.7m

Duration Difference: -6.5m

JOBS COMPARISON
--------------------------------------------------------------------------------
build-and-test
   Run 1: ✅ success    - 12.3m
   Run 2: ✅ success    - 10.1m
   Diff:  -2.2m (-17.9%)
```

## 🔧 Next Steps

1. **Test the Package**
   ```bash
   cd workflow-compare
   ./install.sh
   source venv/bin/activate
   export GITHUB_TOKEN=your_token
   workflow-compare --help
   ```

2. **Try with Real Data**
   ```bash
   # Get run IDs from https://github.com/tenstorrent/tt-metal/actions
   workflow-compare RUN_ID_1 RUN_ID_2
   ```

3. **Publish to PyPI** (when ready)
   ```bash
   python -m build
   python -m twine upload dist/*
   ```

4. **Optional Enhancements**
   - Add caching for workflow data
   - Implement step-level log comparison
   - Add artifact comparison
   - Create web dashboard
   - Add GitHub Action integration

## 📚 Documentation Links

- **User Guide**: `README.md`
- **Publishing Guide**: `PUBLISHING.md`
- **Project Structure**: `PROJECT_STRUCTURE.md`
- **Usage Examples**: `examples/usage_example.py`
- **Tests**: `tests/test_workflow_compare.py`

## 🤝 Contributing

The package is structured for easy contributions:
- Clear module separation
- Comprehensive tests
- Type hints throughout
- Good documentation
- CI/CD ready

## 📄 License

MIT License - See `LICENSE` file

---

**Package Name**: `workflow-compare`
**Version**: `0.1.0`
**Python**: `>=3.8`
**Dependencies**: `requests>=2.25.0`
**Entry Point**: `workflow-compare` command
**Default Repo**: `tenstorrent/tt-metal`

🎊 Ready to publish to PyPI!
