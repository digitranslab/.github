#!/bin/bash
# Property Test: Navigation Link Consistency
# **Property 1: Navigation Link Consistency**
# **Validates: Requirements 1.6**
#
# For any markdown file in the docs/ directory, the file SHALL contain
# at least one navigation link back to the main README.md or parent document.

set -e

echo "=== Property Test: Navigation Link Consistency ==="
echo "Feature: digitranslab-docs, Property 1: Navigation Link Consistency"
echo ""

FAILED=0
PASSED=0
TOTAL=0

# Find all markdown files in docs/ directory
for file in $(find docs -name "*.md" -type f); do
    TOTAL=$((TOTAL + 1))
    
    # Check for navigation links (links to README.md, parent directories, or home)
    if grep -qE '\[.*\]\((\.\.\/|README\.md|\.\.\/README\.md|\.\.\/\.\.\/README\.md|🏠|Home|Back)' "$file"; then
        PASSED=$((PASSED + 1))
        echo "✅ PASS: $file contains navigation link"
    else
        FAILED=$((FAILED + 1))
        echo "❌ FAIL: $file missing navigation link to parent/home"
    fi
done

echo ""
echo "=== Results ==="
echo "Total files checked: $TOTAL"
echo "Passed: $PASSED"
echo "Failed: $FAILED"

if [ $FAILED -gt 0 ]; then
    echo ""
    echo "❌ Property test FAILED"
    exit 1
else
    echo ""
    echo "✅ Property test PASSED"
    exit 0
fi
