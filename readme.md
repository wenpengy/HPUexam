### HPUexam.cls 河南理工大学试卷模板

模板首页：
![](https://github.com/wenpengy/HPUexam/blob/master/media/first-page.png)

非首页密封线（优化）：
![](https://github.com/wenpengy/HPUexam/blob/master/media/margin.jpg)

#### 模板介绍

HPUexam.cls 模板为河南理工大学考试试卷模板，最新模板发布日期为2017年11月6日，
该模板主要配合exam程序使用，可以实现抽题、出题、排版的自动化。

考试模板提供单栏和双栏排版格式，页码自动更新，未来版本将支持题目类型自动编号。


#### 选项命令和常用命令

模板提供选项：
* twocolumn: 双栏模式
* c5s: 字体为5号
* c4s: 字体为小四号
* question: 输出试题模式
* answer: 输出答案模式
* full: 输出试题和答案模式，此模式中，答案填在试题适当位置 

模板提供的内部命令：
* \timeinfo: 该命令为试卷时间信息，接受2个参数，第一个参数为 __年度__，第二参数为 __学期__
* \courseinfo: 该命令为课程信息，接受2个参数，第一个参数为 __课程名__，第二个
    参数为 __试卷类型__ (A、B卷)
* \examinfo: 该命令为考试信息，接受2个参数，第一个参数为 __成绩占比__，第二个
    参数为 __考试方式__ (开卷或闭卷)。其中第一个参数默认值为60%
* \scoretable: 该命令提供2个参数，第一个参数为 __试题类型__，第二个参数为 __总
    分值__

#### 使用方法

下面是一个典型的使用案例：
```tex
\documentclass[twocolumn,answer,full,c5s]{HPUexam}
\begin{document}

\thispagestyle{HPUFirstPage}
说明：试题定义两个2中页面风格，默认使用HPU风格，但首页必须要用HPUFirstpage风格
。

\timeinfo{2018——2019}{二}

\courseinfo{金属材料学}{A}

\examinfo{闭卷}
此命令默认成绩占比为60，如果要调整百分比为50，可以写成：
\examinfo[50]{闭卷}

\scoretable{一、填空题，每空1分}{20}

1. 试题1
2. 试题2
3. 试题3
...

\scoretable{二、选择题}{20}

1. 试题1
2. 试题2
3. 试题3
...
\end{document}
```

#### 日志

2020-06-30

* 发布0.1版本，满足基本排版要求
* 定义2中页面风格，可以切换
* 定义6个选项，根据实际情况选择
* 定义4条默认命令

#### TODO LIST

* 增加题型自动编号
* 填空题自动根据答案增加下划线长度
* 增加选择题根据选项自动断行

**注明：** 以上自动自动化内容已经通过exam程序实现。未来开发目标针对使用人员是
手工录入题目的用户。
