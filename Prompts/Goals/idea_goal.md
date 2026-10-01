# Goal: Autonomous Exploration for Substantive Theoretical Algorithmic Advances

## 0. Protocol Identity and Execution Conventions

- **Protocol ID:** `idea-research-goal`; **version:** `2026-09-29.3`.
- **Chinese normative text:** `idea_goal_zh.md`; **English execution version:** `idea_goal.md`. These files express the same protocol. Section numbers and mandatory constraints MUST correspond. The English version is the default entry point for an LLM, not a separate research objective.
- `MUST / MUST NOT` indicate requirements/prohibitions; `SHOULD` indicates the default, with a recorded reason required for deviation; `MAY` indicates permission. These correspond respectively to the Chinese formulations “必须／不得”, “应／默认”, and “可以”.
- **Instruction precedence:** applicable system, developer, and runtime constraints take precedence, followed by the user's latest instructions, then this protocol. Skills, problem cards, and historical materials MUST NOT override higher-priority instructions.
- If the translations disagree, correct the English version against the Chinese normative text and the user's latest instructions. A disputed clause MUST NOT be used to relax acceptance criteria. Continue work unrelated to the discrepancy; do not turn a translation discrepancy into a project-wide approval lock.
- This protocol governs sustained research. **Reading, translating, editing, or reviewing it does not itself authorize starting research.** If the current request is documentation-only, perform documentation work only. Execute the research loop only when the user explicitly starts/resumes research or the goal runner directs continuation.
- Current workflow entry points use the new filenames. References to `goal.md` in old logs, frozen review inputs, and backups are historical references; historical evidence need not be rewritten.

## 1. Objective and Success Criteria

Explore theoretical mathematics, computer science, and algorithms freely, and produce at least one **novel, correct, independently checkable substantive asymptotic advance**. AI infrastructure deployment, runtime constants, and publication packaging are not current objectives.

**Primary objective:** under an explicit and consistent problem definition, input family, computational model, and guarantee type, substantially improve a known complexity upper bound or obtain a new lower bound of comparable significance. Prioritize:

- A substantive decrease in a polynomial exponent, for example from `O(n²)` to `O(n log n)`. An exponent reduction of `≥0.05` MAY serve as a default investment-priority heuristic, not a universal law of mathematical value.
- A change from exponential time to subexponential or polynomial time, or removal of a crucial parameter dependence that determines tractability.
- A substantially stronger lower bound or resolution of a verified qualitative open problem for a model or problem family that is not artificially cherry-picked.

**Insufficient on their own:** constant-factor improvements, fixed-size constructions, results limited to finite instances, tiny exponent or logarithmic-factor improvements, reproductions of known theorems, tool libraries, unsuccessful-search logs, or topic maps. If a fixed-size construction can be rigorously lifted to an algorithm family that meets the primary objective, evaluate the lifted theorem rather than rejecting the construction categorically.

Conditional theorems, method-limitation theorems, and restricted-instance results can have research value but MUST NOT automatically replace the original objective. A restricted problem MAY be selected autonomously as a formal target if its definition and success threshold are registered **before searching** and it passes independent value review. Do not narrow the scope after seeing a result to declare success. If progress is only conditional, continue pursuing the primary objective unless the user explicitly changes it.

**Completion requires all of the following:** a frozen precise theorem; the substantive-progress threshold preregistered for that target; a complete reviewed proof; a nontrivial contribution relative to verified literature; reproducibility/review materials; no unresolved core proof gaps; and the external value and verification outcomes required by §7. Improving a known upper bound does not prove that the old bound was optimal.

## 2. Autonomy, Sustained Execution, and Stopping

This file and its semantically equivalent Chinese version are the current project workflow specification. Conflicting project-process clauses in older `PREREG.md` versions, historical reviews, experiment logs, or skills no longer govern. The user's newer instructions and runtime permission limits take precedence.

