# Codex Skills

个人使用的 Codex 技能集合。2026-09-15 首次收录，**2026-09-28 合并论文写作更新**：在已同步的本机个人版本上，参考仓库内更新后的 Claude skills，并核对 Auto-claude-code-research-in-sleep 上游。仓库版本与本机安装版本分别维护。

## 收录技能

| Skill | 用途 | 本次核对与同步结果 |
| --- | --- | --- |
| [research-paper-writing](research-paper-writing/SKILL.md) | 贡献定位、实验设计、中文简报、LaTeX 写作与完整稿件审阅。 | 以本机 2026-09-25 版本为基础，合入更新后的写作原则、Introduction 论证检查和证据审阅；保留作者偏好，现有 8 个按需参考文件。 |
| [writing-systems-papers](writing-systems-papers/SKILL.md) | 系统论文的章节结构、页数分配、Design / Implementation / Evaluation 组织。 | 新增 Codex 适配版；以已更新的 Claude 版为基础，对照上游 Codex 版，保留结构蓝图并去除对完整 ARIS 流程的依赖。 |
| [pdf](pdf/SKILL.md) | PDF 读取、生成、页面渲染与版面检查。 | 与用户目录版本逐文件一致，无需改动；来源文件修改于 2026-06-12。 |
| [zotero](zotero/SKILL.md) | 本地 Zotero 检索、BibTeX 导出、引用插入与文献导入。 | 已安装来源仍为插件 **0.1.2**；脚本、接口说明与图标均一致，无需更新。保留仓库已有的独立 skill 适配。 |

论文写作 skills 在保留本机个人偏好的基础上做了 Codex 适配，不再声称与用户目录逐字一致。`pdf` 保持已同步内容。配套元数据、资源和已有许可证一并保存；两个论文技能各含 `LICENSE.upstream`，保留上游 MIT 声明。Claude 与 Codex 版本分别维护。

Zotero 保留原脚本和接口说明，仅将技能名规范为 `zotero`、同步默认调用提示，并把插件路径改为相对于 `SKILL.md` 的路径。它依赖本机 Zotero Desktop，通过本地 API/Connector 工作，不需要另装 Codex Zotero 插件。若已经通过插件加载同一技能，选择一种加载方式即可。

## 写作流程与当前偏好

四项技能各有分工：`research-paper-writing` 负责论证和正文，`writing-systems-papers` 补充系统论文结构，`zotero` 负责文献与引用，`pdf` 负责页面级阅读和最终视觉检查。以下是仓库中论文写作 skill 的摘要，不替代完整说明。

- **先论证，后润色。** 优先读取作者最新修改；明确问题、比较对象、机制和后果。润色保留原有主语、比较关系、因果方向、强调和有效的主张强度，不擅自恢复作者删掉的细节。
- **结构服务于阅读。** 偏好 Introduction → Preliminaries and Challenges → Method → Experiment → Conclusion，但不覆盖更清晰的作者结构或会议要求。Introduction 先讲贡献的意义，再讲构造；Method 开头用问题、组件和收益说明贡献。Related Work 完整综述与详细证明默认放附录，正文保留必要基线与引用。
- **先建立前提，再提出挑战。** 明确方法类别、训练阶段、目标和更新范围；按“问题 → 原因 → 后果”解释限制。保持术语和数学符号跨节一致，避免用过渡词掩盖缺失的逻辑前提。
- **公式与算法强调可读性。** 每个公式承担明确解释任务，符号就地定义；核心理论结论和假设留在正文，详细推导放附录。伪代码展示输入、计算、决策和状态变化，而非堆积不透明调用或机械减少公式数量。
- **实验围绕主张组织。** 偏好 Setup → Performance → Efficiency，段落用“比较或问题 → 主要结果 → 代表性增益 → 有证据支持的解释”推进。区分外部基线、消融和机制诊断，匹配信息与预算，计入测量和预处理开销；主叙述可以采用方法类别，表格和记录仍保留准确比较对象。
- **严格区分证据状态。** 不把相关性、局部恒等式或正确性检查写成完整方法优势。未测结果默认明确留空；仅在作者明确要求假设成功的草稿时采用完成式与占位符，并在外部证据说明中记录假设。数值模拟须明确授权和标注，不能支撑实证结论。
- **保持稿件同步并检查渲染。** 术语、范围或贡献变化后检查摘要、正文、算法、图注、结论、中文简报和当前交接文档。遵循每个自然段一行 LaTeX、Eq./Fig./Tab. 等作者约定，编译并检查受影响页面；写作任务本身不授权新增训练实验。

按需参考文件（仅加载当前任务需要的指南）：

