import argparse
import os

from playwright.sync_api import sync_playwright

from .io import write_csv
from .parser import extract_article_links, parse_article

BASE_URL = "https://mitadmissions.org/blogs/"


def crawl(limit: int, output: str) -> None:
    articles = []
    with sync_playwright() as playwright:
        executable_path = os.getenv("CHROME_PATH")
        launch_options = {"headless": True}
        if executable_path:
            launch_options["executable_path"] = executable_path
        browser = playwright.chromium.launch(**launch_options)
        page = browser.new_page(viewport={"width": 1440, "height": 1000})
        page.goto(BASE_URL, wait_until="domcontentloaded", timeout=60_000)
        links = extract_article_links(page.content(), BASE_URL)[:limit]

        for link in links:
            page.goto(link, wait_until="domcontentloaded", timeout=60_000)
            articles.append(parse_article(page.content(), page.url))
        browser.close()

    write_csv(articles, output)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--limit", type=int, default=10)
    parser.add_argument("--output", default="output/playwright_results.csv")
    args = parser.parse_args()
    crawl(args.limit, args.output)
