# Workflow Compare - Quick Reference

## Installation

```bash
pip install workflow-compare
```

## Authentication

```bash
export GITHUB_TOKEN=your_github_token
```

## Basic Usage

```bash
# Compare two runs (defaults to tenstorrent/tt-metal)
workflow-compare 12345678 12345679

# Custom repository
workflow-compare 12345678 12345679 --repo owner/repo

# Different formats
workflow-compare 12345678 12345679 --format text      # Default
workflow-compare 12345678 12345679 --format json
workflow-compare 12345678 12345679 --format markdown
workflow-compare 12345678 12345679 --format html

# Save to file
workflow-compare 12345678 12345679 -o report.txt
workflow-compare 12345678 12345679 --format html -o report.html

# Verbose output
workflow-compare 12345678 12345679 --verbose
```

## All CLI Options

| Option | Description | Default |
|--------|-------------|---------|
| `run1` | First workflow run ID (required) | - |
| `run2` | Second workflow run ID (required) | - |
| `--repo` | Repository (owner/repo) | `tenstorrent/tt-metal` |
| `--token` | GitHub token | `$GITHUB_TOKEN` |
| `--format` | Output format (text/json/markdown/html) | `text` |
| `--output`, `-o` | Output file | stdout |
| `--verbose`, `-v` | Verbose output | `false` |

## Python API

```python
from workflow_compare import GitHubAPI, WorkflowComparator, Reporter

# Initialize
api = GitHubAPI(token="token")  # Defaults to tt-metal repo
api = GitHubAPI(token="token", repo="owner/repo")  # Custom repo

# Fetch runs
run1 = api.get_workflow_run_full(12345678)
run2 = api.get_workflow_run_full(12345679)

# Compare
comparator = WorkflowComparator(run1, run2)
comparison = comparator.get_full_comparison()

# Generate reports
reporter = Reporter(comparison)
text_report = reporter.to_text()
json_report = reporter.to_json()
markdown_report = reporter.to_markdown()
html_report = reporter.to_html()
```

## Getting Workflow Run IDs

1. Go to: https://github.com/tenstorrent/tt-metal/actions
2. Click on a workflow run
3. The run ID is in the URL: `https://github.com/.../actions/runs/XXXXXXXX`

## Common Use Cases

### Performance Regression
```bash
# Compare current run with previous successful run
workflow-compare 12345678 12345679 --format markdown -o regression-report.md
```

### CI Debugging
```bash
# Compare failed run with last successful run
workflow-compare 12345600 12345678 --verbose
```

### Release Validation
```bash
# Generate HTML report for stakeholders
workflow-compare 12345678 12345679 --format html -o release-comparison.html
```

### Batch Analysis
```bash
# JSON for programmatic analysis
workflow-compare 12345678 12345679 --format json > comparison.json
```

## Output Interpretation

### Status Emojis
- ✅ Success
- ❌ Failure
- 🚫 Cancelled
- ⏭️ Skipped
- ⚪ Other

### Duration Format
- `45.2s` - Seconds
- `12.3m` - Minutes
- `2.5h` - Hours

### Differences
- `+2.3m` - Run 2 took 2.3 minutes longer (slower)
- `-5.1m` - Run 2 took 5.1 minutes less (faster)
- `+15.2%` - Run 2 was 15.2% slower
- `-8.7%` - Run 2 was 8.7% faster

## Troubleshooting

### No GitHub token
```
Error: 403 Forbidden
Solution: export GITHUB_TOKEN=your_token
```

### Rate limited
```
Warning: Rate limit exceeded. Waiting...
Solution: Wait or use authenticated requests (token)
```

### Invalid run ID
```
Error: 404 Not Found
Solution: Check run ID is correct and from the right repo
```

### Wrong repository
```bash
# Use --repo flag
workflow-compare 12345678 12345679 --repo tenstorrent/tt-metal
```

## Examples

### Example 1: Quick comparison
```bash
workflow-compare 12345678 12345679
```

### Example 2: Full HTML report
```bash
workflow-compare 12345678 12345679 \
  --format html \
  --output comparison-$(date +%Y%m%d).html
```

### Example 3: JSON for CI
```bash
workflow-compare 12345678 12345679 \
  --format json | jq '.jobs[] | select(.conclusion_changed)'
```

### Example 4: Multiple repositories
```bash
# tt-metal
workflow-compare 12345678 12345679

# Different repo
workflow-compare 88888888 99999999 --repo myorg/myrepo
```

## Development

```bash
# Clone and install
git clone https://github.com/tenstorrent/workflow-compare.git
cd workflow-compare
./install.sh
source venv/bin/activate

# Run tests
pytest

# Test package
python test_package.py
```

## Publishing

```bash
# Build
python -m build

# Test on TestPyPI
python -m twine upload --repository testpypi dist/*

# Publish to PyPI
python -m twine upload dist/*
```

## Links

- GitHub: https://github.com/tenstorrent/workflow-compare
- PyPI: https://pypi.org/project/workflow-compare/
- Issues: https://github.com/tenstorrent/workflow-compare/issues

---

**Version**: 0.1.0
**License**: MIT
**Python**: >=3.8
