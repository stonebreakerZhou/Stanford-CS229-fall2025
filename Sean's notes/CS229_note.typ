//全局配置 (放在最上面，只写一次)
#set page(
  paper: "us-letter",
  columns: 2,
  margin: (x: 1in, y: 1in), //缩减边距，让双栏更美观
  //设置页码的计数
  footer: context {
    let page_number = counter(page).at(here()).first()
    align(center, text(size: 9pt, font: "New Computer Modern")[
      #page_number
    ])
  },
)


//首页标题 (跨栏显示)
#place(top, scope: "parent", float: true)[
  #align(center)[
    #v(0.5in)
    #text(size: 25pt, weight: "bold")[Notes in CS229-25fall]
    #v(1em)
    #text(size: 14pt)[Sean] \
    #text(size: 10pt)[#link("stonebreaker365@163.com")]
    #v(1em)
    #block(width: 90%, stroke: (y: 0.5pt), inset: 1em)[
      #set align(left)
      *Abstract* --- This note records Sean's notes of Stanford course CS229 taught by Andrew Ng (25fall).
    ]
    #v(2em)
  ]
]













#pagebreak()





#place(top, scope: "parent", float: true)[
  #align(center + horizon)[  // horizon 让它垂直居中页顶区域，更美观
    #text(font: "Georgia", weight: "bold", size: 24pt)[§ Lec I]  //
    #v(0em)
    #line(length: 100%, stroke: 1pt)  // 可选：加一条装饰线
  ]
]

==

=== 1. What is ML ?

- Field of stufy that gives computers the ability to learn without being expliicitly programmed. (Arthur Samuel 1959)
\

- Well-posed Learning Problem: A computer program is said to learn from experience E with expect to some task T and some performance measure P, if its performance on T, as measured by P, improves with experience E. (Tom Mitchell )

\

- AI > ML > DL

=== 2. Supervised Learning

- Regression Problem: \
~~~~Given a dataset of (X, Y) (inputs X and label Y), the goal is to learn a mapping from X to Y. (Regression: the value y that we're trying to predict is continuous)

\

- Classification Problem:\
~~~~Similar to above, but the term classification refers to that Y takes on a discrete number of variables.


=== 3. Unsupervised Learning

~~~~Only inputs X and no outputs Y are given, asked to figure out interesting sturcture in the given data.
\
- Cocktail Party Problem
- ICA : independent cmponent analysis


=== 4. Reinforcement Learning

~~~~Widely used in game playing and robotic applications.




#pagebreak()





#place(top, scope: "parent", float: true)[
  #align(center + horizon)[  // horizon 让它垂直居中页顶区域，更美观
    #text(font: "Georgia", weight: "bold", size: 24pt)[§ Lec II]  //
    #v(0em)
    #line(length: 100%, stroke: 1pt)  // 可选：加一条装饰线
  ]
]


== Linear Regression
\
=== 1. Notations

$theta$: parameters\
$m$: input numbers (rows in the table)\
$x$: inputs / features\
$y$: output / target variable\
$(x, y)$: training\
$(x^((i)), y^((i)))$: $i^("th")$ training example
\
$ h_theta(x) = theta_0 + theta_1 times x_1 + theta_2 times x_2 + dots + theta_n times x_n $
$ h(x) = sum_(i=0)^n theta_i x_i = theta^T x $


Goal: select $theta$ to output a hypothesis : function $h$
\

~~~To minimize cost function: $ J(theta) = 1/2 sum_(i=1)^m(h_theta(x^((i))) - y^((i)))^2 $

p.s: linear regression is a special case in the regression family, and squared error corrresponds to a Guassian !

\
\
== Gradient Descent

\
~~~~Start with $arrow(0)$, keep changing $theta$ to reduce $J(theta)$.

~~~~In fact, when we run gradient descent on linear regression, there will not be local optimum!


- LMS(Least Mean Squares) algorithm

$ theta_j := theta_j - alpha (partial J(theta)) / (partial theta_j) , #h(1em) j=0,1,dots,n $

$alpha$: learning rate\
$:=$: This corresponds to an assignment statement in programming, where the left‑hand side (lvalue) is the value being modified.\

subsitute the previous $J(theta)$ into the derivative:
$
  partial/(partial theta_j) J(theta) & = partial/(partial theta_j) (1/2 sum_(i=1)^m (h_theta (x^((i))) - y^((i)))^2) \
                                     & = (h_theta (x^((i))) - y^((i))) times partial/(partial theta_j) (h_theta (x) - y) \
                                     & = (h_theta (x) - y) dot partial/(partial theta_j) (sum_(i=0)^n theta_i x_i - y) \
                                     & = (h_theta (x) - y)x_j
$

that is, for single training example, the update to $theta_j$ is:
$ theta_j := theta_j + alpha(h_theta (x^((i))) - y^((i)))x_j^((i)) $

~~~~As the derivative of the sum is the sum of the derivatives, the overall update is (using all the training examples, that's called _batch gradient descent !_ , check for all the training examples):
$ theta_j := theta_j + alpha sum_(i=1)^m (h_theta (x^((i))) - y^((i)))x_j^((i)) $
$j = 0, 1, dots, n$\
repeat until convergence.

\
\

~~~~Usually the learning rate $alpha$ should be tried out several times on an exponential scale to find out the best value.


\
\
Intuition about this update algorithm:\
~~~~The magnitude of the update is proportional to $(h_theta (x^((i))) - y^((i)))$. Moreover, when the predicted value for a training example is very close to the true value $y^((i))$, we find that there is essentially no need to further modify the parameters. Conversely, if our prediction $h_theta (x^((i)))$ differs greatly from the true value $y^((i))$ (for instance, if it is far off), then a larger adjustment to the parameters is required.



#figure(
  image("images/ellipsis_contours.png", width: 60%),
  caption: [LMS run on the contours of the quadratic function (ellipsis)],
)

