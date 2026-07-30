// =================================================================
//  Stanford CS229 (Fall 2025) — 每节课学习路线详细规划
//  作者：Sean <stonebreaker365@163.com>
//  配套仓库：Stanford-CS229-fall2025
//  编制日期：2026-07-30
//
//  本文档与 CS229_note.typ 同属仓库根目录，二者关系：
//    CS229_note.typ           => 双栏课堂笔记（含封面、Lec I 起往后的逐节笔记）
//    每节课学习路线详细规划.typ  => 一份"开课前打印贴在桌上"的全局规划
//
//  使用方法：
//    typst compile 每节课学习路线详细规划.typ 每节课学习路线详细规划.pdf
//    或者 typst watch 每节课学习路线详细规划.typ  // 自动重编译
// =================================================================

#set document(
  title: "Stanford CS229 25Fall · 每节课学习路线详细规划",
  author: "Sean",
)

// === 中文友好、稍紧凑的页面设置 ===
#set page(
  paper: "a4",
  margin: (x: 2cm, y: 2.4cm),
  numbering: "1 / 1",
  columns: 1,
  // 页眉：当前 H1（显示当前所在章节）
  header: context {
    let cur-h1 = query(heading.where(level: 1)).filter(h => h.location().page() <= here().page())
    let h1 = if cur-h1.len() > 0 { cur-h1.last() } else { none }
    if h1 != none {
      grid(
        columns: (1fr, auto),
        align: (left, right),
        text(size: 9pt, fill: gray, weight: "bold")[#h1.body],
        text(size: 9pt, fill: gray)[每节课学习路线详细规划],
      )
    }
  },
  // 页脚：右侧显示"第 X 页 / 共 Y 页"
  footer: context {
    let num = counter(page).at(here()).first()
    let total = counter(page).final().first()
    grid(
      columns: (1fr, auto, 1fr),
      align: (left, center, right),
      text(size: 8.5pt, fill: gray)[Stanford CS229 · 25Fall],
      text(size: 8.5pt, fill: gray)[Sean / stonebreaker365\@163.com],
      text(size: 8.5pt, fill: gray)[第 #num 页 / 共 #total 页],
    )
  },
)

// 字体优先级：英文 New Computer Modern / Libertinus Serif（typst 内置）；中文按平台依次回退到 Source Han / Noto CJK / STSong（装了就用，没装也不影响编译，运行时再 fallback 到系统中文）
#set text(
  font: ("New Computer Modern", "Libertinus Serif", "Source Han Serif SC", "STSong"),
  size: 10.5pt,
  lang: "zh",
  region: "cn",
)

#set par(justify: true, leading: 0.72em, first-line-indent: 0em)

// === 标题样式：H1 顶部加蓝色色块，H2~H4 加左侧色条 ===
#show heading.where(level: 1): hd => block(
  width: 100%,
  above: 1.6em,
  below: 1em,
)[
  #set par(justify: false)
  #box(width: 100%, fill: rgb("#1a3a6e"), inset: (x: 12pt, y: 8pt), radius: 3pt)[
    #text(size: 22pt, weight: "bold", fill: white)[#hd.body]
  ]
]

#show heading.where(level: 2): hd => block(
  above: 1.4em,
  below: 0.8em,
)[
  #set par(justify: false)
  #box(width: 100%)[
    #box(width: 6pt, height: 1em, fill: rgb("#2a5a9e"), radius: 2pt)
    #h(0.6em)
    #text(size: 16pt, weight: "bold", fill: rgb("#1a3a6e"))[#hd.body]
  ]
]

#show heading.where(level: 3): set text(size: 13pt, weight: "bold", fill: rgb("#2a5a9e"))

#show heading.where(level: 4): set text(size: 11.5pt, weight: "bold", fill: rgb("#3a3a3a"))

#show link: set text(fill: rgb("#1a5fb4"))

#show raw.where(block: false): box.with(
  fill: rgb("#eef3fb"),
  stroke: (x: 0.5pt + rgb("#cdd9eb")),
  inset: (x: 4pt, y: 1pt),
  outset: (y: 2pt),
  radius: 3pt,
)

// === 表格美化：表头填深蓝，斑马纹，奇偶行底色对比 ===
#set table(
  fill: (_, row) => if row == 0 { rgb("#1a3a6e") } else if calc.odd(row) { rgb("#f5f8fc") } else { rgb("#ffffff") },
  stroke: 0.5pt + rgb("#cdd9eb"),
  inset: 7pt,
  align: (left, left, left),
)

#show table.cell.where(y: 0): set text(weight: "bold", fill: white)

// === "Lec 卡片"：用一个浅色块把整节课都包起来 ===
#let lec-card(body) = block(
  width: 100%,
  fill: rgb("#fbfcfe"),
  stroke: (left: 3pt + rgb("#2a5a9e")),
  inset: (x: 14pt, y: 12pt),
  radius: (right: 3pt),
  above: 1em,
  below: 1em,
)[#body]

// === "阶段徽章"小色块：用于课前/课中/课后三段标题 ===
#let badge(label, color: rgb("#2a5a9e")) = box(
  fill: color,
  inset: (x: 8pt, y: 3pt),
  outset: (y: 2pt),
  radius: 3pt,
  text(size: 9.5pt, weight: "bold", fill: white, label),
)

// === 一些工具函数 / show 规则 ===
// 行内代码块风格（粗体）
#let kbd(s) = box(
  raw(s),
  fill: rgb("#f4f4f4"),
  inset: (x: 4pt, y: 1pt),
  outset: (y: 2pt),
  radius: 3pt,
  stroke: 0.5pt + rgb("#cccccc"),
)

// 文件链接（带 :// 标记 + 文件名）
#let flink(path, label: none) = {
  if label != none {
    link("file:///" + path, text(fill: rgb("#1a5fb4"))[#label])
  } else {
    link("file:///" + path, text(fill: rgb("#1a5fb4"), weight: "bold")[#path])
  }
}

// "外部资料"标签块
#let external(url, label: none) = link(url, if label != none { label } else { url })


// =================================================================
//  首页（封面 + 摘要）
// =================================================================
#align(center)[
  #v(1cm)
  #text(size: 26pt, weight: "bold", fill: rgb("#0a2444"))[
    Stanford CS229 · 25Fall \
    每节课学习路线详细规划
  ]
  #v(0.6cm)
  #text(size: 12pt)[Sean] \
  #text(size: 9.5pt, fill: gray)[#link("mailto:stonebreaker365@163.com")[stonebreaker365\@163.com]]
  #v(1cm)
  #block(
    width: 92%,
    stroke: 1pt + rgb("#1a3a6e"),
    inset: 14pt,
    radius: 4pt,
  )[
    #set align(left)
    #set text(size: 10.5pt)
    *Abstract* ——
    本文以 Stanford CS229 25Fall 官方 syllabus 为骨架，按 Lecture 顺序把仓库里 15 个分类目录的资料重新映射到
    #kbd("课前 / 课中 / 课后") 三段式时间线上。每节课都给出 (a) 课前应该看哪些讲义 / Cheat Sheet、
    (b) 上课时到 #flink("CS229_note.typ", label: "CS229_note.typ") 哪个 § 章节里写笔记、
    (c) 课后要做哪些 Problem Set 子题、(d) 哪些代码可以动手从零实现、(e) 如何把收获整理成博客。
    希望你在学期开始前把它打印出来贴墙上，每完成一节就打一个勾。
  ]
  #v(1.2cm)
  #text(size: 10pt, fill: gray)[
    配套资料参见 #flink("00-README/README.md", label: "00-README/README.md") 顶层的目录结构与学习路径说明。
  ]
]

