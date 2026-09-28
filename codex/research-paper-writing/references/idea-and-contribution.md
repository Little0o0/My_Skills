# Idea, Novelty, and Contribution Framing

## Goal

Decide what the paper actually contributes, and state it at a level that survives a
skeptical reviewer. Use this guide *before* drafting Abstract or Introduction prose, and
again when a reviewer challenges novelty.

This is a judgment guide, not a template. It does not tell you what to write; it tells
you what has to be true before a claim is presented as established. Planned contributions may be recorded with their evidence needs.

## Evaluate Novelty at the Level of the Complete Method

Novelty is a property of the whole construct, not of its parts. Judge it across all of:

1. **Input/output object** — what the method consumes and produces, and whether that
   object is new or newly obtainable.
2. **Assumptions** — what must hold for the method to work, and how those differ from
   prior requirements.
3. **Dependency structure** — what must be computed before what, and which prior
   dependency is removed, relaxed, or reversed.
4. **Supported reuse** — what can now be reused, cached, transferred, or composed that
   previously could not.
5. **Guarantees** — what is provable, and under which conditions.
6. **Comparison to the strongest fair alternative** — not the most convenient baseline.

A method whose parts are all classical can still be novel as a construct. A method built
from novel-sounding parts can still be a known construct under a new name.

## Two Symmetric Failure Modes

Both directions of sloppy novelty reasoning are common. Avoid both.

### Do not under-claim by component accounting

These do **not** by themselves disprove originality:

1. The components are classical or individually well known.
2. The proof is short or uses standard tools.
3. Performance is similar to an existing method on some benchmark.

### Do not over-claim by naming or by absent precedent

These do **not** establish originality:

1. Renaming a composition of known steps.
2. Failing to find a precedent after a shallow search.
3. Broadening the wording of a claim until no prior work matches it exactly.
4. Relabeling one existing algorithm as a "class" of methods.

## State the Exact Specialization

If a generic framework can reproduce your method, say so explicitly and give the exact
specialization — the parameter choices, structural restrictions, or instantiations that
recover your method from the general one. Then state what the specialization *buys*:
a new guarantee, a removed dependency, a tractable computation, a capability.

- Weak: "Unlike general variational methods, our approach is tailored to this setting."
- Better: "Our update is the special case of mirror descent with the entropic potential
  restricted to the simplex face selected by the active-set rule. This restriction is
  what makes the per-step cost linear in the number of active clients rather than
  quadratic."

Concealing the reduction is a correctness risk as well as an ethics risk: a reviewer who
finds it will distrust the rest of the paper.

## Attribute First, Then Claim

Write the attribution before the claim, in this order:

1. Name the known components and their sources.
2. Name the closest prior construct and what it already achieves.
3. State what this paper constructs or proves that the prior construct does not.

Never weaken a prior method to manufacture separation. Do not describe a baseline in its
worst configuration, omit its strongest variant, or imply that prior methods fail *in
their own setting* merely because this paper studies an extension. Preserve the strongest
rationale for the baseline while stating what remains unresolved.

## Separate the Claim Types

These are routinely conflated, and conflating them is what makes a contribution
unfalsifiable. Each needs its own evidence.

| Claim type | What it asserts | What evidence establishes it |
| --- | --- | --- |
| Correctness | The method does what it is defined to do | Proof, invariant test, certificate validation |
| Novelty | The construct differs from prior constructs | Attribution plus explicit specialization analysis |
| Capability | Something is now possible or obtainable | A demonstration under stated conditions |
| Explanatory theory | *Why* an observed behavior occurs | Controlled experiment or derivation, not a plausible story |
| Performance | Better on a measured axis | Matched-budget comparison against a strong alternative |

Winning a benchmark is not the sole criterion for a theoretical contribution, and a
theorem is not evidence of empirical benefit. A theoretical comparison of attainable
error or robustness under aligned assumptions can be substantive evidence on its own.

## Contribution-Claim Ledger

When settling a contribution or auditing novelty, use one row per claimed contribution.
Record unknowns explicitly; do not turn the ledger into a requirement for routine prose edits.

```
Object introduced | Setting where it applies | Strongest fair alternative | Evidence type | Status
```

- **Object introduced** — the concrete thing: a module, representation, estimator,
  objective, protocol, dataset, metric, or theorem. Not "a framework for X."
- **Setting where it applies** — the scope actually supported, stated narrowly.
- **Strongest fair alternative** — the best existing option a reviewer would reach for.
- **Evidence type** — from the table above.
- **Status** — `supported`, `needs evidence`, or `unmeasured (TBD)`.

Illustrative row, not a measured result to copy:

```
Per-client gating module | federated image classification, label-skewed non-IID splits |
FedTiny | performance (matched communication budget) | supported (Table 3)
```

## Calibrate the Claim to the Evidence

1. Do not claim theory, generality, and efficiency from one modest experiment.
2. Name the object, setting, and supporting evidence. Preserve the author's prose and
   evidence-status conventions in [SKILL.md](../SKILL.md).
3. Do not imply a new training method, a distribution-shift guarantee, or an empirical
   benefit without corresponding evidence.
4. An untested explanation of an observed failure is a hypothesis, not an established
   cause. Label it as such.
5. Reviewer approval is evidence about the reviewed scope. It is not certification of
   global firstness or of acceptance.

## Checklist

1. Can I state the contribution as a concrete object, not a framework label?
2. Have I named the strongest fair alternative, in its strongest configuration?
3. If a generic method reproduces mine, have I given the exact specialization and what it buys?
4. Is each claim matched to the right evidence type, with no cross-type substitution?
5. Is every ledger row `supported`, or explicitly marked `needs evidence` / `unmeasured (TBD)`?
6. Does the scope I claim match the scope I tested, with no silent widening?
