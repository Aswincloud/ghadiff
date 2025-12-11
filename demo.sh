#!/bin/bash
# Demo script showing workflow-compare in action
# This is a demonstration script - requires real workflow run IDs to work

echo "╔════════════════════════════════════════════════════════════════════╗"
echo "║         Workflow Compare - Demo Script                            ║"
echo "╚════════════════════════════════════════════════════════════════════╝"
echo ""

# Check if GitHub token is set
if [ -z "$GITHUB_TOKEN" ]; then
    echo "⚠️  Warning: GITHUB_TOKEN not set"
    echo "   Please set it with: export GITHUB_TOKEN=your_token_here"
    echo ""
fi

echo "📦 Package: workflow-compare"
echo "🎯 Default Repository: tenstorrent/tt-metal"
echo ""

# Check if workflow-compare is installed
if ! command -v workflow-compare &> /dev/null; then
    echo "❌ workflow-compare command not found"
    echo "   Please install first:"
    echo "   pip install -e ."
    exit 1
fi

echo "✅ workflow-compare is installed"
echo ""

echo "═══════════════════════════════════════════════════════════════════"
echo "Example 1: Help"
echo "═══════════════════════════════════════════════════════════════════"
echo "$ workflow-compare --help"
echo ""
workflow-compare --help
echo ""

echo "═══════════════════════════════════════════════════════════════════"
echo "Example 2: Compare Two Runs (Text Format)"
echo "═══════════════════════════════════════════════════════════════════"
echo "$ workflow-compare RUN_ID_1 RUN_ID_2"
echo ""
echo "Note: Replace RUN_ID_1 and RUN_ID_2 with actual workflow run IDs"
echo "      from https://github.com/tenstorrent/tt-metal/actions"
echo ""

echo "═══════════════════════════════════════════════════════════════════"
echo "Example 3: Generate HTML Report"
echo "═══════════════════════════════════════════════════════════════════"
echo "$ workflow-compare RUN_ID_1 RUN_ID_2 --format html -o report.html"
echo ""

echo "═══════════════════════════════════════════════════════════════════"
echo "Example 4: JSON Output"
echo "═══════════════════════════════════════════════════════════════════"
echo "$ workflow-compare RUN_ID_1 RUN_ID_2 --format json"
echo ""

echo "═══════════════════════════════════════════════════════════════════"
echo "Example 5: Custom Repository"
echo "═══════════════════════════════════════════════════════════════════"
echo "$ workflow-compare RUN_ID_1 RUN_ID_2 --repo owner/repo"
echo ""

echo "═══════════════════════════════════════════════════════════════════"
echo "Python API Usage"
echo "═══════════════════════════════════════════════════════════════════"
cat << 'EOF'

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

EOF

echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "Get Workflow Run IDs"
echo "═══════════════════════════════════════════════════════════════════"
echo "1. Visit: https://github.com/tenstorrent/tt-metal/actions"
echo "2. Click on any workflow run"
echo "3. Get run ID from URL: .../actions/runs/XXXXXXXX"
echo ""

echo "═══════════════════════════════════════════════════════════════════"
echo "Ready to Use!"
echo "═══════════════════════════════════════════════════════════════════"
echo ""
echo "Try running:"
echo "  workflow-compare <RUN_ID_1> <RUN_ID_2>"
echo ""
