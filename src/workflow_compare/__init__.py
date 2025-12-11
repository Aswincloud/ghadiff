"""
Workflow Compare - A tool to compare GitHub workflow runs
"""

__version__ = "0.1.0"

from .api import GitHubAPI
from .comparator import WorkflowComparator
from .reporter import Reporter

__all__ = ["GitHubAPI", "WorkflowComparator", "Reporter"]
