#!/bin/bash
# Property Test: Case Study Structure Completeness
# **Property 7: Case Study Structure Completeness**
# **Validates: Requirements 10.3**
#
# For any case study entry in CASE-STUDIES.md, the entry SHALL contain
# three distinct sections: Challenge, Solution, and Results.

set -e

echo "=== Property Test: Case Study Structure Completeness ==="
echo "Feature: digitranslab-docs, Property 7: Case Study Structure Completeness"
echo ""

CASE_STUDIES_FILE="CASE-STUDIES.md"

if [ ! -f "$CASE_STUDIES_FILE" ]; then
    echo "❌ FAIL: $CASE_STUDIES_FILE not found"
    exit 1
fi

# Count case study sections (identified by ### headers that aren't template or summary)
CASE_STUDY_COUNT=$(grep -E '^### [^(Template|Summary)]' "$CASE_STUDIES_FILE" | grep -v "Template" | wc -l | tr -d ' ')

# Count Challenge sections
CHALLENGE_COUNT=$(grep -cE '#### 🎯 Challenge' "$CASE_STUDIES_FILE" || echo 0)

# Count Solution sections
SOLUTION_COUNT=$(grep -cE '#### 💡 Solution' "$CASE_STUDIES_FILE" || echo 0)

# Count Results sections
RESULTS_COUNT=$(grep -cE '#### 📈 Results' "$CASE_STUDIES_FILE" || echo 0)

echo "Case studies found: $CASE_STUDY_COUNT"
echo "Challenge sections: $CHALLENGE_COUNT"
echo "Solution sections: $SOLUTION_COUNT"
echo "Results sections: $RESULTS_COUNT"
echo ""

# Each case study should have all three sections
# We expect the counts to match (excluding the template which also has these sections)
EXPECTED_SECTIONS=$((CASE_STUDY_COUNT))

PASSED=0
FAILED=0

# Check Challenge sections
if [ "$CHALLENGE_COUNT" -ge "$EXPECTED_SECTIONS" ]; then
    echo "✅ PASS: All case studies have Challenge sections"
    PASSED=$((PASSED + 1))
else
    echo "❌ FAIL: Missing Challenge sections (found $CHALLENGE_COUNT, expected $EXPECTED_SECTIONS)"
    FAILED=$((FAILED + 1))
fi

# Check Solution sections
if [ "$SOLUTION_COUNT" -ge "$EXPECTED_SECTIONS" ]; then
    echo "✅ PASS: All case studies have Solution sections"
    PASSED=$((PASSED + 1))
else
    echo "❌ FAIL: Missing Solution sections (found $SOLUTION_COUNT, expected $EXPECTED_SECTIONS)"
    FAILED=$((FAILED + 1))
fi

# Check Results sections
if [ "$RESULTS_COUNT" -ge "$EXPECTED_SECTIONS" ]; then
    echo "✅ PASS: All case studies have Results sections"
    PASSED=$((PASSED + 1))
else
    echo "❌ FAIL: Missing Results sections (found $RESULTS_COUNT, expected $EXPECTED_SECTIONS)"
    FAILED=$((FAILED + 1))
fi

echo ""
echo "=== Results ==="
echo "Checks passed: $PASSED/3"
echo "Checks failed: $FAILED/3"

if [ $FAILED -gt 0 ]; then
    echo ""
    echo "❌ Property test FAILED"
    exit 1
else
    echo ""
    echo "✅ Property test PASSED"
    exit 0
fi