- **No upper limit on K:** continue research until the objective is actually achieved or the user explicitly stops it. Do not promise that an open problem must be solvable.
- The lead MAY select and register topics, change strategies, replace problems, assign independent agents, and conduct searches and experiments within authorized resources. **Do not require item-by-item user approval of topics or “freezing.”**
- Preregistration preserves the comparison basis; it is not an approval queue. When changing targets, explain why, create a new version, and arrange independent value reassessment. It is unnecessary to prove the old topic exhausted or the new topic harder.
- Report every five research rounds or after a material evidence change. Reports are notifications: **continue without waiting for a user reply**. Each round MUST perform actual work on a concrete question, not merely rewrite a plan.
- Count rounds using a preregistered “specific question—planned action—work allotment or batch end condition.” At batch end record progress, no progress, or tool failure. Failed batches count; do not number only successful ones. After three consecutive rounds without a new lemma, counterexample, checkable construction, key literature fact, or valid exclusion result, proactively reformulate the problem, change representation, or change mechanism. A stalled candidate is not a stopped project.
- Split long tasks into recoverable batches and save progress, resource usage, and next actions. Unlimited rounds do not mean unlimited expenditure. Paid expansion, external publication, or other actions outside existing authorization require separate confirmation, without stopping other authorized work.
- Report genuine blocking only if required permissions, services, or information are actually missing and no safe alternative task can advance the work. Follow the runtime's blocking rules. **Self-imposed approval requirements, unknown answers, and individual failed candidates MUST NOT be treated as blockers.**
- Finishing this document, passing a protocol review, or exhausting one execution window does not complete the research objective. If the current user request is only document editing or review, perform only that request and do not start new experiments.

### 2.1 Context Management: Automatic Compaction Near the Limit, Not False Completion

- **Context pressure or degraded attention is not evidence of research completion or genuine blocking.** Save a checkpoint early and request actual interface-supported automatic compaction or `/compact` when the runtime reports proximity to the window limit, the next input batch plus reserved output will exceed the window, or excessive context causes persistent errors.
- Prefer native runtime auto-compaction. Invoke a compaction tool/command only if the interface actually supports agent-triggered compaction. Writing `/compact` in a reply, shell command, or subagent prompt **does not compact the current lead conversation**. Do not claim nonexistent capabilities, effective settings, or remaining-token readings.
- Set thresholds using the actual model/interface context limits, input occupancy, output reserve, and compaction margin. About 80% of the effective window MAY be used as a conservative trigger reference, not a universal hard-coded token limit. If reliable occupancy information is unavailable, reduce batch size and checkpoint early; do not invent percentages.
- Before compaction, the following MUST exist as mutually consistent files:
  - `idea_goal_zh.md` and `idea_goal.md`: synchronized objective, success criteria, and execution rules;
  - `PREREG.md`: current problem card, baseline, and success threshold;
  - `OPEN-ITEMS.md`: unresolved items, evidence status, and priorities;
  - `STATE.md`: current candidate/stage, latest substantive results, next action, task handles, and resource usage;
  - `explore/`, `artifacts/`, and `review/`: proofs, scripts, complete raw evidence, and review packets.
- After compaction, continue using the single recovery order in §9 without awaiting additional human “freezing.” If the current interface cannot actively compact, record that capability limit, checkpoint, and use native automatic compaction/recovery. Continue small batches within a safe window. Do not falsely claim `/compact` was executed or immediately label the entire research project blocked.
- Divide long tasks into recoverable batches; update `STATE.md` and `OPEN-ITEMS.md` after each batch. The first substantive action after recovery MUST come from the current highest-priority unresolved item, after checking that it is not obsolete, completed, or refuted. Correct a stale item before selecting the next valid task.

### 2.2 Scheduling, Waiting, and Deadlock Prevention

- Before delegating, identify the critical-path task the lead can perform immediately. Delegate only concrete, bounded, parallelizable work with an independent deliverable. Do not delegate the sole next action and then repeatedly wait without doing work.
- Register each task's owner, read/write scope, input version/hash, expected output, batch allotment or end condition, and real task handle. **A file MUST have only one writer at a time.** Independent reviewers write separate reports, not the proof being reviewed.
- An observation timeout is not task failure. Check the authoritative status of the same handle and avoid starting duplicate work. Explain redirection/termination decisions, and confirm termination or handoff before transferring write ownership. Preserve late outputs in separate files rather than overwriting later versions.
- Classify each round as `PROGRESS / VERIFIED_WAIT / NO_PROGRESS`: progress changes checkable evidence or artifacts; a verified wait requires task status verifiable in that round; unsupported status repetition, unexecuted plans, or merely increasing the wait count are no progress.
- Continue other safe work rather than blocking the project on one review service or candidate. Core acceptance gates MUST NOT be skipped. Change mechanisms after sustained no progress as specified in §2; genuine blocking follows the runner's rules.

