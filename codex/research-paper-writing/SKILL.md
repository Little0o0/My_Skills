---
name: research-paper-writing
description: Frame contributions, design claim-driven evaluations, and draft or review research papers, Chinese briefs, and LaTeX manuscripts while preserving the author's structure and aligning claims with evidence. Use for manuscript planning and writing, not ordinary literature questions or authorization to run new research.
---

# Research Paper Writing

Make the problem, contribution, and supporting evidence understandable on a first reading. For polishing, preserve the author's subjects, comparisons, causal claims, and emphasis. Fix grammar and ambiguity; reorganize only when requested or needed to resolve a clear logical break. Do not restore details the author deliberately removed.

## Start with the argument

When settling or revisiting the paper's framing, read [writing principles](references/writing-principles.md). State the central contribution in one sentence: the object or finding, its scope, and the evidence that establishes it. Use the strongest supported advantage to organize the story, while retaining unfavorable results and the original evaluation conditions.

Read the latest author edits and comments before older plans. Identify the problem in one short phrase and explain its consequence without naming the proposed method. “Prior work lacks our score” is not a sufficient problem.

Track who does what, compared with whom, and with what consequence. Frame motivation and gaps around the relevant method class and its shared mechanism, citing representative work, rather than narrating a modification to one named method. Keep that class as an explicit comparison subject. Scope claims to methods that share the mechanism; do not generalize one paper's distinctive setup to an entire field or use an unsupported state-of-the-art label. Retain names in baseline setup, tables, legends, Related Work, and purpose-specific controls; the main result narrative should match the method-class contribution. Correct inaccurate premises narrowly and flag substantive corrections; preserve valid claim strength. Useful components need not share one root cause.

Read paragraph topic sentences consecutively, then check adjacent sentences: has the reader been given the premise needed for the next claim? A transition word cannot supply a missing premise. Introduce changes to objectives, information, or training protocols before discussing the capabilities they enable and the limitations that remain. Use concrete actors and operations rather than unexplained abstract summaries.

## Organize the reading path

The following is this author's preferred structure, not a universal venue rule. Preserve a clearer supplied structure and follow actual venue requirements. Open each major section by carrying forward the unresolved question or consequence from the preceding section. Begin Method with a short contribution pitch: name the problems, introduce the components, and connect each to its benefit. Within Method, organize each key component around the need, mechanism, justification, and consequence, rather than listing operations. Before a proposition, explain the question it resolves; afterward, explain the decisive reason it holds and what decision it informs. An approximation needs both a cost rationale and a reason it preserves useful information. Put derivation setup after the opening pitch, not in a chapter roadmap.

| Section | What the reader should learn |
| --- | --- |
| Introduction | Why the problem matters, what fails, what is proposed, and why it helps. |
| Preliminaries and Challenges | Training mechanism and cost → baseline objectives and update scope → resulting limitations. Keep the paper's own analysis in Method. |
| Method | Analysis of that challenge → proposed mechanism → practical algorithm. |
| Experiment | Which comparisons establish the claims and what the outcomes mean. |
| Conclusion | The supported contribution and its demonstrated scope. |

Keep the full Related Work survey, expanded proofs, and supplementary protocols in appendices by default. Retain the direct-baseline explanations and citations needed in the main text. For a systems-venue structure or page-budget request, use the separately installable `writing-systems-papers` skill when available; its Design / Implementation / Evaluation blueprint is an alternative to this preference, not an additional set of required sections.

For Preliminary or technical-background revisions, read [Preliminary writing: logic, equations, and concise precision](references/preliminaries.md). It turns the author's edits into checks for sentence dependencies and equation selection, without prescribing a fixed section structure.

For Introduction, use these paragraph roles flexibly, not a mandatory paragraph count:

1. Motivate the practical bottleneck and relevant approach. Distinguish this broad motivation from the specific problem solved.
2. Explain how the baseline class works and why it helps. Group citations without inventing a uniform workflow across materially different methods.
3. Name the remaining problem, then explain the mechanism and consequence. Scope class-wide claims to a shared mechanism or adequate evidence.
4. Introduce the contribution: **what we propose → what it can measure or enable → why it is more relevant to the decision → what analysis and comparisons support it**. Explain the score's meaning through intuitive concepts such as recovery or adaptation. Put its construction, including paired measurement states, in Method; a simpler description of that construction can still be premature here.
5. Explain the overall method and each component's purpose. Do not add separate names for procedures that have no independent explanatory role.
6. State the principal comparative findings. Match every headline claim to its body evidence.

Merge roles when this improves the argument. The abstract follows the same logic at smaller scale, not a list of components. By this author's preference, keep formulas out of Introduction; preserve essential scope without repeating technical qualifications in every sentence. For an Introduction draft or structural revision, use the [argument-chain check](references/introduction.md): test the expected intervention, class-level support, and two-way correspondence with the body. Keep contribution meaning before construction details; the check does not impose an analysis-first paragraph order.

## Develop explanations without confusing them with evidence

**Research order:** anticipated advantage → candidate explanation → tests that distinguish it from alternatives. **Writing order:** concrete problem → method and why it should help → supporting analysis and comparative results. Do not reproduce the chronology of discovery inside the paper.

Start from a specific advantage over a strong, fairly budgeted alternative. Ask what observations would differ if the explanation were wrong. Separate changes to objectives, schedules, information, and computation where they could offer competing explanations. Retain negative or ambiguous findings; a benchmark gain alone does not establish its cause.

Give intuitive claims an operational definition in Method. Distinguish what a score measures, why it might guide a decision, and whether the resulting full procedure works. Correlation with recovery does not itself prove a better schedule; a local identity does not guarantee full-training behavior or global optimality. State the strongest positive conclusion the assumptions support.

Separate theoretical scope, contribution, and implementation choice. Keep proof-essential assumptions with the theorem; introduce practical approximations where the algorithm uses them. A current representation, backend, or cache policy is not automatically a selling point or a fundamental restriction. A general scheduling principle does not imply its estimator or kernel transfers unchanged to another parameterization. Attribute established components; neither using classical tools nor failing to find an exact precedent settles novelty. When framing contributions or responding to novelty objections, read [idea and contribution framing](references/idea-and-contribution.md). Compare the complete construct against the strongest fair alternative, state exact specializations of generic frameworks, and distinguish correctness, novelty, capability, explanation, and performance evidence.

**Unmeasured results.** Normally write the experimental design as planned and leave results explicitly unmeasured. If the author explicitly requests a hypothetical successful draft, use the requested completed-result voice with keyed placeholders and empty numerical cells. Keep assumed outcomes, explanations, and required tests in an external evidence note; do not repeatedly announce missing results in the manuscript. Never report this draft as experimentally verified. Numerical mock-ups require explicit authorization and visible simulated-data labeling, and cannot support empirical claims.

## Keep mathematics and algorithms readable

Allocate detail according to contribution: explain the new mechanism and why it helps, while keeping familiar extensions and implementation bookkeeping in prose or an appendix. State results essential to the method's justification in the main text, with their assumptions; place detailed proofs in the appendix. A concise theorem or proposition can replace a long verbal claim, but an empirical expectation must not be promoted into a theorem. Core material must remain readable too. Control each equation's explanatory work and notation cost, not the equation count. Introduce its purpose, define symbols locally, and explain the result; remove repeated facts and aliases. One coherent operation chain may share a display.

Reuse the symbols and matrix orientation established in Preliminaries. Reserve each symbol's meaning across sections; do not rename the same loss or weights or overload an existing symbol for an unrelated quantity. Introduce notation when it expresses a distinction the reader needs, not merely because a detail can be formalized. Suppress repeated context in prose while retaining material dependencies and update restrictions. Put expanded tensor bookkeeping in the appendix with an explicit mapping to the main notation.

Pseudocode should expose inputs, operations, decisions, state changes, and outputs. Mix short mathematical assignments with plain-language actions and purpose comments. Define helpers and cite score equations. Distinguish measuring from updating parameters; avoid both numbered prose and walls of opaque capitalized calls.

