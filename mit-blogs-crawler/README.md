# MIT Admissions Blogs Crawler

This submission crawls `https://mitadmissions.org/blogs/` with **both**
Playwright and DrissionPage and writes UTF-8 CSV files with the required
headers:

`Title | Author | Comment Count | Time | Article Content | Images In Article`

## Setup

```bash
python -m venv .venv
python -m pip install -r requirements.txt
python -m playwright install chromium
```

## Run both implementations

```bash
python -m crawler.playwright_crawler --limit 10
python -m crawler.drissionpage_crawler --limit 10
```

If Chromium installation is unavailable but Google Chrome is already
installed, set `CHROME_PATH` before running Playwright. For example on Windows:

```powershell
$env:CHROME_PATH = "C:\Program Files\Google\Chrome\Application\chrome.exe"
python -m crawler.playwright_crawler --limit 10
```

Results are saved as:

- `output/playwright_results.csv`
- `output/drissionpage_results.csv`

The shared parser uses multiple selector fallbacks because blog templates can
change over time. Image URLs are normalized to absolute URLs, duplicate links
and images are removed, and CSV output includes a UTF-8 BOM for convenient
opening in Excel.

## Test

```bash
pytest -q
```

Please crawl responsibly: keep the default sample small, avoid high
concurrency, and respect the website's terms and robots policy.