\
\
\

- Batch Gradient Descent
~~~~In each step, we examine _all_ the samples in the entire training set.\
~~~~drawback: if we have a huge dataset, each single update (the sum operation) becomes very slow.

\
\
\

- Stochastic Gradient Descent

#table(
  columns: 1,
  stroke: 1pt + black,
  align: left + horizon,
  inset: 10pt,
  [
    #set text(size: 11pt)
    #set par(leading: 0.8em)
    Repeat： \
    #h(1em) { \
    #h(2em) from $i = 1$ to $n$ \
    #h(3em) { \
    #h(4em) $theta_j := theta_j + alpha ( h_theta (x^((i))) - y^((i))) x_j^((i))$ \
    #h(5em) (for every $j$) \
    #h(3em) } \
    #h(1em) }
  ],
)

~~~~In other words, SGD update the whole $theta$ with only _one_ current training example !


~~~~Typically, stochastic gradient descent finds a value of $theta$ that is sufficiently close to the minimum much faster than batch gradient descent. (Also note that it may sometimes fail to converge completely to the minimum; in that case, $theta$ will keep oscillating around the minimum of $J(theta)$. However, in practice, these nearby values are usually close enough to satisfy our precision requirements, so they can still be used.) For these reasons, especially when the training set is large, stochastic gradient descent is often preferred over batch gradient descent.


~~~~Most commonly, we already have determined a specific learning rate α (with a description of the dataset beforehand) and then run SGD while gradually decaying the learning rate $alpha$ toward 0 as the algorithm proceeds. This ensures that the parameters we finally obtain will converge to the minimum, rather than oscillating around it.

\
\
\

- The Normal Equation
notice: this is only applicable for linear regression !



\
\
Prequisites:\
一些矩阵导数。\
另外要注意等式 (4) 中的 $A$ 必须是非奇异方阵（non-singular square matrices），而 $|A|$ 表示矩阵 $A$ 的行列式。那么我们就有下面这些等量关系：

#align(center)[
  $ nabla_A op(tr)(A B) = B^T $
  $ nabla_(A^T) f(A) = (nabla_A f(A))^T $
  $ nabla_A op(tr)(A B A^T C) = C A B + C^T A B^T $
  $ nabla_A |A| = |A|(A^(-1))^T $

]

\
\
\

~~~~Now, given a dataset, we have the _design matrix $x$_ as a $m times n$ matrix:
（实际上，如果考虑到截距项，也就是 $theta_0$ 那一项，就应该是 $m times (n+1)$ 矩阵），这个矩阵里面包含了训练样本的输入值作为每一行：

#align(center)[
  $
    ("design matrix")X = mat(
      -(x^((1)))^T-;
      -(x^((2)))^T-;
      dots.v;
      -(x^((m)))^T-
    )
  $
]

~~~~Then, design $y$ as a m-dimensional vector which contains all the targets in training:
#align(center)[
  $ y = mat(y^((1)); y^((2)); dots.v; y^((m))) $
]
the same for $theta$:
#align(center)[
  $ theta = mat(theta_0; theta_1; dots.v; theta_n) $
]
As $h_theta (x^(i)) = (x^(i))^T theta$, we have:

#align(center)[
  $
    X theta - y = mat((x^((1)))^T theta; dots.v; (x^((m)))^T theta) - mat(y^((1)); dots.v; y^((m))) = mat(h_theta (x^((1))) - y^((1)); dots.v; h_theta (x^((m))) - y^((m)))
  $
]

$
  J(theta) = 1/2 (X theta - y)^T (X theta - y)
$
\

~~~~Using things in the review part of linear algebra, we could just take the gradient of this expression:


#align(center)[
  $
    nabla_theta J(theta) & = nabla_theta [ 1/2 (X theta - y)^T (X theta - y) ] \
                         & = 1/2 nabla_theta [ theta^T X^T X theta - theta^T X^T y - y^T X theta + y^T y ] \
                         & = 1/2 nabla_theta op(tr)(theta^T X^T X theta - theta^T X^T y - y^T X theta + y^T y) \
                         & = 1/2 nabla_theta ( op(tr)(theta^T X^T X theta) - 2 op(tr)(y^T X theta) ) \
                         & = 1/2 ( X^T X theta + X^T X theta - 2 X^T y ) \
                         & = X^T X theta - X^T y
  $
]
\
\
Let the gradient be 0, and that's the normal function:
$ X^T X theta = X^T y $
therefore:
$ theta = (X^T X)^(-1) X^T y $

\
\
\
\
\
\
\
\
\

~~~~When faced with a regression problem, why might the least-squares cost function J, be a reasonable choice? We'll give a set of probabilistic assumptions, under which least-squares regression is derived as a very natural algorithm.
\
\

Assumption:
$ y^((i)) = theta^T x^((i)) + epsilon^((i)) $
$epsilon^(i)$ is an error term that captures either unmodeled effects or random noise.

~~~~Let us further assume that the $epsilon^((i))$ are distributed _IID_ (_independently and identically distributed_) according to a Gaussian distribution :$epsilon^((i)) ~ "N"(0, sigma^2)$. The density of $epsilon^((i))$ is given by
$ p(epsilon^((i))) = (1) / (sqrt(2 pi) sigma) exp(- (epsilon^((i)))^2 / (2 sigma^2)) $
~~~Due the fact that:
$
  epsilon^((i)) = theta^T x^((i)) - y^((i))
$
~~~~This implies that (just substitute the whole $epsilon^((i))$ into that density function)
$ p(epsilon^((i)) | x^((i)) ; theta) = (1) / (sqrt(2 pi) sigma) exp(- (y^((i)) - theta^T x^((i)))^2 / (2 sigma^2)) $
~~~~Additionally, given that:
$ p_Y (y) = p_epsilon (epsilon) dot |(d y)/(d epsilon)| $

