# 临床医学研究中的因果推断 · Quarto 双语电子书

本仓库用 [Quarto](https://quarto.org) 构建本书的中文版与英文版，免费在线发布。

## 目录结构

```
Causal inference---完善后出版/
├── Causal Inference/          # 中文 Quarto 项目（你在 RStudio 里打开它）
│   ├── _quarto.yml            #   中文书配置，输出到 ../docs/zh
│   ├── index.qmd              #   前言
│   ├── chapters/              #   第 1–21 章（c01…c21.qmd）
│   ├── references.qmd / .bib
│   └── cover.png
├── Causal Inference-EN/       # 英文 Quarto 项目，输出到 ../docs/en
│   ├── _quarto.yml
│   ├── index.qmd / chapters/ / references.qmd
├── data/                      # 14 个配套数据集（章节代码用 ../data/ 读取）
├── docs/                      # 发布目录（GitHub Pages 指向这里）
│   ├── index.html             #   语言选择落地页
│   ├── zh/  (渲染后生成)
│   └── en/  (渲染后生成)
├── LICENSE                    # CC BY 4.0（正文）/ MIT（代码）
└── 乔Book/                     # 原始 Word 书稿（迁移内容的来源）
```

> 为什么分成两个项目？因为本地网盘目录不允许删除文件，且两个独立项目能让 GitHub Pages 下中英文各自拥有干净的 `index.html`，互不干扰。`Causal Inference/` 是你原先在 RStudio 新建的项目，已改造为中文版；英文版放在并列的 `Causal Inference-EN/`。

## 本地渲染与预览

需先安装 Quarto（RStudio 已内置）。中文 PDF 需要 XeLaTeX + ctex；只发布网页可忽略 PDF。

中文版（在 RStudio 打开 `Causal Inference/` 后点 **Render**，或命令行）：

```bash
quarto preview "Causal Inference"      # 实时预览
quarto render  "Causal Inference"      # 生成到 docs/zh/
```

英文版：

```bash
quarto render "Causal Inference-EN"    # 生成到 docs/en/
```

两个都渲染后，用浏览器打开 `docs/index.html` 即可看到语言选择页。

## 填写内容（从 Word 书稿迁移）

每章 `chapters/cXX-*.qmd` 已建好标题与各节小标题，按下述方式把 `乔Book/` 里的正文搬进来：

- 公式：行内 `$Y^{a=1}$`，独立公式 `$$\\;\\bar Y = E[Y]\\;$$`
- 图片：放到 `chapters/images/`，用 `![标题](images/figX.png)`
- 代码：用可执行代码块，例如
  ````
  ```{r}
  bmt <- read.csv("../data/BMT.csv")
  summary(bmt)
  ```
  ````
- 参考文献：把条目加到 `references.bib`，正文用 `[@hernan2020whatif]` 引用

> 提示：第 1–3 章已有"修订稿"Word 文件（`乔Book/第X章…（修订稿）.docx`），可优先迁移这几章。

## 发布到 GitHub Pages（免费）

1. 在 GitHub 新建仓库，把本目录推送上去（建议 `.gitignore` 忽略 `*/.quarto/`、`*/_book/`，但**保留 `docs/`**）。
2. 仓库 **Settings → Pages → Build and deployment**：Source 选 *Deploy from a branch*，Branch 选 `main`，文件夹选 `/docs`。
3. 每次更新：本地 `quarto render` 两个项目 → 提交 `docs/` → 推送。几分钟后网站更新。
   - 站点首页：`https://<用户名>.github.io/<仓库>/`
   - 中文：`…/zh/`　英文：`…/en/`
4. 进阶：可用 GitHub Actions 自动渲染（`quarto-dev/quarto-actions`），免去本地手动渲染。

中国大陆访问 GitHub Pages 可能不稳定，可另在 Gitee 等做一个中文版镜像（上线前请核实其当前政策）。

## 引用与长期存档（Zenodo）

发布后建议把一份带版本号的 PDF/发行包上传 [Zenodo](https://zenodo.org)（CERN 运营，永久免费），获取 DOI 以便规范引用，并可与 GitHub 仓库自动关联（每次 Release 自动归档新版本）。拿到 DOI 后填回各版本 `index.qmd` 的"引用方式"处。

## 许可

正文 CC BY 4.0，代码 MIT，详见 `LICENSE`。

> 注意：若你同时与出版社签订了（资助）出版合同，免费在线发布可能受合同的独家授权条款限制，请先与出版社确认线上公开发行的权利。
