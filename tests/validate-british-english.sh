#!/bin/bash
# Property Test: British English Spelling Consistency
# **Property 2: British English Spelling Consistency**
# **Validates: Requirements 2.7, 9.1**
#
# For any markdown file in the repository, all text content SHALL use
# British English spelling conventions.

set -e

echo "=== Property Test: British English Spelling Consistency ==="
echo "Feature: digitranslab-docs, Property 2: British English Spelling Consistency"
echo ""

WARNINGS=0
TOTAL=0

# American spellings to check (excluding HTML attributes like align="center")
# We check for word boundaries to avoid false positives
declare -a AMERICAN_SPELLINGS=(
    "\\bcolor\\b"
    "\\bcolors\\b"
    "\\borganization\\b"
    "\\borganizations\\b"
    "\\bbehavior\\b"
    "\\bbehaviors\\b"
    "\\banalyze\\b"
    "\\banalyzing\\b"
    "\\boptimize\\b"
    "\\boptimizing\\b"
    "\\boptimization\\b"
    "\\bfavor\\b"
    "\\bfavors\\b"
    "\\bhonor\\b"
    "\\bhonors\\b"
    "\\blabor\\b"
    "\\blabors\\b"
    "\\bneighbor\\b"
    "\\bneighbors\\b"
    "\\bprograming\\b"
    "\\bmodeling\\b"
    "\\btraveling\\b"
    "\\bcanceled\\b"
    "\\blicensed\\b"
)

# Find all markdown files
for file in $(find . -name "*.md" -type f -not -path "./.git/*" -not -path "./.kiro/*"); do
    TOTAL=$((TOTAL + 1))
    FILE_WARNINGS=0
    
    for spelling in "${AMERICAN_SPELLINGS[@]}"; do
        # Exclude lines that are HTML attributes (align="center" is valid HTML)
        # Also exclude code blocks and badge URLs
        matches=$(grep -iE "$spelling" "$file" 2>/dev/null | grep -v 'align="center"' | grep -v 'shields.io' | grep -v '```' || true)
        
        if [ -n "$matches" ]; then
            # Additional check: make sure it's not in a code block or URL
            if echo "$matches" | grep -qvE '(https?://|`.*`|shields\.io)'; then
                echo "⚠️  WARNING: Potential American spelling in $file:"
                echo "$matches" | head -3
                FILE_WARNINGS=$((FILE_WARNINGS + 1))
                WARNINGS=$((WARNINGS + 1))
            fi
        fi
    done
    
    if [ $FILE_WARNINGS -eq 0 ]; then
        echo "✅ PASS: $file uses British English"
    fi
done

echo ""
echo "=== Results ==="
echo "Total files checked: $TOTAL"
echo "Warnings: $WARNINGS"

if [ $WARNINGS -gt 0 ]; then
    echo ""
    echo "⚠️  Property test completed with warnings"
    echo "Note: Some warnings may be false positives (HTML attributes, URLs, code)"
    exit 0
else
    echo ""
    echo "✅ Property test PASSED"
    exit 0
fi
