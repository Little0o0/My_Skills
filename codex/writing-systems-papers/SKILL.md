---
name: writing-systems-papers
description: "Plan and revise systems-paper structure, page budgets, and paragraph roles for venues such as OSDI, SOSP, ASPLOS, NSDI, and EuroSys. Use for systems-specific manuscript planning or structural revision; not general literature search or experiment execution."
---

# Writing Systems Papers: Paragraph-Level Blueprint

Use this blueprint when the author wants systems-specific structure. Preserve an existing clear outline and the current venue requirements; the page counts, sentence counts, and numbered patterns below are planning examples, not mandatory formatting. An explicitly requested systems outline can replace the general research skill's five-section preference. Do not impose both layouts at once.

## Relationship to Other Skills

- **research-paper-writing**, when installed: use its guidance for evidence, notation, prose, and manuscript review. This skill adds systems-specific structure.
- Reuse an existing paper plan. No separate planning skill or ARIS pipeline is required.

**Boundary**: This skill provides the structural skeleton — page budgets, paragraph roles, and writing patterns specific to systems venues. It does not handle LaTeX generation or citation verification.

---

## Illustrative 12-page budget

After checking the actual submission limit and what counts toward it, allocate space to the paper's strongest contribution. The following example totals 12 pages; it is not a claim about any venue's current limit. Move Related Work or detailed implementation to an appendix when the author and venue permit it, then reallocate that space. Figure and table space is included.

| Section | Example pages | Key content |
| --- | ---: | --- |
| Abstract | 0.25 | Self-contained problem, contribution, and evidence |
| Introduction | 1.5 | Problem → gap → insight → contributions |
| Background & Motivation | 1 | Prerequisites and supported observations |
| Design | 3.5 | Architecture, mechanisms, alternatives, tradeoffs |
| Implementation | 0.5 | Prototype and essential engineering details |
| Evaluation | 3.75 | Setup, end-to-end comparisons, ablations, scale |
| Related Work | 1 | Grouped alternatives and explicit positioning |
| Conclusion | 0.5 | Supported contribution and scope |

---

## Section Blueprints

### Abstract (five possible roles)

```
S1: Problem context and importance
S2: Gap in existing approaches
S3: Thesis — for example, "X enables or improves Y under condition Z"
S4: Approach summary + headline results, or explicit placeholders in an authorized hypothetical draft
S5: Impact or availability
```

Make the contribution concise and define essential terms within the abstract. Use the sentence roles flexibly; do not invent quantitative findings to complete the template.

### S1 Introduction

1. **Problem** — Domain + concrete numbers + why it matters
2. **Gap analysis** — G1–Gn: specific shortcomings with evidence
3. **Key insight** (1 para) — Thesis: "X is better for Y in Z"
4. **Contributions** — concrete, testable claims linked to their supporting sections; use prose or a short list following the author's preference

Pattern: Move 1 (territory) → Move 2 (niche) → Move 3 (occupy).

### S2 Background & Motivation

1. **Technical background** — Define-before-use (Gernot Heiser)
2. **Observations** — O1, O2, O3 from production data → design insights

### S3 Design

1. **Architecture overview** — Show components, data flow, and the capability they provide; draft a figure when it clarifies those relationships
2. **Module details** — Per module: choice, alternatives, why
3. **Trade-offs** — Summary of design decisions

Explain serious alternatives for choices that affect the contribution or tradeoffs. Routine implementation decisions need detail only when they affect reproducibility or the claim.

### S4 Implementation

Language, LOC, framework, key engineering decisions. Keep concise.

### S5 Evaluation

1. **Setup** — Hardware, baselines, workloads, metrics
2. **End-to-end** — X vs baselines for Y on Z
3. **Ablation** — Remove each component, measure impact
4. **Scalability** — Behavior at increasing scale

Keep the question at the section opening, the supported result in the discussion, and the figure's meaning in its caption aligned. This is a consistency check, not a requirement to repeat each conclusion three times. An ablation explains a design choice; an external comparison establishes competitiveness. Include production observations and scalability studies only when they test the paper's claims.

### S6 Related Work

Group by methodology. For each group: what they do, limitation, how we differ.

### S7 Conclusion

Briefly return to the problem, solution, and supported result. Do not introduce a new claim; three sentences is one possible length.

---

## Writing Patterns

### Pattern 1: Gap Analysis
Enumerate G1–Gn in intro → A1–An in design → verify in evaluation.

### Pattern 2: Observation-Driven
O1–O3 from production data → insights → design components.

### Pattern 3: Contribution List
Numbered contributions in intro, each with §N cross-reference.

### Pattern 4: Thesis Formula
Use a concise claim such as "X enables or improves Y under condition Z" to organize the argument. Choose a pattern that fits the evidence rather than combining every pattern.

---

## Verify the actual venue requirements

For OSDI, SOSP, ASPLOS, NSDI, EuroSys, or another target, check the official call for papers for the requested year and track. Record the submission limit, whether references and appendices count, required template, and any separate camera-ready allowance. If no target has been chosen, label the page budget provisional. Do not treat remembered 2025/2026 limits or this example as current rules.

---

## Workflow

1. Determine venue and page limit
2. Choose writing pattern (Gap / Observation / Contribution / Thesis)
3. Allocate pages within the verified limit, using the table above as an example
4. Draft the Abstract using the roles above where useful
5. Draft Introduction: Problem → Gap → Insight → Contributions
6. Draft Motivation with production observations (if available)
7. Draw architecture figure, then write Design
8. Draft Implementation (concise)
9. Draft Evaluation: setup → E2E → ablation → scalability
10. Draft Related Work by methodology groups
11. Draft a concise Conclusion matching the demonstrated scope
12. Run the quick self-check below

---

## Quick Self-Check

- [ ] Thesis states a concrete capability or advantage, with its setting and evidence
- [ ] Each contribution maps to a body location and supporting evidence
- [ ] Design discusses alternatives for every major choice
- [ ] Evaluation questions, result interpretation, and captions agree
- [ ] Related work grouped by methodology
- [ ] Page budget within venue limits
- [ ] No fabricated observations, traces, or results

---

## Academic Integrity

- Never fabricate observations, traces, or experimental results
- Verify cited works through primary sources; do not generate citation records from memory
- Disclose LLM use per venue policy
- Distinguish measured results from proposed studies and authorized hypothetical draft placeholders. Follow the author's evidence-note convention, keep numerical cells unmeasured, and never present placeholders or simulated data as experimental findings.
- Structural planning does not authorize running experiments, changing application settings, or submitting the paper.
- This blueprint provides structural guidance, not copy-paste text

---

## Source guidance

The upstream blueprint attributes its writing patterns to the following authors. Verify the original source before quoting it or presenting a particular wording as an author's rule.

1. Levin & Redell — "How (and How Not) to Write a Good Systems Paper" (USENIX)
2. Irene Zhang — "Hints on how to write an SOSP paper"
3. Gernot Heiser — Style Guide + Paper Writing Talk
4. Timothy Roscoe — "Writing reviews for systems conferences"