#pagebreak()

// =================================================================
//  目录
// =================================================================
#align(center)[
  #text(size: 18pt, weight: "bold", fill: rgb("#1a3a6e"))[*目录*]
  #v(0.5em)
]

#outline(
  title: none,
  depth: 2,
  indent: auto,
)

#v(1cm)
#line(length: 100%, stroke: 0.5pt + rgb("#cccccc"))
#pagebreak()

// =================================================================
//  全局总览
// =================================================================
= 全局学习哲学

== 我为什么写这个文档

CS229 25Fall 是 Andrew Ng 2025 年重新录制的版本，节奏比往年更紧凑。仓库里堆了 600+ 文件，
但"哪份资料对应哪节课、什么时候看"这件事光靠搜索是解决不了的——没有规划，再多资料也是
噪音。这份文档就是替你做完这一步映射。

== 三段式时间线

每节课的安排我固定用三段结构：

#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: 0.5pt + rgb("#cccccc"),
  table.header(
    [*阶段*], [*时间建议*],
  ),
  [课前 (60–90 min)], [
    看英文讲义对应章节 + 中文译稿对照；翻 Cheat Sheet 自检预备知识；写预习笔记到 #kbd("CS229_note.typ")
  ],
  [课中 (90 min + TA)], [
    Stanford Lecture 跟听；现场写板书与疑问到 #kbd("CS229_note.typ") § 课中留白处；TA Section 内容同步补到文档末尾
  ],
  [课后 (3–4 h)], [
    复盘讲义 + 公式手推 + 对应 PS 子题 + 选做代码 + 写博客发布；最后在 #kbd("学习进度清单") 打勾
  ],
)

== 笔记 & 博客约定

- #strong[笔记主文件]：#flink("CS229_note.typ")。每节课用 `§ Lec N · <主题>` 作为一级标题，紧跟要点与公式。
- #strong[博客发布节奏]：每 1–2 节整合一篇，或者每章整合一篇。建议平台选 *Hexo / Hugo 个人博客*
  或 *知乎专栏*——CS229 是公开课，发在公开博客对你找工作 + 自我复盘都最划算。
  本文档在"博客选题"小节给每节课列了候选标题与角度。
- #strong[代码实现]：从零实现时到 #flink("08-Code-Implementations/") 对应子目录。最少做到
  `numpy` 跑通 + 画 loss 曲线 + 写一份 5 句话总结。

== 工具链速览

#table(
  columns: (auto, 1fr, 1fr),
  align: (left, left, left),
  stroke: 0.5pt + rgb("#cccccc"),
  table.header(
    [*工具*], [*用途*], [*本仓库对应文件*],
  ),
  [typst], [写双栏笔记 + 写本规划], [CS229_note.typ, 每节课学习路线详细规划.typ],
  [Jupyter], [PS 0–4 推导 + 实验], [#raw(block: false, "09-Problem-Sets/PS*/src/*.ipynb")],
  [NumPy / SciPy], [数值计算], [02-Python-Tutorial/],
  [scikit-learn], [基线对照], [09-Problem-Sets/environment.yml],
  [PyTorch (可选)], [深度学习 + DQN], [08-Code-Implementations/02-DeepLearning/],
  [matplotlib], [所有 loss / 决策边界绘图], [在每个 PS 的 src/output/ 都能找到参考图],
)

== 资料到 Lecture 的总体映射

#table(
  columns: (auto, 1fr),
  align: (left, left),
  stroke: 0.5pt + rgb("#cccccc"),
  table.header(
    [*仓库目录*], [*用在哪些 Lecture*],
  ),
  [01-Math-Foundation], [Lec 0 预备 + Lec 6 学习理论],
  [02-Python-Tutorial], [Lec 0 预备],
  [03-Lecture-Notes (英文 PDF)], [全程对应讲义],
  [04-Chapter-Notes-CN (中文 markdown)], [全程预复习对照],
  [05-Slides (PPT)], [Lec 6 Boosting、Lec 9 深度学习、Lec 9 弱监督 等],
  [06-Topic-Notes (专题 PDF)], [按需配套 SVM / EM / PCA / ICA / GMM / Learning Theory / RL],
  [07-Cheatsheets], [随时翻阅],
  [08-Code-Implementations], [课后从零实现],
  [09-Problem-Sets], [每章对应作业],
  [10-Problem-Sets-Solutions], [卡壳时参考，不要抄],
  [11-Final-Project], [Lec 13 之后选题],
  [12-Review-Materials], [期中考前一周],
  [13-Section-Materials], [TA 课补充：凸优化 / GP / HMM / 评估指标],
  [14-Extras], [SMO 原始论文、ML Critique 等拓展阅读],
)

#pagebreak()

// =================================================================
//  公共模板 / 课时内通用结构说明
// =================================================================
= 统一的"每节课"清单（每节都按这个 7 步走）

#set enum(numbering: "1.")

1. #strong[课前阅读]：英文讲义 § 对应小节 + 中文 markdown 译稿 + Cheat Sheet 对照页
2. #strong[课中笔记]：到 #kbd("CS229_note.typ") § Lec N 的 `=== N. <主题>` 下书写
3. #strong[课后复习]：再翻一次英文 PDF，留意课上跳过的细节；补全笔记里的公式推导
4. #strong[作业推进]：完成对应 Problem Set（PS1–PS4）的子题；先做不卡超过 20 min 的题
5. #strong[代码实战]：去 #kbd("08-Code-Implementations/") 对应子目录，把当节的核心算法从头写一遍
6. #strong[博客整理]：把"今天我懂了什么 / 原来误解了什么 / 还差什么"写成 ~1500 字博客
7. #strong[进度打卡]：在 #kbd("学习进度清单") 一节打 ✅ ，未完成项写原因（卡哪了、要补哪）

#pagebreak()

// =================================================================
//  Lec 0 — 预备周（数学 + Python）
// =================================================================
== Lec 0 · 预备周（数学 + Python 自学）

*目标*：Week 0 官方不算 Lectures，但 Andrew 在第一讲会直接调用向量化、Likelihood、链式求导。
这一周用来把"工具 + 数学"准备好，整周 ~10 小时。

=== 课前 0 天（Week 0 周一）

- 装好 typst / Python 3.10+ / `pip install numpy scipy matplotlib scikit-learn jupyter`
- 在仓库根目录 `git pull`；建好本地工作目录 `Stanford-CS229-fall2025`
- 速读 #flink("00-README/README.md", label: "00-README/README.md")，知道整个学期会用哪 15 个目录

