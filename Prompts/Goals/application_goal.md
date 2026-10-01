# Application Goal: Substantive Translation of Theory into a User-Specified Domain

## 0. Protocol Identity, Sources, and Precedence

- **Protocol ID:** `theory-to-application-goal`; **version:** `2026-09-29.3`.
- **Chinese normative text:** `application_goal_zh.md`; **English execution entry point:** `application_goal.md`. Both MUST be semantically equivalent, have corresponding sections, and be updated together. Resolve discrepancies against the Chinese normative text and the user's latest instructions; never use a discrepancy to relax acceptance.
- `MUST / MUST NOT` indicate requirements/prohibitions; `SHOULD` indicates the default with a reason required for deviation; `MAY` indicates permission. System/developer/runtime constraints take precedence, then the user's latest instructions, then this protocol.
- **A workflow source is not a theorem source.** `idea_goal.md` specifies the theoretical-research workflow, with `idea_goal_zh.md` as its Chinese counterpart. Neither is itself the mathematical result to apply. Load the actual theory from user-designated papers/theorems/proof files. In this project, `idea.md` and its referenced frozen proof MAY be candidate sources, but verify their actual contents and versions rather than inheriting old “completed/verified” labels.
- This protocol primarily inherits problem cards, primary-source checking, value-before-verification, independent cross-model reviews, evidence levels, unlimited rounds, checkpoints, and deadlock prevention from `idea_goal.md`. It **intentionally replaces the objective that defers downstream deployment**: use the application-impact and publication-level criteria in §2. Do not mechanically demand a new mathematical exponent for every application, or automatically count minor constant-factor tuning as a breakthrough.
- During an application run, this protocol governs the objective, state files, stages, and recovery order. Other referenced methods from `idea_goal.md` MUST NOT override these application-specific clauses. Record the source protocol's version and hash. Evaluate later changes explicitly; do not silently change an ongoing objective.
- **Creating, translating, or reviewing this protocol does not start application research or restart a completed theory goal.** Enter the research loop only when the user explicitly starts/resumes it or the application goal runner requests continuation. For a documentation-only request, produce only the documents and their review.

## 1. User Inputs and Research-Start Boundaries

### 1.1 Required Inputs and Autonomously Resolvable Details

Before actual research begins, establish:

1. **The downstream domain and allowed scope specified by the user**, such as a class of database queries, GPU graph operators, or data-quality tasks. Examples are not defaults. Do not select the domain on the user's behalf from those examples.
2. **Theory sources:** the user-designated result and its dependencies. If unspecified and the directory contains one clear candidate, inspect `idea.md` and register it provisionally. Ask a brief clarification if multiple substantively different results exist or the source is unclear.
3. **Execution authorization:** an explicit user instruction to start this application research or a corresponding application-runner continuation. Completion of the theory project is not authorization to start a new application project.

For an actual startup request, record `WAITING_INPUT` if the domain is missing, the theory source is unclear, or execution authorization is absent. Make one concise clarification request covering all essential startup blockers, without repeatedly asking about autonomously resolvable details. Authorized protocol/desk work may continue, but do not initiate experiments in a self-selected domain. A documentation-only request does not require asking for a domain to fill placeholders or creating an application run. `WAITING_INPUT` is a local workflow status, not unilateral authority to change the goal runner's blocked status. Do not ask the user to approve every detail that can be resolved autonomously.

The user MAY additionally specify tasks, exclusions, target venues, hardware/data, quality tolerances, metrics, budgets, or privacy constraints. By default, a publication venue is not a prerequisite; do not invent hardware/data authorization. Develop other details through reconnaissance and state assumptions in the problem card. Do not use unauthorized resources; continue analysis using available materials.

### 1.2 Run-Configuration Template

After receiving an actual application-start request, save a valid JSON record such as the following in `applications/<run-id>/RUN_CONFIG.json`. This is a data template, not a JSON Schema that automatically validates completion. `null` means unfilled—not zero, unlimited resources, or permission. `false` does not become `true` automatically.

```json
{
  "protocol_id": "theory-to-application-goal",
  "protocol_version": "2026-09-29.3",
  "run_id": null,
  "user_domain": null,
  "user_domain_evidence": null,
  "allowed_scope": null,
  "excluded_scope": [],
  "execution_authorized": false,
  "authorization_evidence": null,
  "theory_sources": [],
  "workflow_sources": [
    {
      "path": "application_goal.md",
      "version": null,
      "sha256": null
    },
    {
      "path": "idea_goal.md",
      "version": null,
      "sha256": null
    }
  ],
  "target_venues": [],
  "authorized_resources": {},
  "resource_limits": null,
  "quality_constraints": [],
  "success_profile": null,
  "status": "DRAFT"
}
```

