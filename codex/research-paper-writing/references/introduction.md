# Introduction argument-chain check

Use this guide for an Introduction draft or structural revision. Check the argument, not
a fixed paragraph count. Preserve the contribution-first reading path and formula-free
Introduction preference in [SKILL.md](../SKILL.md); analysis details may appear later in Method.

### 1. Keep the background limitation distinct from your problem

The opening motivation (why the field cares) and the problem this paper solves are two
different things. Keep them separate.

A broad quality, cost, or scalability tradeoff must not silently become the claimed
contribution. If the opening laments that a task is expensive and the contribution is a
sampling rule, the Introduction has promised something the paper does not deliver.

- Weak: opens with "3D reconstruction remains slow and memory-hungry," then contributes a
  view-selection heuristic — the reader expects a systems result.
- Better: opens with the general cost pressure, then narrows to the specific decision
  (which views to keep) whose current solution is the paper's actual target.

Prefer declarative prose. Do not end the background with a rhetorical question, which
tends to enlarge the paper's scope beyond what the method addresses.

### 2. The absence of your module is not a problem statement

"Prior methods lack an adaptive gating term" is a description of your method, not a
problem. State the problem so that a reviewer can understand it **without knowing what
you propose**: what breaks, when it breaks, and what undesirable outcome it permits.

Test: delete every mention of the proposed method from the problem paragraph. If nothing
identifiable remains, the problem has not been stated.

### 3. Read the topic sentences consecutively

Extract the first sentence of each paragraph and read them in order, ignoring everything
else. Check these dependencies even when contribution meaning is presented before the analysis:

```
background limitation
  -> the baseline class addresses that limitation
    -> the problem concerns that baseline class
      -> the analysis examines that same problem
        -> each design choice answers a finding from that analysis
          -> the evidence tests those design choices
```

Adding "However," "Further analysis shows," or "Based on this observation" does **not**
repair a change of subject. If a link is broken, the fix is structural, not transitional.

A second component may address a different cause. Explain its connection to the paper's
central contribution, or present it as a secondary contribution. Do not invent one shared
root cause or silently widen the problem to cover unrelated components.

### 4. Check that the problem implies your intervention

Ask what direct remedy a reader would expect after reading your problem statement. If the
expected remedy is not what you propose, either the problem is mis-stated or the
connection needs an explicit analysis step.

Sharing a broad outcome such as "poor task quality" is not enough to connect a problem to
a design. Hold competing changes fixed when arguing the connection.

### 5. Class-level claims need class-level support

When the Introduction groups prior work into a method class:

1. One method's observed degradation is not a class-level failure. Support a class claim
   through the **shared mechanism**, or through representative evidence across the class.
2. Check the actual works behind grouped citations. Acknowledge generic methods that
   already reproduce the computation.
3. Broadening the wording, or renaming one algorithm as a class, establishes neither a
   shared gap nor originality.
4. Keep member-specific differences out of the Introduction; they belong in Related Work
   or the preliminaries. But do not flatten meaningful differences away — synthesis must
   preserve them even when individual names are absent from the prose.
5. Do not imply that prior methods fail *in their own setting* merely because this paper
   studies an extension.

### 6. An explanation of a failure is not an established cause

If you observed degradation and propose a reason for it, the reason is a hypothesis until
tested. Write it as one: "we attribute this to X" and then show where X is verified, or
label it as a conjecture. Do not call an untested explanation a root cause.

### 7. Two-way correspondence with the body

Treat the Introduction as a compressed account of the body, checked in both directions:

1. **Forward:** every introductory claim has a specific body location that supports it.
2. **Backward:** every main contribution in the body is previewed in the Introduction.

Do not change targets, scope, or assumptions between the Introduction and the body, and
do not leave an introductory claim unsupported elsewhere. The Conclusion returns to
supported conclusions rather than introducing new claims.

### 8. The unfamiliar-reader test

Before finalizing, confirm that a reader who does not know the paper can:

1. State the problem and its consequence **without naming the proposed method**.
2. Explain why the analysis motivates each component of the design.

If either fails, the Introduction is not finished regardless of how polished the prose is.

### When revising from review comments

Update the outline as well as the prose. Retaining an obsolete outline or brief while
patching sentences reproduces the same structural failure in the next draft. When a
paragraph role changes, propagate the change to any plan, brief, or notes that exist.