~~~~我们把 $epsilon = y - theta^T x$ 代入，并对 $y$ 求导计算雅可比行列式的绝对值：

$ (d y)/(d epsilon) = (d y)/(d (y - theta^T x)) = 1 $

~~~~因为导数为 1，直接把第三步的 $epsilon$ 和 $p(epsilon)$ 换成 $y$ 和 $p(y)$：

~~~~将 $epsilon = y - theta^T x$ 代入第二步的密度函数中：
$ p(y) = (1)/(sqrt(2 pi) sigma) exp(- (y - theta^T x)^2 / (2 sigma^2)) $

~~~~换个写法写成条件概率：
$ p(y^((i))|x^((i)); theta) = (1)/(sqrt(2 pi) sigma) exp(- (y^((i)) - theta^T x^((i)))^2 / (2 sigma^2)) $

~~~~这里的记号 $p(y^((i)) | x^((i)) ; theta)$ 表示的是这是一个对于给定 $x^((i))$ 时 $y^((i))$ 的分布，用 $theta$ 代表该分布的参数。注意这里不能用 $theta$ 作为条件（即不能写成 $p(y^((i)) | x^((i)), theta)$），因为 $theta$ 并不是一个随机变量。这个 $y^((i))$ 的分布还可以写成
$ y^((i)) | x^((i)) ; theta ~ "N"( theta^T x^((i)), sigma^2 ) $


~~~~现在，我们有 $m$ 个样本。因为假设误差 $epsilon^((i))$ 是 #text(style: "italic")[IID]（独立同分布）的，所以这些样本的联合概率就是每个样本概率的乘积，我们称其为似然函数_Likelihood_ (现在这是关于$theta$的函数！) :

#align(center)[
  $ L(theta) = product_(i=1)^m p(y^((i)) | x^((i)) ; theta) $
]
\
~~~~现在，给定了 $y^((i))$ 和 $x^((i))$ 之间关系的概率模型了，用什么方法来选择咱们对参数 $theta$ 的最佳猜测呢？最大似然法（maximum likelihood）告诉我们要选择能让数据的似然函数尽可能大的 $theta$。也就是说，咱们要找的 $theta$ 能够让函数 $L(theta)$ 取到最大值 (MLE: Maximum Likelihood Estimation)。

\

~~~~取对数可以把连乘变成连加，我们便得到对数似然函数$ell(theta)$：

#align(center)[
  $
    ell(theta) & = log L(theta) \
               & = sum_(i=1)^m log [ (1)/(sqrt(2 pi) sigma) exp(- (y^((i)) - theta^T x^((i)))^2 / (2 sigma^2)) ] \
               & = sum_(i=1)^m [ log ( (1)/(sqrt(2 pi) sigma) ) - (y^((i)) - theta^T x^((i)))^2 / (2 sigma^2) ] \
               & = m log ( (1)/(sqrt(2 pi) sigma) ) - (1)/(2 sigma^2) sum_(i=1)^m (y^((i)) - theta^T x^((i)))^2
                 )
  $
]



~~~~因此，对 $ell(theta)$ 取得最大值也就意味着下面这个子式取到最小值：

$ (1)/(2) sum_(i=1)^m ( y^(i) - theta^T x^(i) )^2 $

~~~~到这里我们能发现这个子式实际上就是 $J(theta)$，也就是最原始的最小二乘成本函数（least-squares cost function）。

\
\
\
\
\


- 局部加权线性回归（Locally weighted linear regression）


~~~~在原始版本的线性回归算法中，要对一个查询点 $x$ 进行预测，比如要衡量 $h(x)$，要经过下面的步骤：

+ 使用最小二乘法：使用参数 $theta$ 进行拟合，让数据集中的值与拟合算出的值的差值平方最小;
  $ sum_i ( y^((i)) - theta^T x^((i)) )^2 $
+ 输出 $theta^T x$

~~~~可以看出，最小二乘法中对所有样本一视同仁，也即所有样本对$theta$的影响力度都相同。

\
\

~~~~在 LWR 局部加权线性回归方法中，步骤如下：

+ 使用参数 $theta$ 进行拟合，让加权距离最小;
  $ sum_i w^((i)) ( y^((i)) - theta^T x^((i)) )^2 $
+ 输出 $theta^T x$。

上面式子中的 $w^((i))$ 是非负的权值。直观点说就是，如果对应某个 $i$ 的权值 $w^((i))$ 特别大，那么在选择拟合参数 $theta$ 的时候，就要尽量让这一点的 $(y^((i)) - theta^T x^((i)))^2$ 最小。而如果权值 $w^((i))$ 特别小，那么这一点对应的 $(y^((i)) - theta^T x^((i)))^2$ 就基本在拟合过程中忽略掉了。
\

~~~~从这里我们可以看出，权值越大的样本点的误差会被放大，对于$theta$的影响也会越大

\
\
~~~~对于权值的选取可以使用下面这个比较标准的公式：

#align(center)[
  $ w^((i)) = exp(- (x^((i)) - x)^2 / (2 tau^2)) $
]

① 当 $x^(i)$ 离查询点 $x$ 很近：$(x^(i) - x)^2 -> 0$，分子为 $0$，$exp(0) = 1$，权重最大。

② 当 $x^(i)$ 离查询点 $x$ 很远：$(x^(i) - x)^2 -> infinity$，指数函数趋近于 $0$。权重几乎为零。

\
\
\

~~~~如果 $x$ 是向量，距离就用欧几里得距离平方的泛化形式，那就要对上面的式子进行泛化 :

#align(center)[
  $ w^((i)) = exp(- ((x^((i)) - x)^T (x^((i)) - x)) / (2 tau^2)) $
]

或者我们考虑对不同维度有不同的伸缩效应，于是引出马氏距离（Mahalanobis Distance）：
#align(center)[
  $ w^((i)) = exp(- ((x^((i)) - x)^T Sigma^(-1) (x^((i)) - x)) / 2) $
]

