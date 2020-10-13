% HPUexam.cls
%
% A LaTeX2e document class for preparing exams in HPU.

% Copyright (c) 2020-2021 Yang Wenpeng 
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2003/12/01 or later.
%
% This work has the LPPL maintenance status "author-maintained".
%
% This work consists of the files HPUexam.cls and HPUexamdoc.tex.
%

%%% Yang Wenpeng
%%% Henan polytechnic university
%%% Jiaozuo
%%% wenpengy@gmail.com

\def\fileversion{0.1}
\def\filedate{2020/06/28}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{HPUexam}[\filedate\space Version \fileversion\space by
Yang Wenpeng]

\newif\iftestmode \testmodefalse
\DeclareOption{test}{\testmodetrue}

\newif\ifkeysmode \keysmodefalse
\DeclareOption{keys}{\keysmodetrue}

\newif\ifanswermode \answermodefalse
\DeclareOption{answer}{\answermodetrue}

\newif\ifanswermode \answermodefalse
\DeclareOption{full}{\answermodetrue}

\newcommand\@fontsize{false}
\DeclareOption{c5s}{\renewcommand\@fontsize{5}}
\DeclareOption{c4s}{\renewcommand\@fontsize{-4}}

\newif\if@twocolumn \@twocolumnfalse
\DeclareOption{twocolumn}{\@twocolumntrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\RequirePackage[UTF8, zihao = \@fontsize]{ctex}
\ctexset{linestretch = 4, autoindent = 0pt}

%------------------------------- 大题 ----------------------------------%
% \ctexset{section = {name = {,、\hspace*{-5mm}},number = \chinese{section},format = {\zihao{5}\heiti\raggedright}}}
% \ctexset{subsection = {name = {\hspace{5mm},\hspace*{-1mm}},number = (\chinese{subsection}),format = {\zihao{5}\heiti\raggedright}}}
%------------------------------- 大题 ----------------------------------%

\RequirePackage{tabularx, ifthen} % 排选项用
\RequirePackage{makecell}
\RequirePackage[cbgreek]{textgreek}
\RequirePackage[separate-uncertainty=true,bracket-numbers=false,multi-part-units=single]{siunitx}
\RequirePackage{titlesec}%titlesec宏包调整section与正文间距
\RequirePackage{xcolor,graphicx,caption} % 彩色、图片、图释
\RequirePackage{geometry,fancyhdr,calc} % 纸张、边距、页眉、页脚
\RequirePackage{etoolbox}
\RequirePackage{ulem}
\RequirePackage{tasks}
\RequirePackage{amsmath,amsmath,amssymb} % ams数学相关
% \RequirePackage{unicode-math}
% \setmainfont{STIX2Text-Regular.otf}
% \setmathfont{STIX2Math.otf}
\RequirePackage{pifont} % 带圈数字\ding
\RequirePackage{bbding} % 图案
\RequirePackage{romannum} % 罗马数字
\RequirePackage{enumitem}
\RequirePackage{wrapfig}
\RequirePackage{eso-pic}

%%%----------数学类---------%%%
%=======================================================================
\RequirePackage{amsmath,amssymb}%
\def\dif{\mathop{}\!\mathrm{d}}
\DeclareMathOperator{\rank}{rank}
\RequirePackage{bm}
\RequirePackage{pifont}
\RequirePackage{extarrows} %长等号
\RequirePackage{scalerel}%缩放公式大小

\AtBeginDocument{
  \pagenumbering{arabic}  % 使用阿拉伯数字页码
  \pagestyle{HPU}
}

%
% 双栏显示
%
\if@twocolumn
  \geometry{a3paper,landscape,twocolumn,columnsep=20mm,left=40mm,right=30mm,top=25mm,bottom=20mm,footskip=20pt,headheight=20mm}
  % \geometry{a3paper,twocolumn,landscape,hmargin={3.5cm,1.3cm},vmargin={1.5cm,1.5cm},footskip=0.75cm,headsep=0.25cm}
\else
  \geometry{a4paper,left=30mm,right=30mm,top=35mm,bottom=25mm, headheight=20mm}
\fi


%%---------------------------------- 定理\引理\定义样式设置 ------------------------------------%%
\RequirePackage{amsthm}
\renewcommand{\proofname}{\heiti{证明}}
%\newenvironment{proof}{\par\noindent{\heiti{证明.\,}}}{\hspace*{\fill}{$\Box$}\par}
%\newenvironment{proof}{\par\noindent{\heiti{证明.\,}}\small}{\hfill$\Box$\quad\par}
\newenvironment{Proof}{\par\noindent{\heiti{证明.\,}}\small}{\hfill$\Box$\quad\par}
\newenvironment{Solution}{\par\noindent{\heiti{解.\,}}}{\hspace*{\fill}{$\Diamond$}\par}
%-----------------------------------------------------------------------------
%\RequirePackage{amsthm}
\RequirePackage{thmtools}
\declaretheoremstyle[
spaceabove=0pt, spacebelow=0pt,
headfont=\normalfont\bfseries,
notefont=\mdseries, notebraces={(}{)},
bodyfont=\normalfont,
postheadspace=0.5em,
headindent=0em,
headpunct={:},
qed=$\blacktriangleleft$,
numbered=no
]{solstyle}
\declaretheorem[style=solstyle,shaded={rulecolor=red,
rulewidth=0.5pt, bgcolor={rgb}{1,1,1}},name=解]{solution}
%-----------------------------------------------------------------------------


%%--------------------------设置数学字体为新罗马字体----------------------------
\RequirePackage[T1]{fontenc}
\RequirePackage{mathptmx}
%%-----------------------------------------------------------------------------


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%------------------------------------------页眉页脚-%-装订线----------------------------------------%
\RequirePackage{tikz}
\RequirePackage{lastpage}
\newcommand{\defen}[2][1cm]{\hspace*{\fill}\raisebox{-1.1ex}{\tikz\draw[line width=1pt,dash pattern=on 1pt off 2.5pt on 1pt off 2.5pt] (0pt,0pt)--(#1 ,0pt)node[right=-1mm]{(#2~分)};}\newline}
\pagestyle{fancy}
\fancyhf{}
\fancypagestyle{HPUFirstPage}{
  \renewcommand{\headrulewidth}{0pt}
  \setlength{\columnseprule}{0.4pt}
  \setlength{\columnsep}{1.8cm}
  \usetikzlibrary{calc}
  \fancyfoot[LO]{
    \begin{tikzpicture}[remember picture,overlay]
      \draw (current page.west)++(13.5mm,0) node (studyt) {\rotatebox[origin=c]{90}{\zihao{-4} 专业班级\underline{\hspace{5cm}}\hspace{0.5cm} 姓名\underline{\hspace{3.5cm}}\hspace{0.5cm}学号\underline{\hspace{3.5cm}}}};
      %
      \draw (current page.west)++(24mm,0) node (f) {\rotatebox{90}{封}};
      \draw (f)++(0,-6cm) node (m) {\rotatebox[origin=c]{90}{密}};
      \draw (m)++(0,-6cm) node (b) {};
      \draw (f)++(0,6cm) node (x) {\rotatebox[origin=c]{90}{线}};
      \draw (x)++(0,6cm) node (t) {};
      \draw [dotted, ultra thick] (b)--(m)--(f)--(x)--(t);
      % \draw [dotted, ultra thick] (o)--(f)--(x);
  \end{tikzpicture}}
  \fancyfoot[C]{第~\thepage{}~页 \quad (共~\pageref{LastPage}~页)}
  \renewcommand{\headrulewidth}{0pt}
}

\fancypagestyle{HPU}{
  \renewcommand{\headrulewidth}{0pt}
  \setlength{\columnseprule}{0.4pt}
  \setlength{\columnsep}{1.8cm}
  \usetikzlibrary{calc}
  \fancyfoot[LO]{
    \begin{tikzpicture}[remember picture,overlay]
      \draw (current page.west)++(18mm,0) node (studyt) {\rotatebox[origin=c]{90}{\zihao{-4}\heiti★~注意：答题请勿超过此密封线!}};
      %
      \draw (current page.west)++(24mm,0) node (f) {\rotatebox{90}{封}};
      \draw (f)++(0,-6cm) node (m) {\rotatebox[origin=c]{90}{密}};
      \draw (m)++(0,-6cm) node (b) {};
      \draw (f)++(0,6cm) node (x) {\rotatebox[origin=c]{90}{线}};
      \draw (x)++(0,6cm) node (t) {};
      \draw [dotted, ultra thick] (b)--(m)--(f)--(x)--(t);
  \end{tikzpicture}}
  \fancyfoot[C]{第~\thepage{}~页 \quad (共~\pageref{LastPage}~页)}
  \renewcommand{\headrulewidth}{0pt}
}


%-------------------------------------------------------------------------------------------------


\newcommand{\watermark}[3]{\AddToShipoutPictureBG{%
    \parbox[b][\paperheight]{\paperwidth}{%
      \vfill%
      \centering%
      \tikz[remember picture, overlay]%
      \node [rotate = #1, scale = #2] at (current page.center)%
      {\textcolor{gray!80!cyan!30}{#3}};
\vfill}}}
%\watermark{60}{6}{14-金融工程-白兔兔}
%-------------------表格-------------------%
\RequirePackage{array}%m{3em}
\usepackage{tabularx}
\newcolumntype{Y}{>{\centering\arraybackslash}X}
%--------------------------------------

%=======================================================================
\RequirePackage{color,xcolor}%-颜色-%
%==============================================================================


\RequirePackage{enumitem}

\def\juemi{\noindent{\heiti\zihao{-4} 绝密$\bigstar$启用前}}
\def\biaoti#1{\begin{center}{\zihao{3} #1}\end{center}}
\def\fubiaoti#1{\begin{center}{\zihao{2}\heiti #1}\end{center}}

\newcommand{\timeinfo}[2]{
  \begin{center}
    \vspace{2ex} \heiti \zihao{-3} 河南理工大学\uline{\makebox[9em]{#1}}学年第\uline{\makebox[3em]{#2}}学期\vspace{1ex}
  \end{center}
}

\newcommand{\courseinfo}[2]{
  \begin{center}
    \vspace{2ex} \heiti {\zihao{-2}《#1》试卷}\zihao{4}（#2卷）\vspace{2ex}
  \end{center}
}

\newcommand{\examinfo}[2][60]{
  \newcolumntype{M}{>{\bfseries\songti}p{5.05cm}<{\centering}}
  \begin{tabular}{|M|M|M|} \hline
    考试方式 & \makecell{{本试卷考试分数占}\\{学生总评成绩比例}} & 总得分 \\ \hline
    #2 & {\bfseries #1\%}  & \makecell{{ }\\{ }} \\ \hline
  \end{tabular}
  \vspace{2ex}
}

\newcommand{\scoretable}[2]{
  \renewcommand{\arraystretch}{1.3}
  \newcolumntype{F}{>{\bfseries\heiti}p{1.4cm}<{\centering}}
  \vspace{2ex}
  \begin{tabular}[b]{|F|F|p{12cm}} \cline{1-2}
    分数 & #2 & {\bfseries \songti #1}\\\cline{1-2}
    得分 & &\\\cline{1-2}
  \end{tabular}
  \vspace{2ex}
}

\setlength{\baselineskip}{1.5ex}
\setlength{\parskip}{2ex}

\endinput
