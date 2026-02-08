#!/bin/bash
# Run all property tests for DigiTransLab documentation repository
# Feature: digitranslab-docs

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR/.."

echo "========================================"
echo "DigiTransLab Documentation Property Tests"
echo "========================================"
echo ""

TOTAL_TESTS=4
PASSED_TESTS=0
FAILED_TESTS=0

# Test 1: Navigation Link Consistency
echo "Running Test 1: Navigation Link Consistency..."
if bash tests/validate-navigation.sh; then
    PASSED_TESTS=$((PASSED_TESTS + 1))
else
    FAILED_TESTS=$((FAILED_TESTS + 1))
fi
echo ""

# Test 2: British English Spelling
echo "Running Test 2: British English Spelling..."
if bash tests/validate-british-english.sh; then
    PASSED_TESTS=$((PASSED_TESTS + 1))
else
    FAILED_TESTS=$((FAILED_TESTS + 1))
fi
echo ""

# Test 3: Badge Format Consistency
echo "Running Test 3: Badge Format Consistency..."
if bash tests/validate-badge-format.sh; then
    PASSED_TESTS=$((PASSED_TESTS + 1))
else
    FAILED_TESTS=$((FAILED_TESTS + 1))
fi
echo ""

# Test 4: Case Study Structure
echo "Running Test 4: Case Study Structure..."
if bash tests/validate-case-studies.sh; then
    PASSED_TESTS=$((PASSED_TESTS + 1))
else
    FAILED_TESTS=$((FAILED_TESTS + 1))
fi
echo ""

echo "========================================"
echo "Final Results"
echo "========================================"
echo "Total tests: $TOTAL_TESTS"
echo "Passed: $PASSED_TESTS"
echo "Failed: $FAILED_TESTS"
echo ""

if [ $FAILED_TESTS -gt 0 ]; then
    echo "❌ Some tests FAILED"
    exit 1
else
    echo "✅ All tests PASSED"
    exit 0
fi