\

~~~~所以可以看出，$theta$ 的选择过程中，查询点 $x$ 附近的训练样本有更高得多的权值。还要注意，权值$w^((i))$的取值方程的形式跟高斯分布的密度函数比较接近的，但权值和高斯分布并没有什么直接联系，它只是借用高斯函数的“钟形”衰减特性来给距离“打分”：随着点 $x^(i)$ 到查询点 $x$ 的距离降低，训练样本的权值的也在降低，参数 $tau$ 控制了这个衰减的速度；$tau$ 也叫做带宽参数。

\
\

~~~~① 无权重的线性回归算法就是一种 [参数] 学习算法：因为有固定的有限个数的参数（也就是 $theta_i$），这些参数用来拟合数据。我们对 $theta_i$ 进行了拟合之后，就把它们存了起来，也就不需要再保留训练数据样本来进行更进一步的预测了
\
~~~~② 局部加权线性回归是一个 [非参数] 算法：使用这个算法的时候我们就必须一直保留着整个训练集，因为每来一个新的查询点 $x$，权重$w^((i))$都会重新计算，导致最优的$theta$也随之改变。\
"non-parametric"是粗略地指：“模型的复杂度和参数数量，会随着训练集规模 mm 的增大而线性增大。”




#pagebreak()








#place(top, scope: "parent", float: true)[
  #align(center + horizon)[  // horizon 让它垂直居中页顶区域，更美观
    #text(font: "Georgia", weight: "bold", size: 24pt)[§ Lec III]  //
    #v(0em)
    #line(length: 100%, stroke: 1pt)  // 可选：加一条装饰线
  ]
]


== Classification

- The framework we've built:
1. Make a assumption about $P(Y|X; theta)$\
2. Figure out maximum likelihood estimation\
\

Now if we want to apply this framework to other problems, where the value of Y is now either 0 or 1, and that's a classification problem.
\

~~~~It turns out that fit a line (use linear regression) for a classification problem is not a good idea !

\
\
\

=== 1. Logistic Regression
\
~~~~we want $h_theta (x) in [0, 1]$

~~~~If we choose the function below:

#align(center)[
  $ h_theta (x) = g(theta^T x) = (1) / (1 + e^(- theta^T x)) $
]

#align(center)[
  $ g(z) = (1) / (1 + e^(-z)) $
]

~~~~This function is called "logistic" or "sigmoid" function.


#figure(
  image("images/logistic_func.jpg", width: 60%),
  caption: [sigmoid / logistic function curve],
)
\

~~~~Intuitively, the function maps real value ($theta^T x$) $in (-infinity, +infinity)$ to ($g(theta^T x) in$ $(0, 1)$.

~~~~func $g$'s property:
#align(center)[
  $
    g'(z) & = d/(d z) [ (1)/(1 + e^(-z)) ] \
          & = (1)/((1 + e^(-z))^2) (e^(-z)) \
          & = (1)/(1 + e^(-z)) dot.c (1 - (1)/(1 + e^(-z))) \
          & = g(z) (1 - g(z))
            )
  $
]

\
\

~~~~Now that we have the logistic regression model, how do we fit an appropriate $theta$? We have previously seen that, under a set of assumptions, least squares regression ($L S R$) can be derived via maximum likelihood estimation ($M L E$). \
~~~~So next, let us make a series of statistical assumptions for this classification model, and then use the maximum likelihood method to fit the parameters.
\
\

~~~~First, #underline[*_define the output probabilities_*]:
#align(center)[
  $
    P(y = 1 | x ; theta) & = h_theta (x) \
    P(y = 0 | x ; theta) & = 1 - h_theta (x)
  $
  $y in { 0, 1}$
]
(note: there we define the direct output prob corresponds to positive example $h_theta (x)$ just for convention)\
\

~~~~A more compact way to write this is (use the fact that $y$ only $in {0, 1}$):
#align(center)[
  $ p(y | x ; theta) = (h_theta (x))^y (1 - h_theta (x))^(1-y) $
]
\


#pagebreak()




~~~~Now that the probabilistic model has been established, we need to use $M L E$ (Maximum Likelihood Estimation) to find the optimal $theta$.

~~~~Assuming that the $m$ training examples are all generated independently, we can write the likelihood function $L(theta)$ for the parameters as follows (在已知所有输入特征 $X$ 和参数 $theta$ 的前提下，观测到这整个标签向量 $arrow(y)$
​（即所有 $y^((i))$ 到 $y^((m))$ 同时出现）的联合概率):
#align(center)[
  $
    L(theta) & = p(arrow(y)|X; theta) \
             & = product_(i=1)^m p(y^((i)) | x^((i)) ; theta) \
             & = product_(i=1)^m (h_theta (x^((i))))^(y^((i))) (1 - h_theta (x^((i))))^(1 - y^((i)))
  $
]

~~~~Simmilarly, we use log likelihood func $ell(theta)$ to figure out the best parameters:

#align(center)[
  $
    ell(theta) & = log L(theta) \
               & = sum_(i=1)^m [ y^((i)) log h_theta (x^((i))) + (1 - y^((i))) log (1 - h_theta (x^((i)))) ]
                 )
  $
]
~~~~Now the task is to choose $theta$ to maximize $ell(theta)$.\
\
\

- 怎么让似然函数最大？就跟之前咱们在线性回归的时候用了求导数的方法类似，这次是用梯度上升法（*gradient ascent*）(ascent corresponds to the plus symbol below):
$ theta := theta + alpha nabla_theta ell(theta) $
（注意更新方程中用的是加号而不是减号，因为我们现在是在找一个函数的最大值，而不是找最小值）

\

~~~~还是先从只有一组训练样本 $(x, y)$ 来开始，然后求导数来推出随机梯度上升规则：\