=== Day 1–2：线性代数与概率回顾

#table(
  columns: (auto, 1fr, auto),
  align: (left, left, center),
  stroke: 0.5pt + rgb("#cccccc"),
  table.header([*时段*], [*内容*], [*时间*]),
  [晨], [翻 #flink("01-Math-Foundation/cs229-linalg.pdf", label: "cs229-linalg.pdf") 第 1–5 章（矩阵、特征值、SVD）], [60 min],
  [午], [翻 #flink("01-Math-Foundation/cs229-prob.pdf", label: "cs229-prob.pdf") 第 1–3 章（联合 / 边缘 / 期望）], [60 min],
  [晚], [用 #kbd("numpy") 把常用的矩阵分解与求导公式敲一遍，存到 #kbd("00-My-Notes/math-refresh.ipynb")（自行创建）], [60 min],
)

=== Day 3–4：高斯 / Hoeffding / Loss 函数

- #flink("01-Math-Foundation/gaussians.pdf", label: "gaussians.pdf") + #flink("01-Math-Foundation/more_on_gaussians.pdf", label: "more_on_gaussians.pdf")
- #flink("01-Math-Foundation/hoeffding.pdf", label: "hoeffding.pdf") —— 大致翻，知道"训练误差 = 泛化误差 + O(sqrt(...))" 即可，公式不用背
- #flink("06-Topic-Notes/loss-functions.pdf", label: "06-Topic-Notes/loss-functions.pdf") —— 把 L1 / L2 / Hinge / Cross-Entropy 公式列表抄一份贴墙

=== Day 5–6：Python + NumPy + Jupyter

- #flink("02-Python-Tutorial/Spring_2020_Notebook.ipynb", label: "Spring_2020_Notebook.ipynb") —— 全部跑一遍
- #flink("02-Python-Tutorial/Numpy tutorial.ipynb", label: "Numpy tutorial.ipynb") —— 重点看 broadcasting / axis
- #flink("02-Python-Tutorial/cs229_python_friday.pdf", label: "cs229_python_friday.pdf") —— 通读一遍，知道 OOP 风格怎么写 ML 代码

=== Day 7：学前自检

在 #kbd("07-Cheatsheets/en/super-cheatsheet-machine-learning.pdf") 上随机指 10 个公式，能口述出处。
不能的回去翻。

=== LeC 0 笔记 / 博客

- 笔记不必单开 § ，直接把要点合到 #kbd("CS229_note.typ") 的 § Lec 0·预备 小节（前几页空白处）
- 博客候选：*《一周搞定 CS229 数学 + Python 预备》* —— 把高频公式和最容易踩的坑写出来

#pagebreak()

// =================================================================
//  Lec 1 — 监督学习与线性回归
// =================================================================
== Lec 1 · 监督学习 + 线性回归

*对应讲义*：#flink("03-Lecture-Notes/cs229-notes1.pdf", label: "cs229-notes1.pdf") ｜ 中文 #flink("04-Chapter-Notes-CN/cs229-notes1.md", label: "cs229-notes1.md") ｜ Topic #flink("06-Topic-Notes/Linear Model.pdf", label: "Linear Model.pdf")

=== 课前 1 天（60 min）

1. 把 `cs229-notes1.md` 整个看一遍，重点是"线性回归 + LMS / 正规方程 + LWR（局部加权线性回归）"
2. 对照 Cheat Sheet #flink("07-Cheatsheets/zh/cheatsheet-supervised-learning.pdf", label: "cheatsheet-supervised-learning.pdf") 的 Linear Regression 一页
3. 把自己上一周数学准备时写的 `math-refresh.ipynb` 翻出来回顾梯度 / 矩阵求导符号

=== 课中

- Andrew 的 25Fall Lecture 1 一般是 90 min + 直播答疑
- 在 #kbd("CS229_note.typ") § Lec I 之后追加 `=== 2. Linear Regression` 小节，记录每张 slide 的关键推导
- 注意：Andrew 会现场跑 Python demo，可截图贴到笔记里 + 在自己机器上重跑一遍

=== 课后 1（复盘 + 公式手推）

- 重新打开英文 PDF #flink("03-Lecture-Notes/cs229-notes1.pdf", label: "cs229-notes1.pdf")，把"正规方程 vs 梯度下降"部分公式自己推导一遍
- 重点搞懂：
  - 为什么 $nabla_theta J(theta) = X^T (X theta - y)$
  - 什么时候不可逆 + 怎么处理
  - LWR 的 bandwidth 参数 $tau$ 怎么选

=== 课后 2（作业）

#table(
  columns: (auto, 1fr, auto),
  align: (left, left, center),
  stroke: 0.5pt + rgb("#cccccc"),
  table.header([*作业*], [*对应题*], [*预计时间*]),
  [PS0], [整个 PS0 完整跑一遍（warm-up）], [60 min],
  [PS1 § a], [#flink("09-Problem-Sets/PS1/src/p01b_logreg.py", label: "p01b_logreg.py") 不相关, 跳过], [],
  [PS1 § f], [Linear Regression with multiple variables + 正规方程实现], [90 min],
  [Blog], [看 #flink("10-Problem-Sets-Solutions/PS1/code/src/output/") 跑出来的图，对照自己的实现], [30 min],
)

=== 课后 3（代码实战）

- 进 #flink("08-Code-Implementations/00-SupervisedLearning/01-LinearRegression/", label: "01-LinearRegression/") 把 02 个文件（梯度下降 + 正规方程）从头读，再加一个 LWR 实现
- 自己用 `numpy` 重写一个 `my_linear_regression.py`，包含：
  - 闭式解
  - mini-batch SGD
  - loss 曲线绘制

=== 博客选题

- 题目 1：《从一张图看 Linear Regression 的两种解法》
- 题目 2：《LWR：为什么加权的回归不是回归》

=== 打勾位置

在学完本节后，回头在本文档底部的 #kbd("学习进度清单") 找到 `Lec 1`，打 ✅；若跳过某项写原因。

#pagebreak()

// =================================================================
//  Lec 2 — 分类 / Logistic Regression
// =================================================================
== Lec 2 · Logistic 回归与分类

*对应讲义*：#flink("03-Lecture-Notes/cs229-notes2.pdf", label: "cs229-notes2.pdf") ｜ 中文 #flink("04-Chapter-Notes-CN/cs229-notes2.md", label: "cs229-notes2.md")

=== 课前（45 min）

- 读过 #flink("04-Chapter-Notes-CN/cs229-notes2.md", label: "cs229-notes2.md") 第 1–3 节：伯努利分布、对数似然、Newton 更新
- 看 Cheat Sheet `cheatsheet-supervised-learning.pdf` Logistic 一页
- 把上一节 LWR 留的疑问写出来（如果有的话）

=== 课中

- 跟听 Lecture 2 — Andrew 会用二分类 spam 举例
- 笔记位置：#kbd("CS229_note.typ") § Lec I 末尾追加 `=== 3. Logistic Regression`
- 重点记：odds / logit / sigmoid 三种等价写法；Newton method 的 Hessian

=== 课后（3 h）

1. #flink("09-Problem-Sets/PS1/src/p01b_logreg.py", label: "p01b_logreg.py")：完成 Logistic + 正则化
2. #flink("10-Problem-Sets-Solutions/PS1/", label: "PS1 sol") 看 Newton's method 实现细节
3. 选做：用 `sklearn.linear_model.LogisticRegression` 当 baseline，对比自己的实现测试精度
4. 代码实战：到 #flink("08-Code-Implementations/00-SupervisedLearning/02-Classification/00-LogisticRegression.py", label: "00-LogisticRegression.py")（实际是文件不是目录）走读，再与自己的实现对比

=== 博客选题

- 《Logistic 回归的 5 个等价写法》
- 《Newton method 为什么在 LR 上比 GD 快》

#pagebreak()

// =================================================================
//  Lec 3 — 生成学习算法：GDA + 朴素贝叶斯
// =================================================================
== Lec 3 · 生成学习算法（GDA + 朴素贝叶斯）

*对应讲义*：#flink("03-Lecture-Notes/cs229-notes3.pdf", label: "cs229-notes3.pdf") ｜ 中文 #flink("04-Chapter-Notes-CN/cs229-notes3.md", label: "cs229-notes3.md") ｜ Topic #flink("06-Topic-Notes/Generative Model.pdf", label: "Generative Model.pdf")

=== 课前（45 min）

- 读 `cs229-notes3.md`：判别模型 vs 生成模型；GDA 的推导；朴素贝叶斯条件独立假设
- 翻 #flink("03-Lecture-Notes/cs229-notes1.pdf", label: "cs229-notes1.pdf") 中"高斯判别"那一节作为衔接
- 看 Cheat Sheet 上 Naive Bayes 一页

=== 课中

- 跟听 Lecture 3；Andrew 通常会讲 GDA 与 LR 在数据不满足高斯时的差异
- 笔记：#kbd("CS229_note.typ") 新开 `=== 4. Generative Learning`

=== 课后（3 h）

1. #flink("09-Problem-Sets/PS1/src/p01e_gda.py", label: "p01e_gda.py") 完成 GDA 二分类
2. #flink("09-Problem-Sets/PS1/src/p02cde_posonly.py", label: "p02cde_posonly.py") 完成朴素贝叶斯 spam 分类（很经典）
3. #flink("08-Code-Implementations/00-SupervisedLearning/04-GenerativeLearningAlgorithms/", label: "04-GenerativeLearningAlgorithms/") 看一眼作者实现的 GDA 与 NB 的核心差异
4. 数据探索：用 #flink("08-Code-Implementations/00-SupervisedLearning/04-GenerativeLearningAlgorithms/naive_bayes/data/spam.csv", label: "spam.csv") 自己统计一下单词分布

=== 博客选题

- 《GDA vs LR：什么时候用哪个》
- 《朴素贝叶斯为什么会"朴素"》

#pagebreak()

// =================================================================
//  Lec 4 — 广义线性模型 / 正则化
// =================================================================
== Lec 4 · 广义线性模型 (GLM) + 正则化

*对应讲义*：#flink("03-Lecture-Notes/cs229-notes4.pdf", label: "cs229-notes4.pdf") ｜ 中文 #flink("04-Chapter-Notes-CN/cs229-notes4.md", label: "cs229-notes4.md") ｜ Topic #flink("06-Topic-Notes/Regularization and model selection.pdf", label: "Regularization and model selection.pdf")

=== 课前（45 min）

- 读 `cs229-notes4.md`：指数族分布、充分统计量、GLM 推导的"三步走"
- 看 cheatsheet 里 `softmax` / `poisson` 一页
- 翻 #flink("06-Topic-Notes/Linear Model.pdf", label: "Linear Model.pdf") 重温向量化的好处

=== 课中

- Andrew 现场示例：Softmax = 多分类 Logistic；Poisson 回归
- 笔记：#kbd("CS229_note.typ") 新节 `=== 5. GLM`

=== 课后（3 h）

1. #flink("09-Problem-Sets/PS1/src/p03d_poisson.py", label: "p03d_poisson.py") 完成 Poisson 回归
2. #flink("08-Code-Implementations/00-SupervisedLearning/03-GeneralizedLinearModels/", label: "03-GeneralizedLinearModels/") 里看 Softmax 实现
3. 拓展：用 `scipy.optimize` 实现一个 L2 正则化 Logistic Regression，对照 sklearn 的 `LogisticRegression(penalty='l2')`
4. 思考题：为什么 LR / Softmax / Poisson 都是 GLM？"指数族"假设实际意味着什么？

=== 博客选题

- 《GLM 是怎么把 LR、Softmax、Poisson 串成一个家族的》
- 《L1 vs L2 正则化的几何直观》

#pagebreak()

// =================================================================
//  Lec 5 — 核方法 + SVM
// =================================================================
== Lec 5 · 核方法 + SVM

*对应讲义*：#flink("03-Lecture-Notes/cs229-notes5.pdf", label: "cs229-notes5.pdf") ｜ 中文 #flink("04-Chapter-Notes-CN/cs229-notes5.md", label: "cs229-notes5.md") ｜ Topic #flink("06-Topic-Notes/SVM.pdf", label: "SVM.pdf") ｜ Section #flink("04-Chapter-Notes-CN/cs229-notes-cvxopt.md", label: "cs229-notes-cvxopt.md")

=== 课前（90 min —— 内容多）

1. 读 `cs229-notes5.md`：从 margin/functional geometric margin 推到 KKT、SVM dual
2. 看 #flink("06-Topic-Notes/SVM.pdf", label: "SVM.pdf")：清楚 SVM 的对偶形式 + kernel trick
3. 翻 #flink("04-Chapter-Notes-CN/cs229-notes-cvxopt.md", label: "cs229-notes-cvxopt.md") + #flink("04-Chapter-Notes-CN/cs229-notes-cvxopt2.md", label: "cs229-notes-cvxopt2.md") 的 LP/QP 转换 —— SVM 是二次规划
4. Cheat Sheet `cheatsheet-unsupervised-learning.pdf` 没有 SVM，但 `cheatsheet-supervised-learning.pdf` 末尾有 SVM summary

=== 课中

- Lecture 5 — Andrew 会现场用 `cvxopt` 解 QP
- 笔记：#kbd("CS229_note.typ") 新开 `=== 6. SVM & Kernels`
- 关键把"原问题 → 对偶 → KKT → kernel substitution"四步画图

=== 课后（5 h — 这节是难点）

1. #flink("09-Problem-Sets/PS2/src/p05_percept.py", label: "p05_percept.py") 先做感知机热身
2. #flink("09-Problem-Sets/PS2/src/p06_spam.py", label: "p06_spam.py") 完成 SVM spam classification（完整 pipeline：特征 → SVM → 精度）
3. 阅读 #flink("14-Extras/smo.pdf", label: "smo.pdf") + #flink("14-Extras/smo-paper-platt.pdf", label: "smo-paper-platt.pdf") 了解 SMO 算法的来龙去脉
4. 代码实战：到 #flink("08-Code-Implementations/", label: "08-Code-Implementations/") 找 `svm.py` 走读一遍；尝试自己写一个简化版 SMO 训练 RBF 核 SVM

=== 博客选题

- 《SVM 对偶推导：为什么 max min 能换 min max》
- 《核函数的本质：把低维不可分映射到高维可分》
- 《SMO：把 QP 切成两两更新的小问题》

#pagebreak()

// =================================================================
//  Lec 6 — 学习理论 / 偏差方差 / 模型选择
// =================================================================
== Lec 6 · 学习理论 + 偏差-方差 + 模型选择

*对应讲义*：无独立 notes；Topic #flink("06-Topic-Notes/BiasVarianceAnalysis.pdf", label: "BiasVarianceAnalysis.pdf") + #flink("06-Topic-Notes/LearningTheory.pdf", label: "LearningTheory.pdf") + #flink("06-Topic-Notes/Regularization and model selection.pdf", label: "Regularization and model selection.pdf")

=== 课前（60 min）

1. 看 `LearningTheory.pdf`：PAC 学习、Hoeffding 不等式、VC 维
2. 看 `BiasVarianceAnalysis.pdf`：图形化理解偏差-方差分解；如何用交叉验证选 λ
3. 重新翻 #flink("01-Math-Foundation/hoeffding.pdf", label: "hoeffding.pdf") 复习 Hoeffding

=== 课中

- Lecture 6 — Andrew 会用图形演示 bias-variance tradeoff；用具体例子讲 underfitting / overfitting
- 笔记：#kbd("CS229_note.typ") 新节 `=== 7. Learning Theory`

=== 课后（4 h）

1. #flink("09-Problem-Sets/PS2/src/p01_lr.py", label: "p01_lr.py") 完成 Logistic stability & calibration 子题（用 learning curve 选模型）
2. PS2 中如果有 model selection 子题，做交叉验证并对比特征工程影响
3. 思考：用 lecture 中 bias-variance 的分解公式，自己挑一个 50 样本回归问题验证一遍
4. 复盘：到现在为止 PS1 / PS2 各子题哪里因为"理论没吃透"卡壳，回去看对应讲义

=== 博客选题

- 《Bias-Variance 直观可视化：从多项式拟合的隐藏真相》
- 《为什么我们需要交叉验证而不是 train-test split》

#pagebreak()

// =================================================================
//  Lec 7 — 决策树 + 集成 + Boosting
// =================================================================
== Lec 7 · 决策树 + 集成 + Boosting

*对应讲义*：#flink("03-Lecture-Notes/cs229-notes-dt.pdf", label: "cs229-notes-dt.pdf") + #flink("03-Lecture-Notes/cs229-notes-ensemble.pdf", label: "cs229-notes-ensemble.pdf") ｜ 中文 #flink("04-Chapter-Notes-CN/cs229-notes-dt.md", label: "cs229-notes-dt.md") + #flink("04-Chapter-Notes-CN/cs229-notes-ensemble.md", label: "cs229-notes-ensemble.md") + #flink("04-Chapter-Notes-CN/cs229-boosting.md", label: "cs229-boosting.md") ｜ Slides #flink("05-Slides/boosting.pdf", label: "boosting.pdf")

=== 课前（60 min）

1. `cs229-notes-dt.md`：信息增益 / Gini / 剪枝
2. `cs229-notes-ensemble.md`：Bagging / Random Forest
3. `cs229-boosting.md`：AdaBoost / Gradient Boosting
4. 翻 #flink("05-Slides/boosting.pdf", label: "boosting.pdf") —— 25Fall 这一讲用了大量 figure

=== 课中

- Lecture 7 — Andrew 通常会现场跑 AdaBoost demo 与 GBDT demo
- 笔记：#kbd("CS229_note.typ") 新节 `=== 8. Trees & Boosting`

=== 课后（4 h）

1. #flink("14-Extras/boosting_example.m", label: "boosting_example.m") —— MATLAB 演示 boosting，有空跑一下理解
2. 用 `sklearn.ensemble.GradientBoostingClassifier` 在 PS2 / PS3 的某个数据集（比如 spam）上做 baseline
3. 代码实战：自己手写一个 1D AdaBoost 演示数据点（数据量 = 10），可视化每轮弱分类器
4. 重要思想题：Boosting vs Bagging 的本质差别在哪？

=== 博客选题

- 《AdaBoost 为什么不会再过拟合？》
- 《决策树剪枝：从信息增益到代价复杂度》

#pagebreak()

// =================================================================
//  Lec 8 — 神经网络 / 反向传播
// =================================================================
== Lec 8 · 神经网络 + 反向传播

*对应讲义*：#flink("03-Lecture-Notes/cs229-notes-backprop.pdf", label: "cs229-notes-backprop.pdf") ｜ 中文 #flink("04-Chapter-Notes-CN/cs229-notes-BP.md", label: "cs229-notes-BP.md")

=== 课前（60 min）

1. 读 `cs229-notes-backprop.pdf`：手推符号与链式求导；BP 是 ∂L/∂w = ∂L/∂a · ∂a/∂z · ∂z/∂w
2. 翻 #flink("02-Python-Tutorial/just_works.py", label: "just_works.py") —— Stanford 官方 Python 风格示例；以及 #flink("02-Python-Tutorial/proper_start.py", label: "proper_start.py") / #flink("02-Python-Tutorial/class_example.py", label: "class_example.py") 了解 OOP 写法
3. Cheat Sheet 上没有专门的 NN 页，但可用 super-cheatsheet 右下角做参考

=== 课中

- Lecture 8 — Andrew 通常会手推 BP 在矩阵形式下的计算图
- 笔记：#kbd("CS229_note.typ") 新节 `=== 9. NN & Backprop`
- 重点：把矩阵 BP 公式按"前向 → 反向"两栏并排写出

=== 课后（5 h）

1. #flink("09-Problem-Sets/PS3/src/p01_nn.py", label: "p01_nn.py") —— 用 numpy 写完整神经网络（不加任何 DL 库），跑通 digit classification
2. 看 #flink("10-Problem-Sets-Solutions/PS3/", label: "PS3 sol") 里的实现细节（feature scaling / minibatch / momentum）
3. 代码实战：到 #flink("08-Code-Implementations/02-DeepLearning/00-NeuralNetworks/", label: "00-NeuralNetworks/") 对照
4. 思考：用 `matplotlib` 画出 loss 曲线，调节 hidden size / learning rate / epochs 观察 bias-variance

=== 博客选题

- 《反向传播：4 行矩阵公式背后的链式求导》
- 《从 numpy 神经网络看 gradient flow》

#pagebreak()

// =================================================================
//  Lec 9 — 深度学习实践 + CNN + DL Friday
// =================================================================
== Lec 9 · 深度学习实践 + CNN

*对应讲义*：#flink("03-Lecture-Notes/cs229-notes-deep_learning.pdf", label: "cs229-notes-deep_learning.pdf") ｜ 中文 #flink("04-Chapter-Notes-CN/cs229-notes-deep_learning.md", label: "cs229-notes-deep_learning.md") ｜ Slides #flink("05-Slides/deep_learning.pdf", label: "deep_learning.pdf")

=== 课前（60 min）

1. 读 `cs229-notes-deep_learning.md`：mini-batch SGD / momentum / RMSProp / Adam
2. 翻 #flink("05-Slides/deep_learning.pdf", label: "deep_learning.pdf") 看实际超参配方
3. 周五的 DL Friday Slide #flink("02-Python-Tutorial/cs229_deep_learning_friday.pptx", label: "cs229_deep_learning_friday.pptx") —— 25Fall 是 Andrew 现场带大家写 CNN

=== 课中

- Lecture 9 + DL Friday afternoon
- 笔记：#kbd("CS229_note.typ") 新节 `=== 10. Deep Learning Practice`

=== 课后（5 h）

1. 完成 PS3 NN 训练（接 Lec 8）
2. #flink("08-Code-Implementations/02-DeepLearning/01-ConvolutionalNeuralNetworks/", label: "01-CNN/") 用 numpy 写 1 个卷积层 + 1 个池化层
3. 选做：到 #flink("08-Code-Implementations/05-Mnist/", label: "05-Mnist/") 跑 99.76% 的 CNN baseline
4. 进阶：用 PyTorch 重写 PS3 NN；对比 numpy 与 PyTorch 实现的可读性、速度

=== 博客选题

- 《优化器谱：SGD → Momentum → Adam》
- 《为什么 CNN 用卷积而不是全连接？参数量的真相》

#pagebreak()

// =================================================================
//  Lec 10 — 无监督：K-means + PCA
// =================================================================
== Lec 10 · 无监督 K-means + PCA + ICA

*对应讲义*：#flink("03-Lecture-Notes/cs229-notes7a.pdf", label: "cs229-notes7a.pdf") + #flink("03-Lecture-Notes/cs229-notes8.pdf", label: "cs229-notes8.pdf") ｜ 中文 #flink("04-Chapter-Notes-CN/cs229-notes7a.md", label: "cs229-notes7a.md") + #flink("04-Chapter-Notes-CN/cs229-notes8.md", label: "cs229-notes8.md") ｜ Topic #flink("06-Topic-Notes/K-means.pdf", label: "K-means.pdf") + #flink("06-Topic-Notes/PCA.pdf", label: "PCA.pdf") + #flink("06-Topic-Notes/ICA.pdf", label: "ICA.pdf")

=== 课前（60 min）

1. `cs229-notes7a.md`：K-means 算法、随机初始化、k 值选择（elbow）
2. `cs229-notes8.md`：PCA 推导（方差最大化 / 重建误差最小化），ICA 公式
3. Cheat Sheet `cheatsheet-unsupervised-learning.pdf`

=== 课中

- Lecture 10
- 笔记：#kbd("CS229_note.typ") 新节 `=== 11. Unsupervised · Kmeans & PCA`

=== 课后（4 h）

1. #flink("09-Problem-Sets/PS3/src/", label: "PS3/src/") 完整目录里目前只有 #flink("09-Problem-Sets/PS3/src/p01_nn.py", label: "p01_nn.py") 与 #flink("09-Problem-Sets/PS3/src/p03_gmm.py", label: "p03_gmm.py")；K-means 没有现成题目，建议用 #flink("10-Problem-Sets-Solutions/PS3/", label: "PS3 sol") 里作者代码反推 #kbd("numpy K-means") 实现，跑图像压缩 demo
2. #flink("09-Problem-Sets/PS4/src/p04_ica.py", label: "p04_ica.py") 完成 ICA on 图像分离
3. 代码实战：自己动手用 numpy 实现 PCA + K-means（仓库 #flink("08-Code-Implementations/01-UnsupervisedLearning/", label: "01-UnsupervisedLearning/") 当前以 GAN/CGAN 为主，PCA/K-means 需要你补一个空文件；这个"自己填一个空缺子目录"本身就是一种深度学习）

=== 博客选题

- 《PCA 等价性的 4 个视图》
- 《K-means 一定会收敛吗？会收到最优解吗？》

#pagebreak()

// =================================================================
//  Lec 11 — 高斯混合 + EM 算法
// =================================================================
== Lec 11 · 高斯混合模型 (GMM) + EM 算法

*对应讲义*：#flink("03-Lecture-Notes/cs229-notes7b.pdf", label: "cs229-notes7b.pdf") + #flink("03-Lecture-Notes/cs229-notes9.pdf", label: "cs229-notes9.pdf") ｜ 中文 #flink("04-Chapter-Notes-CN/cs229-notes7b.md", label: "cs229-notes7b.md") + #flink("04-Chapter-Notes-CN/cs229-notes9.md", label: "cs229-notes9.md") ｜ Topic #flink("06-Topic-Notes/EM.pdf", label: "EM.pdf") + #flink("06-Topic-Notes/Mixtures of Gaussians.pdf", label: "Mixtures of Gaussians.pdf") + #flink("06-Topic-Notes/Factor analysis.pdf", label: "Factor analysis.pdf")

=== 课前（60 min）

1. `cs229-notes7b.md`：混合分布、潜变量
2. `cs229-notes9.md`：EM 算法 + Jensen 不等式推导
3. `Mixtures of Gaussians.pdf` —— GMM 完整推导

=== 课中

- Lecture 11
- 笔记：#kbd("CS229_note.typ") 新节 `=== 12. EM & GMM`

=== 课后（4 h）

1. #flink("09-Problem-Sets/PS3/src/p03_gmm.py", label: "p03_gmm.py") 完成 GMM 拟合
2. 阅读 `Factor analysis.pdf` 知道 EM 如何扩展到 FA
3. 代码实战：手写一个 1D GMM 的 EM 迭代动画（用 matplotlib）

=== 博客选题

- 《EM 算法的"鸡生蛋"问题怎么破》
- 《GMM 与 K-means 的关系：隐变量视角》

#pagebreak()

// =================================================================
//  Lec 12 — 强化学习入门
// =================================================================
== Lec 12 · 强化学习入门

*对应讲义*：#flink("03-Lecture-Notes/cs229-notes10.pdf", label: "cs229-notes10.pdf") + Topic #flink("06-Topic-Notes/reinforce_learning.pdf", label: "reinforce_learning.pdf")

=== 课前（45 min）

1. `cs229-notes10.pdf`：MDP、policy、value function、Bellman 方程
2. `reinforce_learning.pdf`：RL 三种基本方法（policy iteration / value iteration / policy gradient）

=== 课中

- Lecture 12
- 笔记：#kbd("CS229_note.typ") 新节 `=== 13. RL · MDP`

=== 课后（4 h）

1. 在 Python 上用 10 行代码实现 Value Iteration on Gridworld
2. 复盘到目前 BN + EM 的思路：RL 的 value iteration 是不是另一种"EM"？

=== 博客选题

- 《强化学习的"目标函数"为什么这么难设计》
- 《Value Iteration 是动态规划在 Bellman 上的应用》

#pagebreak()

// =================================================================
//  Lec 13 — 强化学习实践：DQN + Policy Gradient
// =================================================================
== Lec 13 · 强化学习实践（DQN / Policy Gradient）

*对应讲义*：#flink("03-Lecture-Notes/cs229-notes11.pdf", label: "cs229-notes11.pdf")

=== 课前（45 min）

1. `cs229-notes11.pdf`：DQN 经验回放、target network、ε-greedy；Policy Gradient 定理
2. (无中文 markdown 对应，建议直接用英文 + TA Section 笔记)

=== 课中

- Lecture 13 —— Andrew 通常会现场跑 Cartpole demo
- 笔记：#kbd("CS229_note.typ") 新节 `=== 14. RL Deep`

=== 课后（5 h）

1. #flink("09-Problem-Sets/PS4/src/p06_cartpole.py", label: "p06_cartpole.py") 完成 DQN Cartpole（25Fall 升级版）
2. 选做：用 PyTorch 写自己的 DQN 解决 LunarLander
3. 训练可视化：画出 episode reward 曲线，对比 ε 衰减策略

=== 博客选题

- 《DQN 经验回放为什么能打破相关性》
- 《Policy Gradient 和 REINFORCE 一锅炖》

#pagebreak()

// =================================================================
//  Lec 14 — 序列模型：HMM
// =================================================================
== Lec 14 · 序列模型 HMM

*对应讲义*：#flink("13-Section-Materials/cs229-hmm.pdf", label: "cs229-hmm.pdf") ｜ 中文 #flink("04-Chapter-Notes-CN/cs229-notes-hmm.md", label: "cs229-notes-hmm.md")

=== 课前（60 min）

1. `cs229-hmm.pdf`：HMM 三问 (likelihood / decoding / learning) + Baum-Welch (即 HMM 上的 EM)
2. `cs229-notes-hmm.md` 中文对照

=== 课中

- Lecture 14 —— 25Fall 往往把 HMM 放在 NLP / 序列模型背景讲
- 笔记：#kbd("CS229_note.typ") 新节 `=== 15. HMM`

=== 课后（3 h）

1. 用 Python 实现一个 toy HMM（硬币投掷、3 个状态），跑 forward / Viterbi / Baum-Welch
2. 拓展思考：HMM 与 RNN / Transformer 在建模序列上的本质区别

=== 博客选题

- 《Baum-Welch：把 EM 套到 HMM 上》
- 《HMM 与语言模型：从 n-gram 到 RNN》

#pagebreak()

// =================================================================
//  Lec 15（可选）— Gaussian Process 进阶
// =================================================================
== Lec 15 · Gaussian Process 进阶（选修）

*对应讲义*：#flink("13-Section-Materials/cs229-gaussian_processes.pdf", label: "cs229-gaussian_processes.pdf") ｜ 中文 #flink("04-Chapter-Notes-CN/cs229-gaussian_processes.md", label: "cs229-gaussian_processes.md")

=== 课前 + 课后安排

- 自学节奏：一周 ~6 h
- 笔记位置：#kbd("CS229_note.typ") § Lec 16（可选）
- 代码：`scikit-learn.gaussian_process` —— 在 UCI 一个小回归数据集上调参
- 博客选题：《GP regression 的后验为什么是高斯》

#pagebreak()

// =================================================================
//  Final Project 阶段
// =================================================================
== Final Project · 期末项目阶段（Week 11–14）

*资料来源*：#flink("11-Final-Project/", label: "11-Final-Project/poster/ & /report/") —— 118 个 2018 秋季参考项目

=== Week 11：选题

- 扫一眼 118 个 poster，按方向分类：CV / NLP / RL / Theory / Healthcare / 其他
- 评估自己的：兴趣 + 数据可得性 + 时间预算（学期结束前要交 1 个 demo）
- 选题大致 3 个，征求学长 / Stack Overflow 评分

=== Week 12：提方案

- 写 1 页 project proposal：问题定义、数据来源、baseline、最终 metric
- 公开 proposal 在个人博客上 —— 同时增加 visibility
- Andrew 经常会在 syllabus 里鼓励把 proposal 发到 course forum / Slack

=== Week 13：编码 + 进度博客

- 中期 blog：把"数据 → baseline → 初步结果"写成 1500 字博客
- 检查仓库目录：用 `08-Code-Implementations/` 当 baseline 起点

=== Week 14：终稿

- Final poster + final report
- 用 #flink("11-Final-Project/poster-guidelines.pdf", label: "poster-guidelines.pdf") 检查格式
- 终稿博客：完整复盘

#pagebreak()

// =================================================================
//  期中复习阶段
// =================================================================
== Midterm 复习阶段（第 8 周左右）

*资料*：#flink("12-Review-Materials/midterm-review.pdf", label: "midterm-review.pdf") + #flink("12-Review-Materials/cs229-mt-review.pdf", label: "cs229-mt-review.pdf") + #flink("13-Section-Materials/mid_review_sp2020_annotated.pdf", label: "mid_review_sp2020_annotated.pdf")

=== 5 天复习安排

#table(
  columns: (auto, 1fr, auto),
  align: (left, left, center),
  stroke: 0.5pt + rgb("#cccccc"),
  table.header([*天数*], [*任务*], [*时间*]),
  [Day 1], [过一遍 notes1–6 重点公式手推（重点：Linear / LR / GDA / GLM / SVM / Bias-Variance）], [3 h],
  [Day 2], [集中刷 `cs229-mt-review.pdf` 全部题，对答案], [4 h],
  [Day 3], [重做自己 PS1–PS2 卡过的子题], [3 h],
  [Day 4], [`super-cheatsheet-machine-learning.pdf` 公式全表盲背], [2 h],
  [Day 5], [模拟卷 + 整理错题清单到博客], [3 h],
)

#pagebreak()

// =================================================================
//  学习节奏建议（time budget）
// =================================================================
= 全学期学习节奏建议

#table(
  columns: (auto, 1fr, auto, auto),
  align: (left, left, center, center),
  stroke: 0.5pt + rgb("#cccccc"),
  table.header(
    [*Week*], [*主题*], [*总时间*], [*博客篇数累计*],
  ),
  [0], [数学 + Python 预备], [10 h], [0],
  [1], [Lec 1 线性回归], [10 h], [1],
  [2], [Lec 2 分类 + PS1], [12 h], [1],
  [3], [Lec 3 生成模型 + PS1], [11 h], [2],
  [4], [Lec 4 GLM + Lec 5 SVM], [16 h], [3],
  [5], [Lec 5 SVM + PS2], [14 h], [3],
  [6], [Lec 6 学习理论 + 期中], [12 h], [4],
  [7], [Lec 7 决策树 + Boosting], [10 h], [5],
  [8], [Lec 8 NN + 反向传播 + PS3], [16 h], [6],
  [9], [Lec 9 深度学习 + CNN], [12 h], [7],
  [10], [Lec 10 K-means + PCA + PS3], [12 h], [8],
  [11], [Lec 11 EM + GMM + Final 选题], [14 h], [9],
  [12], [Lec 12 RL + Final 提案], [12 h], [10],
  [13], [Lec 13 DQN + PS4], [12 h], [11],
  [14], [Lec 14 HMM + Final 编码], [12 h], [12],
)

期望总投入：约 #strong[180 小时]，覆盖 12 篇博客产出 + 14 次课堂笔记 + 4 个完整 PS。

#pagebreak()

// =================================================================
//  资料快捷索引（一份给懒人）
// =================================================================
= 资料 → 课时速查表（懒人版）

#table(
  columns: (auto, 1fr, 1fr),
  align: (left, left, left),
  stroke: 0.5pt + rgb("#cccccc"),
  table.header([*议题*], [*必看*], [*选看*], ),
  [向量 / 矩阵], [01-Math-Foundation/cs229-linalg.pdf], [—],
  [概率 / 期望], [01-Math-Foundation/cs229-prob.pdf], [—],
  [Hoeffding / 高斯], [01-Math-Foundation/hoeffding.pdf], [gaussians.pdf],
  [监督学习总览], [07-Cheatsheets/zh/cheatsheet-supervised-learning.pdf], [—],
  [无监督学习总览], [07-Cheatsheets/zh/cheatsheet-unsupervised-learning.pdf], [—],
  [SVM 推导], [06-Topic-Notes/SVM.pdf], [04-Chapter-Notes-CN/cs229-notes-cvxopt.md],
  [SMO 算法], [14-Extras/smo.pdf], [smo-paper-platt.pdf],
  [Boosting], [05-Slides/boosting.pdf], [14-Extras/boosting_example.m],
  [DL / CNN], [05-Slides/deep_learning.pdf], [02-Python-Tutorial/cs229_deep_learning_friday.pptx],
  [EM / GMM], [06-Topic-Notes/Mixtures of Gaussians.pdf], [06-Topic-Notes/EM.pdf],
  [PCA / ICA / Factor], [06-Topic-Notes/PCA.pdf / ICA.pdf / Factor analysis.pdf], [—],
  [RL], [06-Topic-Notes/reinforce_learning.pdf], [—],
  [GP / HMM], [13-Section-Materials/cs229-gaussian_processes.pdf / cs229-hmm.pdf], [—],
  [评估指标], [13-Section-Materials/evaluation_metrics_spring2020.pdf], [—],
)

