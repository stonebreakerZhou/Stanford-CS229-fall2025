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
=== 1.


