% -------------------
% 基本设置
% -------------------
\ProvidesClass{PlainNote}
\LoadClass[11pt]{article}
\RequirePackage[a4paper, top = 80pt , bottom=80pt,outer=50pt,]{geometry}%页边距
\setlength{\headheight}{23pt}

% ---- 引入宏包

\RequirePackage{amsmath,amsfonts,tikz,graphicx,framed,mdframed,amsthm, amssymb, appendix, bm,  mathrsfs,xcolor,braket,tkz-base,tkz-euclide,pgfplots,hyperref,bookmark, titlesec, pgfplots, booktabs, setspace, changepage, multirow, fancyhdr, helvet, mathtools, derivative}
\RequirePackage[most]{tcolorbox}
\PassOptionsToPackage{table}{xcolor}
\pgfplotsset{compat=1.18}

% ---- 引用

\hypersetup{
colorlinks=true,
linkcolor=blue,
anchorcolor=blue,
citecolor=blue}

% -------------------
% 封面设计
% -------------------

% ---- 定义三个变量
\newcommand{\@titlex}{} % x: 主标题
\newcommand{\@datez}{}  % z: 日期
\newcommand{\@authora}{}  % a: 作者

% ---- 定义\thetitle

\newcommand{\thetitle}[3]{%
    \gdef\@titlex{#1} % 定义标题 x
    \gdef\@datez{#2}  % 定义日期 z
    \gdef\@authora{#3}  % 定义作者 a
}

% ---- maketitle

\renewcommand{\maketitle}{
\begin{flushleft}
  {\fontsize{35}{18}\textbf{\textsf{\@titlex}}} \par % 主标题
\end{flushleft}
\begin{flushleft}
  \vspace*{30pt} % 主标题上方的固定留白
  {\raisebox{0.5ex}{\rule{\mylength}{1pt}}\hfill\textsf{\large\textbf{\@authora *}}} \par % 作者部分
\end{flushleft}
\vspace*{-25pt} % 主标题上方的固定留白
\begin{flushright}
  {\textsf{\textcolor{gray}{\footnotesize\textit{LEARN WITH BRAIN}}}} \par
  \vspace*{-15pt} % 主标题上方的固定留白
  {\textsf{\textcolor{gray}{\footnotesize\textit{YOU CAN NOT CATCH ME UNLESS YOU CAN}}}} \par
  {\textsf{\@datez}} \par % 日期部分
\end{flushright}
}
\newlength{\mylength}
\setlength{\mylength}{12cm}


% -------------------
% 页面设计
% -------------------

\linespread{1.3}
\setlength\parskip{10pt} \setlength\parindent{0in}
\textwidth 5.8in

% -------------------
% 页眉页脚
% -------------------


\pagestyle{fancy}
\fancyhf{} % 清空默认页眉页脚

% ---- 左页眉
\fancyhead[L]{%
    \fontsize{10pt}{10pt} \sffamily \leftmark
}

% ---- 右页眉
\fancyhead[R]{%
    \hfill \fontsize{10pt}{10pt} \sffamily \thepage
}

\renewcommand{\headrule}{%
    \vspace*{0pt} % 调整垂直位置，负值向上移动
    \hrule width\headwidth height0.5pt
    \vspace*{2mm}  % 恢复原始位置
}
\renewcommand{\footrulewidth}{0pt} % 去掉页脚下划线

% ---- section标记
\renewcommand{\sectionmark}[1]{\markboth{\sffamily #1}{}} 

% -------------------
% 自定义环境
% -------------------


% ---- 定义abstract
\renewenvironment{abstract}{%
    \begin{adjustwidth}{0cm}{0cm} % 左右缩进 1.5cm，具体值可根据需要调整
    \par\vspace{0.3cm} % 上方留白
    \par\vspace{0.5em} % 细线与标题之间的间距
    \noindent \textbf{\textsf{Abstract.}} % 加粗标题 "Abstract"
    \noindent \small % 设置正文为 9 号字体 (通常 \small 对应 9pt)
    \setstretch{1} % 调整行距
}{%
    \par\vspace{0.05em} % 正文与细线之间的间距
    \par\vspace{0.3cm} % 下方留白
    \end{adjustwidth}
}

% ---- 定义cbox计数器
\newcounter{theoremcounter}[section]
\newcounter{definitioncounter}[section]
\newcounter{corollarycounter}[section]
\newcounter{propositioncounter}[section]
\newcounter{lemmacounter}[section]
\newcounter{axiomcounter}[section]
\newcounter{conventioncounter}[section]
\newcounter{conclusioncounter}[section]

% ---- 定义通用cbox
\newcommand{\amzcolorboxtitlesep}{\ \raisebox{2pt}{\scalebox{0.5}{ $\blacktriangleright$}}}
\newenvironment{cbox}[2] % 第一个参数是标题内容，第二个是计数器名称
{\refstepcounter{#2}% 增加指定计数器
\begin{tcolorbox}[rounded corners,      % 四角圆角
                  arc=2mm,              % 圆角半径
                  title = {\textbf{\csname #2name\endcsname~\thesection.\arabic{#2}\amzcolorboxtitlesep  } #1}, % 动态生成标题
                  boxrule = 0.7pt, 
                  fonttitle = \bfseries, 
                  colframe = black!90, % 边框颜色
                  colback = black!10, % 背景颜色
                  width=\linewidth, % 设置宽度
                  breakable, % 启用分页功能
                  enhanced jigsaw, % 提供更灵活的分页布局
                  parskip=0mm, % 避免额外的分页间距
                  before=\vspace{0pt}, % 分页前无额外空白
                  after=\vspace{0pt}, % 分页后无额外空白
                  before skip=10pt, % 整体盒子与正文的上间距
                  after skip=10pt % 整体盒子与正文的下间距
                 ]}
{\end{tcolorbox}}


% ---- 计数器对应名字
\newcommand{\theoremcountername}{Theorem}
\newcommand{\definitioncountername}{Definition}
\newcommand{\corollarycountername}{Corollary}
\newcommand{\propositioncountername}{Proposition}
\newcommand{\lemmacountername}{Lemma}
\newcommand{\axiomcountername}{Axiom}
\newcommand{\conventioncountername}{Convention}
\newcommand{\conclusioncountername}{Conclusion}

% ---- 定义具体环境
\newenvironment{theorem}[1]
{\begin{cbox}{#1}{theoremcounter}}{\end{cbox}}
\newenvironment{definition}[1]
{\begin{cbox}{#1}{definitioncounter}}{\end{cbox}}
\newenvironment{corollary}[1]
{\begin{cbox}{#1}{corollarycounter}}{\end{cbox}}
\newenvironment{proposition}[1]
{\begin{cbox}{#1}{propositioncounter}}{\end{cbox}}
\newenvironment{lemma}[1]
{\begin{cbox}{#1}{lemmacounter}}{\end{cbox}}
\newenvironment{axiom}[1]
{\begin{cbox}{#1}{axiomcounter}}{\end{cbox}}
\newenvironment{convention}[1]
{\begin{cbox}{#1}{conventioncounter}}{\end{cbox}}
\newenvironment{conclusion}[1]
{\begin{cbox}{#1}{conclusioncounter}}{\end{cbox}}

% ---- 禁用自带环境
\let\proof\relax
\let\endproof\relax

% ---- 定义solution
\newenvironment{solution}[1]{
  \noindent\textbf{Solution ~#1:} % 手动输入的计数值作为标题的一部分
  \;% 标题与内容间距
}{
    \par\vspace{1em} % 内容与结尾间距
    \begin{flushright}\textbf{\qed}\end{flushright} % 正体字体
}

% ---- 定义proof
\newenvironment{proof}[1]{
  \noindent\textbf{Proof ~#1:} % 手动输入的计数值作为标题的一部分
  \;% 标题与内容间距
}{
    \par\vspace{1em} % 内容与结尾间距
    \begin{flushright}\textbf{\qed}\end{flushright} % 正体字体
}


% -------------------
% 字体
% -------------------
\renewcommand\qedsymbol{$\squoval$}
\RequirePackage{fontspec}    
\renewcommand{\contentsname}{\sffamily Contents}
\usepackage{sectsty}
\sectionfont{\sffamily}  
\subsectionfont{\sffamily}  
\subsubsectionfont{\sffamily}  
\RequirePackage{unicode-math}
\setmainfont{STIXTwoText}[
  Extension = .otf,
  UprightFont = *-Regular,
  BoldFont = *-SemiBold,
  ItalicFont = *-Italic,
  BoldItalicFont = *-SemiBoldItalic,
]
\setmathfont{STIXTwoMath-Regular.otf}
\setmathfont{STIXTwoMath-Regular.otf}[range={scr,bfscr},StylisticSet=01]
\setmonofont{Inconsolata}
% -------------------
% 重定义命令
% -------------------

% -------------------
% 致谢
% -------------------

% 感谢serenity对本模板的大力支持, 我的恩情bisel拿什么还?