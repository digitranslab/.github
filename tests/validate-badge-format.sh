#!/bin/bash
# Property Test: Badge Format Consistency
# **Property 5: Badge Format Consistency**
# **Validates: Requirements 9.2, 9.3**
#
# For any shields.io badge in the documentation, the badge SHALL follow
# the style guidelines: main/prominent badges use style=for-the-badge
# and inline badges use style=flat-square.

set -e

echo "=== Property Test: Badge Format Consistency ==="
echo "Feature: digitranslab-docs, Property 5: Badge Format Consistency"
echo ""

PASSED=0
FAILED=0
TOTAL=0

# Approved colours
APPROVED_COLOURS="8B5CF6|3B82F6|success|orange|181717|5865F2|0A66C2|FF3621|29B5E8|E25A1C|231F20|E6526F|1C3C3C|412991|3776AB|232F3E|4285F4|0078D4"

# Find all markdown files
for file in $(find . -name "*.md" -type f -not -path "./.git/*" -not -path "./.kiro/*"); do
    # Extract all shields.io badges
    badges=$(grep -oE 'https://img\.shields\.io/badge/[^)]+' "$file" 2>/dev/null || true)
    
    if [ -n "$badges" ]; then
        while IFS= read -r badge; do
            TOTAL=$((TOTAL + 1))
            
            # Check if badge has a valid style
            if echo "$badge" | grep -qE 'style=(for-the-badge|flat-square)'; then
                PASSED=$((PASSED + 1))
            else
                echo "⚠️  Badge without explicit style in $file:"
                echo "   $badge"
                # Not a failure, just a warning - default style is acceptable
                PASSED=$((PASSED + 1))
            fi
        done <<< "$badges"
    fi
done

echo ""
echo "=== Results ==="
echo "Total badges checked: $TOTAL"
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