注意： 由于$g(theta^T x) = h_theta (x)$ （也就是我们的预估函数）

$
  (partial ell)/(partial theta_j) & = ( y dot (1)/(g) - (1-y) dot (1)/(1 - g)) (partial g)/(partial theta_j)
$

代入性质: $g'(z) = g(z)(1- g(z))$
所以:
$
  (partial g(theta^T x)) / (partial theta_j) &= (partial g(theta^T x)) / (partial (theta^T x)) dot (partial theta^T x) / (partial theta_j)\
  &= g(theta^T x)(1 - g(theta^T x)) dot x_j
$

代入原式得：
$
  (partial l) / (partial theta_j) & = ( y dot (1)/(g) - (1-y) (1)/(1 - g) ) g(theta^T x) (1 - g(theta^T x)) dot x_j \
                                  & = (y (1 - g) - (1-y) g) dot x_j \
                                  & = (y - g(theta^T x)) dot x_j
$
\
$g(theta^T x)$也可以写成$h_theta (x)$\
\

~~~~上面的式子里，我们用到了之前所提到的$g$的性质:  $g'(z) = g(z)(1 - g(z))$. 最后得到了随机梯度上升的参数更新规则：

#align(center)[
  $ theta_j := theta_j + alpha ( y^((i)) - h_theta (x^((i))) ) x_j^((i)) $
]

（注：上标的i指的是第i个样本，下标j则指的是对于向量的第j维进行的更新操作）
\

~~~~It turns out that $ell(theta)$ is always a concave（凸） function, so we won't get trapped in local op（局部最优）. Actually, the only global maximum is also the reason why we choose sigmoid func rather tahn other funcs that give $(0, 1)$.
\

~~~~For linear regression, the normal equations give a one short way to find the best value of $theta$. However, there is no known way to have a close form equation for logistic regression. So we only have to use the iterative algorithm like gradient ascent or the Newton method later.




#pagebreak()



- *Newton's method*

~~~~Gradient descent only allows us to take small steps during update, so we need a lot of iterations to converge. But Newton's method will let us take bigger jumps.
\
\
~~~~Previously, we've learned Newton's method to find the zeros of a function:
$
  "want to find" theta, #h(1em)s.t: f(theta) = 0
$
~~~~Now we apply it to $ell'(theta)$:
$
  "find" theta, #h(1em)s.t: ell'(theta) = 0
$
\
\

~~~~Newton's tangent method iterates as follows:

#align(center)[
  $ theta^((t+1)) := theta^((t)) - (f(theta^((t)))) / (f'(theta^((t)))) $
]

~~~~我们可以把它理解成用一个线性函数来对函数 $f$ 进行逼近，这条直线是 $f$ 的切线，而猜测值是 $theta$，解的方法就是找到线性方程等于零的点，把这一个零点作为 $theta$ 设置给下一次猜测，然后以此类推。


#figure(
  image("images/Newton's-method.png", width: 60%),
  caption: [Newton's method to solve the zeros],
)

~~~~我们现在要找一阶导数的零点，也就用这样的更新公式：
$
  theta_"new" := theta - (ell'(theta)) / (ell''(theta))
$

~~~~In our present case, θ is a vector, so we generalize it (to multi-dimension) to obtain the following update rule (Newton-Raphson method):

#align(center)[
  $ theta := theta - H^(-1) nabla_theta ell(theta) $
]
相当于：$nabla_theta ell(theta)$就是之前式子里面的一阶导数$ell'(theta)$；而$H$就是之前式子里面的二阶导数$ell''(theta)$\
\

~~~~$nabla_theta ell(theta)$ 是关于 $theta_i$ 的 $ell(theta)$ 的偏导数向量，也就是在之前我们算出关于单个样本的梯度之后累加起来得到所有样本构成的总梯度：
$ nabla_theta ell(theta) = sum_(i=1)^m ( y^((i)) - h_theta (x^((i))) ) x^((i)) $


而 $H$ 是一个 $(n+1) times (n+1)$ 矩阵（包含截距项）：

#align(center)[
  $ H_(i j) = (partial^2 ell(theta)) / (partial theta_i partial theta_j) $
]

$
  H in RR^(n+1 times n+1) ;#h(1em) nabla_theta ell(theta) in RR^(n+1)
$
\
\

~~~~Newton's method has the property of "quadratic convergence", so it converges very fast.\
~~~~牛顿法通常都能比（批量）梯度下降法收敛得更快，而且达到最小值所需要的迭代次数也低很多。然而，牛顿法中的单次迭代往往要比梯度下降法的单步耗费更多的性能开销(more expensive)，因为要求一个 $n times n$ 的 Hessian 矩阵的逆(hard in high dimensions)；不过只要这个 $n$ 不是太大，牛顿法通常就还是更快一些。
\

~~~~当用牛顿法来在逻辑回归中求似然函数 $ell(theta)$ 的最大值的时候，得到这一结果的方法也叫做 Fisher 评分（Fisher scoring）。



#pagebreak()





#place(top, scope: "parent", float: true)[
  #align(center + horizon)[  // horizon 让它垂直居中页顶区域，更美观
    #text(font: "Georgia", weight: "bold", size: 24pt)[§ Lec IV]  //
    #v(0em)
    #line(length: 100%, stroke: 1pt)  // 可选：加一条装饰线
  ]
]

=== 1. Perception Learning Algoritm
\
~~~~Logistic Regression uses the sigmoid function $g(z) = 1 / (1+e^(-z))$to squeeze the entire real line from $(- infinity, +infinity)$ to $(0, 1)$.
\
\

~~~~Imagine modifying logistic regression so that it is "forced" to output only 0 or 1. A natural way is to use a threshold function(unit step funct):

#align(center)[
  $
    g(z) = cases(
      1 & "if " z >= 0,
      0 & "if " z < 0
    )
  $
]
#figure(
  image("images/unit_step_func.jpg", width: 60%),
  caption: [unit step function],
)