## 3. Exploration and Problem Boundaries

### 3.1 Topic Selection

Start with broad reconnaissance, then concentrate on proof. Retain several candidates and investigate one or two in depth. Do not impose arbitrary quotas such as five problems, eight mechanisms, or a fixed number of ideas per round.

Prioritize mathematical importance, genuine gaps between verified bounds, exploitable structure, possible new mechanisms, proof routes, and research cost. Research density and verification cost inform prioritization; they are not automatic exclusion rules. “No lower bound found” does not mean “no barrier exists.” Do not exclude an entire theoretical field because no cheap complete verifier is available.

### 3.2 A Problem Card for Every Deeply Investigated Target

Record in `PREREG.md` or `explore/`:

1. Precise inputs, outputs, and parameters; distinguish counting, decision, reporting, approximation, compressed-output, and other tasks.
2. Input-size definition, allowed input families, number domains, encoding, and word size; identify RAM, bit-complexity, circuit, or other models.
3. Guarantee type: deterministic/randomized; worst-case/amortized/expected; error, failure probability, and adversary model.
4. Best verified upper/lower bounds under the same specification, conditional assumptions, and method-specific limitations; record search dates and uncertainties.
5. Intended contribution, success threshold, nontriviality rationale, comparison baseline, and the specific step to improve.
6. Initial proof route, most dangerous assumptions, verification method, and the next action that can distinguish viable from failing routes.

Basic definitions MAY begin as a draft. Do not claim novelty or completion before verifying the core baseline. If the target specification changes, create a new card; old conclusions remain scoped to the old version.

## 4. Prior Work and Opportunities for Improvement

1. Search original papers, author versions, errata, and follow-up work. Trace synonymous terminology, neighboring problems, and important citation chains. Mark failed searches as unverified instead of inventing conclusions from model memory.
2. Read theorems and assumptions, not just abstracts. Record title, authors, version/year, theorem location, and link or identifier. Distinguish published results, preprints, and unverified claims.
3. Build `GAP_MAP.md` under a consistent model: problem, parameter ranges, UB/LB, assumptions, sources, cost bottleneck, and improvement target. Do not compare only favorable slices of a multiparameter problem.
4. Decompose the best algorithm/proof: include every step, preprocessing, data acquisition, storage, queries, encoding/decoding, numerical precision, and retry cost. Explain which terms determine the current bound.
5. State which term must change to improve the final bound, and whether other terms would still dominate. Distinguish a bookkeeping bottleneck in one algorithm from a lower bound for an entire method family.
6. Check novelty before value review and again before the final claim. If an existing result is found, update the baseline or classify the work as reproduction.

## 5. Ideation: Form Research Hypotheses That Can Be Advanced

Mechanisms MAY come from divide-and-conquer, algebraic representations, data structures/amortization, offline batching, randomization, structured instances, parameterization, information theory, reductions, or new proof measures. This list is suggestive, not an exhausted search space.

For every candidate, save in `candidates/` at least:

- Problem-card version; **the quantitative conclusion if successful**; the increment over prior work.
- A concrete mechanism and its key lemmas, constructions, potential functions, representations, or invariants.
- Unresolved proof obligations, scope, preliminary cost accounting, and falsifiable predictions.
- The next action and its information value: which claim it will support, refute, or narrow.

**A candidate need not already be proved to qualify for value review.** Ideas without a quantitative conjecture and key obligations remain in the direction pool; they are neither results nor artificially manufactured “verification candidates.”

Structural search, symbolic completion, SAT/SMT, conventional solvers, and LLMs MAY be combined. Combining tools does not change their evidence levels: LLM outputs still require independent verification. Calibrate tools with known positive, incorrect, and format cases first. Candidate generation is not mathematical proof. Identical outputs do not establish memorization-only generation; differing outputs do not establish novelty; unsuccessful finite search does not prove a method impossible.

