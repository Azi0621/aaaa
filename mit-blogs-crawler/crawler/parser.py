import re
from urllib.parse import urljoin

from bs4 import BeautifulSoup

from .models import Article


def _first_text(soup: BeautifulSoup, selectors: list[str]) -> str:
    for selector in selectors:
        element = soup.select_one(selector)
        if element:
            value = element.get("content") if element.name == "meta" else element.get_text(" ", strip=True)
            if value:
                return str(value).strip()
    return ""


def parse_article(html: str, page_url: str) -> Article:
    """Parse a MIT Admissions blog page using resilient selector fallbacks."""
    soup = BeautifulSoup(html, "lxml")

    title = _first_text(soup, ["h1", "meta[property='og:title']", "title"])
    author = _first_text(
        soup,
        [".blog-author", ".author", "[rel='author']", "meta[name='author']"],
    )
    published = _first_text(
        soup,
        ["time", "meta[property='article:published_time']", ".date", ".published"],
    )

    content_node = None
    for selector in ["article .entry-content", "article .post-content", "article", ".entry-content", "main"]:
        content_node = soup.select_one(selector)
        if content_node:
            break
    article_content = content_node.get_text("\n", strip=True) if content_node else ""

    comments_text = _first_text(soup, [".comment-count", "a[href*='#comments']", "#comments"])
    comments_match = re.search(r"\d+", comments_text.replace(",", ""))
    comment_count = int(comments_match.group()) if comments_match else 0

    images: list[str] = []
    if content_node:
        for image in content_node.select("img[src]"):
            absolute_url = urljoin(page_url, str(image.get("src")))
            if absolute_url not in images:
                images.append(absolute_url)

    return Article(title, author, comment_count, published, article_content, images)


def extract_article_links(html: str, base_url: str) -> list[str]:
    soup = BeautifulSoup(html, "lxml")
    links: list[str] = []
    for anchor in soup.select("a[href]"):
        url = urljoin(base_url, str(anchor.get("href")))
        if "/blogs/entry/" in url and url not in links:
            links.append(url)
    return links
