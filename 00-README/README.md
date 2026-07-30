# Stanford CS229 机器学习 · 自学资源合集

> 配套课程：**Stanford CS229 Machine Learning (Fall 2025)** — Andrew Ng 主讲  
> 视频地址：<https://cs229.stanford.edu/index.html-fall25>  
> 本目录汇总了课程相关的讲义、笔记、作业、参考答案、代码实现、复习资料等，按学习顺序系统整理。

---

## 📂 目录结构

| # | 目录 | 内容简介 | 主要来源 |
| --- | --- | --- | --- |
| 00 | `00-README/` | 本说明 + 各仓库原始 README 参考 | — |
| 01 | `01-Math-Foundation/` | 线性代数 / 概率 / 高斯 / Hoeffding / Loss 函数基础 | Stanford 官方 |
| 02 | `02-Python-Tutorial/` | NumPy / Jupyter / class / OOP 教程 + Python Section 笔记 | Stanford 官方 |
| 03 | `03-Lecture-Notes/` | 官方讲义 cs229-notes1～13 + 反向传播 / 深度学习 / 决策树 / 集成 | Stanford 官方 |
| 04 | `04-Chapter-Notes-CN/` | 与 03 对应的中文讲义 markdown 共 28 篇（notes1～13 + 14 篇专题译稿），配图已本地化到 `img/`，可离线阅读 | cycleuser (社区) |
| 05 | `05-Slides/` | 官方 PPT：Boosting / 深度学习 / 弱监督 / ML Critique | Stanford 官方 |
| 06 | `06-Topic-Notes/` | 专题讲义：SVM / EM / PCA / ICA / Factor Analysis / GMM / K-means / Learning Theory / RL 等 19 篇 | Stanford 官方 |
| 07 | `07-Cheatsheets/` | 中英 cheat sheet + 算法可视化 GIF/JPG | afshinea + Sierkinhane |
| 08 | `08-Code-Implementations/` | 从零实现：线性回归 / 逻辑回归 / GDA / 朴素贝叶斯 / Softmax / NN / CNN / GAN / MNIST | Sierkinhane (社区) |
| 09 | `09-Problem-Sets/` | PS0～PS4（题面 PDF + Jupyter 题解骨架 + Python 模板 + 数据） | Stanford 官方 |
| 10 | `10-Problem-Sets-Solutions/` | PS0～PS4 官方参考答案 PDF + 完整代码 + 输出文件 | Stanford 官方 |
| 11 | `11-Final-Project/` | 2018 秋季 118 个 Final Project 海报+报告 PDF，可借鉴选题 | Stanford 官方 |
| 12 | `12-Review-Materials/` | 期中 / 总复习资料 | Stanford 官方 |
| 13 | `13-Section-Materials/` | TA Session 资料：凸优化 / Gaussian Process / HMM / Prob Slide / 误差分析 / 模型评估 等 | Stanford 官方 |
| 14 | `14-Extras/` | SMO 原始论文、ML Critique、原版 syllabus、Boosting 示例代码 | Stanford 官方 |

---

## 🚀 推荐学习路径（对应 CS229 2025 Fall）

下表把每个目录里的内容映射到 Stanford 的讲次（基于官方 syllabus 的传统顺序，2025 Fall 由 Andrew Ng 重新录制）。