## 6. Stage Order: Value First, Verification Second

| Stage | Work | Output and transition |
|---|---|---|
| Reconnaissance and registration | Search, specify the problem, verify baselines | Problem card and gap map; no human-freeze approval wait |
| Hypothesis formation | State quantitative targets and core obligations | Candidate packet with unproved portions marked |
| **Value review** | External reviewers assess significance, novelty, and scope assuming the proposition is true | Scores, reasons, and `ADVANCE / REWORK / DEFER / REJECT` |
| Asymptotic audit | Check total cost, preconditions, and model alignment | Expose omitted terms and actual proof burden |
| **Deep verification** | Construct proofs, attack with counterexamples, independently review, machine-check when appropriate | Explicit proof status and remaining obligations |
| Improve or change route | Address specific failures rather than changing the success specification | New candidate version; material changes trigger renewed value review |
| Accept or archive | Recheck literature and every completion criterion | Report completion only if satisfied; otherwise perform the next task |

### 6.1 Value Review

Reviewers first answer: **If the conclusion is true, is it worth proving?** Then assess whether the proof route has a credible entry point. Complete proof belongs to the later stage; “not proved yet” MUST NOT be the sole rejection reason.

Use scores from 0–4 and written reasons for:

- Magnitude of progress; importance and scope; novelty increment; model/comparison fairness; tractability of further work and reuse value.
- Scores only rank candidates, not success probabilities or correctness. Stage transitions use a reasoned categorical decision: `ADVANCE` merits verification investment; `REWORK` requires clarification; `DEFER` postpones while retaining the candidate; `REJECT` excludes it as a primary-objective candidate. None determines mathematical truth. Missing information is `UNKNOWN`, not a disguised low/zero score.

Reproductions of known results, constant-only improvements, post hoc model changes, and violations of proved lower bounds MUST NOT advance as primary-objective candidates. If a claim conflicts with a **conditional** lower bound, identify the conjecture it challenges instead of declaring a mathematical contradiction. Do not extend a method-specific barrier to all algorithms.

Invest verification effort in high-value candidates that pass the value gate; do not require the top two to pass automatically. Candidates deferred only for uncertainty or priority MAY be sampled periodically for reassessment, recording whether work resumes. Do not estimate a global false-negative rate from those reassessments. A candidate must still pass the value gate before deep verification.

### 6.2 Improvement Rules

Distinguish “not worth pursuing,” “false statement,” “proof gap,” “search unsuccessful,” “tool error,” and “insufficient evidence.” Only a checkable counterexample or proof establishes mathematical refutation; a proved limitation applies only to its stated scope.

An iteration MUST address core review issues and lead to a new checkable result. After two consecutive rounds with no progress on the same obstacle, defer that candidate or change mechanism; new evidence can justify resumption. A reviewer's inability to reprove a theorem does not itself make the theorem false.

## 7. Reviewer Roles and Cross-Model Requirements

| Role | Responsibility |
|---|---|
| Lead | Retain the model currently selected in the Codex frontend; select topics, organize proofs/experiments, maintain records; MAY self-check but MUST NOT be the sole final reviewer of its own results |
| Claude Code | Independent value review; after candidate advancement, mathematical and cost-proof review in a fresh session |
| Independent local agent | Explicitly select an underlying model different from the lead and relevant artifact-generating model, with `fork_context=false`; perform value review, counterexample attacks, or proof review; does not replace the heterogeneous Claude-side reviewer |
| Dispute reviewer, when needed | Independently check a material disagreement; do not decide mathematical truth by vote |

