---
name: research-paper-writing
description: Improve academic paper writing quality for ML/CV/NLP-style papers with clear section structure, paragraph flow, and reviewer-facing presentation. Use when framing an idea or contribution, designing experiments, drafting or revising Abstract, Introduction, Related Work, Method, Experiments, or Conclusion; polishing figures/tables; checking claim-support alignment; or performing self-review before submission.
---
# Research Paper Writing

## Overview

Use this skill to rewrite a research paper into a reviewer-friendly, high-clarity draft.
Prioritize first-impression quality (figures/tables/layout), logical flow, and evidence-backed claims.

## Core Workflow

1. Before locking the framing, read `references/writing-principles.md` to confirm the contribution can be stated in one sentence and the narrative spine is clear.
2. Clarify the paper story before sentence-level edits.
3. Settle the contribution before drafting prose: name the object introduced, its scope, and the strongest fair alternative, using `references/idea-and-contribution.md`.
4. Use section-specific guidance in `references/`.
5. Before writing Experiments, settle what each experiment claims and whether the design can establish it, using `references/experiment-design.md`.
6. Rewrite paragraph-by-paragraph with one message per paragraph.
7. Run reverse outlining after writing each section.
8. Verify the Introduction argument chain, not just template compliance (`references/introduction.md`).
9. Check every major claim in Abstract/Introduction against experimental evidence.
10. Run final-paper adversarial review with `references/paper-review.md`.

## Global Principles

1. Keep one paragraph for one message only.
2. State the paragraph message in the first sentence.
3. Make nouns self-contained; define new terms before reusing them.
4. Maintain sentence-to-sentence flow (cause, contrast, consequence, or refinement).
5. Iterate with adversarial self-review: read as a skeptical reviewer.
6. Treat visual quality as core content, not decoration.
7. Use a clean teaser and pipeline figure.
8. Use readable, minimal-ink tables.
9. Keep formatting consistent and tidy.
10. Write in a human, argued voice, not an assembled one: narrate reasoning instead of enumerating it, report gains relative to a named baseline (with correct units) instead of stacking raw numbers in prose, spend em-dashes sparingly, and replace praise adjectives with mechanism plus evidence. See `references/human-voice.md`.
11. Do not offload a claim's main argument into trailing parentheses. When a figure or table does the argumentative work, fold it into the sentence: write "as Figure 1 shows, FedRTS beats FedTiny", not "FedRTS beats FedTiny (Figure 1)". Purely navigational pointers ("...three client-side modules (Fig. 2)") and numeric citations ("[12]") stay parenthetical. See `references/human-voice.md` (item J).
12. Use italics sparingly. Marking a method name once at its defining first mention is fine, but do not restyle it on every later mention, and do not double-mark at introduction with both italics and a parenthetical expansion: write "We propose \textit{Flare}, short for Flux Adaptive Redistribution" or "We propose Flux Adaptive Redistribution (Flare)", not "We propose \textit{Flare} (Flux Adaptive Redistribution)". See `references/human-voice.md` (item K).
13. Judge novelty at the level of the complete method (input/output object, assumptions, dependency structure, supported reuse, guarantees) against the strongest fair alternative. Classical components do not disprove originality, and renaming a composition does not establish it. If a generic framework reproduces the method, state the exact specialization. See `references/idea-and-contribution.md`.
14. Design experiments from the claim, not from the available implementation. External comparisons establish competitiveness; ablations explain mechanism, and one never substitutes for the other. Match information, tuning, and compute budgets, or report the comparisons separately. See `references/experiment-design.md`.
15. Never fabricate a measurement. When results do not yet exist, write the protocol, mark result cells `TBD`, and pre-register how each outcome would be interpreted; do not substitute zeros, invented trends, or completed-result language.
16. When polishing an existing draft, preserve the author's subjects, comparisons, causal claims, and emphasis. Fix grammar and ambiguity; reorganize only when explicitly requested or when a clear logical break makes the argument unreadable. Do not restore details the author deliberately removed.
17. For Preliminaries, Background, or Challenges: establish prerequisites before stating limitations. Work backward from each challenge to determine what the reader must already know. Structure every challenge as problem → cause → consequence. Give each display equation a specific job — cut repeated definitions and bookkeeping; do not add a symbol just to abbreviate something used once. See `references/preliminaries.md`.
18. For Method formulas and algorithms: control notation cost, not equation count. Introduce each symbol's purpose, define it locally, and explain the result. Pseudocode should expose inputs, operations, decisions, and state changes — mix short mathematical assignments with plain-language comments. When substantially restructuring formulas or pseudocode, read `references/readable_math_and_algorithms.md`.

## Paragraph Clarity Check (Important)

Use this quick test whenever the user asks whether a paragraph "flows" or is clear.