The lead fills values from actual user instructions and records evidence; the user need not edit JSON manually. Starting research requires a nonempty domain, scope, sources, and authorization. An incomplete configuration MUST NOT be marked started. `success_profile` MAY be determined after initial reconnaissance, but MUST be frozen before confirmatory experiments.

`status` is exactly one of `DRAFT / WAITING_INPUT / ACTIVE / PAUSED / COMPLETE / STOPPED`: draft, essential inputs missing, authorized execution, user/runner pause, accepted completion, or user/runner stop without completion. Do not write `ACTIVE` while `execution_authorized=false` or essential inputs are missing. Use `COMPLETE` only after every §2.3 condition is met. Pause/stop/resume require actual user/runner instructions; candidate failure cannot trigger `STOPPED`. These are local application statuses, not replacements for runner state management. A genuine startup request awaiting clarification MAY have a `DRAFT / WAITING_INPUT` record without research having started; a documentation-only request still creates no run directory.

Every `theory_sources` element MUST be an object with `path`, `version`, and `sha256`; theorem locations and evidence paths MAY be added. `workflow_sources` uses the same source-object structure and hashes the actual contents read. Leave unresolved sources as empty arrays/null rather than fabricated hashes. Transition back to `ACTIVE` only after an explicit resume instruction and adequate inputs, authorization, and resources.

## 2. Application Objective and Success Criteria

### 2.1 Primary Objective

Within the user-specified domain and constraints, use a checkable theoretical result to produce at least one **algorithm, data structure, or systems method addressing a real task, with correct theory-to-application fit, application-level novelty, independent reproducibility, and substantive impact**, and prepare materials suitable for scholarly peer review.

Establish an auditable chain:

`user task → real bottleneck → theoretical assumptions and object mapping → new mechanism → complete algorithm/system → measurable or provable benefit → applicability boundaries → paper contribution`

The objective is not to rename a theorem as an application, or to count a paper draft alone as success. Unless the user specifies otherwise, completion means **meeting preregistered application criteria and delivering submission-ready materials**, not conference acceptance, production deployment, or demonstrated societal impact. Actual submission, external release, and deployment require separate explicit authorization.

### 2.2 What Counts as Substantive Progress

Register one or more domain-appropriate success dimensions and obtain value review:

- **Asymptotic progress:** improve end-to-end time/space for the same task and guarantees, not merely a non-bottleneck intermediate counting bound.
- **Mechanism-backed systems progress:** a new algorithm/representation reliably improves time, memory, energy, cost, or feasible scale on real tasks under fair resource/quality constraints, even without changing asymptotic order. It MUST exceed noise and low-value parameter tuning; register thresholds before verification, and do not substitute better hardware or reduced quality for innovation.
- **New capability or trade-off:** make a task feasible within a previously insufficient resource budget, or establish a new checkable region of an important quality–efficiency or exactness–space trade-off.

Do not impose a universal “2×” or “5%” threshold across domains. `APPLICATION_CARD.md` MUST register metrics, direction, minimum meaningful improvement, workload-scale range, quality/resource constraints, baselines, and evaluation method. Do not relax user-imposed thresholds. Small exploratory measurements MAY inform threshold selection, but do not backfill a success criterion from the minimum already-observed result.

**Insufficient on their own:** reproving the original theorem; mechanical reuse of an existing method; changing only GPU/model/library version; local metrics with no end-to-end benefit; cherry-picked data slices; toy-only examples; generic application lists; unsuccessful-search logs; model consensus; paper formatting; or venue fit.

### 2.3 Completion Requires All Conditions

1. Domain, task, assumptions, input distribution/scale, and guarantees satisfy the user's scope and frozen problem card.
2. The theorem applies to the real task, or all needed adaptations/extensions are fully verified. Do not hide an unproved bridge inside the implementation.
3. A nontrivial application mechanism/result provides a clear increment over current verified, applicable strong baselines.
4. Preregistered benefit and quality criteria are met with all required costs included; evidence covers the claim's scope; if the frozen `success_profile` requires an implementation or experiments, the corresponding prototype MUST exist and reproduce the key results (see §10).
5. All load-bearing mathematical, implementation-correctness, experimental-validity, and novelty obligations are discharged; no core `UNKNOWN / UNREVIEWED` remains.
6. Cross-model value and verification reviews required by §9 are complete, with material objections resolved by evidence.
7. Reproducibility materials, limitations, full derivations, and paper drafts required by §10–§12 are delivered.

## 3. Unlimited Iteration, Autonomy, and Stopping

### 3.1 Sustained Execution