- If the user explicitly requests `tclaude`, actually invoke the local `tclaude`. Otherwise prefer connected Claude MCP; if unavailable, use genuine Claude Code CLI, including `tclaude`. Record the actual interface, tool version, obtainable underlying model identity, input packet, output, exit status, and file hashes. **CLI MUST NOT be labeled MCP; tool branding is not model-identity evidence; unknown model identity MUST NOT be guessed.**
- A value packet contains problem definition, candidate conclusion, sources, and increment—not the author's desired score or other reviewers' verdicts. Proof reviewers receive the complete proof and assumptions. Withhold the original derivation only for an explicitly assigned blind rederivation task.
- Independent sessions isolate context; they do not imply independent training data or statistical independence. Multi-model agreement is not proof, and a few samples do not estimate a theoretical-breakthrough success rate.
- Save inputs before invocation and preserve raw outputs. Do not hide unwanted verdicts by retrying. Revised reviews get new versions with earlier versions retained. Transport interruptions MAY be retried, but MUST be distinguished from substantive rejection.
- If reviewers disagree on a core obligation or whether to pass, identify the dispute and inspect sources or provide missing proof. If a material disagreement remains, use a dispute reviewer. Votes cannot override unresolved evidence. Do not accept the candidate while core evidence remains unresolved; continue other candidates. Wording or irrelevant score differences do not trigger endless arbitration.
- If an external service is temporarily unavailable, record the missing review and continue available search, proof, and revision work. **A candidate lacking required external reviews MUST NOT be accepted**, but the entire project need not stop.

### 7.1 Model Selection: Preserve the Lead, Explicitly Diversify Review Models

1. **Keep the lead model selected in the Codex frontend.** Do not silently switch it, modify the user's global defaults, or restart the session to obtain reviewer diversity. Recheck independence for new review batches after the frontend selection changes.
2. **Local agents MUST NOT merely inherit a default model:** explicitly specify an actually supported model ID on every invocation, and every delegated local agent MUST differ from the lead model. An independent reviewer MUST additionally differ from the model that generated the key proof/construction under review. A model that generated or substantively revised the artifact can only self-check it; that check does not qualify as independent final review.
3. Local reviewers counted toward the same candidate's same-stage gate MUST use different underlying models from one another. A model MAY work on other candidates or later stages in fresh sessions, but this does not make it a second independent model within the same stage. Value and proof reviews use separate fresh sessions.
4. `fork_context=false`, different agent names, different sessions, different reasoning settings, aliases, or context variants of the same underlying model **do not** establish model heterogeneity. Deduplicate reviewers by verified underlying identity.
5. Review SHOULD use the latest accessible high-capability models appropriate to the task at invocation time. `gpt-6-astra` and `gpt-5.6-sol` are user-named candidate examples, **not permanently “latest” labels or a timeless performance ranking**. At each research-run start, before critical final review, or after interface/model changes, check official documentation, current interface capabilities, and accessible model catalogs; record dates and sources. Local caches are timestamped capability evidence, not proof of global recency.
6. **Satisfy both strength and independence:** select the strongest available model commensurate with review importance from the models eligible under the different-model constraint. If the lead or artifact-generating model is the strongest, it MAY provide additional self-checks, but an independent reviewer must be another model. Strengthen critical final review with the strongest available Claude-side model; do not abandon independence merely to reuse the highest-ranked model.
7. The minimum final-review combination is **a heterogeneous Claude-side review plus at least one qualified different-model independent local review**. This minimum applies to research-result acceptance; protocol editing follows the review scope specified in the current user request and does not itself start the research-acceptance workflow. Both MUST be independent of the artifact as specified above, and MUST differ from each other in underlying model. `tclaude` is an invocation entry point, not a guarantee that the backend is Claude. Verify the backend; do not infer cross-model or cross-provider review from a tool name.
8. If an eligible different model is unavailable, identity is unverifiable, or an unacceptable downgrade occurs, retain the review as advisory but do not count it toward the missing formal gate. Record `REVIEW_INCOMPLETE`; continue other available work and accept only after the missing review is completed. Do not unlock a gate through silent fallback or fabricated model IDs.

### 7.2 Review Criticality, Reasoning Depth, and Context

| Level | Work | Configuration rule |
|---|---|---|
| R1: supporting | Literature organization, formatting, straightforward independent reproduction | Use an appropriate currently available high-capability heterogeneous model, explicitly named; supporting opinions do not replace final review |
| R2: important | Value, novelty, model/parameter alignment, complexity audit, counterexample attacks | Select a high-capability eligible heterogeneous model, use the deepest verified single-reviewer reasoning configuration for that model/interface, and provide the complete relevant context |
| R3: critical | Load-bearing lemmas, complete proofs, counterexample certificates, reductions/verifier reliability, dispute resolution, final acceptance | Use the strongest eligible available model, its deepest supported single-reviewer reasoning mode, and maximum effective context configuration; weaker fast models MUST NOT be the sole reviewers of core obligations |

