# הוראות להפעלת GitHub Actions - Automated MSI Building
# Instructions for Activating GitHub Actions - Automated MSI Building

**גרסה:** Ov2.1.13F1.0.0-BLL
**Version:** Ov2.1.13F1.0.0-BLL

---

## עברית | Hebrew

### סיכום
GitHub Actions מוכן לבניה אוטומטית של MSI, אך דורש הוספה ידנית בגלל הגבלות אבטחה של OAuth.

### שלבים מהירים

#### אופציה 1: דרך ממשק GitHub Web (מומלץ)

1. **פתח את הקובץ בGitHub:**
   ```
   https://github.com/ORELASH/redshift-odbc-driver-v2.1.13-complete/blob/main/docs/github-actions/build-msi.yml.template
   ```

2. **לחץ על "Raw" וכשמר את הקובץ:**
   - לחץ על כפתור "Raw" בצד ימין
   - שמור את הקובץ (Ctrl+S או Right-click → Save As)
   - שמור כ-`build-msi.yml` (הסר את `.template`)

3. **צור תיקייה חדשה בGitHub:**
   - עבור לדף הראשי של הריפוסיטורי
   - לחץ "Add file" → "Create new file"
   - הקלד בשדה שם הקובץ: `.github/workflows/build-msi.yml`
     - GitHub יצור את התיקיות אוטומטית

4. **העתק את התוכן:**
   - פתח את `build-msi.yml` שהורדת
   - העתק את כל התוכן (Ctrl+A, Ctrl+C)
   - הדבק בעורך של GitHub (Ctrl+V)

5. **Commit הקובץ:**
   - גלול למטה ל"Commit new file"
   - הוסף הודעה: `Add GitHub Actions workflow for automated MSI building`
   - לחץ "Commit new file"

6. **הרץ Workflow:**
   - עבור ל-Actions tab
   - בחר "Build Amazon Redshift ODBC Driver MSI"
   - לחץ "Run workflow"
   - בחר branch: `main`
   - לחץ "Run workflow"

7. **המתן לסיום:**
   - הבנייה תימשך כ-15-30 דקות
   - עקוב אחר התקדמות ב-Actions tab

8. **הורד MSI:**
   - כשהבנייה הסתיימה, עבור ל-Actions
   - לחץ על הרצה האחרונה
   - גלול ל-"Artifacts"
   - הורד: `AmazonRedshiftODBC64-Ov2.1.13F1.0.0-BLL`

---

#### אופציה 2: דרך GitHub CLI (מתקדם)

אם יש לך הרשאות Workflow Scope:

```bash
cd /home/orel/redshift-odbc-versions/Ov2.1.13F1.0.0-BLL

# רענן אימות עם workflow scope
gh auth refresh -h github.com -s workflow

# צור את התיקייה
mkdir -p .github/workflows

# העתק את הקובץ
cp docs/github-actions/build-msi.yml.template .github/workflows/build-msi.yml

# Commit ו-Push
git add .github/workflows/build-msi.yml
git commit -m "Add GitHub Actions workflow for automated MSI building"
git push origin main

# הרץ workflow
gh workflow run build-msi.yml
```

---

## English

### Summary
GitHub Actions is ready for automated MSI building, but requires manual addition due to OAuth security restrictions.

### Quick Steps

#### Option 1: Via GitHub Web UI (Recommended)

1. **Open the template file on GitHub:**
   ```
   https://github.com/ORELASH/redshift-odbc-driver-v2.1.13-complete/blob/main/docs/github-actions/build-msi.yml.template
   ```

2. **Click "Raw" and download the file:**
   - Click the "Raw" button on the right
   - Save the file (Ctrl+S or Right-click → Save As)
   - Save as `build-msi.yml` (remove `.template`)

3. **Create new file on GitHub:**
   - Go to repository homepage
   - Click "Add file" → "Create new file"
   - Type in filename field: `.github/workflows/build-msi.yml`
     - GitHub will create directories automatically

