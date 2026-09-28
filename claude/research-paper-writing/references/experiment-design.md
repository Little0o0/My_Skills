# Experiment Design and Interpretation

## Goal

Design experiments that can actually establish the paper's claims, and interpret results
without overreading them. Use this guide *before* running or writing up experiments.

Scope split: this file covers **what to run and why**. For writing up results —
section structure, table/figure hygiene, caption rules — use
`references/experiments.md`.

## Claim First, Dataset Second

Start from the claim, not from whatever the implementation already exposes. For each
planned experiment, answer in order:

1. **What claim is being tested?** State it as one falsifiable sentence.
2. **Why does this matter to the task?** If the improvement were real, what would change
   for someone using the method?
3. **What comparison could establish it?** Name the alternative and the conditions.
4. **What would a successful outcome license you to say?** Write the sentence you would
   put in the paper.
5. **Can this design distinguish the method from a strong alternative** under the stated
   information and resource conditions? If not, the experiment is not yet worth running.

Design the experiment to make a real advantage convincing, rather than accumulating
measurements around whatever is easy to instrument. If a proposed measurement cannot
support the intended claim *even when it succeeds*, revise the comparison or narrow the
claim before running it.

## An Advantage Need Not Be Higher Accuracy

A contribution can be established by any of these, provided the comparison is matched:

1. Comparable error at materially lower cost (compute, memory, communication, labels).
2. Robustness under distribution shift, noise, or adversarial conditions.
3. Better solution quality under a fixed budget.
4. A demonstrated capability that alternatives cannot provide at all.
5. A theoretical comparison of attainable error or robustness under aligned assumptions.

Do not force a capability or cost contribution into an accuracy table where it will look
like a marginal loss.

## Comparison Roles Are Not Interchangeable

This is the most common structural error in an evaluation section.

| Role | Question it answers | What it cannot do |
| --- | --- | --- |
| **External comparison** | Is the complete method competitive with the best existing option? | Explain which internal choice caused the result |
| **Ablation** | Which design choice causes the observed benefit? | Establish competitiveness against prior work |

Removing a component from your own method tells you about your method's internals. It
says nothing about whether your method beats anyone else's. A paper with only ablations
has not established competitiveness; a paper with only external comparisons has not
explained its own mechanism.

Choose baselines and regimes because they test the claim, **not because they are likely
to lose**. Include strong same-capability alternatives — the methods that solve the same
problem with the same class of resources.

## Match the Budgets, or Separate the Comparisons

A comparison is only informative if the things being compared had the same opportunity.
Align, and report:

1. **Information** — same data splits, same input features, same supervision, same
   target selection.
2. **Tuning opportunity** — comparable hyperparameter search for baselines and for the
   proposed method. A tuned method against an untuned baseline is not evidence.
3. **Compute accounting** — training and inference cost, stated with the measurement
   boundary (what is included in the timing).
4. **Randomness** — seeds, and how many independent runs.
5. **Paired statistical units** — the genuinely independent unit of analysis, which is
   usually not the individual prediction.

When assumptions or prediction budgets genuinely differ, present the comparisons
**separately**. Do not merge them into a single ranking that implies they were matched.

## Choose Primary Outcomes That Carry the Claim

The primary outcome must make the claimed advantage meaningful and comparable.

Internal statistics — intermediate variance, representation size, diagnostic agreement,
attention entropy — belong in a *supporting* role: they explain the main result. They
should not become an isolated main experiment with no demonstrated connection to the task
or the claimed capability. A favorable diagnostic alone does not establish improved
solving, prediction, or runtime.

Put correctness self-checks, certificate validation, and invariant tests in the appendix
or in validation details, with a brief main-text reference when needed. Passing them
establishes implementation correctness, not a competitive advantage.

## Four Argument Roles per Experiment

Write each experimental argument through these roles:

1. **Motivation** — why this question matters to the task or the contribution.
2. **Approach** — model, data, baselines, controlled variables, protocol.
3. **Actual results** — the measured comparison and its quantitative magnitude.
4. **Interpretation** — how the findings address the motivating problem, and whether they
   support, limit, or contradict the claimed advantage.

These are **logical roles, not four mandatory headings** and not four equally sized
paragraphs. Routine sensitivity studies can combine motivation and approach. When a
result reveals no separate mechanism, combine results and interpretation rather than
adding a repetitive explanation paragraph.

## Report Magnitudes Correctly

Quantify against the named reference and use the right scale. The prose-level rules live
in `references/human-voice.md` (§2 and item F); the arithmetic that matters here:

1. **Percentage points vs. relative percent.** Accuracy from 70% to 75% is a gain of
   **5 percentage points**, or about **7.1% relative** to the baseline. "5% improvement"
   is ambiguous and usually wrong.
2. **Always give the denominator** for a relative improvement.
3. **Time reduction is not speedup.** A 50% reduction in runtime is a 2x speedup; a 90%
   reduction is 10x. Retain the stated timing boundary.
4. **State direction.** Report the underlying values and whether larger or smaller is
   better.
5. **Uncertainty over independent units.** Compute intervals over the actual independent
   experimental units, not over correlated predictions.

Highlight meaningful measured advantages, but retain ties, losses, failures, and adverse
regimes. Describe author-reported results separately from results you reproduced.

## Writing Experiments Before Results Exist

Missing measurements do not prevent writing the experimental design. When results are not
yet available:

1. **Write the motivation and the executable protocol now** — the claim being tested,
   comparisons, controlled variables, metrics, and budgets.
2. **Use planned/future tense** where appropriate.
3. **Leave numerical cells explicitly unmeasured.** Label them `TBD` or an equivalent
   marker. Leave them empty rather than filled.
4. **Pre-register the interpretation.** State in advance how each outcome will be read:

```
Claim:            [one falsifiable sentence]
Comparison:       [method vs. named alternative, under stated conditions]
Primary outcome:  [metric, direction, unit]
If positive:      [what this would support, and how narrowly]
If negative:      [what this would rule out, and which claim gets revised]
If tied:          [what a tie means here -- often a cost/capability argument instead]
If inconclusive:  [what would need to change -- power, budget, or a different comparison]
```

**Never** substitute zeros, invented magnitudes, plausible trends, favorable
explanations, or completed-result language for a measurement that does not exist. A
planned figure is not evidence until its stated content exists. Do not leave unsupported
placeholder numbers in manuscript tables or figures.

Writing an experimental design does not by itself authorize running new experiments or
training beyond the scope already agreed in the session.

## Design Checklist

1. Does each experiment trace to one falsifiable claim?
2. Is there at least one external comparison against a strong same-capability alternative?
3. Do ablations explain the mechanism rather than substitute for external comparison?
4. Were baselines given comparable tuning, information, and compute?
5. Are mismatched-assumption comparisons reported separately rather than merged?
6. Is the primary outcome the one that carries the claim, not the one easiest to measure?
7. Would a negative result be visible and reportable under this design?
8. Are unmeasured cells marked `TBD` with the interpretation pre-registered?