#pagebreak()

// =================================================================
//  学习进度清单（每节打勾）
// =================================================================
= 学习进度清单

#table(
  columns: (auto, 1fr, auto, 1fr),
  align: (left, left, center, left),
  stroke: 0.5pt + rgb("#cccccc"),
  table.header(
    [*节次*], [*主题*], [*状态*], [*备注 / 跳过的子项*],
  ),
  [Lec 0], [数学 + Python 预备], [⬜], [],
  [Lec 1], [监督学习 / 线性回归], [⬜], [],
  [Lec 2], [Logistic 回归], [⬜], [],
  [Lec 3], [GDA + 朴素贝叶斯], [⬜], [],
  [Lec 4], [GLM + 正则化], [⬜], [],
  [Lec 5], [SVM + 核方法], [⬜], [],
  [Lec 6], [学习理论 / 偏差方差], [⬜], [],
  [Lec 7], [决策树 / Boosting], [⬜], [],
  [Lec 8], [NN + 反向传播], [⬜], [],
  [Lec 9], [深度学习 + CNN], [⬜], [],
  [Lec 10], [K-means + PCA], [⬜], [],
  [Lec 11], [GMM + EM], [⬜], [],
  [Lec 12], [RL 入门], [⬜], [],
  [Lec 13], [DQN + Policy Gradient], [⬜], [],
  [Lec 14], [HMM], [⬜], [],
  [Lec 15], [Gaussian Process (选修)], [⬜], [],
  [Final], [期末项目], [⬜], [],
)

