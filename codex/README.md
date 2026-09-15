# Codex Skills

从本机当前安装版本整理的个人技能集合。2026-09-15 首次收录，依据 9 月实际读取技能的调用记录筛选，并核对本地文件修改时间。

## 收录技能

| Skill | 用途 | 本次收录依据与版本 |
| --- | --- | --- |
| [research-paper-writing](research-paper-writing/SKILL.md) | 论文提纲、中文简报与 LaTeX 写作；五节结构、Introduction 论证推进、贡献与实验证据对应。 | 9 月频繁使用；本机 `SKILL.md` 最近修改于 **2026-09-15 17:02（Asia/Shanghai）**，按当前内容完整保存。 |
| [pdf](pdf/SKILL.md) | PDF 读取、生成、页面渲染与版面检查。 | 9 月多次用于论文工作；保存本机已安装版本，文件修改于 2026-06-12。 |
| [zotero](zotero/SKILL.md) | 本地 Zotero 检索、BibTeX 导出、引用插入与文献导入。 | 2026-09-14 有实际使用记录；来源为本机 Zotero 插件 **0.1.2**，转为独立 skill。 |

`research-paper-writing` 与 `pdf` 保持来源文件内容不变，配套元数据、资源和已有许可证一并保存。Codex 论文写作版与 `../claude/research-paper-writing/` 分别维护。

Zotero 保留原脚本和接口说明，仅将技能名规范为 `zotero`、同步默认调用提示，并把插件路径改为相对于 `SKILL.md` 的路径。它依赖本机 Zotero Desktop，通过本地 API/Connector 工作，不需要另装 Codex Zotero 插件。若已经通过插件加载同一技能，选择一种加载方式即可。

系统内置 skills 由 Codex 自身管理；其他已安装但在本次检查中未发现 9 月使用记录的 skills 暂未收录。仓库不保存会话日志、Zotero 文献库、认证文件或机器配置。

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

选择一个安装位置即可。安装后在 Codex 中使用 `$research-paper-writing`、`$pdf` 或 `$zotero`；若尚未显示，重新启动 Codex。

依赖由各技能说明列出：PDF 工作需要相应 Python 包与 Poppler；Zotero helper 仅使用 Python 标准库。安装器只安装技能文件，不安装系统依赖或改动应用配置。

## 后续同步

本目录保存的是本地版本的快照。若后续在安装目录修改了技能，把对应完整文件夹同步回这里，再检查差异；使用 `--link` 则可直接在仓库维护。新增技能时放入其文件夹并更新上表，安装器会自动识别。

来源：`research-paper-writing`、`pdf` 来自 `~/.codex/skills/`；Zotero 来自 `~/.codex/plugins/cache/openai-curated-remote/zotero/0.1.2/skills/zotero/`。