- **No upper limit on iteration count K:** once application research is started, continue until §2.3 is actually satisfied or the user explicitly stops. Do not promise a breakthrough exists in every designated domain or that a paper will be accepted.
- Within the authorized domain, the lead MAY select subtasks, form candidates, register cards, change mechanisms, defer failed candidates, and arrange independent reviews without repeated “freeze approval.”
- **Do not autonomously change the domain or user-imposed constraints.** Register within-domain topic changes autonomously. Moving outside the domain, changing required quality, or expanding spending/data access/production permissions needs explicit authorization. Out-of-domain leads MAY be recorded, but out-of-domain success cannot replace this goal.
- Report every five rounds or after material evidence changes. Reports notify, not request permission to continue. Each round requires a specific question, action, resource/batch end condition, and evidentiary artifact.
- After two rounds without useful progress on the same obstacle, change mechanism or defer the candidate. After three rounds with no new checkable information, reprioritize within-domain candidates and bottlenecks. Reduce repeated tiny examples; rewriting plans is not progress.
- `REJECT / INCOMPATIBLE / REFUTED` for a candidate is not project termination. Multiple failures do not prove the entire domain lacks opportunities. An impossibility argument closes only its explicitly covered scope.
- Unlimited rounds do not authorize unlimited cost; every invocation/experiment remains within authorized resources and budgets. Report genuine blocking only when required resources are missing and no other safe work remains; follow the runner's repeated-blocker audit. Difficulty, slow reviews, long context, or failed candidates alone do not justify blocked status.

### 3.2 Scheduling Without Deadlock

- Identify immediate critical-path work for the lead before delegating independent, parallelizable, bounded subtasks. Do not delegate the sole next action and repeatedly wait without work.
- Register input version/hash, owner, tool handle, read/write scope, outputs, and end conditions. **One file has only one writer at a time.** Reviewers write their own reports and do not overwrite reviewed artifacts.
- A timeout only ends an observation window; verify the same handle before restarting anything. Confirm handoff after redirection/closure before transferring write ownership. Preserve late artifacts as new versions, not replacements for current proofs/configurations.
- Classify rounds as `PROGRESS / VERIFIED_WAIT / NO_PROGRESS`. A verified wait requires status checkable in that round; an intent to wait, an old lock file, or an unexecuted plan is neither a verified wait nor progress.
- If a service, independent model, or local evidence is missing, keep the relevant gate closed but continue other work. Do not create approval locks, endless arbitration, or waits for the user to claim a candidate.

## 4. Domain Reconnaissance and Problem Cards

### 4.1 Start from the Real Task

Study actual inputs/outputs, distributions, quality requirements, resource limits, update frequency, deployment paths, and existing practice. Inspect primary papers, official documentation, public code, data/workload sources, and necessary domain materials. Verify dates for current products, algorithm libraries, venues, and baselines.

Build `DOMAIN_MAP.md`: task value, known solutions, real bottlenecks, exploitable theoretical structure, initial fit obstacles, expected benefit, and minimum discriminating action. Retain several directions and focus on one or two; no fixed topic quota. Mark unsupported demand assumptions for validation rather than inventing users, deployments, or industry scale.

### 4.2 Application Problem Card

For each deeply investigated candidate, create a versioned `APPLICATION_CARD.md` containing at least:

1. User domain, users, real task, input/output semantics, and exclusions.
2. Data/workload sources, sampling units, scale parameters, structural conditions, and their prevalence; define training, querying, building, and updating separately.
3. Hardware/software stack, precision, parallelism, dynamics, failure model, quality, and safety constraints.
4. Exact theorem, assumptions, parameters, version/hash, proof, and external-dependency status.
5. Mapping from the task to mathematical objects and back to outputs; additional assumptions, costs, and unresolved obligations.
6. Strongest verified applicable baselines, what the original theorem does not supply, the proposed new mechanism, and its difference from routine engineering.
7. Quantitative success thresholds, comparison ranges, statistical/theoretical decision method, quality floors, non-goals, and failure conditions.
8. Risks, counterexample/boundary-test plan, exploratory/confirmatory data separation, and intended reproducibility artifacts.
9. The next action that distinguishes success from failure. Target venues MAY remain unset until contributions justify positioning.

Drafts are allowed during reconnaissance. Before confirmatory verification, freeze the task specification, thresholds, data-processing rules, and baselines. Material changes to mechanism, semantics, quality constraints, workload, or threshold require a new version, rationale, and renewed value review. Old observations are not blind-test evidence for the new version.

## 5. Theory-to-Application Fit Audit

### 5.1 Map Assumptions Individually; Terminology Is Not a Reduction

In `ADAPTATION.md`, maintain a “theoretical assumption/conclusion—application object—evidence—gap—repair cost” matrix. At minimum check:

- Directionality, weights, planarity, connectivity, sparsity, dynamics, or whatever conditions the theorem actually requires. MUST NOT claim applicability merely because both objects are called a “graph” or “compression”.
- Input size, parameters, bit lengths, and hidden constants. Connecting terminals, subdivision, expansion, discretization, or indexing can enlarge a supposedly small parameter.
- Whether the conclusion is existential, counting-only, constructive, average-/worst-case, exact, or approximate. MUST NOT equate fewer possible states with proportionally less actual running time without a justified cost derivation.
- Encoding, decoding, output recovery, ties, randomness, and floating-point error. Prove preservation of semantics, feasible sets, error, and task guarantees.
- Whether the bridged metric/loss/objective remains the quantity the application actually needs. Do not silently replace the task by removing directions/weights/edges or approximating it.

Use `SATISFIED / REQUIRES_PROOF / VIOLATED / UNKNOWN` per obligation. Overall fit uses:

- `DIRECT`: existing assumptions/conclusions directly cover the task.
- `ADAPTED`: semantics, error, and costs of a nontrivial adaptation are verified.
- `CONDITIONAL`: explicitly depends on an unproved bridge or new theory.
- `INCOMPATIBLE`: a proved conflict/counterexample exists under the current definition.
- `UNKNOWN`: insufficient information.

Before the value gate, `CONDITIONAL / UNKNOWN` MAY support a hypothetical value assessment without a complete proof. **Final acceptance requires claim-consistent `DIRECT / ADAPTED` status; unproved adaptation cannot be counted as completion.**

### 5.2 Attribution and Necessity of the Theory

Ask: “Without this theoretical result, would we obtain the same algorithm and outcome?” Distinguish:

1. Theory motivates a new algorithm/structure that improves an actionable bottleneck.
2. Theory gives a previously heuristic method a new guarantee, applicability range, or design parameter.
3. Only a previously stated complexity bound becomes tighter; the actual algorithm and capability do not change.
4. The application framing has no testable relationship to the theorem.

The first two can be valuable. The third must establish why the guarantee itself matters to the domain. The fourth cannot be this goal's primary result. Check attribution through feasible ablations, theoretical counterfactuals, alternative representations/solvers, or cost decomposition. Deleting theorem text is not a runtime ablation; hardware speedups do not substitute for theoretical contribution.

If a new lemma/extension is needed, register it as a separate proof obligation. Borrow only problem-card, improvement, proof, and verification methods from `idea_goal.md` §3.2, §6.2, and §8.1–§8.2, not its standalone-theory success criteria or authorization to restart the theory goal. This “borrow only” restriction specifies bridge-proof methods and excludes standalone-theory success/acceptance criteria; it does not limit workflow and review clauses explicitly inherited in §0 and §9.1. A bridge lemma need not itself be an exponent breakthrough. The source's `≥0.05` was only a topic-prioritization heuristic and MUST NOT become a bridge gate. Evaluate the lemma by its role in the application candidate; application value and acceptance follow this protocol's §2, §6, and §10. Advance it within the domain, but do not retreat into unbounded pure mathematics without an application objective. If a source theorem develops a gap, downgrade all dependent claims. Repair it or try another within-domain adaptation; do not automatically re-audit unrelated historical materials.

## 6. Candidates, Stage Gates, and Value Review

### 6.1 Stage Order

| Stage | Work | Gate/transition |
|---|---|---|
| S0 Inputs and authorization | Establish domain, sources, scope, permissions | Missing essential input: `WAITING_INPUT`; otherwise S1 |
| S1 Reconnaissance and lightweight fit | Domain baselines, actual bottleneck, assumption matrix | Concrete candidates; archive or reformulate already-conflicting routes |
| S2 Candidate and preregistration | Quantitative benefit hypothesis, mechanism, risks, validation plan | Sufficient packet for external assessment assuming success |
| S3 **Value/novelty review** | Importance, fit potential, increment, impact, publishable contribution | Only `ADVANCE` enters deep verification; otherwise rework/defer/reject with reasons |
| S4 **Adaptation and correctness verification** | Prove mapping, complexity/error accounting, and—where the success profile requires them—prototype and discriminating tests | Establish correctness before formal performance/quality evaluation |
| S5 Confirmatory evidence | Experimental candidates use frozen configurations, independent workloads, fair strong baselines; theoretical candidates use complete theorems and checkable comparisons | Meet the frozen success profile; experiment non-applicability must be preregistered and reviewer-confirmed, not a post hoc removal of required experiments |
| S6 Independent verification and final value reassessment | Audit proof, implementation, evaluation, attribution, current novelty | All core obligations pass; material changes return to S3 |
| S7 Paper and acceptance | Complete artifacts, reviewer perspective, boundaries, §2.3 audit | Complete only if actually satisfied; otherwise execute the most informative next task |