\




~~~~Then  we still define  the hypothesis function $h_theta (x) = g(theta^T x)$, but now with $g$ as the threshold function above, and then apply the following update rule(same for both logistic regression and the perception):

#align(center)[
  $ theta_j := theta_j + alpha ( y^((i)) - h_theta (x^((i))) ) x_j^((i)) $
]

then we obtain the _perceptron learning algorithm_.
\
~~~~Inspect this equation carefully: if the prediction is right, $y^((i)) - h_theta (x^((i))) = 0$, and there'll be no update. Otherwise $y^((i)) - h_theta (x^((i))) = ± 1$.
\

~~~~More close looks at its update algorithm when the prediction is wrong and we end up at $y^((i)) - h_theta (x^((i))) = ± 1$ : \
~~~~① If $y^((i)) = 0, h_theta (x^((i))) = 1$,which means we've mistaken a negative example as a positive one. So we take : $theta_j := theta_j - alpha x_j$ , to add $- alpha arrow(x)$ to $arrow(theta)$ , one common way to intending a negative dot product $arrow(x) dot arrow(theta)$ later. (当y=0, 我们希望$arrow(theta)$与$arrow(x)$尽量相反) (这里要配一个向量图1)
\

~~~~② Similarly, when we've mistaken a positive example as negative one, we to add $alpha arrow(x)$ to $arrow(theta)$ , wishing a positive dot product $arrow(x) dot arrow(theta)$. (当y=1, 我们希望$arrow(theta)$与$arrow(x)$尽量接近) (这里要配一个向量图2)

#figure(
  image("images/Lec4_perceptron.jpg", width: 80%),
  caption: [perceptron update rule],
)
\
\

~~~~（题外话）：In the 1960s, this "perceptron" was considered a rough model of how a single neuron in the brain might work. Because of its simplicity, this algorithm serves as a starting point for our later discussion of learning theory in this course. However, it is important to note that although the perceptron learning algorithm may look superficially similar to the other algorithms we have covered, it is actually fundamentally different in kind from logistic regression and least‑squares linear regression. In particular, it is very difficult to attach a meaningful probabilistic interpretation to the perceptron's predictions, nor can the perceptron learning algorithm be derived as a maximum likelihood estimation procedure.
\
\
\
\

=== 2. The Exponential Family
\

- 我们先定义一下指数组分布（exponential family distributions）。如果一个分布能用下面的方式来写出来，我们就说这类分布属于指数族：

#align(center)[
  $ p(y ; eta) = b(y) exp(eta^T T(y) - a(eta)) $
]

上面的式子中:\
$y$——数据(data)\

$eta$——此分布的自然参数（natural parameter，也叫典范参数 canonical parameter）\

$T(y)$——充分统计量（sufficient statistic），通常就是 $y$ 自身\

$eta$ 与 $T(y)$ 的维度应当匹配（二者向量点积）\

$b(y)$——basic measure，是一个标量\

$a(eta)$——对数分割函数（log partition function）\


#align(center)[
  $ p(y ; eta) = (b(y) e^(eta^T T(y))) / e^(a(eta)) $
]

~~~~$e^(-a(eta))$ 这个量本质上扮演了归一化常数（normalization constant）的角色，也就是确保 $p(y ; eta)$ 的总和或者积分等于 $1$。
\

~~~~当给定 $T$，$a$ 和 $b$ 时，就定义了一个用 $eta$ 进行参数化的分布族（family，或者叫集 set）；通过改变 $eta$，我们就能得到这个分布族中的不同分布（也就是说这是一个单参数的分布，给定$eta$，我们就能拿到这个分布的全部概率密度公式等等，进而之后的更新公式也能被推导出来）。

\
\
\

- *_Bernoulli Distribution_* is in this family

~~~~Recall that Bernoulli distribution's PDF is:

$
  p(y ; phi) & = phi^y (1 - phi)^(1-y)
$

~~~~Then we rewrite it into the form above:

#align(center)[
  $
    p(y ; phi) & = exp(y log phi + (1-y) log (1 - phi)) \
               & = exp(( log (phi / (1 - phi)) ) y + log (1 - phi))
  $
]
~~~~compare it to this uni-form:

#align(center)[
  $ p(y ; eta) = (b(y) e^(eta^T T(y))) / e^(a(eta)) $
]

~~~~The corresponding parameters for Bernoulli's distribution are:

#align(center)[
  $
      b(y) & = 1 \
       eta & = log(phi/(1-phi)) \
      T(y) & = y \
    a(eta) & = - log (1 - phi) = log (1 + e^eta)
  $
]
\

- *_Gaussian Distribution_* is also in this family
\
assume $sigma^2 = 1$
#align(center)[
  $
    p(y ; mu) & = (1)/(sqrt(2 pi)) exp(- (y - mu)^2 / 2) \
              & = (1)/(sqrt(2 pi)) exp(- 1/2 y^2) dot.c exp(mu y - 1/2 mu^2)
  $
]

~~~~Then we have:

#align(center)[
  $
      b(y) & = (1)/(sqrt(2 pi)) exp(- y^2 / 2) \
       eta & = mu \
      T(y) & = y \
    a(eta) & = eta^2 / 2 (= mu^2 / 2) \
  $
]

\


- Properties with the exponential family

+ MLE with respect to $eta$ is a concave function $<=>$ NLL(negative log likelihood) is convex\

+ $ E[y; eta] = partial(a(eta)) / (partial eta) $

+ $ V a r[y; eta] = (partial^2 (a(eta))) / (partial eta^2) $

~~~~通常我们求解某种分布中的均值与方差的时候需要进行积分，但是此时我们只需要进行求导，更易操作
\
\
\

~~~~事实上，针对不同类型的数据，我们可以采用exponential family中的不同分布类型进行建模：\

