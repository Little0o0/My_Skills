# Writing Principles: Narrative, Clarity, and Submission Readiness

Use this reference when the paper's framing is unsettled, prose feels generic, or before locking the abstract and introduction. Read only the section guide needed afterward. The author's current structure, notation, and evidence-status conventions in [SKILL.md](../SKILL.md) take precedence over illustrative templates.

## The Narrative Principle

A paper should be a short, rigorous, evidence-backed technical story — not a pile of experiments.

By the end of the Introduction, the reader should understand:
- **What**: the 1–3 specific claims the paper makes
- **Why**: the evidence that supports those claims
- **So What**: why the community should care

Organize the paper around a clear central contribution. Its components can address different causes; explain how each supports that contribution without inventing a shared root cause. Experiments, related work, and discussion should advance the same argument.

### One-Sentence Contribution Test

Use these sentence forms to test the framing. Their numbers and outcomes are illustrative, not evidence to insert into a draft:

- "We prove that X converges under assumption Y."
- "We show that method A improves B by 15% on benchmark C."
- "We identify failure mode D and propose mechanism E that removes it."

If the sentence is hard to write, the usual causes are: the contribution is still too vague, evidence is not yet tightly coupled to the claims, or the paper does not know what story it is telling. Fix framing before drafting.

## Reviewer Reading Order and Time Allocation

Most reviewers encounter the paper in this order: title → abstract → introduction → Figure 1 → the rest. Many form a preliminary judgment before reading the methods carefully.

Check whether the title, abstract, Introduction, and overview figure communicate the contribution without requiring a full-method read. Allocate editing effort to the actual comprehension problems; there is no fixed time quota.

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

**Choose verbs that describe the actual contribution.** Explain what is constructed, characterized, or enabled. Do not replace accurate words such as "combine" or "extend" just to imply novelty; the mechanism and evidence must establish it.

## Mathematical Notation Habits

Keep notation consistent; define symbols at first use; pair proofs and derivations with intuition.

For a new manuscript without established notation, possible conventions are:
- Scalars: lowercase italic ($x$, $\alpha$)
- Vectors: lowercase bold ($\mathbf{x}$, $\mathbf{v}$)
- Matrices: uppercase bold ($\mathbf{W}$, $\mathbf{X}$)
- Sets: uppercase calligraphic ($\mathcal{X}$, $\mathcal{D}$)
- Named functions: roman ($\mathrm{softmax}$, $\mathrm{ReLU}$)

Common mathematical writing mistakes: presenting equations without explaining why they matter; introducing assumptions too late; reusing symbols with different meanings across sections; moving all intuition to the appendix.

## Causal Spine

Check the argument across sections: gap → question → insight → consequence → evidence → implication. This is a dependency check, not a mandatory paragraph sequence. Explain each component's connection to the problem; preview contribution meaning before construction details when following the author's Introduction preference.

## Launch, Not Progress Report

Organize the narrative around the work's strongest genuine advantage — a new capability, problem, mechanism, viewpoint, wider applicability, lower cost, or a better tradeoff. Material that does not form an advantage stays out of the main line. If the results cannot carry the original story, rebuild the story around the strongest evidence instead of defending the original framing.

## Frame the Supported Advantage

Frame the contribution around the capability, cost, robustness, or quality the evidence actually supports. Retain the preselected primary outcomes, fair baselines, and unfavorable results. If the original claim fails, narrow it and distinguish a post-hoc explanation from a confirmed finding; do not change the contest after seeing results and present it as planned. Explain a tradeoff only when evidence supports that explanation.

## Every Experiment Has an Argumentative Duty

An experiment should do one of: show the method works, show the gain comes from the key mechanism, show value in the target scenario, or rule out the most likely alternative explanation. Move an irrelevant diagnostic to supplementary material or reconsider its design. Retain failures that test a central claim even when they weaken the narrative. The experiments section is an argument, not a results warehouse. State the advantage yourself — under which condition it appears, why it appears, what it solves — rather than expecting the reviewer to find it in a table.

## Pre-Submission Checklist

**Narrative**
- [ ] The contribution can be stated in one sentence.
- [ ] The Introduction makes the What / Why / So What clear.
- [ ] Every major experiment supports a clear claim.

**Structure**
- [ ] Abstract explains what is contributed, why it matters, how it works, and what supports it.
- [ ] Section lengths fit the actual venue limit and the author's reading path.
- [ ] Contributions are concrete and testable, in prose or a list as appropriate.
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