- **Capabilities are specific to model × invocation interface × account.** A CLI accepting `max`, `xhigh`, or `ultra` does not imply the local agent tool accepts those values. Do not send or claim an effective value without confirming support; verify requested versus effective settings from invocation receipts/capability declarations.
- If the deepest mode includes automatic delegation, its subtasks MUST also satisfy independence, write-ownership, and evidence requirements. Do not present one auto-delegating call as an independent reviewer panel. If this behavior cannot be isolated/audited, use the deepest verifiable **single-reviewer** configuration and record why.
- **Maximum context is a supported capacity, not a target to fill.** Select the largest effective window actually permitted by the account/interface; fabricated token settings do not enlarge model capacity. Reserve space for output and tool messages. Context size alone is not a measure of model strength.
- Critical proof review MUST receive the frozen exact statement, all assumptions, complete proof, dependency sources or sufficient proofs, counterexamples/tests, and obligation list. Do not provide only a summary and ask for proof approval. If input exceeds the window, partition it into traceable local-obligation reviews, followed by a critical review of the dependency graph, interfaces, and global composition. Unloaded or truncated core content MUST be marked `UNREVIEWED`.
- Request checkable derivations, counterexamples, conclusions, and unresolved obligations—not a model's private hidden chain of thought, and do not pretend to have obtained it.

### 7.3 Preflight Checks and tclaude Invocation

For every formal review, execute these steps in order:

1. Freeze the candidate/protocol version and identify the review stage as `VALUE`, `VERIFICATION`, `DISPUTE`, or `PROTOCOL`. Research candidates MUST pass the value gate before deep verification.
2. Record known identities of the lead and artifact-generating models. Select a qualified different model and verify its ID, reasoning level, context, and tool capabilities. Unknown identity is `UNKNOWN`, not verified independence.
3. Save the input snapshot, hash, and expected obligations. Complete text MAY be delivered through stdin. If only paths are supplied, enable reading tools and confirm successful access to the actual text.
4. Invoke a fresh isolated session. Protocol review is read-only by default. Prefer minimal tools and disable unrelated custom instructions/MCP/hooks so that research instructions inside the reviewed document are not treated as present authorization to act. Reviewers MUST NOT overwrite inputs.
5. When local `tclaude` is requested, first inspect `tclaude --version` and actual upstream help, such as `tclaude -- -h` if supported. Then use supported parameters. Options such as `--model`, `--effort`, `--tools`, `--strict-mcp-config`, `--safe-mode`, and `--no-session-persistence` MAY be used **only when supported by the actual interface**. Do not hard-code permanently valid commands or Claude aliases.
6. Save stdout, stderr, exit code, actual model receipt/verified alias mapping, output hash, and task handle. “Starting to read,” empty output, tool failure, or exit code 0 alone does not constitute a completed review.
7. Address each finding by adoption, additional evidence, or an evidence-based explanation of rejection. Freeze the new version and preserve the old one. Material changes require re-review of affected clauses; do not hide adverse feedback through selective retries.

### 7.4 Minimal Machine-Readable Review Record

A formal review MUST save at least the following JSON structure. `UNKNOWN` means unverified, not passed. `null` means a field value has not been obtained, not zero; use `null` for a task handle not yet obtained as well. Paths and hashes MUST identify actual files. Fields MAY be added, but identity, input version, coverage, and unresolved obligations MUST NOT be removed.

