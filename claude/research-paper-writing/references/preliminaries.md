# Preliminary writing: logic, equations, and concise precision

Use this guide when drafting or polishing Preliminaries, Background, or an adjacent Challenges section. Establish the facts needed to understand the problem; leave the paper's new analysis and solution in Method. Preserve a clear author-supplied structure.

## Establish prerequisites before limitations

Work backward from each challenge: what must the reader already know to understand it? Introduce those operations, objectives, and update restrictions first. For a staged baseline, explain each relevant stage separately; do not bury a stage in a closing sentence if its limitations motivate the next paragraph. Connect computational cost to the operation that incurs it.

The author's QAT revision illustrates this dependency: explain both stages and their trainable parameters, identify the mismatch between local reconstruction and prediction loss, introduce a layerwise end-to-end objective, then explain why order still matters. The previous draft discussed compensation through the output loss before establishing that training setup. This example is not a mandatory sequence, a requirement to use CE, or a fixed subsection count. An established objective can provide the setup for a contribution without itself being claimed as novel.

## Make each sentence advance an explicit relation

At each sentence boundary, identify the relation: definition, operation, consequence, contrast, or limitation. The next sentence should use an established fact or clearly introduce a needed premise. In particular:

- Name the actor and affected quantity: which method class or stage updates what, using which objective, while what stays fixed. Describe shared behavior with a class subject and supporting citations, rather than making the background a walkthrough of one named paper. Repeat a short concrete noun when a pronoun would be ambiguous.
- Explain an operation before summarizing its significance. Abstract phrases such as "allocation of adaptation opportunities" cannot replace the training and freezing behavior that gives them meaning.
- Structure a challenge as **problem → cause → consequence**: name the concrete limitation, explain why it arises, and state its effect on accuracy, cost, or another relevant outcome. Reserve prescriptions such as "the challenge is to compute X directly" for Method; a desired solution does not explain the existing problem. Explain a capability before discussing how another constraint limits its use.
- Distinguish axes that ordinary words can conflate: network position versus training time, or frozen parameters versus a stopped gradient path. Add the short qualifier that resolves the actual ambiguity.

## Give formulas specific jobs

Before adding a display, identify the distinction it makes visible. Keep it when it explains a mechanism, objective, or training state needed later. Cut repeated definitions, expanded bookkeeping, and unrelated parameter details. Do not introduce a separate symbol solely to abbreviate something used once.

The author's revision added useful displays: a quantization–forward–STE chain, reconstruction, scale training, and the layerwise task objective. It was clearer despite having more equations. These are example roles, not a four-equation quota. A coherent operation chain can share a display; independent stages merit separate objectives when their contrast matters. Split crowded displays for readability without adding mathematical machinery.

Keep the optimization variables and essential state distinctions visible. Define new symbols locally, then explain what the objective trains or what the expression reveals; do not paraphrase every symbol in a second description of the same operation.

## Put precision where it changes understanding

Keep conditions that determine the argument: which parameters update, which states differ, and how a training signal reaches them. Move reference-stream bookkeeping, implementation variants, and unused indices to Method or an appendix unless the present claim depends on them. A simpler special case needs a brief scope statement and consistent references; it must not silently redefine the implementation.

When polishing, compare against the author's own revision, not only a later assistant edit. Preserve the premise, comparator, causal direction, and intended claim strength. Correct technical inconsistencies locally and disclose substantive corrections. Do not restore removed details under the label of rigor or inflate verbs with unsupported modifiers. Reuse the established term: once a stage is called "scale training," do not also call it "scale refinement." Reserve new terminology for a distinction the reader actually needs.

Finish with a cold read: can a reader explain what each stage does, why the stated limitation follows, and why the next question arises? If not, repair the missing premise rather than adding transition words. Remove sentences and formulas that neither establish such a premise nor advance the explanation.