Lightweight probes in S1/S2 MAY exclude obvious mismatches, estimate parameters, or fix tools. They do not replace the value gate or authorize unbounded optimization in advance. Initial review assumes the core conclusion true and asks whether it is worth pursuing; unfinished proof/experiments MUST NOT be the sole rejection reason.

### 6.2 Value and Potential Impact

Score each dimension 0–4 with evidence/reasons; use `UNKNOWN`, not zero, when uncertain: real-task importance, credible adaptation entry point, application novelty, expected benefit magnitude, fair comparison/cost, scope/reuse, verifiability, and clarity of the paper contribution.

Scores aid prioritization; they are not correctness rates, acceptance probabilities, or demonstrated societal impact. Return `ADVANCE / REWORK / DEFER / REJECT`. A candidate entering S4 MUST complete the required external value reviews and resolve core objections. Voting cannot override a substantive unresolved conflict.

Value review MUST challenge demand realism, overly narrow conditions, simpler existing solutions, construction costs that consume benefits, prevalence of the parameter range, changes to hardware/quality/baselines, and what the new theorem actually contributes. Negative findings are exclusion evidence, not automatically an “application breakthrough.” A switch to a negative-results-paper objective requires explicit redefinition by the user.

## 7. Implementation, Experimental Design, and Complete Costs

### 7.1 Correctness Before Performance

- Validate outputs first against checkable small cases, boundary cases, known counterexamples, and an independent reference implementation. Performance is not success evidence while core correctness fails.
- For exact claims, prove semantic preservation and run differential tests. For approximate/randomized methods, register error, failure probability, adversary/sampling assumptions, and verify that quality budgets were not silently relaxed.
- Test checkers too: valid and deliberately corrupted cases, dimensions/schema/number-domain validation, actual exit codes. Tool timeout, empty output, or unsuccessful heuristic search does not prove no solution exists.
- If the success profile requires a prototype, that prototype MUST implement the load-bearing mechanism, not call a hidden oracle. Unaccounted costs, hand-precomputation, or unavailable indexes are explicit gaps.

### 7.2 Cost and Benefit Accounting

Include all relevant costs: data acquisition/cleaning, representation conversion, preprocessing, index construction, model training/tuning, compilation, CPU–GPU transfer, kernel launch/synchronization, storage, queries, decoding/output, updates/invalidation/rebuild, retries, and quality checks. Explain inapplicable costs; not every task uses a GPU.

For new preprocessing `P_new` and query cost `t_new`, versus baseline `P_base` and `t_base`, compare:

`T_new(Q) = P_new + Q*t_new` against `T_base(Q) = P_base + Q*t_base`.

Only when `t_new < t_base` can the corresponding amortization threshold be considered. For positive extra build cost, total-time improvement requires `Q > (P_new-P_base)/(t_base-t_new)`. Include actual update frequency and cache lifetime. Account for a local speedup's share of end-to-end cost. Compressed representations do not eliminate the lower bound of an explicitly required output.

### 7.3 Fair Baselines and Evaluation Coverage

- Find current verified strong algorithms/systems **applicable to the same task and guarantees**, not only the source paper's loose upper bound or a naive implementation. Record implementation sources, versions, tuning budgets, and unavailable baselines.
- Fix hardware, precision, quality, resource budgets, input/output, and workloads according to the claim. If resources differ, report cost-normalized results separately rather than mislabeling them algorithmic speedups.
- Preregister data sources, train/validation/test splits, sampling units, repetitions, seeds, primary metrics/thresholds, exclusions, statistical and stopping procedures. Cover cold/warm start, batching, concurrency, peak memory, and scale variation where relevant to the claim.
- Use verifiable synchronized GPU timing. Separate compilation/warmup, host time, device time, and end-to-end time. Asynchronous submission time is not execution time. Do not charge caching or data movement only to the baseline.
- Explore on development data, then freeze and run confirmation. Changing methods/thresholds after seeing confirmation data is adaptive selection: record it and use new independent confirmation data or preregistered valid sequential/multiple-comparison methods. Unlimited iteration is not unlimited peeking at the same test set.
- Report effect sizes, variability/intervals, and run-to-run fluctuation appropriate to the claim. Statistical significance is not practical value. Deterministic worst-case bounds need proof, not timing-slope fits.
- Use representative real/realistically constrained workloads and controlled synthetic hard cases; state representativeness, licenses, shareability, and scale coverage. Many samples from one generator do not cover an entire domain.
- Preserve negative results, degradation ranges, and counterexamples; perform necessary ablations, sensitivity, and robustness checks. If real data is unavailable, limit claims to controlled environments rather than claiming real deployment validation.

