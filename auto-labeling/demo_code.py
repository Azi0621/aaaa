import argparse
import csv
import json
from pathlib import Path

from transformers import pipeline

LABELS = ["World", "Sports", "Business", "Science and Technology"]


def load_samples(path: str | Path, limit: int | None = None) -> list[dict[str, str]]:
    with Path(path).open(encoding="utf-8", newline="") as file:
        rows = list(csv.DictReader(file))
    return rows[:limit] if limit else rows


def build_classifier(model_name: str):
    return pipeline("zero-shot-classification", model=model_name)


def label_samples(samples: list[dict[str, str]], classifier) -> list[dict[str, str | float]]:
    outputs: list[dict[str, str | float]] = []
    for sample in samples:
        prediction = classifier(
            sample["text"],
            candidate_labels=LABELS,
            hypothesis_template="This news article is about {}.",
            multi_label=False,
        )
        outputs.append(
            {
                "text": sample["text"],
                "human_label": sample["label"],
                "model_label": prediction["labels"][0],
                "confidence": round(float(prediction["scores"][0]), 4),
                "agreement": prediction["labels"][0] == sample["label"],
            }
        )
    return outputs


def summarize(outputs: list[dict[str, str | float]]) -> dict[str, int | float]:
    correct = sum(bool(item["agreement"]) for item in outputs)
    total = len(outputs)
    return {
        "samples": total,
        "agreements": correct,
        "accuracy": round(correct / total, 4) if total else 0.0,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", default="data/ag_news_sample.csv")
    parser.add_argument("--output", default="output/predictions.jsonl")
    parser.add_argument("--limit", type=int)
    parser.add_argument("--model", default="typeform/distilbert-base-uncased-mnli")
    args = parser.parse_args()

    samples = load_samples(args.input, args.limit)
    classifier = build_classifier(args.model)
    outputs = label_samples(samples, classifier)

    output_path = Path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with output_path.open("w", encoding="utf-8") as file:
        for item in outputs:
            file.write(json.dumps(item, ensure_ascii=False) + "\n")

    print(json.dumps(summarize(outputs), indent=2))


if __name__ == "__main__":
    main()