① Real number（实值）—— Gaussian\
② Binary（二分类数据）—— Bernoulli\
③ count （1，2，3...整数）—— Poisson\
④ $R^+$ （正实数）—— Gamma, Exponential\
⑤ 概率分布之上的概率分布 —— Beta, Dirichlet（通常出现在贝叶斯机器学习、统计中）
\
\
\
\
\


- *GLMs*

~~~~进行泛化，设想一个分类或者回归问题，要预测一些随机变量 $y$ 的值，作为 $x$ 的一个函数。要导出适用于这个问题的广义线性模型，就要对我们的模型、给定 $x$ 下 $y$ 的条件分布来做出以下三个假设：

1. *假设 1*：$ y | x ; theta ~ "ExponentialFamily"(eta) $
即给定 $x$ 和 $theta$，$y$ 的分布属于指数分布族，是一个参数为 $eta$ 的指数分布。

2. *假设 2*：$ eta = theta^T x, #h(1em) theta in RR^n, x in RR^n $
自然参数 $eta$ 和输入值 $x$ 是线性相关的，$eta = theta^T x$，且如果$eta$为有值的向量，则$eta_i = theta^T_i x$

3. *假设 3*：\
~~~~给定 $x$，目的是要预测对应这个给定 $x$ 的 $T(y) (=y)$ 的期望值，这就意味着我们的学习假设 $h$ 输出的预测值 $h(x)$ 要满足 $ h(x) = E [y | x] $
例如在逻辑回归中，
$
  h_theta (x) & = [p(y = 1 | x ; theta)] \
              & = [0 dot p(y = 0 | x ; theta) + 1 dot p(y = 1 | x ; theta)] \
              & = E[y | x ; theta]
$
注：这里的 $E[y | x]$ 应该就是对给定 $x$ 时的 $y$ 值的期望的意思。

\
\

~~~~上面的几个假设中，第二个可能看上去证明得最差，所以也更适合把这第二个假设看作是一个我们在设计广义线性模型时候的一种“设计选择”（design choice），而不是一个假设。自然界可能并不真的遵循$eta = theta^T x$，但我们把它当成一个设计准则。因为线性是最简单的起点，而且如果这条线不够好，我们可以在 $x$ 上加非线性特征（比如 $log x$, $x^2$ 来强制让它变好）\
\

~~~~那么这三个假设/设计，就可以用来推导出一个非常合适的学习算法类别，即广义线性模型（GLMs），这个模型有很多特别友好又理想的性质，比如很容易学习。此外，这类模型对一些关于 $y$ 的分布的不同类型建模来说通常效率都很高；例如，我们下面就将要简单介绍一些逻辑回归以及普通最小二乘法这两者如何作为广义线性模型来推出。

\
\

~~~~整体思想是这样的，一共分为两部分：模型 + 分布。首先我们拿到输入 $x$，我们假设模型是一个线性模型，于是这个模型通过可学习的参数 $theta$ 输出 $theta^T x$ 作为参数 $eta$（即自然参数），$eta$ 被传递给 Exponential Family 作为其核心参数，（我们会在分布这部分选择合适的分布，分布类型的选择取决于我们最后的任务，比如说预测实值就选Guassian，预测值$in {0,1}$就选Bernoulli......进而再选择合适的$b(y), a(eta), T(y)$）最后我们在对应的分布类型上得到最终的预测值 $h(x)$，这个预测值被定义为在给定 $x$ 下的条件期望 $E[y | x]$。\
（上述mental map要配一个手绘示意图）

#figure(
  image("images/Lec4_GLM_mental_map.jpg", width: 80%),
  caption: [GLM mental map],
)
\


~~~~而这个期望值，恰好等于指数族分布的对数分割函数 $a(eta)$ 的一阶导数：
#align(center)[
  $ h(x) = E[y | x] = (partial a(eta)) / (partial eta) $
]

~~~~这个数学性质（指数族的均值-参数恒等式）是连接线性部分 $eta$ 和最终预测值之间的桥梁。

\
~~~~GLM 的流水线就是：输入 $x$ 线性投影得到 $eta$，$eta$ 驱动指数族分布，最后输出的是该分布的期望值。而这个期望值是由 $eta$ 经过“正则响应函数”（即 $a(eta)$ 的导数）映射得到的。

#align(center)[
  $ eta = theta^T x, quad h(x) = E[y | x] = (partial a(eta)) / (partial eta) $
]

\
\


在学习的时候，我们做的是maximum likelihhod：
$
  max_theta log P(y^((i)); theta^T x^((i)))
$
在训练的时候我们怎样训练得到模型？我们通过梯度下降得到的参数，就

是线性模型里面的参数$theta$，而不是分布里面的$mu, sigma^2, eta$
\
\
\
\

- Learning update rule

~~~~It turns out that no matter what kind of GLM we're doing, or what kind of distribution we choose. The rule is always the same as below:
\
$
  theta_j := theta_j + alpha (y^((i)) - h_theta (x^((i)))) x_j^((i))
$
(注意：以上这个总是成立的统一更新公式的推导是因为我们使用的MLE进而推导出来的)
\
\

- Terminology
$eta ->$ natural parameter\
$mu = E[y; eta] = g(eta) = partial / (partial eta) a(eta) -> g():$ canonical response function\
$eta = g^(-1)(mu) -> g^(-1)():$ canonical link function


\
\
- 3 Parameterizations

①: model parameter : $theta$\
②: natural parameter : $eta$\
③: canonical parameter :
$
  phi - "Bernoulli"\
  mu, sigma^2 - "Guassian"\
  lambda - "Poisson"
$
\