## 8. Novelty, Paper Positioning, and Deliverables

### 8.1 Two Literature Chains

Search both **the source theory/neighboring mathematical tools** and **existing domain indexes, systems, algorithms, and engineering techniques**. Check synonyms, equivalent existing methods, stronger special-case results, public code, and recent preprints.

Perform novelty checks before the value gate and before final claims. Attach primary-source locations, versions, and search dates to load-bearing novelty claims. “Not found” does not mean “does not exist.” Separate prior theory, known adaptation, new bridges/algorithms, new systems mechanisms, and new empirical findings. Cite prior publications/public results correctly; do not count the original theorem's novelty again.

### 8.2 Paper Positioning Is Not Rebranding

A venue MAY be specified by the user or suggested after substantive within-domain contributions emerge. Its absence does not block research. Verify official scope, paper types, review expectations, page limits, and dates rather than relying on old memory. Mathematical theorems, database indexes, Web questions, ML capabilities, and GPU systems require different evidence; not every paper needs identical experiments.

Build `PAPER_CASE.md`: task in one sentence, importance, closest prior work, key distinction, technical challenge, theorem/algorithm/system contributions, main findings, limitations, and likely rejection reasons. Adopt the reviewer's perspective: is the theory decorative, is the data chosen merely to fit assumptions, is there a stronger baseline? Do not promise acceptance or turn model scores into acceptance probabilities.

Final `application.md` and `paper/` MUST include the precise problem, prior work, assumption mapping, complete step-by-step derivations/algorithms, complexity/error analysis, experimental methods and raw-evidence pointers applicable under the success profile, applicable ablations/counterexamples/boundaries, contribution attribution, and references. Appendices MUST NOT hide core gaps or let the main paper omit adaptation assumptions.

## 9. Review Roles, Heterogeneous Models, and Gates

### 9.1 Inherited Model Rules

Apply `idea_goal.md` §7.1–§7.4, with this operational summary for application work:

- Retain the Codex frontend's lead model; do not modify global defaults. Every delegated local agent explicitly uses a different underlying model from the lead. Formal reviewers additionally differ from the generators of the key artifacts they review.
- Local reviewers counted toward the same candidate/stage gate MUST differ from one another. New sessions, aliases, or reasoning settings do not establish heterogeneity. Use `fork_context=false` or an actually equivalent no-inherited-context session.
- Minimum research-result review is **a heterogeneous Claude-side reviewer plus at least one qualified independent local reviewer**, with different underlying models. Value and verification use separate fresh sessions; both reviewers complete required stages. Implementer self-checks are not substitutes.
- Names such as `gpt-6-astra` and `gpt-5.6-sol` are candidate examples only. Before invocation verify the latest accessible models, actual interface, deepest single-reviewer reasoning mode, and largest effective context. Critical reviews use the strongest eligible independent model; a weak fast model cannot be the sole review for convenience.
- Adaptation proofs, core mathematical/algorithmic correctness, experimental validity, final benefits, and disputes are R3; value/novelty/complexity accounting is at least R2; formatting/organization MAY be R1. Capabilities are model × interface × account specific; do not copy another interface's `max / ultra` or context capacity.
- `tclaude` is a local CLI entry point, not a guarantee of backend branding. Preserve model receipts and alias mappings. Unverified identity, independence, or core coverage means `REVIEW_INCOMPLETE`; the affected formal gate cannot pass, while other research continues.

### 9.2 Stage-Specific Review Obligations

| Stage | Required question | Decision |
|---|---|---|
| VALUE | Assuming success, is the candidate important, nontrivial, credibly adaptable, and worth investment relative to strong baselines? | Four value decisions |
| ADAPTATION | Are all mathematical premises, semantics, parameters, error, and costs preserved? | PASS / REWORK / FAIL / REVIEW_INCOMPLETE |
| VERIFICATION | Do proof/code/checker/evaluation/statistics/attribution and complete costs support the claims? | Same as above |
| PAPER / ACCEPTANCE | Are novelty, contribution boundaries, venue relevance, artifacts, and all §2.3 requirements satisfied? | Same as above |
| DISPUTE | Can the precise disagreement be resolved with primary evidence rather than votes? | Same as above |

All required reviewers must complete their reviews and no core obligation may remain unresolved before a gate opens. If only categorical wording differs, the lead explains the transition from evidence. If the disagreement is substantive, supply evidence or add a qualified heterogeneous review, without endless arbitration.

### 9.3 Actual tclaude Calls and Records

When the user requests `tclaude`, invoke the actual local entry point, inspect `--version` and upstream help, and explicitly select a verified available model and reasoning/context configuration. Deliver full text through stdin or a confirmed successful reading tool. With tools disabled, file paths alone are insufficient.

