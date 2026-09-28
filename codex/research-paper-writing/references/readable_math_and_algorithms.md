# Readable equations and algorithms: inspected examples

Use this reference when a manuscript explains the right mechanism but obscures it with exhaustive notation or prose-like pseudocode. The examples demonstrate specific writing techniques, not a universal ICLR template or evidence that a new method is correct.

## LoftQ — ICLR 2024 Oral

Sources: [official ICLR program](https://iclr.cc/virtual/2024/calendar), [published paper](https://proceedings.iclr.cc/paper_files/paper/2024/file/39ec972afab01e0d8ddc6834a9d12ac1-Paper-Conference.pdf).

Sections 2.2–2.3 on page 3 establish quantization and the adaptation baseline before Section 3.1 on page 4 introduces the new optimization objective. That objective expresses the essential approximation using four matrix names rather than expanding their entries. A residual receives its own short name before its decomposition is discussed. Algorithm 1 on page 5 has five numbered lines: initialization, a loop, two assignments, and the loop end. The decomposition step points to its defining equation instead of repeating the derivation.

Transferable lesson: explain the baseline before the new analysis; choose names that expose the central comparison; let the main algorithm show the flow between defined operations. Its short algorithm is appropriate to its operation count, not a mandatory five-line limit.

## Cut Your Losses — ICLR 2025 Oral

Sources: [official Oral list](https://iclr.cc/virtual/2025/events/oral), [published paper](https://proceedings.iclr.cc/paper_files/paper/2025/file/aa963ac256590bb7ad5fc26c68229a3a-Paper-Conference.pdf).

Section 3 on page 3 establishes the standard training computation. Section 4 on page 4 begins with one token's loss, defines the embeddings used in the calculation, then develops the batch expression and its computational parts. Algorithms 1–3 on pages 5–7 show initialization, loops, matrix operations, and accumulations. Short comments explain data movement and synchronization alongside the operations. Their length reflects computation that readers need to inspect.

Transferable lesson: reveal a mechanism on one meaningful unit before expanding dimensions. Pseudocode should expose the computation; prose supplies its purpose and assumptions. A systems paper may need detailed loops, but a method overview need not reproduce memory-management instructions.

## Applying the lesson

Before editing, identify what the reader must distinguish to understand the contribution. Open Method with a short problem-to-contribution summary, then carry its unresolved questions into the technical analysis. Put conclusions essential to the method's justification in the main text as concise theorems or propositions when that is clearer than prose; retain their assumptions and define the quantities locally. Introduce the question before the statement, then explain its implication for the method. Link each statement to its proof in the appendix rather than hiding the result there or repeating its full derivation in the body.

For an estimator, connect each approximation to its computational bottleneck, the information retained, and the mathematical or empirical reason to trust it. Separate the ideal target from the actually measured quantity when states or assumptions differ; explain the distinction with minimal notation. Do not make ordinary sampling or averaging the central story when the substantive choice is what to measure. For a fused implementation, show the central tile recurrence or reduction and its data flow in the main text when they constitute the contribution. Use a compact method figure to expose shared computation, intermediate location, and writes or reads removed; leave launch details and edge cases in the appendix. Distinguish exact algebra from finite-precision agreement and expected efficiency from measured speed.

Keep indices for meaningful distinctions and suppress fixed context explicitly. Judge notation by its use inside later equations: a short definition that creates nested expressions can increase reading cost. Prefer the author's compact notation when a sentence resolves its ambiguity. If grouping is a routine extension, explain one shared scale and state how the operation applies independently to groups; group names and indexing need not enter the main derivation. If grouping is central to the contribution, retain the necessary details.

Audit notation before rewriting formulas: carry forward the loss, weights, layer index, and matrix orientation from Preliminaries. A bit-width symbol must not silently become a gradient or batch index. A new symbol should name a necessary new quantity, not a renamed existing one. Giving a matrix a technical name is not enough: explain what its entries represent, how it is obtained, and what its use in the equation does. Distinguish an approximation from its theoretical target without requiring the reader to consult an appendix for the basic meaning. When an implementation stores transposed weights, explicitly map that layout in the appendix rather than changing the forward convention midway through the paper.

Do not replace complexity with undefined shorthand. Explain what helper calls consume, return, and modify; retain assumptions needed for a theorem; distinguish a smooth local result from full-budget training. Check the rendered algorithm and equations at paper scale. A successful revision lets a reader explain the operation without first reconstructing the entire implementation specification.

The observed failures went in both directions. Moving detailed material out of the Introduction initially displaced the readability problem into Preliminary and Method. A later attempt deleted helpful objectives and derivation steps, replacing them with prose and opaque helper calls. Audit the reading path and notation in every main section: equations should carry useful explanation, symbols should be defined locally, and pseudocode should combine explicit operations with short explanatory comments. Fewer equations or fewer algorithm lines are not measures of readability.
