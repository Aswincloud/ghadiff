╔══════════════════════════════════════════════════════════════════════════╗
║                                                                          ║
║                    WORKFLOW-COMPARE PACKAGE                              ║
║                  Complete PyPI Package Created ✅                         ║
║                                                                          ║
╚══════════════════════════════════════════════════════════════════════════╝

📦 PACKAGE INFORMATION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Name:              workflow-compare
  Version:           0.1.0
  License:           MIT
  Python:            >=3.8
  Default Repo:      tenstorrent/tt-metal
  Entry Point:       workflow-compare command

🎯 KEY FEATURES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  ✅ Simple CLI - Just pass two run IDs
  ✅ Smart Defaults - Automatically uses tenstorrent/tt-metal
  ✅ Multiple Formats - Text, JSON, Markdown, HTML
  ✅ Comprehensive Analysis - Workflow, job, and step levels
  ✅ Duration Tracking - Time diffs and percentages
  ✅ Status Detection - Highlights changes (success → failure)
  ✅ Rate Limiting - Handles GitHub API limits gracefully
  ✅ Beautiful Reports - Color-coded, emoji-enhanced
  ✅ Token Support - Via environment or CLI argument
  ✅ Extensible - Easy to add new metrics

📂 PROJECT STRUCTURE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  workflow-compare/
  │
  ├── 📁 src/workflow_compare/
  │   ├── __init__.py          Package initialization
  │   ├── api.py               GitHub API client
  │   ├── cli.py               Command-line interface
  │   ├── comparator.py        Comparison logic
  │   └── reporter.py          Report generation (4 formats)
  │
  ├── 📁 tests/
  │   ├── __init__.py
  │   └── test_workflow_compare.py    Unit tests
  │
  ├── 📁 examples/
  │   └── usage_example.py     Python API examples
  │
  ├── 📁 .github/workflows/
  │   └── test-and-publish.yml CI/CD pipeline
  │
  ├── 📄 Configuration Files
  │   ├── pyproject.toml       Package configuration
  │   ├── .gitignore           Git ignore rules
  │   ├── .flake8              Linter configuration
  │   └── MANIFEST.in          Package manifest
  │
  ├── 📄 Documentation
  │   ├── README.md            Main user documentation
  │   ├── SUMMARY.md           Complete package summary
  │   ├── QUICK_REFERENCE.md   CLI cheat sheet
  │   ├── PUBLISHING.md        PyPI publishing guide
  │   └── PROJECT_STRUCTURE.md Structure documentation
  │
  ├── 📄 Scripts
  │   ├── install.sh           Development setup
  │   ├── test_package.py      Package verification
  │   └── demo.sh              Usage demonstration
  │
  └── 📄 LICENSE               MIT License

🚀 QUICK START
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  1. INSTALL FOR DEVELOPMENT
     ┌────────────────────────────────────────────────────────────────┐
     │ cd workflow-compare                                            │
     │ ./install.sh                                                   │
     │ source venv/bin/activate                                       │
     └────────────────────────────────────────────────────────────────┘

  2. SET GITHUB TOKEN
     ┌────────────────────────────────────────────────────────────────┐
     │ export GITHUB_TOKEN=your_github_token_here                     │
     └────────────────────────────────────────────────────────────────┘

  3. TEST THE PACKAGE
     ┌────────────────────────────────────────────────────────────────┐
     │ python test_package.py                                         │
     │ workflow-compare --help                                        │
     └────────────────────────────────────────────────────────────────┘

  4. COMPARE WORKFLOW RUNS
     ┌────────────────────────────────────────────────────────────────┐
     │ workflow-compare 12345678 12345679                             │
     │                                                                │
     │ # Defaults to tenstorrent/tt-metal repo                        │
     │ # First arg is run1 (baseline)                                 │
     │ # Second arg is run2 (comparison)                              │
     └────────────────────────────────────────────────────────────────┘

💡 USAGE EXAMPLES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  ▸ Basic Comparison (Text Output)
    workflow-compare 12345678 12345679

  ▸ HTML Report
    workflow-compare 12345678 12345679 --format html -o report.html

  ▸ Markdown Report
    workflow-compare 12345678 12345679 --format markdown -o report.md

  ▸ JSON Output
    workflow-compare 12345678 12345679 --format json

  ▸ Custom Repository
    workflow-compare 12345678 12345679 --repo owner/repo

  ▸ Verbose Output
    workflow-compare 12345678 12345679 --verbose

🐍 PYTHON API
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  from workflow_compare import GitHubAPI, WorkflowComparator, Reporter

  # Initialize (defaults to tenstorrent/tt-metal)
  api = GitHubAPI(token="your_token")

  # Fetch workflow runs
  run1 = api.get_workflow_run_full(12345678)
  run2 = api.get_workflow_run_full(12345679)

  # Compare
  comparator = WorkflowComparator(run1, run2)
  comparison = comparator.get_full_comparison()

  # Generate reports
  reporter = Reporter(comparison)
  print(reporter.to_text())        # Text format
  print(reporter.to_json())        # JSON format
  print(reporter.to_markdown())    # Markdown format
  print(reporter.to_html())        # HTML format