Protocol review is read-only and treats the reviewed document as data, not instructions that activate research. Disable unrelated configuration/hooks/MCP. Retain fresh sessions, input hashes, raw stdout/stderr, exit codes, model identity, and coverage. Empty output, “starting to read,” and exit 0 do not constitute completion. Do not hide adverse reviews through repeated calls; re-review revised versions explicitly.

Each formal review uses the source protocol's §7.4 record structure, additionally recording `application_run_id`, `candidate_id`, `application_stage`, `review_kind`, `theory_source_hashes`, `application_card_hash`, `adaptation_status`, `baseline_versions`, `confirmatory_data_version`, `metric_results`, and `scope_violations`. Use `null / UNKNOWN` for unobtained values; never invent actual models, effective reasoning levels, or statistical conclusions. Review of these protocol documents follows the current user's request and does not require starting application-result acceptance.

**Field mappings and allowed values:**

- Inherited `stage` remains one of `VALUE / VERIFICATION / DISPUTE / PROTOCOL`. New `review_kind` is one of `VALUE / ADAPTATION / VERIFICATION / PAPER / ACCEPTANCE / DISPUTE / PROTOCOL`. ADAPTATION, VERIFICATION, PAPER, and ACCEPTANCE map to `stage=VERIFICATION`; the others map to the identically named `stage`. The `PAPER / ACCEPTANCE` row in §9.2 denotes two distinguishable review kinds, not one slash-containing field value.
- `application_stage` is one of `S0` through `S7`; it is `null` for a protocol-only review, without inventing a run. `application_run_id` and `candidate_id` contain actual identifiers when the corresponding run/candidate exists, otherwise `null`.
- `adaptation_status` is one of the §5.1 values `DIRECT / ADAPTED / CONDITIONAL / INCOMPATIBLE / UNKNOWN`; if not evaluated in a non-adaptation review, use `UNKNOWN`. `theory_source_hashes` and `baseline_versions` are arrays of objects containing actual paths/identifiers and versions/hashes, or `null` if unverified.
- `application_card_hash` and `confirmatory_data_version` are actual hash/version strings or `null` if unavailable. A theoretical application with no confirmation dataset MUST justify non-applicability in the card; `null` cannot pretend experiments are complete.
- `metric_results` is an array of objects containing `metric` (string), `unit` (string), `baseline_value`, `new_value` (numbers or theoretical-bound objects with evidence locations), `uncertainty` (interval/variance object or `null`), `meets_registered_threshold` (boolean or `null`), and `evidence_path`. If either of the last two fields is missing/unknown, the benefit gate cannot pass. Use `null` for the entire field before benefit verification; an empty array does not mean success.
- `scope_violations` is a string array: `[]` means checked with none found, `null` means not checked. A nonempty array means violations exist: the affected gate MUST NOT pass until scope is corrected or explicitly authorized by the user and registered as a new version. New authorization does not retroactively erase a violation; affected evidence must be revalidated under the new scope. `null` is an unchecked core item and cannot support final acceptance. VALUE uses the four value decisions; other `review_kind` values use `PASS / REWORK / FAIL / REVIEW_INCOMPLETE`.

Actual records/validators MUST enforce these domains. Arrays can contain multiple items; single-valued enums take one choice, not a literal `|`- or `/`-separated explanation. Final acceptance depends on obligations and evidence, not field presence, empty arrays, or one PASS.

## 10. Evidence Levels and Completion Audit

- **Experimental support:** finite data, timings, sampling, and empirical regularities; not universal conclusions, worst-case complexity, or domain-wide applicability.
- **Local certificates/unit checks:** only cover specified semantics, input domains, and checker guarantees.
- **Complete adaptation/mathematical proofs:** cover all assumptions, transformations, parameters, errors, and costs of the exact claim.
- **Implementation and end-to-end evaluation evidence:** supports benefits under registered data, environment, quality constraints, and statistical procedures; not automatically untested settings or production reliability.
- **Independent model review:** helps detect errors but does not replace the above evidence or constitute scholarly peer review.

Treat completion as unproven, inspect every §2.3 requirement, and populate `ACCEPTANCE.md` with a “claim—domain/theory assumptions—obligation—proof/code/test—baseline—metric—independent review—limitation” matrix. Deadlines, low remaining budget, model agreement, attractive figures, or one successful candidate do not excuse missing core requirements.

A prototype MAY be rough while progress continues, but required executable artifacts must actually exist and reproduce key results at completion. A theoretical application paper need not be deployed in production; it must still establish the real domain problem and its new guarantee. If the success profile requires experiments, theory cannot substitute for unfinished mandatory experiments.