~~~~Whenever we learn a GLM, we learn $theta$(that is in the linear model).\
~~~~$theta^T x = eta$ (it's the design choice !)\
~~~~$g(eta) = "canonical parameter"$; \
and $g^(-1)("canonical param") = eta$

\
\
\
\

~~~~Now recall the logistic regression:
$ h_theta (x) = E[y|x ; theta] = phi $ (we choose the Bernoulli distribution, so the canonical param here is $phi$)\
~~~~Also, there is:
$ phi = 1/(1+e^(- eta)) = 1/(1+e^(- theta^T x)) $
\
~~~~By now, we know that the logistic function is a natural choice when doing binary classification !

\
\
\

~~~~Also, recall linear regression: we have input x, and get $ theta^T x = eta $ ~~~~Additionally, we use the Guassian as the distribution in this case, so $ eta = mu $
~~~~In our Guassian assumption, we assume that for every x, the correspoding y is in a Guassian distribution of variance 1（注意：方差不为1时方差的大小可以被学习在$theta$中，所以简化起见我们就令方差为1） and mean of $theta^T x$（配一个手绘图）
\
~~~~所以我们相当于是认定事先存在上述手绘图中的这种数据分布规律，然后我们实际拿到的数据是这个分布规律之上产生的，现在我们实际做的就是一个从右向左的倒推过程，最后要找到合适的$theta$。（再配一个手绘图）

#figure(
  image("images/Lec4_GLM_Guassian.jpg", width: 100%),
  caption: [GLM linear regression(Guassian)],
)
\
\

~~~~同理对于逻辑回归任务，我们同样也是要进行这样的一个倒推（再配一张手绘图）

#figure(
  image("images/Lec4_GLM_logistic.jpg", width: 100%),
  caption: [GLM logistic regression(Bernoulli)],
)
\
\
\



- Softmax regression

~~~~Softmax回归可以被理解为GLM家族中的一个例子，但是这里我们将采取非GLM的方法进行推证，即采用交叉熵(Cross Entropy)的思想。

\

Consider a multi-class(k- class) classification:\

$x^((i)) in RR^(n), "label" y in [{0, 1}^k]$ (y is a one-hot vector)

~~~~_Every class_ has its own set of parameters: $theta_"class" in RR^n$, and there are $k$ such $theta_"class"$, $class in {0, ..., 1, ..., 0}$(one-hot vector)

\
The whole parameters form a matrix:
$
  overbrace(
    underbrace(
      mat(
        theta_1^T;
        theta_2^T;
        dots;
        theta_k^T
      ),
      k " rows"
    ),
    n " columns"
  )
$
\
（这里配一张分类手绘图）

#figure(
  image("images/Lec4_softmax.jpg", width: 80%),
  caption: [Multi-class classification],
)


~~~~Given a $x$, $theta^T x in (-infinity, +infinity)$. Our gola is to get a probability distribution over the classes, so we first take the exponential of each $theta_i^T x$ : $e^(theta_i^T x)$ and the value will be positive. Then, normalize the values:
$ frac(e^(theta_i^T x), sum_(i=1)^k e^(theta_i^T x)) $

~~~~So given a x, and we run this whole procedure, we get _a probability output over all the classes_ for which class that example is most likely to belong to.
\
~~~~The true $y$ is prob 1 over the true class, and prob 0 over other classes.
\
~~~~Our goal is to minimize the distance between the two prob distributions. The term  for that is :" minimize the cross entropy between the two distributions ".
\
$
  op("Cross Entropy")(p, hat(p)) = -sum_(y in "classes") p(y) log hat(p)(y)
$
~~~~For this example,
$
  & = -log hat(p)(y_0) \
  & = -log frac(e^(theta_i^T x), sum_(c in "classes") e^(theta_c^T x))
$

~~~~And then we do gradient descent with respect to the parameters.







#pagebreak()





#place(top, scope: "parent", float: true)[
  #align(center + horizon)[  // horizon 让它垂直居中页顶区域，更美观
    #text(font: "Georgia", weight: "bold", size: 24pt)[§ Lec V]  //
    #v(0em)
    #line(length: 100%, stroke: 1pt)  // 可选：加一条装饰线
  ]
]




== Generative Learning Algorithm

\
~~~~By now, the learning algorithms we've learned are called discriminative learning algorithms. (也就是说目前为止，我们讲过的学习算法的模型都是 $p(y | x ; theta)$，即给定 $x$ 下 $y$ 的条件分布，以 $theta$ 为参数)

\

=== 1. Guassian Discriminative Analysis
\
~~~~设想一个二分类问题，我们要学习基于一个动物的某个特征来辨别它是大象 $(y = 1)$ 还是小狗 $(y = 0)$。给定一个训练集，用逻辑回归或者基础版的感知器算法（perceptron algorithm）这样的一个算法能找到一条直线，作为区分开大象和小狗的边界。接下来，要辨别一个新的动物是大象还是小狗，程序就要检查这个新动物的值落到了划分出来的哪个区域中，然后根据所落到的区域来给出预测。（以上这样的 discriminative algorithm 本质就是在做MLE）

\

~~~~So rather than looking at both classes simultaneously and searching for a way to separate them, the generative algorithm builds a model of what each of the classes looks like.\
~~~~At test time, it evaluates a new example against those two models and tries to see which of the two models mathces more closely against.
\
\

- - Discriminative: \
Learn *$p(y|x)$*, i.e. *$h_theta (x) = cases(0, 1)$* ~ directly. (the mapping : $x -> y$)

\

- - Generative:\
Learn *$p(x|y)$* (given the class y, what the feature x will be like)\
&&(and) *$p(y)$*(a class prior)

~~~~Using the Bayes rule:\
$
  p(y = 1|x) = frac(p(x|y=1)p(y=1), p(x))\
  p(x) = p(x|y=1)p(y=1) + p(x|y=0)p(y=0)
$
\
Combining the above two equations gives:
$
  p(y=1|x) = frac(p(x|y=1)p(y=1), p(x|y=1)p(y=1) + p(x|y=0)p(y=0))
$





















