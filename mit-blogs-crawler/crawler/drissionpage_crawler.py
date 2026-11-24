import argparse
import os

from DrissionPage import ChromiumOptions, ChromiumPage

from .io import write_csv
from .parser import extract_article_links, parse_article

BASE_URL = "https://mitadmissions.org/blogs/"


def crawl(limit: int, output: str) -> None:
    options = ChromiumOptions().headless().auto_port()
    chrome_path = os.getenv("CHROME_PATH")
    if chrome_path:
        options.set_browser_path(chrome_path)
    page = ChromiumPage(options)
    try:
        page.get(BASE_URL)
        links = extract_article_links(page.html, BASE_URL)[:limit]
        articles = []
        for link in links:
            page.get(link)
            articles.append(parse_article(page.html, page.url))
        write_csv(articles, output)
    finally:
        page.quit()


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--limit", type=int, default=10)
    parser.add_argument("--output", default="output/drissionpage_results.csv")
    args = parser.parse_args()
    crawl(args.limit, args.output)
