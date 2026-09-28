# Writing Principles: Narrative, Clarity, and Submission Readiness

Use this reference when the paper's framing isn't converging, prose feels generic, or before locking the abstract and introduction. It complements the section-specific guides; read it first, then apply the relevant section guide.

## The Narrative Principle

A paper should be a short, rigorous, evidence-backed technical story — not a pile of experiments.

By the end of the Introduction, the reader should understand:
- **What**: the 1–3 specific claims the paper makes
- **Why**: the evidence that supports those claims
- **So What**: why the community should care

Organize the whole paper around one central contribution. Experiments, related work, and discussion support the main claim; they are not independent mini-papers.

### One-Sentence Contribution Test

If you cannot write a sentence of this form, the framing has not converged:

- "We prove that X converges under assumption Y."
- "We show that method A improves B by 15% on benchmark C."
- "We identify failure mode D and propose mechanism E that removes it."

If the sentence is hard to write, the usual causes are: the contribution is still too vague, evidence is not yet tightly coupled to the claims, or the paper does not know what story it is telling. Fix framing before drafting.

## Reviewer Reading Order and Time Allocation

Most reviewers encounter the paper in this order: title → abstract → introduction → Figure 1 → the rest. Many form a preliminary judgment before reading the methods carefully.

Spend roughly equal effort on the abstract, the introduction, the figures, and everything else combined. Do not bury the contribution after Section 3. Make the value of the paper legible before the reader reaches the full method.

## Sentence-Level Clarity (Gopen and Swan)

Readers have strong structural expectations. Violating them forces them to decode the sentence instead of following the idea.

1. **Keep subject and verb close.** Weak: "The model, which was trained on 100M tokens and then fine-tuned..., achieves strong results." Strong: "The model achieves strong results after training on 100M tokens and fine-tuning..."
2. **Put important information near the end.** Weak: "Accuracy improves by 15% when using attention." Strong: "When using attention, accuracy improves by 15%."
3. **Put context at the start.** Weak: "A new attention mechanism is introduced to solve the alignment problem." Strong: "To address the alignment problem, we introduce a new attention mechanism."
4. **Move from old to new.** Begin with what is already familiar; end with what is newly important.
5. **One unit, one function.** A paragraph should do one main job. A sentence carrying two layers of logic probably wants to become two sentences.
6. **Put actions in verbs.** Weak: "We performed an analysis of the results." Strong: "We analyzed the results."
7. **Set the stage before new material.** Before presenting an equation, theorem, or result, tell the reader why it matters.

## Micro-Level Tactics

**Reduce ambiguous pronouns.** When "this", "it", or "these" could be unclear, replace with a specific noun. "This shows the method is robust" → "These ablation results show the method is robust to label noise."

**Remove low-information fillers.** These can usually be deleted: *actually, very, really, quite, basically, essentially, Importantly, Notably, It is worth noting that.*

**Replace vague terms with specific ones.**

| Vague | Specific |
|---|---|
| performance | accuracy / F1 / latency / throughput |
| improves | increases by X% / reduces by Y ms |
| large | 1B parameters / 100M tokens |
| fast | 3× faster / 50ms latency |
| good results | 92% accuracy / 0.85 F1 |

**Vocabulary signaling.** Verbs like *combine, modify, extend, expand* suggest loose assembly. *Develop, propose, introduce, characterize* suggest deliberate contribution. This is not mechanical substitution — it reflects how wording shapes a reviewer's intuition about the work.

## Mathematical Notation Habits

Keep notation consistent; define symbols at first use; pair proofs and derivations with intuition.

Recommended conventions:
- Scalars: lowercase italic ($x$, $\alpha$)
- Vectors: lowercase bold ($\mathbf{x}$, $\mathbf{v}$)
- Matrices: uppercase bold ($\mathbf{W}$, $\mathbf{X}$)
- Sets: uppercase calligraphic ($\mathcal{X}$, $\mathcal{D}$)
- Named functions: roman ($\mathrm{softmax}$, $\mathrm{ReLU}$)

Common mathematical writing mistakes: presenting equations without explaining why they matter; introducing assumptions too late; reusing symbols with different meanings across sections; moving all intuition to the appendix.

## Causal Spine

One causal spine should run through the entire paper: gap → question → insight → consequence → evidence → implication. Every section advances it. The method feels inevitable when the gap creates a concrete question, the key insight answers it, the method follows from the insight, each major experiment tests a consequence, and the conclusion states exactly what the evidence establishes.

## Launch, Not Progress Report

Organize the narrative around the work's strongest genuine advantage — a new capability, problem, mechanism, viewpoint, wider applicability, lower cost, or a better tradeoff. Material that does not form an advantage stays out of the main line. If the results cannot carry the original story, rebuild the story around the strongest evidence instead of defending the original framing.

## Pick the Contest the Paper Wins

Do not build the narrative on a metric where the method is not ahead. Frame the comparison around the task definition, evaluation dimension, or constraint that reflects what the method is for, and say explicitly which contest it wins. Unfavorable numbers still appear — tables stay complete. Where evidence supports it, explain underperformance as a goal difference or deliberate tradeoff; where it does not, state the underperformance neutrally, narrow the claim, and keep it in Limitations if material. Never elevate a local observation into a verdict on the whole method, and never invent a tradeoff to cover a weakness.

## Every Experiment Has an Argumentative Duty

An experiment should do one of: show the method works, show the gain comes from the key mechanism, show value in the target scenario, or rule out the most likely alternative explanation. An experiment carrying none of these is cut, shortened, moved to the appendix, or redesigned. The experiments section is an argument, not a results warehouse. State the advantage yourself — under which condition it appears, why it appears, what it solves — rather than expecting the reviewer to find it in a table.

## Pre-Submission Checklist

**Narrative**
- [ ] The contribution can be stated in one sentence.
- [ ] The Introduction makes the What / Why / So What clear.
- [ ] Every major experiment supports a clear claim.

**Structure**
- [ ] Abstract follows the five-part formula (what / why hard / how / evidence / strongest result).
- [ ] Introduction stays within about 1–1.5 pages; method starts by page 2–3.
- [ ] 2–4 concrete, falsifiable contribution bullets.
- [ ] Limitations are stated specifically (real ones, not hedges).

**Writing**
- [ ] Terminology is consistent — one name per concept.
- [ ] No generic field-background openings ("In recent years, deep learning has...").
- [ ] Unnecessary hedging removed; hedging kept only where uncertainty is real.
- [ ] All key figures have self-contained captions.

**Technical**
- [ ] Citations are verified (not LLM-generated).
- [ ] Error bars and statistical reporting are clear.
- [ ] Compute resources and code/data availability documented.
