from pathlib import Path

from crawler.parser import extract_article_links, parse_article


def test_parse_article() -> None:
    html = Path("tests/fixtures/article.html").read_text(encoding="utf-8")
    article = parse_article(html, "https://mitadmissions.org/blogs/entry/test/")

    assert article.title == "A Test Article"
    assert article.author == "MIT Blogger"
    assert article.comment_count == 12
    assert "First paragraph." in article.article_content
    assert article.images_in_article == ["https://mitadmissions.org/images/example.jpg"]


def test_extract_article_links_deduplicates() -> None:
    html = """
    <a href="/blogs/entry/one/">One</a>
    <a href="/blogs/entry/one/">Duplicate</a>
    <a href="/about/">Not an article</a>
    """
    assert extract_article_links(html, "https://mitadmissions.org/blogs/") == [
        "https://mitadmissions.org/blogs/entry/one/"
    ]