| 文件 | 何时使用 |
| --- | --- |
| [references/writing-principles.md](research-paper-writing/references/writing-principles.md) | 确定叙述主线、用一句话检验贡献、消除泛化措辞和检查投稿前表达。 |
| [references/idea-and-contribution.md](research-paper-writing/references/idea-and-contribution.md) | 判断整体方法的新意、最强公平替代、精确特例关系与贡献证据类型。 |
| [references/introduction.md](research-paper-writing/references/introduction.md) | 检查问题与干预是否相符、类别级主张是否有支持、Introduction 与正文是否双向对应。 |
| [references/experiment-design.md](research-paper-writing/references/experiment-design.md) | 先定主张、比较与主要指标，再定测量；明确预算和正负结果解释。 |
| [references/paper-review.md](research-paper-writing/references/paper-review.md) | 完整稿件审阅或投稿准备，检查六个维度并记录未解决的证据缺口。 |
| [references/preliminaries.md](research-paper-writing/references/preliminaries.md) | 修改 Preliminary、Background 或 Challenges，检查前提依赖、句间逻辑与公式选择。 |
| [references/experiments.md](research-paper-writing/references/experiments.md) | 修改实验章节，组织性能与效率比较、压缩结果叙述并保留数值含义。 |
| [references/readable_math_and_algorithms.md](research-paper-writing/references/readable_math_and_algorithms.md) | 大幅重组公式或伪代码，参考已检查的论文示例改善记号、计算流程和解释。 |

系统内置 skills 由 Codex 自身管理，不复制到此集合。用户目录中的 `transcribe` 用于音视频转录，属于写作素材整理辅助，本次未新增收录；隐私产品评审与安全威胁建模 skills 不属于本次论文写作同步范围。仓库不保存会话日志、Zotero 文献库、认证文件或机器配置。

## 上游与适配范围

2026-09-28 核对的上游提交为 `c4535ea8ae1e013399a2525dc7d285859f672b62`（上游提交时间：2026-09-28 17:39:52 +08:00）：

- 仓库：[wanshuiyin/Auto-claude-code-research-in-sleep](https://github.com/wanshuiyin/Auto-claude-code-research-in-sleep/tree/c4535ea8ae1e013399a2525dc7d285859f672b62)。
- 写作原则：[skills/skills-codex/shared-references/writing-principles.md](https://github.com/wanshuiyin/Auto-claude-code-research-in-sleep/blob/c4535ea8ae1e013399a2525dc7d285859f672b62/skills/skills-codex/shared-references/writing-principles.md)。
- 系统论文：[skills/skills-codex/writing-systems-papers/SKILL.md](https://github.com/wanshuiyin/Auto-claude-code-research-in-sleep/blob/c4535ea8ae1e013399a2525dc7d285859f672b62/skills/skills-codex/writing-systems-papers/SKILL.md)。

`research-paper-writing` 是本仓库的组合与个人化版本，并非上游同名文件的镜像。此次从更新后的 `../claude/research-paper-writing/` 提取贡献定位、实验设计和 Introduction 检查，结合上游写作原则，按 Codex 现有入口合并；Method 假设与主张规则已由主文件覆盖，保留两个原有公式/Preliminary 参考文件，扩展实验写作并补入六维审阅。

适配时保留作者结构优先、Introduction 先讲贡献意义、每段一行 LaTeX、绝对准确率差的记号，以及明确授权的假设性草稿规则。理论主张按证明审阅，实证主张按测量审阅；新指南不会把实验计划当成运行授权，也不会要求每次润色启动外部审阅循环。

系统论文的页数表是合计 12 页的规划示例，实际投稿年份、赛道和 camera-ready 要求使用时核对官方 CFP。移除旧年份的固定页数断言与未安装的 `paper-plan` / `paper-write` 依赖，补齐 Codex UI 元数据。此目录可独立复制安装，无需安装完整上游流程。

更新仓库文件不会自动更新其他位置的复制安装；需要应用时使用下面的安装入口。

## 安装

```bash
cd My_Skills/codex
./install.sh --dry-run
./install.sh
```

脚本安装本目录下直接包含 `SKILL.md` 的文件夹。默认目标为 `${CODEX_HOME:-$HOME/.codex}/skills`，以匹配本次同步来源机器的现有布局；同名目标会先移到 `<目标目录>.backups/` 下的唯一时间目录，再安装。脚本会打印备份位置；需要恢复时，从该备份取回对应技能文件夹即可。

```bash
./install.sh --link                          # 链接到仓库，仓库编辑立即反映到安装目录
CODEX_SKILLS_DIR=/custom/path ./install.sh   # 自定义目标目录
```

新环境可以使用当前 [OpenAI 官方文档](https://learn.chatgpt.com/docs/build-skills#where-codex-loads-local-skills) 中的用户目录 `~/.agents/skills`，或项目内的 `.agents/skills`：

```bash
CODEX_SKILLS_DIR="$HOME/.agents/skills" ./install.sh
CODEX_SKILLS_DIR=/path/to/project/.agents/skills ./install.sh
```

选择一个安装位置即可。安装后在 Codex 中使用 `$research-paper-writing`、`$writing-systems-papers`、`$pdf` 或 `$zotero`；若尚未显示，重新启动 Codex。

依赖由各技能说明列出：PDF 工作需要相应 Python 包与 Poppler；Zotero helper 仅使用 Python 标准库。安装器只安装技能文件，不安装系统依赖或改动应用配置。

## 后续同步

本目录保存个人版本与注明来源的上游适配。若后续在安装目录修改了技能，把对应完整文件夹同步回这里，再检查差异；使用 `--link` 则可直接在仓库维护。新增技能时放入其文件夹并更新上表，安装器会自动识别。

初始本机来源：`research-paper-writing`、`pdf` 来自 `~/.codex/skills/`，论文技能的后续合并来源见上文；Zotero 来自 `~/.codex/plugins/cache/openai-curated-remote/zotero/0.1.2/skills/zotero/`。