1. Read as an external reader:
   - Does this paragraph have one explicit message?
   - Does the first sentence state what this paragraph will do?
   - Are all key nouns/terms readable without hidden context?
   - Does each sentence connect to the previous one with a clear relation (cause, contrast, consequence, refinement, example)?
2. Run reverse outlining for the current section:
   - Write down thesis/main claim.
   - Write down each paragraph topic sentence.
   - Write down the evidence/explanation points under each paragraph.
   - Check mapping: topic sentence -> thesis, and evidence -> topic sentence.
   - Revise or remove any paragraph that cannot be mapped cleanly.
3. If flow is still weak, add temporary section headers and explicit transition phrases during revision, then remove unnecessary headers before finalizing.

Source reference for this check:

- `references/does-my-writing-flow-source.md`

## Section Guides

Load only the needed section file:

- Narrative framing and submission readiness: `references/writing-principles.md`
- Idea / novelty / contribution framing: `references/idea-and-contribution.md`
- Experiment design (what to run and why): `references/experiment-design.md`
- Preliminaries / Background / Challenges: `references/preliminaries.md`
- Introduction: `references/introduction.md`
- Abstract: `references/abstract.md`
- Related Work: `references/related-work.md`
- Method: `references/method.md`
- Method formulas and algorithms (substantial restructure): `references/readable_math_and_algorithms.md`
- Experiments (write-up, tables/figures): `references/experiments.md`
- Conclusion: `references/conclusion.md`
- Paper review: `references/paper-review.md`
- Human voice / anti-AI-style prose: `references/human-voice.md`
- Paragraph clarity source: `references/does-my-writing-flow-source.md`
- Example bank index: `references/examples/index.md`
- Systems paper structure (OSDI/SOSP/ASPLOS/NSDI/EuroSys): `../writing-systems-papers/SKILL.md`

## Paper Review Core Points

Use `references/paper-review.md` for the full checklist and workflow.

1. Add an end-of-draft self-review question list in six dimensions:
   - contribution,
   - writing clarity,
   - experimental strength,
   - evaluation completeness,
   - method design soundness,
   - evidence integrity and contribution calibration.
2. Treat claim-evidence alignment as a hard constraint, especially for Abstract and Introduction.
3. Perform adversarial writing: review as a skeptical reviewer and resolve every high-risk question.
4. Revise until major rejection risks are explicitly addressed.
5. Treat reviewer approval as evidence about the reviewed scope, not as certification of firstness or acceptance.

## Execution Rules

1. Build a mini-outline before drafting prose.
2. For each subsection, explicitly include motivation, design, and technical advantage when applicable.
3. Avoid writing style that looks like incremental patching of a naive baseline.
4. Keep terminology stable across the full paper.
5. If a claim cannot be supported by results, weaken or remove the claim.
6. Before finalizing, append and answer a six-dimension self-review question list, then revise the paper based on unresolved items.
7. Do not load all references at once; load only the specific guide needed for the current target (`idea-and-contribution.md` when settling the contribution, `experiment-design.md` when planning experiments, and one section guide per edit).
8. Apply `references/human-voice.md` on every prose pass: narrate reasoning rather than listing steps, interpret results relative to a named baseline (distinguishing percentage points from relative percent) and avoid stacking raw numbers in prose, restrict em-dashes, cut template filler and unearned superlatives, integrate figure/table/section pointers into the sentence instead of trailing parentheses, and make each empirical claim name its metric, setting, comparator, and direction.
9. Keep evidence status explicit at all times: label measured vs. proposed results, mark unmeasured cells `TBD`, distinguish author-reported from reproduced numbers, and retain ties, losses, and failure cases rather than reporting only wins.
10. Attribute known components before claiming what the paper constructs, and never weaken a prior method to manufacture separation.
11. When a peer-model channel (MCP: Claude <-> Codex) is available, send drafted passages to the peer for adversarial review before finalizing, instructing it to act as a strict AI professor who dislikes AI-generated papers and prioritizes logic. Accept only technically valid criticism; reject style edits that reduce precision.
12. After any name, scope, or contribution change, check the abstract, Introduction, body, algorithms, captions, conclusion, Chinese brief, and active handoff documents for consistency. Search-and-replace alone is insufficient. Build edited LaTeX and visually inspect affected pages and figures before finalizing.

## Output Contract

When asked to rewrite or draft sections, return:

1. A compact section outline (3-7 bullets).
2. Revised paragraphs with explicit paragraph roles (opening/challenge/method/advantage/evidence/limitation).
3. A short self-review checklist covering clarity, flow, terminology consistency, unsupported claims, missing evidence, and human-voice compliance (no step-lists for reasoning, relative gains with correct units, restrained em-dashes, no unearned superlatives, no trailing-parenthesis pointers for figures/tables per `references/human-voice.md`).
4. A claim-evidence map for each major claim in the revised text using `Claim: ... | Evidence: ... | Status: supported/needs evidence/unmeasured (TBD)`.