```json
{
  "_record_semantics": {
    "null": "NOT_OBTAINED_NOT_ZERO",
    "UNKNOWN": "UNVERIFIED_NOT_PASS",
    "enum_separator": "|",
    "choose_one_enum_value": true
  },
  "review_id": "<unique-id>",
  "stage": "VALUE|VERIFICATION|DISPUTE|PROTOCOL",
  "criticality": "R1|R2|R3",
  "input_version": "<frozen-version>",
  "input_sha256": "<sha256>",
  "main_model": "<verified-id-or-UNKNOWN>",
  "artifact_generator_models": [
    "<verified-id-or-UNKNOWN>"
  ],
  "interface": "<actual-tool-or-cli>",
  "requested_model": "<id>",
  "resolved_model": "<verified-id-or-UNKNOWN>",
  "model_identity_evidence": "<receipt-or-verified-mapping-path>",
  "capability_checked_at": "<ISO-8601>",
  "capability_sources": [
    "<source-or-snapshot-path>"
  ],
  "reasoning_requested": "<supported-value>",
  "reasoning_effective": "<verified-value-or-UNKNOWN>",
  "context_limit_tokens": null,
  "context_effective_tokens": null,
  "input_tokens": null,
  "output_reserve_tokens": null,
  "context_delivery": "COMPLETE|PARTITIONED|TRUNCATED|UNKNOWN",
  "context_manifest": "<input-files-or-chunk-manifest>",
  "coverage": [
    {
      "obligation_id": "<id>",
      "status": "PASS|FAIL|UNKNOWN|UNREVIEWED",
      "evidence": "<path-or-location>"
    }
  ],
  "unresolved_core_obligations": [],
  "independence": "VERIFIED|UNVERIFIED|NOT_INDEPENDENT",
  "task_handle": null,
  "exit_code": null,
  "stdout_path": "<path>",
  "stderr_path": "<path>",
  "output_sha256": "<sha256>",
  "decision": "ADVANCE|REWORK|DEFER|REJECT|PASS|FAIL|REVIEW_INCOMPLETE"
}
```

This is a valid JSON field template, not a JSON Schema. `_record_semantics` supplies machine-readable meanings for special values. Do not put `//` comments inside the JSON block. An automated validator must separately validate field types, single-value enums, and acceptance conditions; the template itself is not a validator. A `|`-separated string is not a literal enum value. Populate one valid value when writing a record. The value stage uses the four value decisions; verification, dispute, and protocol stages use `PASS / REWORK / FAIL / REVIEW_INCOMPLETE`. Exit codes, model strength, reasoning length, and multi-model agreement cannot replace evidence.

## 8. Verification and Evidence Levels

### 8.1 Obligations That Must Be Covered

1. **Mathematical correctness:** definitions, quantifiers, boundary cases, lemma dependencies, termination, exactness/error guarantees. Discharge every core obligation individually.
2. **End-to-end complexity:** do not merely solve an unproved recurrence. Include input reading, intermediate data generation, preprocessing/lookups, state transitions, output, bit-length growth, and randomized retries. Use appropriate recurrence, amortized, counting, or probabilistic analysis; do not force every problem into the Master Theorem.
3. **Representations and reductions:** source and target semantics must agree. Prove that encoding/decoding, algebraic operations, equalities/ties, parameters, and costs are preserved. Checking one identity is not verification of an entire reduction.
4. **Independent attacks:** check hard instances, degeneracies, extreme parameters, adversarial sequences, and easily hidden assumptions.
5. **Reproducibility:** retain source code, inputs, dependency versions, commands, random seeds, raw results, and failure records. Proof materials must let a reviewer reconstruct the key reasoning.

### 8.2 Three Evidence Levels That Must Not Be Confused

- **Experimental support:** finite tests, runtime fits, randomized searches, and fixed-word-size simulations. These can reveal problems, not prove all-size complexity bounds. Timing fits neither prove nor refute Big-O; do not interpret constant terms or discrete blocking artifacts as exponent changes.
- **Local certificates:** finite identities over exact domains, solver certificates within a specified logic, and similar evidence. State the proposition certified, premises, and checker. The evidence covers only the checked part.
- **Complete theorem proof:** covers the entire claim domain and all core obligations. A rigorous written proof with independent stepwise review is acceptable; Lean, Coq, Isabelle, or similar formalization MAY also be used. Formalization additionally requires auditing the theorem statement and trusted dependencies, excluding proof placeholders and undeclared axioms.

Prioritize formalizing the most error-prone, load-bearing new lemmas; pursue full formalization when feasible. Do not require a cheap complete verifier for every direction or **limit a contribution's value by its initial verification tool**. Acceptance rests on complete proof and audit, not arbitrary “left/right column” labels.