#v(0.5cm)
#text(size: 9.5pt, fill: gray)[
  提示：完成一节后，把上面对应 ⬜ 改为 ✅；跳过的子项在右栏写原因（如：作业跳过 P02c、代码实战未做 RBF-SVM 等）。
  本节末是一个动态区域，建议每周末回顾一次。
]

#pagebreak()

// =================================================================
//  博客选题清单（与课表一一对应）
// =================================================================
= 博客选题清单

每节课至少一篇博客，建议发布到 *Hexo / Hugo / 知乎专栏 / CSDN* 等平台。下面是一份候选清单，
发布后把链接填到右栏。

#table(
  columns: (auto, 2fr, 1fr),
  align: (left, left, left),
  stroke: 0.5pt + rgb("#cccccc"),
  table.header([*节次*], [*候选标题*], [*发布链接*],
  ),
  [Lec 0], [《一周搞定 CS229 数学 + Python 预备》], [—],
  [Lec 1], [《一张图看懂 Linear Regression 两种解法》], [—],
  [Lec 2], [《Logistic 回归的 5 个等价写法》], [—],
  [Lec 3], [《GDA vs LR：什么时候用哪个》], [—],
  [Lec 4], [《GLM 是怎么把 LR、Softmax、Poisson 串成一个家族的》], [—],
  [Lec 5], [《SVM 对偶推导：为什么 max min 能换 min max》], [—],
  [Lec 6], [《Bias-Variance 直观可视化》], [—],
  [Lec 7], [《AdaBoost 为什么不会再过拟合？》], [—],
  [Lec 8], [《反向传播：4 行矩阵公式背后》], [—],
  [Lec 9], [《优化器谱：SGD → Momentum → Adam》], [—],
  [Lec 10], [《PCA 等价性的 4 个视图》], [—],
  [Lec 11], [《EM 算法的"鸡生蛋"问题怎么破》], [—],
  [Lec 12], [《强化学习的"目标函数"为什么这么难设计》], [—],
  [Lec 13], [《DQN 经验回放为什么能打破相关性》], [—],
  [Lec 14], [《Baum-Welch：把 EM 套到 HMM 上》], [—],
  [Final], [《我的 CS229 期末项目复盘》], [—],
)

#pagebreak()

// =================================================================
//  收尾：可调整建议
// =================================================================
= 收尾：自检 / 调整建议

每一周结束时，问自己以下 5 个问题：

+ 笔记是否同步到了 #flink("CS229_note.typ") 对应小节？
+ 博客是否按时发布？
+ 作业是否独立完成？（不卡的子题控制在 20 min 内卡的即可放弃看答案）
+ 代码实战是否在 #flink("08-Code-Implementations/", label: "08-Code-Implementations/") 对应子目录下从零写过一遍？
+ 当周是否有任何资料被反复用、可以放到 Cheat Sheet 一起打印？

#v(0.5cm)
#text(size: 10pt, fill: rgb("#333333"))[
  #strong[文档维护建议]：
  - 课程开始后，把表里的 ⬜ 改为 ✅；
  - 真有意外跳过某节时，在备注栏写明跳过原因 + 后续补学计划；
  - 当本文档出现大量过时的"预备节"，学期过半时重新归档。
]

#v(1cm)
#align(center)[
  #text(size: 9pt, fill: gray)[
    本文结束。祝学习顺利。 \
    —— Sean · 2026-07-30 · Stanford CS229 Fall 2025
  ]
]
