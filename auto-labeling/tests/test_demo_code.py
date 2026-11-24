import csv

from demo_code import label_samples, load_samples, summarize


class FakeClassifier:
    def __call__(self, text, candidate_labels, hypothesis_template, multi_label):
        label = "Sports" if "team" in text else "Business"
        return {"labels": [label], "scores": [0.9]}


def test_load_label_and_summarize(tmp_path) -> None:
    path = tmp_path / "samples.csv"
    with path.open("w", newline="", encoding="utf-8") as file:
        writer = csv.DictWriter(file, fieldnames=["text", "label"])
        writer.writeheader()
        writer.writerow({"text": "The team won", "label": "Sports"})
        writer.writerow({"text": "Revenue rose", "label": "World"})

    outputs = label_samples(load_samples(path), FakeClassifier())
    assert outputs[0]["model_label"] == "Sports"
    assert summarize(outputs) == {"samples": 2, "agreements": 1, "accuracy": 0.5}
