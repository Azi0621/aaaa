# Automatic News Labeling with a Foundation Model

## Dataset and task

This demo uses a small, transparent sample derived from the public **AG News**
topic-classification task. Each input is an English news headline or short
description. The labeling target is one of four mutually exclusive topics:
`World`, `Sports`, `Business`, or `Science and Technology`. The included CSV
keeps human reference labels so model–human agreement can be calculated.

## Model and method

The implementation uses `typeform/distilbert-base-uncased-mnli`, a transformer pretrained
for natural-language inference, through the Hugging Face Transformers local
inference pipeline. No paid API or private data is required. Zero-shot
classification turns each candidate label into the hypothesis: “This news
article is about {label}.” The model scores whether the input entails each
hypothesis, and the highest-scoring label is selected. This design makes the
label set explicit, reproducible, and easy to extend.

Run the demo with:

```bash
python -m pip install -r requirements.txt
python demo_code.py
```

The first execution downloads model weights. Each JSONL result contains the
input, human label, model label, confidence, and agreement flag. The script
also prints aggregate agreement accuracy.

## Execution status and example output

The code path and deterministic data-flow tests were run locally. Downloading
the public model weights from Hugging Face timed out in the supplied network
environment, so this submission does **not** claim measured model accuracy or
confidence. `output/example_predictions.jsonl` is deliberately marked
`not_run` and demonstrates only the output schema. Running the command above
in a network-enabled environment replaces that file (or the default
`output/predictions.jsonl`) with measured predictions.

For the included texts, the expected qualitative behavior is that strong cues
such as “championship,” “central bank,” and “open-source model” support Sports,
Business, and Science and Technology respectively. These expectations are not
reported as experimental results.

The most likely errors are semantically overlapping cases. A story about the
business impact of new technology could reasonably be either Business or
Science and Technology. International trade combines World and Business.
Short inputs with few contextual cues also tend to have lower confidence.
Consequently, confidence should be treated as a triage signal rather than a
guarantee of correctness.

## Human versus model labeling

The model offers high throughput, low marginal cost, and consistent application
of a fixed taxonomy. Human annotators provide better domain context, can detect
irony or ambiguity, and can revise an unsuitable taxonomy, but they are slower,
more expensive, and can disagree with one another. The most reliable production
workflow combines both: the model handles clear cases and humans review
uncertain or high-impact examples.

## Improvements

1. Add confidence filtering and route predictions below a calibrated threshold
   to human review.
2. Use prompt/model ensembling and majority voting to reduce sensitivity to a
   single hypothesis template or model.
3. Build a small validated development set, tune label descriptions, and report
   a confusion matrix rather than accuracy alone.
4. Feed reviewed corrections back into a lightweight fine-tuning or retrieval
   workflow and monitor class drift over time.
