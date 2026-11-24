from dataclasses import dataclass, field


@dataclass(slots=True)
class Article:
    title: str
    author: str
    comment_count: int
    time: str
    article_content: str
    images_in_article: list[str] = field(default_factory=list)

    def as_csv_row(self) -> dict[str, str | int]:
        return {
            "Title": self.title,
            "Author": self.author,
            "Comment Count": self.comment_count,
            "Time": self.time,
            "Article Content": self.article_content,
            "Images In Article": " | ".join(self.images_in_article),
        }
