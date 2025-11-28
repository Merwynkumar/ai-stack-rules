# How to Review Exported Rules

This guide helps you review the exported rules before committing them to GitHub.

## Quick Review Methods

### 1. Automated Review (Recommended)

Run the review script to automatically validate all files:

```bash
# From the project root
node scripts/review-exported-rules.js
```

This script will:
- ✅ Validate JSON structure
- ✅ Check required fields (title, category, tags, content, tool_slug)
- ✅ Verify field types and formats
- ✅ Check for common issues
- ✅ Provide a summary by tool

### 2. Manual Review

#### A. Check Folder Structure

Verify that rules are organized correctly:

```
ai-stack-rules/rules/
├── claude/          (10 rules)
├── cursor/          (49 rules)
├── github-copilot/  (5 rules)
├── replit/          (5 rules)
└── windsurf/        (5 rules)
```

#### B. Verify File Structure

Each JSON file should have this structure:

```json
{
  "title": "Rule Title",
  "category": "Category Name",
  "tags": ["tag1", "tag2"],
  "content": "Rule content here...",
  "is_official": true,
  "is_popular": false,
  "tool_slug": "cursor"
}
```

**Required Fields:**
- `title` - String, non-empty
- `category` - String, non-empty
- `tags` - Array of strings
- `content` - String, non-empty
- `tool_slug` - String, must match folder name

**Optional Fields:**
- `is_official` - Boolean (default: false)
- `is_popular` - Boolean (default: false)

#### C. Check Specific Files

**Sample files to review:**

1. **Cursor rules** - Check a few files:
   ```bash
   # View a file
   cat ai-stack-rules/rules/cursor/always-specify-file-names.json
   ```

2. **Claude rules** - Verify structure:
   ```bash
   cat ai-stack-rules/rules/claude/claude-rule-python-backend-engineering-best-practices.json
   ```

3. **Other tools** - Spot check:
   ```bash
   # Windsurf
   cat ai-stack-rules/rules/windsurf/-windsurf-rule-modern-javascript-ui-logic-flow-guidance.json
   
   # Replit
   cat ai-stack-rules/rules/replit/-replit-agent-rule-javascript-iteration-runtime-feedback-excellence.json
   ```

### 3. What to Look For

#### ✅ Good Signs:
- JSON files are valid and parseable
- All required fields are present
- `tool_slug` matches the folder name
- `title` is descriptive and clear
- `content` is substantial (not too short)
- `tags` array has relevant tags

#### ❌ Issues to Watch For:
- Invalid JSON syntax
- Missing required fields
- `tool_slug` doesn't match folder
- Empty or very short content
- Empty tags array
- Very long titles (>100 characters)

### 4. Using Your Code Editor

You can also review files directly in your editor:

1. **Open the folder:**
   ```
   ai-stack-rules/rules/
   ```

2. **Navigate by tool:**
   - Open any tool folder (e.g., `cursor/`)
   - Review a few sample files
   - Check JSON syntax highlighting

3. **Use search:**
   - Search for specific rule titles
   - Find rules by category
   - Check for duplicate titles

### 5. Quick Validation Commands

**Count files per tool:**
```powershell
# PowerShell
Get-ChildItem -Path ai-stack-rules/rules -Directory | ForEach-Object { 
    Write-Host "$($_.Name): $((Get-ChildItem $_.FullName -File).Count) files" 
}
```

**Check JSON validity:**
```powershell
# PowerShell - Check all JSON files are valid
Get-ChildItem -Path ai-stack-rules/rules -Recurse -Filter *.json | ForEach-Object {
    try {
        Get-Content $_.FullName | ConvertFrom-Json | Out-Null
        Write-Host "✅ $($_.Name)"
    } catch {
        Write-Host "❌ $($_.Name) - Invalid JSON"
    }
}
```

## Review Checklist

Before committing, verify:

- [ ] All 74 rules are exported
- [ ] Files are organized by tool in correct folders
- [ ] All JSON files are valid (run review script)
- [ ] Required fields are present in all files
- [ ] `tool_slug` matches folder name
- [ ] No duplicate file names
- [ ] README.md is updated with new structure

## After Review

Once you've reviewed and everything looks good:

1. **Commit the changes:**
   ```bash
   cd ai-stack-rules
   git add .
   git commit -m "Export all rules organized by tool"
   git push
   ```

2. **Verify on GitHub:**
   - Check that files appear in correct folders
   - Verify README shows updated structure
   - Test that "Submit Yours" button works

## Need Help?

If you find any issues:
1. Run the review script to identify problems
2. Fix the issues in the source files
3. Re-run the export script: `node scripts/export-rules-to-github-structure.js`
4. Review again before committing