📤 PUBLISHING TO PyPI
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  PREREQUISITES
  ┌──────────────────────────────────────────────────────────────────┐
  │ pip install build twine                                          │
  └──────────────────────────────────────────────────────────────────┘

  BUILD PACKAGE
  ┌──────────────────────────────────────────────────────────────────┐
  │ cd workflow-compare                                              │
  │ python -m build                                                  │
  └──────────────────────────────────────────────────────────────────┘

  TEST ON TestPyPI (Recommended First)
  ┌──────────────────────────────────────────────────────────────────┐
  │ python -m twine upload --repository testpypi dist/*              │
  │ pip install --index-url https://test.pypi.org/simple/ \          │
  │     workflow-compare                                             │
  └──────────────────────────────────────────────────────────────────┘

  PUBLISH TO PyPI
  ┌──────────────────────────────────────────────────────────────────┐
  │ python -m twine upload dist/*                                    │
  └──────────────────────────────────────────────────────────────────┘

  AFTER PUBLISHING
  ┌──────────────────────────────────────────────────────────────────┐
  │ pip install workflow-compare                                     │
  └──────────────────────────────────────────────────────────────────┘

🧪 TESTING
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Run Unit Tests:        pytest
  With Coverage:         pytest --cov=workflow_compare
  Linting:               flake8 src/
  Format Check:          black --check src/
  Package Verification:  python test_package.py

📊 OUTPUT FORMATS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  TEXT       Human-readable console output with emojis
             Perfect for: Quick terminal checks, CI logs

  JSON       Machine-readable structured data
             Perfect for: Automation, data processing, APIs

  MARKDOWN   Documentation-ready format with tables
             Perfect for: GitHub issues, PRs, wikis

  HTML       Beautiful web report with styling
             Perfect for: Stakeholder reports, archiving

🎨 FEATURES BREAKDOWN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  API CLIENT (api.py)
  ├─ GitHub API integration
  ├─ Automatic rate limit handling
  ├─ Token authentication
  ├─ Pagination support
  └─ Default repo: tenstorrent/tt-metal

  COMPARATOR (comparator.py)
  ├─ Run-level comparison
  ├─ Job-level comparison
  ├─ Step-level comparison
  ├─ Duration calculations
  ├─ Percentage changes
  └─ Status change detection

  REPORTER (reporter.py)
  ├─ Text format with colors/emojis
  ├─ JSON structured output
  ├─ Markdown tables
  ├─ HTML with CSS styling
  └─ Duration formatting

  CLI (cli.py)
  ├─ Simple positional args (run1 run2)
  ├─ Smart defaults
  ├─ Multiple format options
  ├─ File output support
  └─ Verbose mode

🎯 USE CASES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  • Performance Regression Detection
  • CI/CD Optimization
  • Debugging Failures
  • Release Validation
  • Infrastructure Testing
  • Runner Performance Analysis

📚 DOCUMENTATION FILES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  README.md              Complete user guide with examples
  SUMMARY.md             Package overview and features
  QUICK_REFERENCE.md     CLI cheat sheet
  PUBLISHING.md          Step-by-step PyPI publishing
  PROJECT_STRUCTURE.md   Architecture documentation
  GETTING_STARTED.md     This file

🔗 GETTING WORKFLOW RUN IDs
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  1. Visit: https://github.com/tenstorrent/tt-metal/actions
  2. Click on any workflow run
  3. Look at URL: https://github.com/.../actions/runs/XXXXXXXX
  4. The number XXXXXXXX is the run ID

📋 CHECKLIST
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  ✅ Package structure created
  ✅ Core modules implemented (api, comparator, reporter, cli)
  ✅ CLI interface with simple run1/run2 args
  ✅ Default to tenstorrent/tt-metal repo
  ✅ Multiple output formats (text, JSON, markdown, HTML)
  ✅ GitHub API client with rate limiting
  ✅ Comprehensive comparison logic
  ✅ Beautiful report generation
  ✅ Unit tests included
  ✅ PyPI packaging configuration (pyproject.toml)
  ✅ Documentation (README, guides)
  ✅ Example scripts
  ✅ Installation script
  ✅ CI/CD workflow
  ✅ License (MIT)
  ✅ .gitignore
  ✅ Package verification script

🎊 READY TO USE!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  The package is complete and ready for:
  • Local development and testing
  • Publishing to PyPI
  • Distribution to users
  • Integration into CI/CD pipelines

  Next Steps:
  1. Test locally: ./install.sh && python test_package.py
  2. Try with real data: workflow-compare RUN_ID_1 RUN_ID_2
  3. Build: python -m build
  4. Publish: python -m twine upload dist/*

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Created: December 11, 2025
Version: 0.1.0
License: MIT
Repository: tenstorrent/workflow-compare
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