| 周次 | 主题 | 必看材料 | 配套练习 |
| --- | --- | --- | --- |
| 0 | 课程预备（数学） | `01-Math-Foundation/cs229-linalg.pdf`, `cs229-prob.pdf` | — |
| 0 | Python 入门 | `02-Python-Tutorial/` 全部 | — |
| 1 | 监督学习与线性回归 | `03-Lecture-Notes/cs229-notes1.pdf`; 中文 `04-Chapter-Notes-CN/cs229-notes1.md` | PS1 |
| 2 | 分类 / GDA / 朴素贝叶斯 | `03-Lecture-Notes/cs229-notes2.pdf`, `cs229-notes3.pdf`; 中文 `04-Chapter-Notes-CN/cs229-notes2.md`, `cs229-notes3.md`; `07-Cheatsheets/zh/cheatsheet-supervised-learning.pdf` | PS1 |
| 3 | 广义线性模型 / 正则化 | `03-Lecture-Notes/cs229-notes4.pdf`; 中文 `04-Chapter-Notes-CN/cs229-notes4.md`; `06-Topic-Notes/Linear Model.pdf` | PS1 (Poisson) |
| 4 | 核方法 / SVM | `03-Lecture-Notes/cs229-notes5.pdf`; 中文 `04-Chapter-Notes-CN/cs229-notes5.md`; `06-Topic-Notes/SVM.pdf`; `13-Section-Materials/cs229-cvxopt.md` | PS2 |
| 5 | 模型选择 / 偏差-方差 / 学习理论 | `06-Topic-Notes/BiasVarianceAnalysis.pdf`, `LearningTheory.pdf`, `Regularization and model selection.pdf` | PS2 |
| 6 | 决策树 / 集成 / Boosting | `03-Lecture-Notes/cs229-notes-dt.pdf`, `cs229-notes-ensemble.pdf`; 中文 `04-Chapter-Notes-CN/cs229-notes-dt.md`, `cs229-notes-ensemble.md`, `cs229-boosting.md`; `05-Slides/boosting.pdf` | — |
| 7 | Neural Network / 反向传播 | `03-Lecture-Notes/cs229-notes-backprop.pdf`, `backprop.py`; 中文 `04-Chapter-Notes-CN/cs229-notes-BP.md`; `06-Topic-Notes/Regularization and model selection.pdf` | PS3 |
| 8 | 深度学习实践 / CNN / DL Friday | `03-Lecture-Notes/cs229-notes-deep_learning.pdf`; 中文 `04-Chapter-Notes-CN/cs229-notes-deep_learning.md`; `05-Slides/deep_learning.pdf`; `02-Python-Tutorial/cs229_deep_learning_friday.pptx` | PS3 |
| 9 | 无监督：K-means / PCA / ICA | `03-Lecture-Notes/cs229-notes7a.pdf`, `cs229-notes8.pdf`; 中文 `04-Chapter-Notes-CN/cs229-notes7a.md`, `cs229-notes8.md`; `06-Topic-Notes/K-means.pdf`, `PCA.pdf`, `ICA.pdf` | PS3 |
| 10 | 高斯混合 / EM / 因子分析 | `03-Lecture-Notes/cs229-notes7b.pdf`, `cs229-notes9.pdf`; 中文 `04-Chapter-Notes-CN/cs229-notes7b.md`, `cs229-notes9.md`; `06-Topic-Notes/EM.pdf`, `Mixtures of Gaussians.pdf`, `Factor analysis.pdf` | PS3 (GMM) |
| 11 | ICA 实战 / RL 入门 | `06-Topic-Notes/ICA.pdf`, `reinforce_learning.pdf` | PS4 |
| 12 | RL 算法 / 强化学习实践 | `03-Lecture-Notes/cs229-notes10.pdf`, `cs229-notes11.pdf` | PS4 (Cartpole) |
| 13 | 序列模型：HMM | `13-Section-Materials/cs229-hmm.pdf`; 中文 `04-Chapter-Notes-CN/cs229-notes-hmm.md` | — |
| 14 | Gaussian Process 进阶 | `13-Section-Materials/cs229-gaussian_processes.pdf`; 中文 `04-Chapter-Notes-CN/cs229-gaussian_processes.md` | — |
| — | 期末项目 | `11-Final-Project/poster/`, `11-Final-Project/report/`（118 个往年项目参考） | 自选方向 |

---

## 📝 速查与可视化 (`07-Cheatsheets/`)

- `en/`：英文原版 4 张 cheatsheet + 2 张 refresher + 1 张 super cheatsheet
- `zh/`：afshinea 翻译的中文版（简繁两套）
- `visualizations/`：Sierkinhane 提供的 GIF——直观看到 linear/logistic/softmax/LWR 回归拟合过程、GDA 决策边界、GAN 生成效果

强烈建议将 `super-cheatsheet-machine-learning.pdf` 打出来贴墙上。

---

## 💻 动手实践 (`08-Code-Implementations/`)

当你想看每个公式长成 Python 是什么样，从零实现每个算法时来这里——