Only when every condition is satisfied may the runner be marked complete under its rules. Finite negative findings, all candidates temporarily deferred, or a submission draft that misses benefit criteria cannot replace the positive objective. Human stop and genuine blocking follow user/runner rules, not claims of scientific success.

## 11. Records, Checkpoints, and Recovery

### 11.1 Isolate Application Runs from Theory Artifacts

Use a unique `applications/<run-id>/` for each actual application run; do not mix domains/runs. A protocol-only request MUST NOT create a directory pretending research has started.

| File/directory | Purpose |
|---|---|
| `RUN_CONFIG.json` | User domain, authorization, resources, source protocols and versions |
| `STATE.md`, `OPEN-ITEMS.md` | This run's latest authoritative state, valid next action, handles, unresolved obligations |
| `THEORY_CARD.md`, `ADAPTATION.md` | Frozen theory, assumption mapping, source hashes, proof gaps |
| `DOMAIN_MAP.md`, `BASELINES.md` | Within-domain candidates, demand, and strong-baseline evidence |
| `APPLICATION_CARD.md` | Current task, metric thresholds, data/parameter ranges, version |
| `candidates/`, `archive/` | Candidate versions and deferral/rejection reasons |
| `proofs/`, `src/`, `tests/` | Bridge proofs, implementation, independent checkers |
| `experiments/`, `artifacts/` | Preregistered designs, environment, raw output, seeds, statistics, reproduction commands |
| `review/` | Value/adaptation/verification/paper/dispute snapshots and invocation records |
| `PAPER_CASE.md`, `application.md`, `paper/`, `ACCEPTANCE.md` | Paper case, detailed result, manuscript, acceptance audit |

Application files MUST NOT overwrite the theory project's `PREREG.md`, proofs, historical reviews, or completion state. Propose theory corrections as new versions and update dependencies, preserving original evidence. Protocol files contain objectives/rules, not experiment logs.

### 11.2 Automatic Compaction and Recovery

Use actually supported native auto-compaction. Checkpoint this run before the context limit, when the next batch may exceed it, or attention persistently degrades. Base triggers on real context capacity, reserved output, and margin. About 80% is only a conservative reference, not fabricated occupancy/capacity.

When active triggering is supported, invoke the real `/compact`/tool. Writing `/compact` in a shell, reply, or subagent prompt does not compact the lead conversation. Otherwise checkpoint, use native compaction/recovery, and continue small batches within safe context. Do not declare the goal complete because context is exhausted.

Single recovery order:

`application_goal.md → necessary inherited clauses of idea_goal.md → applications/<run-id>/RUN_CONFIG.json → STATE.md → APPLICATION_CARD.md → THEORY_CARD.md / ADAPTATION.md → OPEN-ITEMS.md → current evidence and task handles`.

Consult Chinese for translation clarification. First confirm this remains an authorized application run and verify real process/tool state; do not infer completion/stoppage from an old summary. If the top item is stale, completed, or refuted, correct it before execution; do not repeatedly prepend obsolete “highest-priority” entries.

## 12. Skills, Startup Example, and Final Checklist

### 12.1 Skills

Use actually accessible literature, novelty, idea-refinement, proof-checking, experiment-planning/audit, benchmarking, paper-writing, and code-review skills. A missing skill is not blocking; skill defaults for model, rounds, scores, venue, or permissions do not override this protocol. Validate new tools/libraries with small cases first; verify changing interfaces in current official documentation instead of inventing experimental capabilities from memory.

### 12.2 User Startup Example: Not Current Authorization

```text
Start application research under application_goal.md.
Designated domain: [user supplies domain and allowed scope]
Theory source: [result file/theorem; here, idea.md and its frozen proof may be used]
Task or exclusions: [optional]
Hardware, data permissions, budget: [actual authorization]
Quality requirements, target metrics, venue: [optional]
Explore and change mechanisms autonomously within that domain.
Review value before deep verification. Continue until the registered
application objective and all acceptance conditions are met, or I explicitly stop.
```

### 12.3 Per-Round and Final Checks

Each round, ask: What is the user's current scope? What is the most dangerous unproved adaptation? Which new information would change the choice? Are we repeating an excluded mechanism? What checkable artifact will this batch produce?

Finally ask: Is the theory genuinely used? Are domain semantics preserved? Are strong baselines fair? Do complete benefits meet thresholds? Is confirmation data compromised? Is there a nontrivial application/paper increment? Were reviewers actually heterogeneous, and did they demonstrably cover all core material? Do the prototype, proof, raw evidence, and manuscript required by the frozen success profile actually exist?

**Any unknown core answer means not complete. Continue the most informative within-domain action rather than rebranding, relaxing thresholds, or repeating status reports.**
