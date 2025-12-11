#!/usr/bin/env python3
"""
Quick test script to verify the package works
Run this after installation to test basic functionality
"""

import sys

def test_imports():
    """Test that all modules can be imported"""
    print("Testing imports...")
    try:
        from workflow_compare import GitHubAPI, WorkflowComparator, Reporter
        print("✅ All modules imported successfully")
        return True
    except ImportError as e:
        print(f"❌ Import failed: {e}")
        return False

def test_api_init():
    """Test API initialization"""
    print("\nTesting API initialization...")
    try:
        from workflow_compare import GitHubAPI
        api = GitHubAPI()
        assert api.repo == "tenstorrent/tt-metal"
        print(f"✅ API initialized with default repo: {api.repo}")
        return True
    except Exception as e:
        print(f"❌ API init failed: {e}")
        return False

def test_custom_repo():
    """Test custom repo"""
    print("\nTesting custom repo...")
    try:
        from workflow_compare import GitHubAPI
        api = GitHubAPI(repo="owner/repo")
        assert api.repo == "owner/repo"
        print(f"✅ Custom repo set: {api.repo}")
        return True
    except Exception as e:
        print(f"❌ Custom repo failed: {e}")
        return False

def test_cli_available():
    """Test CLI is available"""
    print("\nTesting CLI availability...")
    import subprocess
    try:
        result = subprocess.run(
            ['ghadiff', '--help'],
            capture_output=True,
            text=True,
            timeout=5
        )
        if result.returncode == 0:
            print("✅ CLI command 'ghadiff' is available")
            return True
        else:
            print("❌ CLI command failed")
            return False
    except FileNotFoundError:
        print("❌ CLI command 'ghadiff' not found")
        return False
    except Exception as e:
        print(f"❌ CLI test failed: {e}")
        return False

def main():
    """Run all tests"""
    print("="*60)
    print("Workflow Compare - Package Test")
    print("="*60)
    
    tests = [
        test_imports,
        test_api_init,
        test_custom_repo,
        test_cli_available
    ]
    
    results = [test() for test in tests]
    
    print("\n" + "="*60)
    print(f"Results: {sum(results)}/{len(results)} tests passed")
    print("="*60)
    
    if all(results):
        print("\n🎉 All tests passed! Package is ready to use.")
        print("\nNext steps:")
        print("1. Set GitHub token: export GITHUB_TOKEN=your_token")
        print("2. Try: ghadiff --help")
        print("3. Compare runs: ghadiff RUN_ID_1 RUN_ID_2")
        return 0
    else:
        print("\n⚠️  Some tests failed. Check the output above.")
        return 1

if __name__ == '__main__':
    sys.exit(main())