```
00-SupervisedLearning/
  01-LinearRegression/         # 00 线性回归 + 01 正规方程 + 02 LWR
  02-Classification/           # 00 Logistic + 01 Perceptron + 02 Newton
  03-GeneralizedLinearModels/  # Softmax 回归
  04-GenerativeLearningAlgorithms/  # GDA + 朴素贝叶斯（含 spam 数据集）
02-DeepLearning/
  00-NeuralNetworks/           # NN 回归 / 分类
  01-ConvolutionalNeuralNetworks/  # CNN（无 DataLoader 版）
01-UnsupervisedLearning/
  GAN/  CGAN/                  # GAN / 条件 GAN on MNIST
05-Mnist/                      # 99.76% 测试精度的 CNN-best
```

---

## 🧪 作业 (`09-Problem-Sets/` + `10-Problem-Sets-Solutions/`)

- **先做** `09-Problem-Sets/PS{i}/ps{i}.pdf`，按 `src/*.py` 的 skeleton 写代码；用 Jupyter `PS{i}-{j}.ipynb` 验证推导题
- **卡壳了再** 看 `10-Problem-Sets-Solutions/PS{i}/ps{i}sol.pdf`（公式 + 思路），最后参考 `PS{i}/code/src/` 的完整 python 实现
- **注意**：每个 PS 的 `src/output/` 目录里是参考运行的真实输出图片与预测文件，可用于对照你模型的输出是否正确
- 环境：`09-Problem-Sets/environment.yml`（依赖 numpy/scipy/matplotlib/sklearn 等）
- 解压图像数据：`PS4/data/` 已经下载好（13 MB 那个没下，可以使用 `make_zip.py` 自解压测试）

| PS | 主题 | 关键代码 |
| --- | --- | --- |
| PS0 | 简单 Python / 线性代数 warm-up | — |
| PS1 | Linear / Logistic / GDA / 朴素贝叶斯 / Poisson / LWR | `p01b_logreg.py`, `p01e_gda.py`, `p02cde_posonly.py`, `p03d_poisson.py`, `p05b_lwr.py` |
| PS2 | Logistic stability / calibration / 正则化贝叶斯 / kernel / perceptron / spam (SVM) | `p01_lr.py`, `p05_percept.py`, `p06_spam.py`, `svm.py` |
| PS3 | NN 训练 (NN) / GMM / K-means | `p01_nn.py`, `p04_gmm.py`, `p05_kmeans.py` |
| PS4 | DQN 强化学习 / ICA / Cartpole | `p01_nn.py`, `p04_ica.py`, `p06_cartpole.py` |

---

## 📚 复习 (`12-Review-Materials/`) 与 Section (`13-Section-Materials/`)

- `12-Review-Materials/midterm-review.pdf` — 2018 秋季期中复习题
- `12-Review-Materials/cs229-mt-review.pdf` — 2020 春季期中复习（带解答）
- `13-Section-Materials/mid_review_sp2020_annotated.pdf` — 复习课带标注答案
- `13-Section-Materials/cs229-cvxopt.pdf`, `cs229-cvxopt2.pdf` — 凸优化两期 Section（前置 SVM 用）
- `13-Section-Materials/cs229-gaussian_processes.pdf` — GP 完整推导
- `13-Section-Materials/cs229-hmm.pdf` — 隐马尔可夫模型推导
- `13-Section-Materials/cs229-prob-slide.pdf` — 概率回顾 slides
- `13-Section-Materials/evaluation_metrics_spring2020.pdf` — 模型评估指标详解

---

## 🛠 期末项目 (`11-Final-Project/`)

- `11-Final-Project/poster/` 与 `11-Final-Project/report/`：2018 秋季 118 个项目的最终海报与报告 PDF，按编号（`3.pdf`、`4.pdf` ... `400.pdf`）命名
- `11-Final-Project/poster-guidelines.pdf` — 项目海报要求规范

挑你感兴趣的方向（如 RL / CV / NLP / Theory）扫一遍往年报告，会对你的选题和实现深度有极大的启发。

---

## 🧰 数学与补充材料

- `01-Math-Foundation/cs229-linalg.pdf` — 线性代数与矩阵求导
- `01-Math-Foundation/cs229-prob.pdf` — 概率基础（含联合 / 边缘 / 期望）
- `01-Math-Foundation/gaussians.pdf`, `more_on_gaussians.pdf` — 高斯分布深入
- `01-Math-Foundation/hoeffding.pdf` — Hoeffding 不等式，用于学习理论证明
- `06-Topic-Notes/loss-functions.pdf` — Loss 函数汇总（顺便还能当数学 cheat sheet）

