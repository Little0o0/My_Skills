# Human, Rigorous Research Prose (Anti-AI-Style)

Reviewers may read prose that sounds assembled rather than argued as a warning sign
about the underlying work. Apply this guide *after* the technical claim is already
correct: it does not fix a broken argument, it keeps a sound one from being dismissed.
The aim is prose that makes the reasoning traceable, the evidence precise, and the tone
controlled.

Do not treat these as a checklist of "AI tells" to dodge by superstition. Each rule
exists because it makes the argument easier for a skeptical reader to audit.

## 1. Use prose for reasoning, lists for inventories

Do not present a causal argument as a numbered recipe. Reserve lists for genuinely
parallel, non-sequential items: contributions, datasets, ablations, assumptions, or
failure cases. When one idea enables the next, write connected sentences that expose
the dependency, so the reader sees *why* the steps belong together.

- Weak: "Our method has three steps. Step 1, encode local images. Step 2, align
  features. Step 3, aggregate the model."
- Better: "Each client first maps local images into a shared feature space. This shared
  representation is what makes cross-client alignment possible before the server
  aggregates the updated model."

## 2. Interpret results in prose; do not stack raw numbers

Running text should state the comparison that matters. Avoid stacking raw numbers in
prose; when an absolute value genuinely matters (an abstract, a headline result, a
figure callout), report it once alongside its comparison rather than piling up
parentheticals such as "(80.1 vs. 70.2)," which read like a stray table fragment. Let
the tables hold the full set of absolute values.

State improvements *relative to the relevant baseline* rather than stacking absolutes —
but be exact about the unit, because "10% better" is ambiguous and often wrong:

- If accuracy rises from 70% to 80%, the gain is **10 percentage points**.
- The **relative** improvement is **14.3% over the baseline** (10/70), not "10% better."

Name the comparator and the setting; "over baselines" is too vague to verify.

- Weak: "FedRTS reaches 80.1% accuracy, while FedTiny reaches 70.2% (80.1% vs. 70.2%)."
- Better: "On the non-IID CIFAR-100 split, FedRTS improves accuracy by 9.9 percentage
  points over FedTiny, the strongest baseline in this setting (Table 2)."

## 3. Use em-dashes only when they earn the interruption

An em-dash is not a default substitute for a comma, colon, or period. Reserve it for a
genuine sharp aside or contrast. Repeated dashes make a dense technical paragraph feel
improvised. Practical check: if a paragraph contains more than one dash, rewrite the
sentence structure instead of leaning on the dash.

- Weak: "The gating module -- which is lightweight -- improves personalization --
  especially under non-IID splits."
- Better: "The gating module is lightweight and improves personalization most clearly
  under non-IID splits."

## 4. Replace praise with evidence

Do not use an evaluative adjective unless the paper has already earned it with a result,
theorem, ablation, or citation. Words like *fundamental*, *powerful*, *superior*,
*highly informative*, and *significant* (when used as vague emphasis rather than a
statistical claim) are empty until the sentence gives their basis. Prefer mechanism plus
evidence over self-congratulation.

- Weak: "Our fundamentally novel module is highly informative and achieves superior
  performance."
- Better: "The module adds a per-client gating term. On the non-IID CIFAR-100 split it
  improves accuracy by 9.9 percentage points over FedTiny (Table 3) while leaving the
  communication payload unchanged (Sec. 4.2)."

---

## Rigor Habits (highest-leverage additions)

These extend the four core habits. They target the failure modes that most often make a
draft read as machine-generated *and* logically loose at the same time.

### A. Causal-claim discipline
Use strong causal verbs (*causes*, *prevents*, *ensures*, *due to*) only when the
design, a theorem, or a controlled experiment actually supports causality; otherwise
report association. "Because" is acceptable for definitional, mathematical, or
procedural explanation, but it still requires a stated basis rather than an assumed one.
- Weak: "The gate improves robustness by reducing client drift."
- Better: "Removing the gate increases client drift by 18% and lowers accuracy by 4.1
  points (Table 4), which links the gate to reduced drift in this ablation."

### B. Hedge scope, not evidence
Be firm about what was measured; be cautious only about what generalizes. Avoid both
overclaiming and mush.
- Overclaim: "Our method solves non-IID federated learning."
- Mush: "Our method may possibly help in some non-IID scenarios."
- Better: "Our method improves accuracy on the Dirichlet-0.1 split; the advantage
  shrinks as client label distributions become balanced."

### C. Delete template filler
These phrases usually carry no argumentative load. Cut them or replace with the fact.
*"It is worth noting that", "This highlights the importance of", "In the realm of",
"delve into", "leverage", "a comprehensive framework", "not only X but also Y".*
- Weak: "It is worth noting that our framework leverages feature alignment to enhance
  robustness."
- Better: "Feature alignment reduces the accuracy drop under label skew from 12.4 to 5.8
  points."

### D. Use concrete subjects and verbs
Do not hide agency behind abstract nouns (*the utilization of*, *the incorporation of*,
*the enhancement of*). Say what does what. If a sentence stacks more than two abstract
nouns, rewrite it around the mechanism.
- Weak: "The incorporation of contrastive regularization facilitates improved
  representation consistency."