Check the checkers: validate schemas, dimensions, and number domains; test valid, deliberately corrupted, and boundary inputs. Self-tests do not establish checker completeness or the research theorem. Record heuristic no-solution/timeout outcomes as `UNKNOWN/NOT_FOUND` unless an unsatisfiability certificate with a clear applicable scope is available.

### 8.3 Acceptance Rules

Before acceptance, confirm all of the following:

- The problem card, baseline, theorem, code/construction, and proof use the same model and parameter range.
- The main result meets its preregistered threshold, without counting prior work or equivalent reformulations as new contributions.
- The heterogeneous Claude-side reviewer and qualified independent local agent have completed value and corresponding verification reviews under §7.1–§7.4; core objections have been resolved by evidence. Actual model independence, input version, and core-content coverage are verifiable. Renaming the same model does not satisfy reviewer multiplicity.
- A complete proof and “claim—proof obligation—evidence” matrix have been submitted. No core obligation is `UNKNOWN`; no key lemma remains unproved; no hidden oracle is used.
- Reproducibility/review materials and explicit limitations are supplied. Model approval, local certificates for finite identities, and finite experiments cannot independently satisfy acceptance.

Only then MAY the research objective be declared complete. Report publication and scholarly peer-review status separately; do not claim academic recognition that has not occurred.

## 9. Records, Skills, and Recovery

**`idea_goal_zh.md` and `idea_goal.md` contain only objectives, workflow, and acceptance rules—not revision logs, experimental numbers, or reviewer scores. Every change MUST be synchronized across both files.**

| Location | Purpose |
|---|---|
| `PREREG.md` | Active target, exact problem-card version, success threshold, and replacement rationale; not a human approval form |
| `GAP_MAP.md`, `explore/` | Verified literature, gaps, and mechanism diagnoses; uncertainties explicitly marked |
| `candidates/`, `killed/` | Candidate versions, current status, and specific deferral/rejection reasons |
| `review/` | Frozen review inputs, bilingual consistency checks, raw Claude/agent reviews, invocation/model-capability records, dispute resolution, acceptance matrix |
| `artifacts/` | Constructions, programs, checkers, reproducible experiments, and environment information |
| `FALSIFICATION_LEDGER.md` | Failed attempts, counterexamples, limitations; distinguish search failure from proved impossibility |
| `CALIBRATION.md` | Protocol rehearsals and reassessments; not claims of statistically guaranteed evaluation |
| `STATE.md` | Current target/candidate/stage, latest evidence, actual task handles, next action, resource usage |

Read accessible local research skills as needed: `research-lit`, `novelty-check`, `citation-audit` for literature; `idea-creator`, `research-refine` for ideation; `research-review`, `proof-checker`, `kill-argument` for review; `experiment-plan`, `experiment-audit` for experiments; `research-paper-writing` for organization. Use only capabilities that are actually accessible; a missing skill does not block work. Skill defaults for models, scores, rounds, or publication orientation MUST NOT override this protocol.

**Single recovery order:** `idea_goal.md` (consult `idea_goal_zh.md` for clarification) → `STATE.md` → current `PREREG.md` → `OPEN-ITEMS.md` → proofs/reviews/scripts needed for the current task. First determine whether the user's task is documentation or already-started research. Verify actual task handles and artifacts; do not infer runtime state from old logs alone. If `NEXT-ACTION.md` exists, it is only a shortcut index and does not override this order.

Historical records are leads, not automatically true evidence. Correct evidence status when errors are discovered; do not inherit obsolete rankings, numbers, or unverified experimental interpretations. Distinguish “one counterexample/instance exists,” “sampling found no counterexample,” “a specified finite domain was exhaustively checked,” and “a universally quantified theorem.” Do not extrapolate finite samples into asymptotic upper bounds or treat one candidate's failure as exhaustion of all routes. Preserve review snapshots and old versions; current entry points MUST NOT repeatedly copy stale “highest-priority” items.

**Next-action principle:** execute the task most likely to advance the primary objective and produce checkable new information. Repeated process reorganization, approval requests, status repetition, and endless reproduction of tiny examples are not theoretical research progress.