---

## 📦 数据 / 背景知识

| 文件 | 说明 |
| --- | --- |
| `02-Python-Tutorial/Spring_2020_Notebook.ipynb` | 2020 春季 Jupyter Notebooks 教程 |
| `02-Python-Tutorial/cs229_python_friday.pdf` | Python Friday 课的 Slide |
| `08-Code-Implementations/.../naive_bayes/data/spam.csv` | 朴素贝叶斯 spam 分类数据集 |
| `08-Code-Implementations/.../mnist/mnist.npz` | GAN 用的 MNIST |
| `08-Code-Implementations/02-DeepLearning/.../mnist/*.gz` | CNN 用的 MNIST（idx 格式） |

---

## 🔖 来源仓库致谢

| 来源 | 角色 |
| --- | --- |
| <https://github.com/maxim5/cs229-2018-autumn> | 主力仓库 — 课程官方完整资料 |
| <https://github.com/Sierkinhane/CS229-ML-Implementation> | 从零算法实现 + 算法可视化 GIF + xmind 知识图谱 |
| <https://github.com/afshinea/stanford-cs-229-machine-learning> | 多语言 cheat sheet（en/zh/zh-tw/ar/es/fa/fr/pt/tr/vi） |
| <https://github.com/PKUFlyingPig/CS229> | 早期资料镜像（已并入本目录） |
| <https://github.com/cycleuser/Stanford-CS-229> | cycleuser 中文译稿 markdown（已并入 04-Chapter-Notes-CN） |

各仓库原始 README 保留在 `00-README/source-*-README.md`。

---

## ✍️ 你的课堂笔记

`CS229_note.typ`（Typst 模板，双栏 + 页码 + 居中标题）放在仓库根目录，已为你预置封面（标题、作者邮箱、Abstract）与 Lec I 占位。建议用法：

- 每听完一讲 → 在文件末尾 `#pagebreak()` 后新开一节，复用 `§ Lec N` 标题格式
- 笔记内容建议同时对照 `03-Lecture-Notes/`（英文 PDF）与 `04-Chapter-Notes-CN/`（中文 markdown）整理要点
- 编译：`typst compile CS229_note.typ CS229_note.pdf`
- 由于 typst 没有原生 markdown 渲染，中文版的代码块 / 表格 / 公式可以手动复制粘贴，或者用 `typst` 的 `#raw()` / `#include()` 引入外部片段

---

## ⚙️ 学习节奏建议（贴合 Stanford 课程）

1. **Week 0 (预备)**：看完 `01-Math-Foundation/` 里 `cs229-linalg.pdf` 和 `cs229-prob.pdf`，把 `02-Python-Tutorial/Numpy tutorial.ipynb` 跑完。
2. **Week 1-2**：Lecture 1-2 → 03 notes1, notes2 → 开 PS1。
3. **Week 3-5**：Lecture 3-5 → 03 notes3-5 + `06-Topic-Notes/SVM.pdf` → 完成 PS2。
4. **Week 6-8**：Lecture 6-9 → dt / ensemble / backprop / DL → 完成 PS3。
5. **Week 9-11**：Lecture 10-13 → unsupervised → 完成 PS4（建议并行看 `13-Section-Materials/` 里的 GP/HMM）。
6. **Week 12-13**：Final Project 提案（参考 `11-Final-Project/`）+ 期中复习（`12-Review-Materials/`）。
7. **Week 14+**：Final Project 实操；有余力看 `08-Code-Implementations/` 把每个模型从零写一遍加深理解。

---

## ❓ 常见问题

- **作业数据找不着？** 看 `09-Problem-Sets/PS4/data/` 是否齐全；缺 `images_train.csv.gz` 时可压缩 `images_test.csv.gz` 来近似，或参考 `PS4/src/make_zip.py`
- **复现官方输出？** PS1/PS2/PS3/PS4 的 `10-Problem-Sets-Solutions/PS{i}/code/src/output/` 已经包含官方参考答案运行后的图片和文字输出
- **复习时间紧？** 直接看 `07-Cheatsheets/en/super-cheatsheet-machine-learning.pdf` + `12-Review-Materials/cs229-mt-review.pdf`

---

> 最后修改：2026-07-30  
> 若发现链接失效或文件缺失，请对照来源仓库补救。Happy learning!
