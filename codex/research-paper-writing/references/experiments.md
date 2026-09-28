# Experiment writing: comparison, result, explanation

Use this guide when drafting or revising an experimental section. Preserve the author's structure and adopt these preferences where they fit the paper; they are not a universal venue template.

When deciding what to measure, first use [experiment design](experiment-design.md). This guide covers the write-up of that design and its results.

## Organize around the reader's questions

Prefer **Experiment Setup → Performance Evaluation → Efficiency Evaluation** for papers with quality and cost contributions. Setup can use concise `\textbf{}` run-in headings for models/data/metrics, baselines, and implementation details. Put quality ablations and mechanism diagnostics under performance; complete training cost and operator/backend comparisons belong under efficiency. Merge precision-specific paragraphs that repeat the same comparison into **Performance Comparison with Baselines**.

Setup states the model names, data source and amount, relevant training settings, and evaluation tasks directly. Remove architectural descriptions and parenthetical qualifications that do not change the interpretation. Keep maximum sequence length distinct from the actual length or token count of sampled examples. State fairness conditions once, scoped to the methods that actually share them; implementation recipes and manifests belong in the appendix.

## Keep the main comparison at the contribution's scope

When the method improves a class of approaches, make that class the comparison subject. In the main performance narrative, prefer “the strongest baseline” or, when justified, “the best SOTA baseline” to a succession of named-method comparisons. This keeps the emphasis on the general contribution rather than presenting an incremental modification to one method.

Names still belong in baseline setup, tables, legends, citations, and comparisons where identity explains the result: an ablation, objective change, equal-budget control, or backend substitution. Do not replace a specific experimental control with “SOTA” if that changes which comparator or budget the claim refers to. In records or tables, retain the exact comparator behind every headline value. “Best” means the best eligible comparator for the stated model, metric and protocol; it is not evidence of superiority to all published work. Use an asserted SOTA designation only with support, or retain the author's explicit pending-draft status.

## Write short result-led paragraphs

A useful progression is:

1. State the comparison or the question, briefly including the defining control.
2. Refer to the figure/table and give its principal observation.
3. Give one representative gain with its model, metric and comparator.
4. Explain what feature of the method accounts for the observation, at the strength supported by the evidence.

These roles need not occupy four sentences. For a main comparison, one sentence can introduce the figure and overall result. For an ablation, the first sentence should explain what is varied and held fixed. End with a concrete mechanism or consequence, not another sentence saying that the experiment validates the method.

Avoid stacked numerical pairs and repeated “respectively” clauses. Let tables carry the full matrix. Do not repeat why every baseline was included, recap the training algorithm in Setup, or insert irrelevant architecture taxonomies. If the author supplies a reference paper, inspect how each sentence contributes to the paragraph; borrow that progression, not its wording, hardware, repeat counts, or unsupported causal certainty.

Illustrative compression:

- Overloaded: “A gains 3.45 and 3.32 points over B, and 0.97 and 0.72 points over C, respectively.”
- Focused: “On model M at 2bit, A improves LCB accuracy by 0.97% over the strongest evaluated baseline.”

The latter still needs a traceable comparator; omitting names from prose does not discard attribution.

## Preserve numerical meaning

This author uses `2bit` / `4bit` in visible manuscript text. When requested, write an absolute accuracy gap as `0.97\%`, rather than “0.97 percentage points.” Preserve the subtraction on the 0–100 scale; **do not divide by baseline accuracy or call it a relative improvement**. Clarify this convention once in an appendix or metric note. Runtime and memory percentage reductions remain relative ratios; speedup is a separate quantity. Loss differences and correlations retain their own units.

Keep unmeasured values and dependent interpretations in the agreed `\tofill{}` or equivalent draft notation, with source provenance. Do not turn assumed noise into measured Std or infer efficacy from author-prescribed rankings. Preserve negative outcomes and numerical limits even while making the writing concise.

## Tables, figures, and evidence checks

- Label the role of each comparison: external baseline, ablation, mechanism diagnostic, or efficiency control. A table of component removals does not establish competitiveness against other methods.
- Give each table a metric, unit, better direction, and identifiable comparator. Define whether uncertainty is a standard deviation, standard error, or interval, and which independent units it covers. Mark missing runs instead of treating them as zero.
- Distinguish author-reported baseline values from reproduced values; report mismatched information or resource assumptions separately. Preserve the source of every headline result and its eligible comparator.
- Make captions explain the question, conditions, and observation without relying on surrounding prose. Combine color with markers or line styles; inspect legibility at final manuscript scale.
- Trace Abstract and Introduction magnitudes to the actual table, figure, or recorded result. Retain ties, losses, adverse regimes, and limits on generalization. Keep measured results distinct from authorized hypothetical draft placeholders.
