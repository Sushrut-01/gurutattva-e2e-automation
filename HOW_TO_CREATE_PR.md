# 🔄 How to Create a Pull Request (PR)

**Created:** January 16, 2026
**Purpose:** Guide for creating PRs for team collaboration

---

## 🎯 Your Feature Branch is Ready!

**Branch Name:** `feature/setup-documentation-pr`
**Status:** ✅ Pushed to GitHub
**Ready for:** Pull Request creation

---

## 📝 Create PR - Two Methods

### **Method 1: Quick Link (Easiest)**

Click this link to create PR immediately:

```
https://github.com/Sushrut-01/gurutattva-e2e-automation/pull/new/feature/setup-documentation-pr
```

**OR**

### **Method 2: GitHub Web Interface**

#### Step 1: Go to Repository
```
https://github.com/Sushrut-01/gurutattva-e2e-automation
```

#### Step 2: You'll see a yellow banner
```
┌─────────────────────────────────────────────────────────────┐
│ feature/setup-documentation-pr had recent pushes           │
│ [Compare & pull request] ←───── Click this button          │
└─────────────────────────────────────────────────────────────┘
```

#### Step 3: Fill in PR Details

**Title:**
```
Add PR template for better collaboration workflow
```

**Description:**
```markdown
## 📋 Description
Added Pull Request template to standardize PR submissions across the team.

## 🎯 Type of Change
- [x] 📝 Documentation update
- [x] 🔧 Configuration change

## ✨ What's New
- Created `.github/PULL_REQUEST_TEMPLATE.md`
- Includes checklist for PR submissions
- Sections for: Description, Testing, Screenshots, Related Issues
- Reviewer checklist for code review process

## 💡 Benefits
- ✅ Standardized PR format across team
- ✅ Ensures all important info is included
- ✅ Makes code reviews easier
- ✅ Tracks testing and documentation updates

## 🧪 Testing
- [x] Template renders correctly on GitHub
- [x] All sections are clear and useful
- [x] No impact on existing codebase

## ✅ Checklist
- [x] Template follows GitHub best practices
- [x] Clear sections and instructions
- [x] Helpful for team collaboration
```

#### Step 4: Select Reviewers (Optional)
- Click "Reviewers" dropdown
- Select team members to review (if any)

#### Step 5: Add Labels (Optional)
- `documentation`
- `enhancement`

#### Step 6: Create Pull Request
Click the green **"Create pull request"** button

---

## 🔍 After Creating PR

### What Happens Next:

1. **PR is Created** ✅
   - Unique PR number assigned (e.g., #1, #2, etc.)
   - Visible to all team members

2. **Review Process**
   - Team members can review code
   - Add comments and suggestions
   - Approve or request changes

3. **Merge PR**
   - After approval, click "Merge pull request"
   - Choose merge type:
     - ✅ **Merge commit** (recommended - preserves history)
     - Squash and merge (combines commits)
     - Rebase and merge (linear history)

4. **Delete Branch** (Optional)
   - After merge, GitHub offers to delete feature branch
   - Click "Delete branch" to clean up

---

## 🔄 Complete PR Workflow (For Future Reference)

### Step-by-Step Process:

```bash
# 1. Create feature branch from master
git checkout master
git pull origin master
git checkout -b feature/your-feature-name

# 2. Make your changes
# ... edit files ...

# 3. Commit changes
git add .
git commit -m "Descriptive commit message"

# 4. Push feature branch to GitHub
git push -u origin feature/your-feature-name

# 5. Create PR on GitHub (using link or web interface)
# 6. Wait for review and approval
# 7. Merge PR on GitHub
# 8. Delete feature branch on GitHub
# 9. Update local master

# 10. Clean up local branches
git checkout master
git pull origin master
git branch -d feature/your-feature-name
```

---

## 📋 PR Best Practices

### ✅ DO:
- Create descriptive branch names (`feature/`, `bugfix/`, `docs/`)
- Write clear commit messages
- Keep PRs focused and small
- Add tests for new features
- Update documentation
- Fill out PR template completely
- Respond to review comments promptly
- Test locally before creating PR

### ❌ DON'T:
- Push directly to master (use PRs instead)
- Create huge PRs with many unrelated changes
- Leave PR description empty
- Ignore review comments
- Force push after creating PR (unless necessary)
- Merge your own PRs without review (for team projects)

---

## 🎨 PR Template Features

Your PR template includes:

1. **Description Section**
   - What changes were made
   - Why changes were needed

2. **Type of Change**
   - Bug fix, new feature, docs, etc.
   - Checkbox for easy selection

3. **Testing Section**
   - What tests were run
   - How to verify changes

4. **Screenshots**
   - Visual proof of changes (for UI)

5. **Checklist**
   - Code quality checks
   - Documentation updates
   - Test coverage

6. **Related Issues**
   - Link to GitHub issues
   - Fixes #, Relates to #

---

## 🔗 Your Current PR Details

**Repository:** https://github.com/Sushrut-01/gurutattva-e2e-automation

**Branch:** `feature/setup-documentation-pr`

**Create PR Link:**
```
https://github.com/Sushrut-01/gurutattva-e2e-automation/pull/new/feature/setup-documentation-pr
```

**Changes:**
- Added `.github/PULL_REQUEST_TEMPLATE.md`
- Improves collaboration workflow
- Standardizes PR submissions

---

## 📊 Why Use PRs Instead of Direct Push?

### Benefits:

1. **Code Review** ✅
   - Team members review before merge
   - Catch bugs early
   - Share knowledge

2. **Documentation** ✅
   - PR describes what changed and why
   - Easy to track history
   - Reference for future

3. **Testing** ✅
   - Can run CI/CD tests
   - Verify changes before merge
   - Protect master branch

4. **Collaboration** ✅
   - Discuss changes before merge
   - Suggest improvements
   - Learn from each other

5. **Safety** ✅
   - Can revert easily if issues
   - Master branch stays stable
   - Reduces merge conflicts

---

## 🚀 Quick Reference Commands

```bash
# Check current branch
git branch

# Create new feature branch
git checkout -b feature/feature-name

# Push feature branch
git push -u origin feature/feature-name

# Update master after PR merge
git checkout master
git pull origin master

# Delete merged feature branch locally
git branch -d feature/feature-name

# Force delete branch (if not merged)
git branch -D feature/feature-name
```

---

## 📞 Need Help?

If you have questions:
1. Check GitHub's PR documentation
2. Ask team members
3. Review this guide

**GitHub PR Guide:**
https://docs.github.com/en/pull-requests

---

## ✅ Next Steps

1. **Click the link above** to create your PR
2. **Fill in the template** with your changes
3. **Create the PR** by clicking the button
4. **Share PR link** with team for review
5. **Merge after approval**
6. **Update local master** branch

---

**Ready to create your first PR!** 🎉

**Link:** https://github.com/Sushrut-01/gurutattva-e2e-automation/pull/new/feature/setup-documentation-pr

Just click and follow the GitHub interface! 🚀
