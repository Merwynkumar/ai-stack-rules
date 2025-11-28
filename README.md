# AI Stack – Community Rules Repository

This repository stores community-submitted rules for ai-stack.dev.

Below are the official contribution guidelines (similar to Cursor Directory).

---

# 🚀 How to Contribute

## 1. Fork This Repository

Click **Fork** on GitHub to create your copy.

---

## 2. Adding a New Rule

### A. Locate the Rules Directory

All rules are organized by tool in the following structure:

```
rules/
├── cursor/
│   ├── rule-name-1.json
│   ├── rule-name-2.json
│   └── ...
├── claude/
│   ├── rule-name-1.json
│   └── ...
├── github-copilot/
│   └── ...
├── windsurf/
│   └── ...
├── replit/
│   └── ...
└── general/
    └── ...
```

Each rule should be a JSON file with a descriptive name (e.g., `typescript-senior-developer.json`, `python-best-practices.json`).

**Current Rules Distribution:**
- **Claude**: 10 rules
- **Cursor**: 50 rules
- **GitHub Copilot**: 5 rules
- **Replit**: 5 rules
- **Windsurf**: 5 rules

### B. Create a Rule File

Create a new JSON file in the appropriate tool directory (`rules/{tool-slug}/`) with the following structure:

```json
{
  "title": "Your Rule Title",
  "category": "TypeScript",
  "tags": ["typescript", "react", "nextjs"],
  "content": "Your rule content here...",
  "is_official": false,
  "is_popular": false,
  "tool_slug": "cursor"
}
```

**Note:** The `tool_slug` field should match the folder name where the file is located (e.g., `cursor`, `claude`, `github-copilot`, `windsurf`, `replit`).

---

## 3. Adding to Existing Rules

If you want to improve or update an existing rule:

1. Find the rule file in the `rules/` directory
2. Make your changes
3. Update the file with your improvements
4. Create a Pull Request describing your changes

---

## 4. Rule Content Guidelines

Your rule content should:

- ✅ Be **accurate** and related to the category
- ✅ Be **clearly worded** to help developers understand and use them easily
- ✅ Be **actionable**, providing steps or insights to solve common problems
- ✅ Be **tested** - ensure your rule has been tested and works as expected
- ✅ Follow **best practices** for the technology/framework
- ✅ Be **concise** but provide enough detail to be helpful

---

## 5. File Naming Convention

- Use lowercase letters
- Separate words with hyphens (`-`)
- Be descriptive (e.g., `typescript-senior-developer.json`, not `rule1.json`)
- Match the category when possible (e.g., `python-django.json`, `react-native-expo.json`)

---

## 6. Create a Pull Request

After creating or updating a rule:

1. **Commit your changes** to your forked repository
2. **Push** your changes to your fork
3. **Create a Pull Request** from your fork to the main repository
4. Provide a **clear description** of your rule in the PR:
   - What category does it belong to?
   - What problem does it solve?
   - How have you tested it?

---

## 7. Pull Request Review Process

- All PRs will be reviewed by maintainers
- Your rule will be tested before merging
- Feedback may be provided if changes are needed
- Once approved, your rule will be merged and appear on ai-stack.dev

---

## 🤝 Contribution Guidelines

### Code of Conduct

- Be respectful and professional
- Provide helpful, constructive feedback
- Follow the existing code style and format
- Test your rules before submitting

### Questions?

If you have questions about contributing, please:
- Open an issue on GitHub
- Check existing issues for similar questions
- Review the documentation on [ai-stack.dev](https://ai-stack.dev)

---

## 📝 License

By contributing to this repository, you agree that your contributions will be licensed under the same license as the repository.

---

## 🙏 Thank You!

Thank you for contributing to the AI Stack community! Your rules help developers worldwide work more efficiently with AI-powered development tools.