4. **Copy the content:**
   - Open the downloaded `build-msi.yml`
   - Copy all content (Ctrl+A, Ctrl+C)
   - Paste in GitHub editor (Ctrl+V)

5. **Commit the file:**
   - Scroll down to "Commit new file"
   - Add message: `Add GitHub Actions workflow for automated MSI building`
   - Click "Commit new file"

6. **Run Workflow:**
   - Go to Actions tab
   - Select "Build Amazon Redshift ODBC Driver MSI"
   - Click "Run workflow"
   - Select branch: `main`
   - Click "Run workflow"

7. **Wait for completion:**
   - Build takes ~15-30 minutes
   - Monitor progress in Actions tab

8. **Download MSI:**
   - When build completes, go to Actions
   - Click on latest run
   - Scroll to "Artifacts"
   - Download: `AmazonRedshiftODBC64-Ov2.1.13F1.0.0-BLL`

---

#### Option 2: Via GitHub CLI (Advanced)

If you have Workflow Scope permissions:

```bash
cd /home/orel/redshift-odbc-versions/Ov2.1.13F1.0.0-BLL

# Refresh authentication with workflow scope
gh auth refresh -h github.com -s workflow

# Create directory
mkdir -p .github/workflows

# Copy file
cp docs/github-actions/build-msi.yml.template .github/workflows/build-msi.yml

# Commit and push
git add .github/workflows/build-msi.yml
git commit -m "Add GitHub Actions workflow for automated MSI building"
git push origin main

# Run workflow
gh workflow run build-msi.yml
```

---

## Workflow Details

### What it does:
1. ✅ Sets up Windows 2022 build environment
2. ✅ Installs Visual Studio, vcpkg, WiX Toolset
3. ✅ Installs AWS SDK C++ dependencies
4. ✅ Builds PostgreSQL client library
5. ✅ Builds ODBC driver with CMake
6. ✅ Creates MSI installer
7. ✅ Renames to `AmazonRedshiftODBC64-Ov2.1.13F1.0.0-BLL.msi`
8. ✅ Generates SHA256 checksum
9. ✅ Uploads artifact (90-day retention)
10. ✅ Creates GitHub release (for tags)

### Triggers:
- Push to `main`, `master`, or `Ov2.1.13F1.0.0-BLL` branches
- Pull requests to `main` or `master`
- Manual workflow dispatch
- Git tags starting with `v*`

### Output:
- **MSI File:** `AmazonRedshiftODBC64-Ov2.1.13F1.0.0-BLL.msi`
- **Checksum:** `AmazonRedshiftODBC64-Ov2.1.13F1.0.0-BLL.msi.sha256`
- **Retention:** 90 days

---

## Troubleshooting

### Problem: "Workflow not found"
**Solution:** Ensure `.github/workflows/build-msi.yml` exists in repository root

### Problem: "Build failed"
**Solution:** Check Actions tab → Click on failed run → View logs

### Problem: "No artifacts"
**Solution:** Check if build completed successfully (green checkmark)

### Problem: "Can't download MSI"
**Solution:**
- Check artifact retention (90 days)
- Ensure build completed successfully
- Re-run workflow if needed

---

## Repository Links

- **Repository:** https://github.com/ORELASH/redshift-odbc-driver-v2.1.13-complete
- **Template File:** https://github.com/ORELASH/redshift-odbc-driver-v2.1.13-complete/blob/main/docs/github-actions/build-msi.yml.template
- **Actions Tab:** https://github.com/ORELASH/redshift-odbc-driver-v2.1.13-complete/actions

---

## Support

**Maintainer:** Orel Ashush (ORELASH)
**Version:** Ov2.1.13F1.0.0-BLL
**Base:** AWS Amazon Redshift ODBC Driver v2.1.13.0

---

**סוף המדריך | End of Guide**