When substantially restructuring formulas or pseudocode, read [inspected examples of readable mathematics and algorithms](references/readable_math_and_algorithms.md). Otherwise this file is sufficient.

## Make experiments and figures carry the argument

When planning evidence or checking whether a protocol can establish a claim, read [experiment design](references/experiment-design.md). Set the claim, comparator, primary outcome, fair budgets, and interpretations of positive, negative, tied, or inconclusive outcomes before selecting measurements. Planning does not itself authorize execution.

For experimental-section revisions, read [Experiment writing: comparison, result, explanation](references/experiments.md). It captures this author's setup → performance → efficiency organization, short result-led paragraphs, class-level headline comparisons, and accuracy-gap notation. Lead with the strongest relevant comparison, one representative result, and a supported explanation; do not narrate every table cell. Keep exact names for baseline identification and controls whose purpose depends on the method identity. A generic “best baseline” must still resolve to a specific eligible comparator and budget.

Organize evidence by claims: external baselines establish competitiveness, ablations isolate choices, and diagnostics test mechanisms. Match information, data, tuning opportunities, and relevant budgets. Charge measurement and preprocessing overhead in total efficiency. Preserve units and numerical definitions even when following the author's preferred notation. Independent repeats support uncertainty; checks of implementation correctness do not establish superiority.

The overview figure should contrast the baseline limitation with the proposed capability and meaningful benefit. Align comparable states, repeat visual encodings, and use color or size only when informative. Every panel should add information. Keep schematic quantities, pending scenarios, and measured results distinguishable through the agreed presentation and provenance; captions must describe the actual figure. Preserve editable sources and inspect the final manuscript-scale rendering.

## Revise and synchronize

Reuse confirmed terms for the same objects and operations. Do not rename a stage or introduce a synonym merely for stylistic variety: repetition lowers reading cost, whereas a new term suggests a new concept. Preserve task examples and repetition that establishes a comparison. Add modifiers such as “jointly,” “all,” or “fully” only when supported and useful; make the affected parameters or operations unambiguous. Prefer concrete errors, recovery, or cost over vague “changes.” Keep domain notation and implementation settings in the project brief. Check revisions for changes to actors, comparators, parameter scope, and claim strength, not just fluency.

Author conventions:

- Preserve the author's naming syntax when clear. Introduce full names in running prose, avoiding “NAME (Full Method Name).” Integrate figure references into sentences.
- In running cross-references, use Eq., Fig., and Tab.; retain Appendix. Follow a different explicit author or venue convention when supplied.
- Prefer connected prose, sparse emphasis, and lists only where useful.
- Use one natural paragraph per LaTeX source line. Preserve template files, mathematical structure, and comment semantics.
- Keep editable section files under `contents/` and figures under `figures/`, adapting to the existing project. A relaxed draft page limit is not a reason to delete explanatory steps or shrink typography.

After a name, scope, or contribution changes, check the abstract, Introduction, body, algorithms, captions, conclusion, brief, and active handoff documents. Distinguish framework, score, and implementation names; search-and-replace alone is insufficient. Preserve historical review records. Build edited LaTeX and visually inspect affected pages and figures.

For a full-paper review or submission-readiness pass, use the [six-dimension review guide](references/paper-review.md), covering contribution, clarity, experimental strength, evaluation completeness, method soundness, and evidence integrity. Keep review notes outside the manuscript unless requested. Follow any review process already requested, using actual reviewers and tools rather than simulated feedback. Routine edits do not automatically require a new review cycle. Reviewer approval covers the reviewed scope, not guaranteed novelty or acceptance. Manuscript work does not itself authorize new training experiments.

## Keep this skill small

When learning from feedback, replace or merge the rule that caused the failure instead of appending another exception. Keep only transferable, decision-changing guidance here; project names, numerical settings, and review history belong in project documents. Add a reference only for substantial conditional material, not to hide repetition.