- Better: "Contrastive regularization pulls augmented views of the same image closer,
  reducing cross-client representation variance."

### E. One sentence, one job
Do not pack motivation, method, result, and implication into one swollen clause; that
makes each claim hard to audit.
- Weak: "By adaptively aligning heterogeneous client representations, FedRTS effectively
  mitigates non-IID drift and consistently achieves superior performance across diverse
  benchmarks."
- Better: "FedRTS aligns client representations with an adaptive gating term. This lowers
  measured client drift on non-IID splits and raises average accuracy by 6.3 points
  across four datasets."

### F. Every empirical claim names metric, setting, comparator, direction
"Improves performance" is unverifiable on its own.
- Weak: "Our method significantly improves performance."
- Better: "On Tiny-ImageNet with Dirichlet alpha = 0.1, FedRTS improves top-1 accuracy
  by 5.4 points over FedAvg and 2.1 points over FedTiny."

### G. Do not inflate contributions
A contribution should name the object introduced, the setting where it applies, and the
evidence later used to support it. Do not claim theory, generality, and efficiency from
one modest experiment.
- Weak: "We propose a general and robust framework for efficient federated learning."
- Better: "We propose a client-specific gating module for federated image classification
  under label-skewed non-IID splits."

### H. Captions must not claim more than the plot shows
- Weak: "Our method clearly outperforms all baselines."
- Better: "Top-1 accuracy on CIFAR-100 under Dirichlet alpha = 0.1. FedRTS exceeds the
  highest baseline curve after round 120; the early-round gap is small."

### I. Make limitations concrete
Name the untested condition and the claim it threatens; avoid ceremonial "future work
will explore broader settings."
- Weak: "Future work will evaluate more scenarios."
- Better: "We have not tested cross-device settings with participation below 5%, so the
  communication results may not transfer to mobile-scale deployments."

### J. Do not offload the main argument into trailing parentheses
When a figure or table is *doing the argumentative work* of a sentence, name it in the
sentence grammar rather than tagging it on in parentheses. A comparative or causal claim
that ends in "(Figure 1)" pushes its own evidence into an aside and reads as assembled;
fold the reference into the clause so the reader sees the relation. This applies most
sharply to sentences with a claim ("A beats B") or with multiple dangling pointers that
interrupt parallel claims.
- Weak: "FedRTS is more accurate than FedTiny (Figure 1)."
- Better: "As Figure 1 shows, FedRTS is more accurate than FedTiny."
- Weak: "The gate reduces client drift (Table 4) and raises accuracy (Table 5)."
- Better: "Table 4 shows the gate reduces client drift, and Table 5 shows the matching
  accuracy gain."

A trailing parenthetical pointer is still fine — and often cleaner — when it is a purely
navigational locator, not the sentence's argument: "We report ablations for temperature,
queue size, and EMA decay (Table 5)" or "The architecture contains three client-side
modules (Fig. 2)." Do not mechanically rewrite these; forcing every locator into clause
grammar bloats space-constrained prose. Numeric citations to prior work "[12]" always
stay in brackets. The test: if the parentheses carry the claim, inline them; if they
only help the reader navigate, leave them.

### K. Use italics sparingly, not as decoration
Reserve italics (`\textit`/`\emph`) for their real jobs: marking the one defining
introduction of a coined method, term, or abbreviation, and genuine contrastive emphasis.
Italicizing (or bolding) a method name at its first mention is a legitimate
defining-instance convention; the failures to avoid are (i) continuing to style the name
on every later mention, and (ii) double-marking the same object at introduction with both
italics *and* a parenthetical expansion, which adds no clarity and reads as
machine-styled. Introduce the name once, then use plain type.
- Acceptable (first-use marking): "We propose \textit{Flare}, short for Flux Adaptive
  Redistribution."
- Also acceptable (plain, name in parens): "We propose Flux Adaptive Redistribution
  (Flare)."
- Avoid (double-marked, then re-styled): "We propose \textit{Flare} (Flux Adaptive
  Redistribution), and \textit{Flare} improves..."

After the method is named, refer to it in plain type ("Flare improves...", not
"\textit{Flare} improves...") unless a venue or project convention requires the styling.
If a paragraph contains several italic spans for emphasis, the emphasis has lost its
force; revise most of them away and let sentence structure carry the stress. Terms with
their own typographic convention (variables, vector/matrix symbols, dataset or software
names that a venue sets in a fixed style) follow that convention, not this emphasis rule.

---

## Peer-Model Review, When Available

When MCP or another peer-model channel is available (Claude <-> Codex), send the revised
passage to the peer model for adversarial review before finalizing. Ask the peer to act
as a **strict professor in AI who dislikes AI-generated papers and prioritizes logical
rigor**, reviewing for: logical gaps, unsupported or non-causal claims, inflated
language, numerical ambiguity (percentage points vs. relative percent), and AI-style
prose. Incorporate only criticisms that are technically valid; do not accept style-only
edits that weaken precision. The review is a rigor filter, not a second style filter.
