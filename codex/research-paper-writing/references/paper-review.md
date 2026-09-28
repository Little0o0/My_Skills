# Paper review: argument, method, and evidence

Use for a requested full-paper review or submission-readiness pass. Scale the review to the supplied draft and evidence; a routine paragraph edit does not require a full review cycle. Keep findings in review notes unless the author asks to insert them into the manuscript.

## Match each claim to its evidence

Every major claim needs evidence of the right kind. A proof can establish a theoretical result under stated assumptions; a measured comparison can establish a performance claim in its tested setting. Neither substitutes for the other. If evidence is absent, record the gap or narrow the claim. An explicitly requested hypothetical draft follows the placeholder and external-evidence-note conventions in [SKILL.md](../SKILL.md), and is not a verified submission.

Use [idea and contribution framing](idea-and-contribution.md) for novelty disputes and [experiment design](experiment-design.md) for whether a protocol can support its claim. Read those only when needed.

## Six review dimensions

### 1. Contribution

- What concrete object, capability, or finding does the paper establish, and why does it matter?
- Does comparison cover the strongest fair alternative, including generic frameworks that reproduce the construction?
- If the method is a specialization, are its exact restrictions and resulting benefit explicit? Classical components do not by themselves settle novelty.

### 2. Writing clarity

- Can an unfamiliar reader state the problem and consequence without naming the proposed method?
- Do paragraph dependencies and the Introduction-to-body mapping hold in both directions?
- Are each component's need, mechanism, and consequence clear, with consistent terms, locally defined notation, and readable algorithms?
- Do figures and captions support the same scope as the prose, at the final rendered size?

### 3. Experimental strength

- Does the main outcome test the claimed capability, cost, robustness, or quality advantage?
- Are effect size and uncertainty meaningful for the task, and comparisons fair in information, tuning, and computation?
- Are ties, losses, failure cases, and adverse regimes visible? Is a proposed causal explanation distinguished from a verified mechanism?

### 4. Evaluation completeness

- Are external comparisons distinct from ablations and mechanism diagnostics?
- Does evaluation cover the relevant mechanisms of any class-level claim, with representative settings or a shared-mechanism argument?
- Are protocols, independent repeat units, timing boundaries, preprocessing overhead, and mismatched assumptions reported?
- For a theoretical contribution, does the formal comparison establish the claimed result without implying unmeasured empirical gains?

### 5. Method design soundness

- Does each component address its stated problem? Are alternatives and tradeoffs explained where they affect the contribution?
- Are assumptions next to the theorem, with the essential conclusion in the main text and a traceable proof?
- Are prediction targets, optimization objectives, proxy measurements, and hoped-for metrics kept distinct?
- Do approximations have a cost rationale and a reason they preserve useful information? Are implementation choices separated from fundamental restrictions?

### 6. Evidence integrity and contribution calibration

- Can each headline claim be traced to a specific section, theorem, table, figure, or available raw result?
- Are measured, author-reported, reproduced, proposed, and hypothetical results distinguishable? Are missing cells still missing?
- Do reported deltas use the correct comparator, units, denominator, and timing boundary, including the author's documented absolute-gap convention?
- Do scope and assumptions match across the Abstract, Introduction, Method, experiments, captions, Conclusion, and Chinese brief?
- Does the paper avoid turning a local identity, correlation, implementation check, or favorable review into a full-method guarantee?

## Record and resolve findings

For each substantive issue, record the claim and location, available evidence, consequence for the argument, and a status such as `supported`, `needs revision`, or `needs evidence`. Prioritize errors that change the contribution or reported result. Complete writing fixes within the agreed scope; identify additional experiments without treating the review as permission to launch them. Stop at the requested review scope and report unresolved evidence gaps.

Follow the review process already requested. If a named external reviewer or model is required, obtain its actual response and record what version it reviewed; never simulate that feedback. Re-review changed claims when requested or when the revision invalidates their earlier check, not as an unconditional loop for every edit.

Reviewer approval is evidence about the reviewed scope, not certification of global firstness or acceptance. Preserve frozen review inputs, experiment artifacts, and historical decisions; make new snapshots when those records need a revised counterpart.
