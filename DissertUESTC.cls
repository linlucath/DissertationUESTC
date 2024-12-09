%%%%%%----------------- identification field -----------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{DissertUESTC}

%%%%%%----------------- initial code -----------------


\RequirePackage{ifthen}

\newcommand{\dissertationtype}{graduate}  % 用于后续判断文档类型
\newcommand{\insertemptypage}{}
\newcommand{\insertevenemptypage}{}
\newcommand{\evenpagemark}{}
\newcommand{\achievementtext}{}
\newcommand{\covertitletext}{}
\newcommand{\covertitleentext}{}
\newcommand{\majlabel}{}
\newlength{\nametitleorgskip}
\newcommand{\majorlabel}{}
\newcommand{\entitlepagemidtext}{}
\newcommand{\clsnum}{}
\newcommand{\clslv}{}
\newcommand{\udc}{}
\newcommand{\dissertationtitle}{}
\newcommand{\supervisor}{}
\newcommand{\supervisortitle}{}
\newcommand{\supervisororg}{}
\newcommand{\supervisorloc}{}
\newcommand{\associatesupervisor}{}
\newcommand{\associatesupervisortitle}{}
\newcommand{\associatesupervisororg}{}
\newcommand{\associatesupervisorloc}{}
\newcommand{\deglv}{}
\newcommand{\major}{}
\newcommand{\profield}{}
\newcommand{\submitdate}{}
\newcommand{\debatedate}{}
\newcommand{\grantorg}{}
\newcommand{\grantdate}{}
\newcommand{\chairreviewer}{}
\newcommand{\reviewers}{}

\newcommand{\ClsNum}[1]{
	\renewcommand{\clsnum}{#1}
}
\newcommand{\ClsLv}[1]{
	\renewcommand{\clslv}{#1}
}
\newcommand{\UDC}[1]{
	\renewcommand{\udc}{#1}
}
\newcommand{\DissertationTitle}[1]{
	\renewcommand{\dissertationtitle}{#1}
}
\newcommand{\Author}[1]{
	\renewcommand{\author}{#1}
}
\newcommand{\Supervisor}[4]{
	\renewcommand{\supervisor}{#1}
	\renewcommand{\supervisortitle}{#2}
	\renewcommand{\supervisororg}{#3}
	\renewcommand{\supervisorloc}{#4}
}
\newcommand{\AssociateSupervisor}[4]{
	\renewcommand{\associatesupervisor}{#1}
	\renewcommand{\associatesupervisortitle}{#2}
	\renewcommand{\associatesupervisororg}{#3}
	\renewcommand{\associatesupervisorloc}{#4}
}
\newcommand{\DegLv}[1]{
	\renewcommand{\deglv}{#1}
}
\newcommand{\Major}[1]{
	\renewcommand{\major}{#1}
}
\newcommand{\Profield}[1]{
	\renewcommand{\profield}{#1}
}
\newcommand{\Date}[2]{
	\renewcommand{\submitdate}{#1}
	\renewcommand{\debatedate}{#2}
}
\newcommand{\Grant}[2]{
	\renewcommand{\grantorg}{#1}
	\renewcommand{\grantdate}{#2}
}
\newcommand{\Reviewer}[2]{
	\renewcommand{\chairreviewer}{#1}
	\renewcommand{\reviewers}{#2}
}


\newcommand{\uestctocname}{目\hspace{1em}录}
% 控制目录中各级标题的缩进距离
\newcommand{\tocsecindent}{1.7em}
\newcommand{\tocsubsecindent}{3.6em}
\newcommand{\tocsubsubsecindent}{6em}

\newcommand{\uestcfigcapmargin}{4em}  % 控制图题左右侧缩进，本科2em，研究生4em
\newcommand{\subfigformat}{}


%% 定义parbox中内容为空时的占位命令
\newcommand{\Phantom}[1]{%
	\ifthenelse{\equal{#1}{}}%
	{\phantom{占位}}%
	{#1}%
}

\newcommand{\uestclightrulewidth}{0.75bp}  % 用于设置\midrule默认线高，本科0.5bp，研究生0.75bp


% 引入伪页码计数器，用以计算摘要之后正文之前的前置部分的右手页的偶数页码
\newcounter{pseudopage}
\setcounter{pseudopage}{0}



%%%%%%----------------- declaration of options -----------------

\DeclareOption{print}{
	% 该命令插入无任何内容的空白页
	\renewcommand{\insertemptypage}{
		\null
		\newpage
		\thispagestyle{empty}
		\null
	}
	
	% 该命令在当前位置处于奇数页时插入一空白页作为左手边的页面
	\renewcommand{\insertevenemptypage}{
		\addtocounter{pseudopage}{\value{page}}
		\ifthenelse{\isodd{\value{pseudopage}}}
			{
				\insertemptypage
				\addtocounter{page}{-1}
				\addtocounter{pseudopage}{1}
			}{}
		\addtocounter{pseudopage}{-\value{page}}
	}
}


\DeclareOption{nonprint}{
	\renewcommand{\insertemptypage}{}
	\renewcommand{\insertevenemptypage}{}
}


\DeclareOption{bachelor}{
	\renewcommand{\dissertationtype}{bachelor}
	\renewcommand{\evenpagemark}{电子科技大学学士学位论文}
	\renewcommand{\achievementtext}{攻读学士学位期间取得的成果}
	\renewcommand{\covertitletext}{学士学位论文}
	\renewcommand{\covertitleentext}{BACHELOR THESIS}
	\renewcommand{\majlabel}{专\hspace{2em}业}
	\setlength{\nametitleorgskip}{6bp}
	\renewcommand{\majorlabel}{专\hspace{2em}业}
	\renewcommand{\entitlepagemidtext}{A Master Thesis Submitted to \\ University of Electronic Science and Technology of China}
	\DegLv{学士}
	\renewcommand{\uestctocname}{目\hspace{0.5em}录}
	\renewcommand{\tocsecindent}{1em}
	\renewcommand{\tocsubsecindent}{2em}
	\renewcommand{\tocsubsubsecindent}{3em}
	\renewcommand{\uestcfigcapmargin}{2em}
	\renewcommand\uestclightrulewidth{0.5bp}
}

\DeclareOption{master}{
	\renewcommand{\evenpagemark}{电子科技大学硕士学位论文}
	\renewcommand{\achievementtext}{攻读硕士学位期间取得的成果}
	\renewcommand{\covertitletext}{硕士学位论文}
	\renewcommand{\covertitleentext}{MASTER THESIS}
	\renewcommand{\majlabel}{学科专业}
	\setlength{\nametitleorgskip}{6bp}
	\renewcommand{\majorlabel}{学科专业}
	\renewcommand{\entitlepagemidtext}{A Master Thesis Submitted to \\ University of Electronic Science and Technology of China}
	\DegLv{硕士}
}

\DeclareOption{promaster}{
	\renewcommand{\evenpagemark}{电子科技大学硕士学位论文}
	\renewcommand{\achievementtext}{攻读硕士学位期间取得的成果}
	\renewcommand{\covertitletext}{专业学位硕士学位论文}
	\renewcommand{\covertitleentext}{MASTER THESIS FOR PROFESSIONAL DEGREE}
	\renewcommand{\majlabel}{\scalebox{0.66}[1.0]{专业学位类别}}
	\setlength{\nametitleorgskip}{-8bp}
	\renewcommand{\majorlabel}{专业学位类别}
	\renewcommand{\entitlepagemidtext}{A Master Thesis Submitted to \\ University of Electronic Science and Technology of China}
	\DegLv{硕士}
}

\DeclareOption{doctor}{
	\renewcommand{\evenpagemark}{电子科技大学博士学位论文}
	\renewcommand{\achievementtext}{攻读博士学位期间取得的成果}
	\renewcommand{\covertitletext}{博士学位论文}
	\renewcommand{\covertitleentext}{DOCTORAL DISSERTATION}
	\renewcommand{\majlabel}{学科专业}
	\setlength{\nametitleorgskip}{6bp}
	\renewcommand{\majorlabel}{学科专业}
	\renewcommand{\entitlepagemidtext}{A Doctoral Dissertation Submitted to \\ University of Electronic Science and Technology of China}
	\DegLv{博士}
}

\DeclareOption{prodoctor}{
	\renewcommand{\evenpagemark}{电子科技大学博士学位论文}
	\renewcommand{\achievementtext}{攻读博士学位期间取得的成果}
	\renewcommand{\covertitletext}{专业学位博士学位论文}
	\renewcommand{\covertitleentext}{DOCTORAL DISSERTATION FOR PROFESSIONAL DEGREE}
	\renewcommand{\majlabel}{\scalebox{0.66}[1.0]{专业学位类别}}
	\setlength{\nametitleorgskip}{-8bp}
	\renewcommand{\majorlabel}{专业学位类别}
	\renewcommand{\entitlepagemidtext}{A Doctoral Dissertation Submitted to \\ University of Electronic Science and Technology of China}
	\DegLv{博士}
}

\DeclareOption{subfigsimple}{
	\renewcommand{\subfigformat}{simple}
}

\DeclareOption{subfigparens}{
	\renewcommand{\subfigformat}{parens}
}


\DeclareOption*{
	\ifthenelse{\equal{\CurrentOption}{boxruled}}
		{\PassOptionsToPackage{\CurrentOption}{algorithm2e}}
		{\ifthenelse{\equal{\CurrentOption}{vlined}}
			{\PassOptionsToPackage{\CurrentOption}{algorithm2e}}
			{\ifthenelse{\equal{\CurrentOption}{draftfig}}
				{\PassOptionsToPackage{draft}{graphicx}}
				{\PassOptionsToClass{\CurrentOption}{book}}
			}
		}
}

%%%%%%----------------- execution of options -----------------

\ExecuteOptions{print,doctor,subfigparens}
\ProcessOptions\relax

%%%%%%----------------- package loading -----------------

\LoadClass[openany]{book}  % 基于标准book类，取消章节只从奇数页（openright）开始
\RequirePackage[UTF8]{ctex}
\RequirePackage{xeCJKfntef}  % 中文添加下划线需要
\RequirePackage{calc}
\RequirePackage{color}
\RequirePackage{layouts}
\RequirePackage{zhnumber}
\RequirePackage{titlesec}
\RequirePackage{titletoc}  % 调整各级标题需要
\RequirePackage[titles]{tocloft} % 调整图目录、表目录需要，titles选项使用LaTex默认命令排版目录标题
\RequirePackage{fancyhdr}
\RequirePackage{afterpage}
% 生成带编号的书签，并设置书签深度（bookmarksdepth不显示赋值则取tocdepth值），参考hyperref宏包文档
\RequirePackage[
	bookmarksnumbered=true,
	bookmarksdepth=3,
	citecolor=black,
	linkcolor=black,
	urlcolor=black,
]{hyperref}
\RequirePackage{graphicx}
\RequirePackage[font=small]{subfig}
%\RequirePackage{soul}
\RequirePackage[numbers,sort&compress]{natbib}  % 排版参考文献和文献引用样式需要
\RequirePackage{nomencl}
\RequirePackage{amssymb, amsmath, amsthm}
\RequirePackage{caption}
\RequirePackage[algochapter, linesnumbered, ruled]{algorithm2e}
\RequirePackage{appendix}
\RequirePackage{xunicode-addon}
\RequirePackage{xpatch}
\RequirePackage{scrextend}  % 调整脚注的缩进设置
% 脚注序号每页重置
% https://wenku.csdn.net/answer/37441a87026a40a28ff235d24c15c879
\RequirePackage[perpage]{footmisc}
\RequirePackage{enumitem}  % 调整list的边距需要
\RequirePackage{array}
% https://blog.csdn.net/weixin_43971980/article/details/96514640
\RequirePackage[flushleft]{threeparttable}  % 排版带附注的表格需要，选项参考宏包文档
\RequirePackage{booktabs}  % 调整三线表线宽需要
\RequirePackage{longtable}  % 跨页表格需要
\RequirePackage{xparse}  % 定义带多个可选参数的命令或环境时需要
\RequirePackage{centerlastline}  % 设计封面中的标题最后一行居中需要
\RequirePackage{multirow}  % 表格合并多行单元格需要
\RequirePackage{extarrows} % 带文字的长等号与箭头需要


%%----------------- main code -----------------

\setlength{\paperwidth}{210mm}
\setlength{\paperheight}{297mm}
\setlength{\topmargin}{2cm-1in}
\setlength{\oddsidemargin}{3cm-1in}
\setlength{\evensidemargin}{3cm-1in}
\setlength{\headheight}{9bp}
\setlength{\textwidth}{\paperwidth-6cm}
\setlength{\textheight}{\paperheight-6cm}
\setlength{\headsep}{1cm-\headheight}
\setlength{\footskip}{1cm}
\setlength{\emergencystretch}{3em}


%%%%%% 设置各种字体，https://www.cnblogs.com/54fire/p/10409570.html
\setmainfont{Times New Roman}  % 英文正文罗马字体
\setsansfont{Times New Roman}  % 英文正文无衬线字体
% \setmonofont{Times New Roman}  % 英文正文等宽字体
\setCJKmainfont{SimSun}[
	AutoFakeBold=2,
	AutoFakeSlant=0.3,
	Path = ./font/,
]   % 正文中文字体——宋体
\setCJKsansfont{SimHei}[
	AutoFakeBold=2,
	AutoFakeSlant=0.3,
	Path = ./font/,
]   % 正文中文无衬线字体——黑体
%\setCJKmonofont{STZHONGS}[
%	AutoFakeBold=2,
%	AutoFakeSlant=0.3,
%	Path = ./font/,
%]   % 正文中文等宽字体——华文中宋

%% 定义ctex包默认字体之外的其他字体：
% https://blog.csdn.net/ProgramChangesWorld/article/details/51429138
% https://latex.lierhua.top/zh/docs/%E5%AD%97%E4%BD%93%E6%97%8F/
\newCJKfontfamily\hwzs{HuaWenZhongSong}  % 为研究生封面添加需要的华文中宋字族
\setCJKfamilyfont{hwzs}{STZHONGS}[
	AutoFakeBold=2,
	AutoFakeSlant=0.3,
	Path = ./font/,
] % 设置华文行楷字族使用的字体文件和字形等属性

\newCJKfontfamily\hwxk{HuaWenXingKai}  % 为本科封面添加需要的华文行楷字族
\setCJKfamilyfont{hwxk}{STXINGKA}[
	AutoFakeBold=2,
	AutoFakeSlant=0.3,
	Path = ./font/,
] % 设置华文行楷字族使用的字体文件和字形等属性


%%%%%% 让公式中支持中文，https://zhuanlan.zhihu.com/p/636127392
\xeCJKsetup{CJKmath=true}
%% 调整公式段前段后，https://www.zhihu.com/question/379358826
\abovedisplayskip=8bp plus 1bp minus 1bp
\abovedisplayshortskip=4bp plus 1bp minus 1bp
\belowdisplayskip=8bp plus 1bp minus 1bp
\belowdisplayshortskip=8bp plus 1bp minus 2bp


\graphicspath{{./fig/}}

\hypersetup{colorlinks=true,linkcolor=black}
\setcitestyle{numbers,square}



%% 构建论文封面，研究生和学士差异很大
\ifthenelse{\equal{\dissertationtype}{graduate}}{
	\newcommand\uestccover[7]{
		\newpage\thispagestyle{empty}
		\pdfbookmark[0]{论文封面}{bookmarkcover}%
		\vspace*{13bp}
		{\fontsize{22bp}{16.9bp}\selectfont\centering%
			电\hspace{0.35cm}子\hspace{0.35cm}科\hspace{0.35cm}%
			技\hspace{0.35cm}大\hspace{0.35cm}学\hspace{0.35cm} \par}
		\vspace*{6bp}
		{\fontsize{12bp}{9.23bp}\selectfont\centering%
			UNIVERSITY OF ELECTRONIC SCIENCE AND TECHNOLOGY OF CHINA\par}
		\vspace*{3cm-34bp}
		{\fontsize{42bp}{32.31bp}\selectfont\centering%
			\covertitletext\par}
		\vspace*{10bp}\par
		{\fontsize{16bp}{12.31bp}\selectfont\centering%
			\covertitleentext\par}
		\vspace*{1.85cm}\par
		{\centering\includegraphics[height=5.0cm]{uestclogo}\par}
		\vspace*{1.75cm-5bp}\par
		{\hwzs\bfseries\fontsize{18bp}{0.77cm}\selectfont\raggedright%
			\parbox[t]{3cm}{\centering 论文题目}%
			\parbox[t][3.6cm]{10.5cm}{%
				\begin{centerlastline}%
					\CJKunderline*[thickness=0.5bp, depth=8bp]{\Phantom{#1}}%
				\end{centerlastline}%
				\par\vspace*{-\baselineskip}%
				\rule[-8.5bp]{\linewidth}{0.5bp}}}%
		\par\vspace*{0bp}
		{\rmfamily\bfseries\zihao{3}\setlength{\baselineskip}{1cm}\noindent%
			\hspace*{1.5cm}\makebox[3cm][c]{\majlabel}%
			\CJKunderline*[thickness=0.5bp, depth=4bp]{\makebox[9cm][c]{#2}}%
			\par\vspace*{0bp}\noindent
			\hspace*{1.5cm}\makebox[3cm][c]{学\hspace{2em}号}%
			\CJKunderline*[thickness=0.5bp, depth=4bp]{\makebox[9cm][c]{#3}}%
			\par\vspace*{0bp}\noindent
			\hspace*{1.5cm}\makebox[3cm][c]{作者姓名}%
			\CJKunderline*[thickness=0.5bp, depth=4bp]{\makebox[9cm][c]{#4}}%
			\par\vspace*{0bp}\noindent
			\hspace*{1.5cm}\makebox[3cm][c]{指导教师}%
			\CJKunderline*[thickness=0.5bp, depth=4bp]{\makebox[9cm][c]{#5\hspace{2em}#6}}%
			\par\vspace*{1bp}\noindent
			\hspace*{1.5cm}\makebox[3cm][c]{学\hspace{2em}院}%
			\CJKunderline*[thickness=0.5bp, depth=4bp]{\makebox[9cm][c]{#7}}
			\par\vspace*{-\baselineskip}\insertemptypage}
	}
}{
	\newcommand\uestccover[7]{
		\newpage\thispagestyle{empty}
		\pdfbookmark[0]{论文封面}{bookmarkcover}%
		\vspace*{-12bp}
		{\hwxk\bfseries\zihao{1}\setlength{\baselineskip}{26bp}\selectfont\centering%
			电\hspace{0.25cm}子\hspace{0.25cm}科\hspace{0.25cm}%
			技\hspace{0.25cm}大\hspace{0.25cm}学 \par}
		\vspace*{7bp}
		{\fontsize{12bp}{9.23bp}\selectfont\centering%
			UNIVERSITY OF ELECTRONIC SCIENCE AND TECHNOLOGY OF CHINA\par}
		\vspace*{32bp}
		{\bfseries\fontsize{42bp}{32.31bp}\selectfont\centering%
			\covertitletext\par}
		\vspace*{10bp}\par
		{\bfseries\fontsize{16bp}{12.31bp}\selectfont\centering%
			\covertitleentext\par}
		\vspace*{1.7cm}\par
		{\centering\includegraphics[height=3.25cm]{uestclogo}\par}
		\vspace*{3.3cm}\par
		{\bfseries\raggedright%
			\hspace*{1em}\parbox[t]{3cm}{\hwzs\fontsize{18bp}{0.77cm}\selectfont\centering 论文题目}%
			\parbox[t][3.6cm]{10.5cm}{%
				\fontsize{16bp}{26bp}\selectfont
				\begin{centerlastline}%
					\CJKunderline*[thickness=0.5bp, depth=8bp]{\Phantom{#1}}%
				\end{centerlastline}%
				\par\vspace*{-\baselineskip}%
				\rule[-8.5bp]{\linewidth}{0.5bp}}}%
		\par\vspace*{20bp}
		{\bfseries\zihao{3}\setlength{\baselineskip}{1.25cm}\selectfont\noindent%
			\hspace*{1.5cm}\makebox[3cm][c]{\hwzs 学\hspace{2em}院}%
			\CJKunderline*[thickness=0.5bp, depth=4bp]{\makebox[9cm][c]{#7}}
			\par\vspace*{0bp}\noindent
			\hspace*{1.5cm}\makebox[3cm][c]{\hwzs \majlabel}%
			\CJKunderline*[thickness=0.5bp, depth=4bp]{\makebox[9cm][c]{#2}}%
			\par\vspace*{0bp}\noindent
			\hspace*{1.5cm}\makebox[3cm][c]{\hwzs 学\hspace{2em}号}%
			\CJKunderline*[thickness=0.5bp, depth=4bp]{\makebox[9cm][c]{#3}}%
			\par\vspace*{0bp}\noindent
			\hspace*{1.5cm}\makebox[3cm][c]{\hwzs 作者姓名}%
			\CJKunderline*[thickness=0.5bp, depth=4bp]{\makebox[9cm][c]{#4}}%
			\par\vspace*{0bp}\noindent
			\hspace*{1.5cm}\makebox[3cm][c]{\hwzs 指导教师}%
			\CJKunderline*[thickness=0.5bp, depth=4bp]{\makebox[9cm][c]{#5\hspace{2em}#6}}%
			\par\vspace*{-\baselineskip}\insertemptypage}
	}
}




%% 中文扉页
\newcommand\uestczhtitlepage{{
	\newpage\thispagestyle{empty}
	\rmfamily\zihao{-4}\raggedright%
	\vspace*{-\baselineskip}\par\vspace*{4bp}%
	\pdfbookmark[0]{中文扉页}{bookmarkzhtitlepage}%
	\parbox[b][0.8cm][b]{1.5cm}{\filright 分类号}%
	\parbox[b][0.8cm][b]{6cm}{\centering%
		\CJKunderline*[thickness=0.5bp, depth=2bp]{\hfill \clsnum \hfill}}%
	\parbox[b][0.8cm][b]{1.5cm}{\centering 密级}%
	\parbox[b][0.8cm][b]{6cm}{\centering%
		\CJKunderline*[thickness=0.5bp, depth=2bp]{\hfill \clslv%
			\hfill}}\par\vspace*{-3bp}
	\parbox[b][0.8cm][b]{1.5cm}{\filright UDC\textsuperscript{注1}}%
	\parbox[b][0.8cm][b]{6cm}{\CJKunderline*[thickness=0.5bp, depth=2bp]{\hfill \udc%
			\hfill}}\par\vspace*{-8bp}
	\parbox[b][2.5cm][b]{15cm}{\hwzs\zihao{-0}\centering%
		学\hspace{1em}位\hspace{1em}论\hspace{1em}文\par\vspace*{1bp}}
	\parbox[b][2.5cm][b]{15cm}{\hwzs\zihao{-2}\hspace*{2cm}%
		\parbox[b]{11cm}{\centering\bfseries \dissertationtitle} \par\vspace{-\baselineskip}%
		\rule[-8bp]{\linewidth}{0.5bp}}\par\vspace*{-8bp}
	\parbox[b][0.8cm]{15cm}{\centering （题名和副题名）}\par\vspace*{0bp}
	\hspace*{5cm}\parbox[b][1.5cm][b]{5cm}{\zihao{3}\centering\bfseries%
		\author\par\vspace{-\baselineskip}%
		\rule[-5bp]{\linewidth}{0.5bp}}\par\vspace*{-8bp}
	\hspace*{5cm}\parbox[b][0.8cm][b]{5cm}{\zihao{-4}\centering%
		（作者姓名）}\par\vspace*{1.3cm+1bp}
	\parbox[b][0.9cm][b]{2.75cm}{\filleft 指导教师}%
	\parbox[b][0.9cm][b]{6.5cm}{\zihao{3}\centering\bfseries \supervisor%
		\par\vspace{-\baselineskip}%
		\rule[-4bp]{\linewidth}{0.5bp}}%
	\parbox[b][0.9cm][b]{3.25cm}{\zihao{3}\filright\bfseries \supervisortitle%
		\par\vspace{-\baselineskip}%
		\rule[-4bp]{\linewidth}{0.5bp}}\par\vspace*{-4bp}
	\hspace*{2.75cm}\parbox[b][0.9cm][b]{6.5cm}{\zihao{3}\centering\bfseries%
		\supervisororg \par\vspace{-\baselineskip}%
		\rule[-4bp]{\linewidth}{0.5bp}}%
	\parbox[b][0.9cm][b]{3.25cm}{\zihao{3}\filright\bfseries%
		\supervisorloc \par\vspace{-\baselineskip}%
		\rule[-4bp]{\linewidth}{0.5bp}}\par%
	\parbox[b][3.3cm][t]{15cm}{
		\ifthenelse{\equal{\associatesupervisor}{}}{
			\vspace*{\nametitleorgskip}\parbox[b][0.8cm]{15cm}{\centering （姓名、职称、单位名称）}}{
			\vspace*{-4bp}\filright
			\hspace*{2.75cm}\parbox[b][0.9cm][b]{6.5cm}{\zihao{3}\centering%
				\bfseries \associatesupervisor \par\vspace{-\baselineskip}%
				\rule[-4bp]{\linewidth}{0.5bp}}%
			\parbox[b][0.9cm][b]{3.25cm}{\zihao{3}\filright\bfseries%
				\associatesupervisortitle \par\vspace{-\baselineskip}%
				\rule[-4bp]{\linewidth}{0.5bp}}\par\vspace*{-4bp}
			\hspace*{2.75cm}\parbox[b][0.9cm][b]{6.5cm}{\zihao{3}\centering\bfseries%
				\associatesupervisororg \par\vspace{-\baselineskip}%
				\rule[-4bp]{\linewidth}{0.5bp}}%
			\parbox[b][0.9cm][b]{3.25cm}{\zihao{3}\filright\bfseries% 
				\associatesupervisorloc \par\vspace{-\baselineskip}%
				\rule[-4bp]{\linewidth}{0.5bp}}\par\vspace*{\nametitleorgskip}
			\parbox[b][0.8cm]{15cm}{\centering （姓名、职称、单位名称）}
		}
	}\par\vspace*{-5bp}
	\parbox[b][0.9cm][b]{2.75cm}{申请学位级别}%
	\parbox[b][0.9cm][b]{4.5cm}{\zihao{4}\centering\bfseries \deglv%
		\par\vspace{-\baselineskip}\rule[-4bp]{\linewidth}{0.5bp}}%
	\parbox[b][0.9cm][b]{2.75cm}{\centering \majorlabel}%
	\parbox[b][0.9cm][b]{5cm}{\zihao{4}\centering\bfseries \major%
		\par\vspace{-\baselineskip}%
		\rule[-4bp]{\linewidth}{0.5bp}}\par\vspace*{-4bp}
	\ifthenelse{\equal{\profield}{}}
	{}
	{
		\parbox[b][0.9cm][b]{2.75cm}{专业学位领域}%
		\parbox[b][0.9cm][b]{12.25cm}{\zihao{4}\centering%
			\hspace*{0.5em} \profield \par\vspace{-\baselineskip}%
			\rule[-4bp]{\linewidth}{0.5bp}}\par\vspace*{-4bp}
	}
	\parbox[b][0.9cm][b]{2.75cm}{提交论文日期}%
	\parbox[b][0.9cm][b]{4.5cm}{\zihao{4}\centering\bfseries \submitdate%
		\par\vspace{-\baselineskip}\rule[-4bp]{\linewidth}{0.5bp}}%
	\parbox[b][0.9cm][b]{2.75cm}{\centering 论文答辩日期}%
	\parbox[b][0.9cm][b]{5cm}{\zihao{4}\centering\bfseries \debatedate%
		\par\vspace{-\baselineskip}%
		\rule[-4bp]{\linewidth}{0.5bp}}\par\vspace*{-5bp}
	\parbox[b][0.9cm][b]{4cm}{学位授予单位和日期}%
	\parbox[b][0.9cm][b]{6cm}{\zihao{4}\centering\bfseries \grantorg%
		\par\vspace{-\baselineskip}\rule[-4bp]{\linewidth}{0.5bp}}%
	\parbox[b][0.9cm][b]{5cm}{\zihao{4}\centering\bfseries \grantdate%
		\par\vspace{-\baselineskip}%
		\rule[-4bp]{\linewidth}{0.5bp}}\par\vspace*{-5bp}
	\parbox[b][0.9cm][b]{3.25cm}{答辩委员会主席}%
	\parbox[b][0.9cm][b]{11.75cm}{\zihao{4}\filright\bfseries%
		\hspace*{0.5em} \chairreviewer \par\vspace{-\baselineskip}%
		\rule[-4bp]{\linewidth}{0.5bp}}\par\vspace*{-4bp}
	\parbox[b][0.9cm][b]{1.5cm}{评阅人}%
	\parbox[b][0.9cm][b]{13.5cm}{\zihao{4}\filright\bfseries%
		\hspace*{0.5em} \mbox{\reviewers} \par\vspace{-\baselineskip}%
		\rule[-4bp]{\linewidth}{0.5bp}}\par\vspace*{-2bp}
	\parbox[b][1.5cm][b]{15cm}{注1：注明《国际十进分类法UDC》的类号。}
	\par\vspace*{-\baselineskip}\insertemptypage}}

%% 英文扉页
\newcommand{\uestcentitlepage}[7]{{%
	\newpage\thispagestyle{empty}%
	\zihao{3}\centering%
	\pdfbookmark[0]{英文扉页}{bookmarkentitlepage}%
	\parbox[t][5cm][c]{13cm}{\zihao{-2}\setlength{\baselineskip}{18bp}%
		\bfseries\centering\vspace*{-15bp} \Phantom{#1}}%
	\par\vspace*{0pt}%
	\parbox[t][8cm][c]{13cm}{\zihao{-3}\setlength{\baselineskip}{22.5bp}%
		\centering\vspace*{-17bp} \entitlepagemidtext}%
	\par\vspace*{0pt}%
	\ifthenelse{\equal{#6}{}}%
	{\parbox[t][1.2cm]{15cm}{}}%
	{\parbox[t][0.8cm]{15cm}{}}%
	\par\vspace*{7pt}%
	\parbox[t][2.4cm][t]{15cm}{%
		\parbox[t]{3cm}{\filleft Discipline}%
		\parbox[t][2.4cm]{12cm}{%
			\bfseries%
			\setlength{\baselineskip}{1.2cm}%
			\begin{centerlastline}%
				\ifthenelse{\equal{#2}{}}
				{\CJKunderline*[thickness=0.5bp, depth=5bp]{\phantom{placeholder}}}%
				{\CJKunderline*[thickness=0.5bp, depth=5bp]{\space #2}}%
			\end{centerlastline}%
			\par\vspace*{-\baselineskip}%
			\rule[-5.5bp]{\linewidth}{0.5bp}%
		}%
	}
	\par\vspace*{0pt}%
	\parbox[t][1.2cm]{3cm}{\filleft Student ID}%
	\CJKunderline*[thickness=0.5bp, depth=5bp]{%
		\parbox[t][1.2cm]{12cm}{\bfseries\centering \Phantom{#3}}}%
	\par\vspace*{0pt}%
	\parbox[t][1.2cm]{3cm}{\filleft Author}%
	\CJKunderline*[thickness=0.5bp, depth=5bp]{%
		\parbox[t][1.2cm]{12cm}{\bfseries\centering \Phantom{#4}}}%
	\par\vspace*{-1pt}%
	\parbox[t][1.2cm]{3cm}{\filleft Supervisor}%
	\CJKunderline*[thickness=0.5bp, depth=5bp]{%
		\parbox[t][1.2cm]{12cm}{\bfseries\centering \Phantom{#5}}}%
	\par\vspace*{-1pt}%
	\ifthenelse{\equal{#6}{}}%
	{}%
	{%
		\makebox[3cm][r]{}%
		\CJKunderline*[thickness=0.5bp, depth=5bp]{%
			\parbox[t][1.2cm]{12cm}{\bfseries\centering \Phantom{#6}}}%
		\par\vspace*{-1pt}%
	}%
	\parbox[t][2.4cm][t]{15cm}{%
		\parbox[t]{3cm}{\filleft School}%
		\parbox[t][2.4cm]{12cm}{%
			\bfseries%
			\setlength{\baselineskip}{1.2cm}%
			\begin{centerlastline}%
				\ifthenelse{\equal{#2}{}}
				{\CJKunderline*[thickness=0.5bp, depth=5bp]{\phantom{placeholder}}}%
				{\CJKunderline*[thickness=0.5bp, depth=5bp]{\space #7}}%
			\end{centerlastline}%
			\par\vspace{-\baselineskip}%
			\rule[-5.5bp]{\linewidth}{0.5bp}}%
	}%
	\par\vspace*{-\baselineskip}\insertemptypage}}

%% 声明页
\newcommand{\declaration}[4][3cm]{
	\newpage\thispagestyle{empty}
	
	\vspace*{18bp}%
	\pdfbookmark[0]{独创性声明}{bookmarkdeclaration}%
	{\hwzs\bfseries\centering
		\zihao{-2}\setlength{\baselineskip}{18bp}\selectfont
		独创性声明 \par}
	\vspace*{18bp}
	
	{\zihao{4}\setlength{\baselineskip}{30bp}\selectfont
		本人声明所呈交的学位论文是本人在导师指导下进行的研究工作及取得的研究成果。据我所知，除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含为获得电子科技大学或其它教育机构的学位或证书而使用过的材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示谢意。\par
	}
	
	\vspace*{16bp}
	{\zihao{4}\setlength{\baselineskip}{21bp}\selectfont
		作者签名：\CJKunderline*[thickness=0.7bp, depth=3bp]{%
			\parbox[b][21bp]{4.25cm}{%
				\centering%
				\ifthenelse{\equal{#3}{}}%
					{\makebox[#1]{}}%
					{\includegraphics[width=#1]{#3}}%
			}%
		}%
		\hfill
		日期：%
		\ifthenelse{\equal{#2}{}}%
			{\hspace*{3em}年\hspace*{1.5em}月\hspace*{1.5em}日}%
			{\makebox[4.37cm][r]{#2}}%
		\par
	}
	\vspace*{32bp}
	
	\vspace*{24bp}
	{\hwzs\bfseries\centering
		\zihao{-2}\setlength{\baselineskip}{18bp}\selectfont
		论文使用授权 \par}
	\vspace*{18bp}
	
	{\zihao{4}\setlength{\baselineskip}{30bp}\selectfont
		本学位论文作者完全了解电子科技大学有关保留、使用学位论文的规定，同意学校有权保留并向国家有关部门或机构送交论文的复印件和数字文档，允许论文被查阅。本人授权电子科技大学可以将学位论文的全部或部分内容编入有关数据库进行检索及下载，可以采用影印、扫描等复制手段保存、汇编学位论文。
		
		（涉密的学位论文须按照国家及学校相关规定管理，在解密后适用于本授权。） \par}
	
	\vspace*{17bp}
	{\zihao{4}\setlength{\baselineskip}{21bp}\selectfont
		作者签名：\CJKunderline*[thickness=0.7bp, depth=3bp]{%
			\parbox[b][21bp]{4.25cm}{%
				\centering%
				\ifthenelse{\equal{#3}{}}%
					{\makebox[#1]{}}%
					{\includegraphics[width=#1]{#3}}%
			}
		}
		\hfill
		导师签名：\CJKunderline*[thickness=0.7bp, depth=3bp]{%
			\parbox[b][21bp]{4.25cm}{%
				\centering
				\ifthenelse{\equal{#4}{}}%
					{\makebox[#1]{}}%
					{\includegraphics[width=#1]{#4}}%
			}
	}}
	
	\vspace*{4bp}
	{\zihao{4}\setlength{\baselineskip}{30bp}
		\hfill 日期：%
		\ifthenelse{\equal{#2}{}}%
			{\hspace*{3em}年\hspace*{1.5em}月\hspace*{1.5em}日}%
			{\makebox[4.37cm][r]{#2}}%
		\par
	}
	\par\vspace*{-\baselineskip}\insertemptypage
}



%% 设置页眉、页码
\pagestyle{fancy}
\fancyhead{}
\fancyhead[CO]{\zihao{5}\setlength{\baselineskip}{10.5bp}\selectfont \leftmark}
\fancyhead[CE]{\zihao{5}\setlength{\baselineskip}{10.5bp}\selectfont \rightmark}
\fancyfoot[C]{\zihao{-5}\setlength{\baselineskip}{9bp}\selectfont \thepage}
\renewcommand\headrulewidth{0.75bp}


%%%%%% 关于Latex字号和行距与Word字号和行距的对应关系：
% https://www.jianshu.com/p/3a833e484214
\renewcommand{\normalsize}{\zihao{-4}\setlength{\baselineskip}{20bp}\selectfont}
\renewcommand{\small}{\zihao{5}\setlength{\baselineskip}{20bp}\selectfont}


%%%%%% 重定义各种编号的打印形式
\renewcommand{\thechapter}{第\zhnum{chapter}章}
\renewcommand{\thesection}{\arabic{chapter}.\arabic{section}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}
\ifthenelse{\equal{\subfigformat}{simple}}%
	{}%
	{\renewcommand{\thesubfigure}{(\alph{subfigure})}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
%% 新增一个子公式编号使用的计数器
\newcounter{subequation}
\counterwithin{subequation}{equation}  % 子公式计数器随equation计数器重置
\renewcommand{\thesubequation}{\alph{subequation}}
%% 定义创建子公式编号的命令，
\newcommand{\subeqtag}[1][]{%
	\stepcounter{subequation}%
	\tag{\theequation\thesubequation}%
	\ifthenelse{\equal{#1}{}}%
		{}%
		{\label{#1}}%
}

%%%%%% 调整浮动体与前后文本的间距，https://github.com/CTeX-org/forum/issues/86，需要与caption包配合
%%%%%% 官方文档，https://mirrors.bfsu.edu.cn/CTAN/macros/latex/contrib/caption/caption.pdf
%% https://www.latexstudio.net/archives/9786.html
\setlength{\floatsep}{6bp} % 相邻两个浮动体之间的垂直距离
\setlength{\intextsep}{6bp}  % h模式浮动体前后间距
\setlength{\textfloatsep}{15bp} % 页面中最后一个t模式的浮动体与文本的间距 或页面中第一个b模式的浮动体与文本的间距。
\captionsetup[figure]{%
	name={图},%
	labelsep=space,%
	font=small,%
	margin={\uestcfigcapmargin, \uestcfigcapmargin},%
	position=below,%
	aboveskip=6bp,%
	belowskip=6bp-0.15\baselineskip%
}
\ifthenelse{\equal{\subfigformat}{simple}}
	{
		\captionsetup[subfloat]{%
			labelformat=parens,
			listofformat=subparens,
			captionskip=-3bp,  % 去掉子图编号和子图间的垂直空间，这里-3bp是因为将\small设置为了20bp行距，而五号字大小是10.5bp，规范对子图题编号行距的要求是单倍行距，需要略作补偿。参见subfig宏包
			farskip=4bp,  % 调整纵向子图与上方子图题的间距
		}
	}{
		\captionsetup[subfloat]{%
			labelformat=simple,  % 配合对\thesubfigure的重新定义，避免子图题显示为((a))
			listofformat=subsimple,  % 避免单独引用的子图编号显示为((a))，参考subfig宏包
			captionskip=-3bp,  % 去掉子图编号和子图间的垂直空间，这里-3bp是因为将\small设置为了20bp行距，而五号字大小是10.5bp，规范对子图题编号行距的要求是单倍行距，需要略作补偿。参见subfig宏包
			farskip=4bp,  % 调整纵向子图与上方子图题的间距
		}
	}

\robustify{\subref}  % 让\subref更易用：https://tex.stackexchange.com/questions/228973/argument-of-captionydblarg-has-an-extra

\captionsetup[table]{
	name={表},
	labelsep=space,
	font=small,
	margin={4em, 4em},
	position=above,
	aboveskip=6bp-0.15\baselineskip,
	belowskip=6bp,
}
% 调整三线表线高：https://tex.stackexchange.com/questions/156122
\setlength\heavyrulewidth{1.5bp}  % 调整\toprule和\bottomrule的默认线高
\setlength\lightrulewidth{\uestclightrulewidth} % 调整\midrule默认线高，本科0.5bp，研究生0.75bp

% 调整表格中间线条线高：https://tex.stackexchange.com/questions/679523
\setlength\cmidrulewidth{\uestclightrulewidth}  % 调整\cmidrule[line height](trim){a-b}的默认线高，参见booktabs宏包文档。本科0.5bp，研究生0.75bp
\setlength\aboverulesep{0bp}  % 调整\cmidrule生成框线的上垂直间隔
\setlength\belowrulesep{0bp}  % 调整\cmidrule生成框线的下垂直间隔

% 表中文字垂直居中且水平居中的方法，https://blog.csdn.net/happy_demo/article/details/105430091

% 重定义table环境，使表格整体默认在页面中居中，并设置其内容的字体大小和行距，内部环境使用其普通形式，https://tex.stackexchange.com/questions/14683
\let\oldtable\table
\let\oldendtable\endtable
\renewenvironment{table}[1][tbp]{
	\oldtable[#1]
	\centering
	\zihao{5}\setlength\baselineskip{10.5bp}\selectfont%
	%	\renewcommand{\arraystretch}{1.1}
}{
	\oldendtable
}

% 在\longtable的定义中插入一行命令，以调整跨页长表格内容的字体及行距。参考自longtable宏包
\newcommand{\longtableprop}{%
	\zihao{5}\setlength\baselineskip{10.5bp}\selectfont%
	%	\renewcommand{\arraystretch}{1.1}%
}

\def\longtable{%
	\par
	\if@noskipsec\mbox{}\par\fi
	\@nobreakfalse
	\ifx\multicols\@undefined
	\else
		\ifnum\col@number>\@ne
			\@twocolumntrue
		\fi
	\fi
	\if@twocolumn
		\LT@err{longtable not in 1-column mode}\@ehc
	\fi
	\begingroup
	\longtableprop % 这里调整字体大小和行距
	%	\setlength{\tabcolsep}{6pt}  % 调整列间隔
	\@ifnextchar[\LT@array{\LT@array[x]}%
}

\setlength{\LTpre}{12bp}  % 表前间隔
\setlength{\LTpost}{6bp}  % 表后间隔
\setlength{\LTcapwidth}{\textwidth-9.5em}  % 表题宽度，这个参数跟table不太一样，现在设定的值在观感上相对正文字体大小是左右各缩进了4em。有可能是因为longtable的五号字体在设置该参数时已经生效。

% 再定义一个新跨页表格环境用于主要符号表
\NewDocumentEnvironment{symbtable}{O{c} D(){p{3.5em} p{\linewidth-9em} p{3em}<{\centering}}}{%
	%	\setlength{\tabcolsep}{6pt}  % 调整列间隔
	\setlength{\LTpre}{0bp}%
	\setlength{\LTpost}{0bp}%
	\renewcommand{\longtableprop}{%
		\zihao{-4}\setlength\baselineskip{12bp}\selectfont%
		\renewcommand{\arraystretch}{1.3}%
	}%
	\begin{longtable}[#1]{#2}%
		\textbf{符号} & \textbf{说明} & \textbf{页码} \\
		\endfirsthead
		\textbf{符号} & \textbf{说明} & \textbf{页码} \\
		\endhead
		\endfoot
		\endlastfoot
	}{
	\end{longtable}%
	\insertevenemptypage
}

\newlength{\CPcapwidth}  % 记录长表格跨页表题的宽度
\newcommand{\CPcaptext}{} % 记录跨页表题完整文本
\newcommand{\CPcaption}[1]{%
	\small%
	\renewcommand{\CPcaptext}{\tablename\ \thetable\ #1（续）}
	\settowidth{\CPcapwidth}{\CPcaptext}% 先记录当前跨页表题的排版长度
	\ifthenelse{\LTcapwidth > \CPcapwidth}% 比较规范要求的表题宽度和表题实际宽度，再做决断，https://runebook.dev/cn/docs/latex/_005csettowidth
		{\parbox[b]{\CPcapwidth}{\vspace{7bp}\CPcaptext}}%
		{\parbox[b]{\LTcapwidth}{\vspace{7bp}\CPcaptext}}%
	\vspace{4bp}
}


%%%%%% 若要调整图、表计数器和其他计数器的关联关系，使用：
%%%%%% https://blog.csdn.net/xovee/article/details/123524530
% \counterwithin{<ctr>}{<within>}
% \counterwithout{<ctr>}{<without>}


% 引入判断是否重置页码编号的计数器
\newcounter{pagereset}
\setcounter{pagereset}{0}


%%%%%% 修改各级标题样式，参见titlesec宏包官方文档
%%%%%% \titleformat{⟨command⟩}[⟨shape⟩]{⟨format⟩}{⟨label ⟩}{⟨sep⟩}{⟨before-code⟩}[⟨after-code⟩]
\titleformat{\chapter}[block]
	{\thispagestyle{fancy}\sffamily\filcenter
		\zihao{-3}\setlength{\baselineskip}{20bp}\selectfont}
	{\thechapter}{\wordsep}{%
		\ifthenelse{\equal{\value{chapter}}{1}}%
			{\stepcounter{pagereset}}%
			{}%
		\ifthenelse{\equal{\value{pagereset}}{1}}  % 从第一章开始页码变更为罗马数字
			{\pagenumbering{arabic}\stepcounter{pagereset}}%
			{}%
	}
\titleformat{\section}[block]
	{\sffamily\filright
		\zihao{4}\setlength{\baselineskip}{20bp}\selectfont}
	{\thesection}{\wordsep}{}
\titleformat{\subsection}[block]
	{\sffamily\filright
		\zihao{4}\setlength{\baselineskip}{20bp}\selectfont}
	{\thesubsection}{\wordsep}{}
\titleformat{\subsubsection}[block]
	{\sffamily\filright
		\zihao{-4}\setlength{\baselineskip}{20bp}\selectfont}
	{\thesubsubsection}{\wordsep}{}

% 标准\chapter似乎会在标题上方默认添加大小为\baselineskip的垂直空间
\titlespacing{\chapter}{0bp}{24bp-\baselineskip}{18bp}
\titlespacing{\section}{0pt}{18bp}{6bp}
\titlespacing{\subsection}{0pt}{12bp}{6bp}
\titlespacing{\subsubsection}{0pt}{12bp}{6bp}

%%%%%% 根据chapter对页眉页脚进行设置，并禁止section修改页眉页脚
\newcommand\chaptermarkprefix{第\zhnum{chapter}章}
\renewcommand\chaptermark[1]
{\markboth{\chaptermarkprefix \hspace{\wordsep} #1}{\evenpagemark}}
\renewcommand\sectionmark[1]{}

\newcommand{\zhabstract}{%
	\newpage% 这里是为了让书签能够准确定位到“摘要”所在的行
	% 参考hyperref宏包文档，手动添加书签，part属于-1级，chapter属于0级，section属于1级
	\pdfbookmark[0]{摘\hspace{1em}要}{bookmarkzhabstract}%
	\chapter*{摘\hspace{1em}要}%
	\markboth{摘\hspace{1em}要}{摘\hspace{1em}要}
	\pagenumbering{Roman}
}
\newcommand{\enabstract}{%
	\newpage%
	\pdfbookmark[0]{ABSTRACT}{bookmarkabstract}%
	\chapter*{ABSTRACT}%
	\markboth{ABSTRACT}{ABSTRACT}
}
\newcommand\zhkeywords[1]{\par\vspace{\baselineskip}\noindent
	\parbox[t]{4em}{\textbf{关键词：}}\parbox[t]{\textwidth-4em}{#1}
	\insertevenemptypage}
\newcommand\enkeywords[1]{\par\vspace{\baselineskip}\noindent
	\parbox[t]{5em}{\textbf{Keywords:}}\parbox[t]{\textwidth-5em}{#1}
	\insertevenemptypage}

\setcounter{secnumdepth}{5}

\setcounter{tocdepth}{2}  % 设定目录的显示深度，到2级（chapter是0级）
\renewcommand{\contentsname}{\uestctocname}  % 修改目录标题
%% 调整主目录条目的缩进、字体、导航线型、页码编号等样式，参考titlesec宏包文档。
\titlecontents{chapter}[0bp]
	{\sffamily\zihao{-4}\setlength{\baselineskip}{20bp}\selectfont\filright}
	{\contentspush{\thecontentslabel\enspace}}{}{~\titlerule*[4bp]{.}\contentspage}
\titlecontents{section}[\tocsecindent]
	{\zihao{-4}\setlength{\baselineskip}{20bp}\selectfont\filright}
	{\contentspush{\thecontentslabel\enspace}}{}{~\titlerule*[4bp]{.}\contentspage}
\titlecontents{subsection}[\tocsubsecindent]
	{\zihao{-4}\setlength{\baselineskip}{20bp}\selectfont\filright}
	{\contentspush{\thecontentslabel\enspace}}{}{~\titlerule*[4bp]{.}\contentspage}
\titlecontents{subsubsection}[\tocsubsubsecindent]
	{\zihao{-4}\setlength{\baselineskip}{20bp}\selectfont\filright}
	{\contentspush{\thecontentslabel\enspace}}{}{~\titlerule*[4bp]{.}\contentspage}
% titlesec的\titlecontents也有弊端，第十章和第十一章标签后的标题内容无法产生相同的悬挂缩进，故而对不齐。考虑到章节一般不会那么多，尚且可用，但是对于图目录和表目录，编号很容易突破到两位数。为了让所有图题和表题对齐，tocloft宏包提供的方式更为适合，后续对图目录和表目录的调整即是如此。


\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{%
	\newpage%
	\pdfbookmark[0]{目\hspace{1em}录}{bookmarktoc}%
	\oldtableofcontents
	\insertevenemptypage  % 为目录部分添加偶空白页
}

\renewcommand{\listfigurename}{图目录}  % 修改图目录标题
\renewcommand{\listtablename}{表目录}   % 修改表目录标题
\let\oldlistoffigures\listoffigures
\renewcommand{\listoffigures}{{
	%	\let\oldnumberline\numberline
	%	\renewcommand{\numberline}{\figurename~\oldnumberline}  % 为图目录条目加上标签“图”，https://www.latexstudio.net/archives/6202.html。这种方式会导致图目录条目悬挂缩进对不齐，弃用
	\renewcommand\addvspace[1]{}  % 取消图目录、表目录章节条目之间的额外间距，https://github.com/HFUTTUG/HFUT_Thesis/discussions/45
	\renewcommand{\cftfigpresnum}{\figurename~}  % 给图目录条目加上标签“图”
	\setlength{\cftfigindent}{0em}  % 取消图目录条目左边距
	\addtolength{\cftfignumwidth}{1.4em}  % 调整图目录条目悬挂缩进量
	\renewcommand{\cftdotsep}{1}  % 调整页码前导航线的疏密
	\newpage%
	\pdfbookmark[0]{图目录}{bookmarklof}%
	\oldlistoffigures
	\insertevenemptypage
}}
\let\oldlistoftables\listoftables
\renewcommand{\listoftables}{{
	%	\let\oldnumberline\numberline
	%	\renewcommand{\numberline}{\tablename~\oldnumberline}  % 为表目录条目加上标签“表”。这种方式会导致表目录条目悬挂缩进对不齐，弃用
	\renewcommand\addvspace[1]{}  % 取消图、表目录章节之间的额外间距，https://github.com/HFUTTUG/HFUT_Thesis/discussions/45
	\renewcommand{\cfttabpresnum}{\tablename~}  % 给表目录条目加上标签“图”
	\setlength{\cfttabindent}{0em}  % 取消表目录条目左边距，参考tocloft宏包文档
	\addtolength{\cfttabnumwidth}{1.4em}  % 调整表目录条目悬挂缩进量
	\renewcommand{\cftdotsep}{1}  % 调整页码前导航线的疏密
	\newpage%
	\pdfbookmark[0]{表目录}{bookmarklot}%
	\oldlistoftables
	\insertevenemptypage
}}



%%%%%% 主要符号表
\newcommand{\listofsymbs}{
	\newpage%
	\pdfbookmark[0]{主要符号表}{bookmarklistofsymbs}%
	\chapter*{主要符号表}%
	\markboth{主要符号表}{主要符号表}%
	%	\insertevenemptypage
}


%%%%%% 缩略词表，https://blog.csdn.net/xovee/article/details/118604572
\renewcommand{\nomname}{缩略词表}  % 修改缩略词表标题
% 设置术语行间距，https://blog.csdn.net/weixin_46046053/article/details/121183785
\setlength{\nomitemsep}{0bp}
% 缩略词表添加新条目，https://blog.csdn.net/ya6543/article/details/113075774
\newlength{\nomdescrchnwidth}
\newcommand{\nomdescr}[1]{%
	\parbox[t]{\linewidth-\nomdescrchnwidth}{\raggedright\strut #1 \strut}%
	\ignorespaces%
}%
\newcommand{\nomdescrchn}[1]{%
	\parbox[t]{\nomdescrchnwidth}{\strut #1 \strut}%
	\ignorespaces%
}%
\newcommand{\nomchn}[4][]{%
	\nomenclature[#1]{#2}{%
		\nomdescr{#3}%
		\nomdescrchn{#4}%
	}%
}%

% 重定义缩略词表打印命令，加入书签，并设置单面印刷
\let\oldprintnomenclature\printnomenclature
\RenewDocumentCommand{\printnomenclature}{O{5em} D(){7.5em}}{
	\newpage%
	\markboth{缩略词表}{缩略词表}%
	\pdfbookmark[0]{缩略词表}{bookmarknomenclature}%
	\renewcommand{\nompreamble}{{\noindent \bfseries \makebox[#1][l]{英文缩写} \makebox[\linewidth-#1-#2-\tabcolsep][l]{英文全称} \makebox[#2][l]{中文全称}}}  % 缩略词表额外注释
	\setlength{\nomdescrchnwidth}{#2}
	\oldprintnomenclature[#1]
	\insertevenemptypage
}
\makenomenclature


%%%%%% 参考文献相关设置
\renewcommand{\bibfont}{\zihao{5}\setlength{\baselineskip}{20bp}\selectfont}
\setlength{\bibsep}{0bp \@plus 2bp \@minus 1bp}  % 调整参考文献条目间距，设置橡胶长度以减少条目强制不跨页导致的页尾空白
\let\oldbibliography\bibliography
\renewcommand{\bibliography}[1]{{
	\renewcommand{\rightmark}{\evenpagemark}
	% 禁止参考文献条目跨页：
	% https://tex.stackexchange.com/questions/43260/biblatex-no-pagebreak-in-bibliography-entry
	\interlinepenalty=10000
	\oldbibliography{#1}
	\addcontentsline{toc}{chapter}{参考文献}
}}




% 定义、定理、命题、引理、推论，https://ask.latexstudio.net/index.php/ask/article/647.html
\newtheoremstyle{uestc} % <风格名>
	{0pt} % <上方间距> 若留空，则使用默认值
	{0pt} % <下方间距> 若留空，则使用默认值
	{} % <主体字体> 如 \itshape
	{\parindent} % <缩进长度> 若留空，则无缩进；可以使用 \parindent 进行正常段落缩进
	{\sffamily} % <定理头字体> 如 \bfseries
	{} % <定理头后的标点符号> 如点号、冒号
	{ } % <定理头后的间距> 不可留空，若设置为 { }，则表示正常词间间距；若设置为 {\newline}，则环境内容开启新行
	{} % <定理头格式指定> 一般留空
\theoremstyle{uestc} % plain: regular+italic, definition: regular++, remark: italic+regular
\newtheorem{definition}{定义}
\newtheorem{theorem}{定理}
\newtheorem{proposition}{命题}
\newtheorem{corollary}{推论}
\newtheorem{lemma}{引理}
% 让这些环境随章节重置编号
\counterwithin{definition}{chapter}
\counterwithin{theorem}{chapter}
\counterwithin{proposition}{chapter}
\counterwithin{corollary}{chapter}
\counterwithin{lemma}{chapter}
%\renewenvironment{proof}{{\sffamily 证明：}}{\hfill $\blacksquare$\par}  % https://blog.csdn.net/robert_chen1988/article/details/61204853
\renewenvironment{proof}[1][\proofname]{\par
	\pushQED{\qed}%
	\normalfont \topsep0\p@\@plus0\p@\relax
	\trivlist
	\item[\hskip\labelsep
	\sffamily\upshape
	\hspace*{\parindent-3pt}
	#1\@addpunct{：}\hspace*{-5pt}]\ignorespaces
}{
	\popQED\endtrivlist\@endpefalse
}  % https://ask.latexstudio.net/index.php/ask/article/647.html
\renewcommand{\proofname}{证明}
%\renewcommand{\proofname}{\sffamily\upshape \hspace*{\parindent}证明：\hspace*{-0.45em}\nopunct}  % https://zhuanlan.zhihu.com/p/680966530
\renewcommand{\thedefinition}{\arabic{chapter}.\arabic{definition}}
\renewcommand{\thetheorem}{\arabic{chapter}.\arabic{theorem}}
\renewcommand{\theproposition}{\arabic{chapter}.\arabic{proposition}}
\renewcommand{\thecorollary}{\arabic{chapter}.\arabic{corollary}}
\renewcommand{\thelemma}{\arabic{chapter}.\arabic{lemma}}
\renewcommand{\qedsymbol}{$\blacksquare$}

% 定义引用样式
%\renewcommand{\eqref}[1]{（\ref{#1}）}  % amsmath宏包已定义，若需要使用中文括号则取消注释
%\newcommand{\figref}[1]{图\ref{#1}}
%\newcommand{\tabref}[1]{表\ref{#1}}
%\newcommand{\algref}[1]{算法\ref{#1}}
%\newcommand{\alglinref}[1]{第\ref{#1}行}
%\newcommand{\secref}[1]{\ref{#1}节}
%\newcommand{\corolref}[1]{推论\ref{#1}}
%\newcommand{\propref}[1]{命题\ref{#1}}
%\newcommand{\defref}[1]{定义\ref{#1}}
%\newcommand{\thmref}[1]{定理\ref{#1}}


%%%%%%% 修改伪代码相关设置
\renewcommand{\algorithmcfname}{算法}  % 修改伪代码标题标签， https://blog.csdn.net/zhenaoxi1077/article/details/90449433
\renewcommand{\thealgocf}{\arabic{chapter}-\arabic{algocf}}  % 修改伪代码编号样式， https://tex.stackexchange.com/questions/62240
\SetAlgoHangIndent{0bp}  % 去掉伪码段首的首行悬挂缩进，https://tex.stackexchange.com/questions/581839

%% 调整algorithm环境和前后文本的垂直距离
\newskip\algskipamount
\algskipamount = 6bp \@plus 1bp \@minus 1bp
\def\algskip{\vskip\algskipamount}  % 定义垂直距离宏，来自ChatGPT
\SetAlgoSkip{algskip}  % 参考algorithm2e宏包的官方文档

%% 调整伪码中的线高，https://tex.stackexchange.com/questions/45272
\setlength{\algoheightrule}{1.5bp} % 伪码顶部和底部的线高
\setlength{\algotitleheightrule}{0.75bp} % 伪码标题下的线高

%% 调整algorithm环境的标题标签、标题文本和内容文本的字体和行距
%% 参考algorithm2e宏包的官方文档
\SetAlCapFnt{\zihao{5}\setlength\baselineskip{10.5bp}\selectfont}
\SetAlCapNameFnt{\zihao{5}\setlength\baselineskip{10.5bp}\selectfont}
\SetAlFnt{\zihao{5}\setlength\baselineskip{13bp}\selectfont}
\SetAlCapHSkip{0.5em}  % 伪代码标题离左框线的距离
\SetCommentSty{textbf}  % 设置伪码中注释文本的排版样式，可选：textbf、textsf、texttt（默认）、emph、text、textit等
\setlength{\algomargin}{1.5em}  % 伪代码文本离左框线的距离

\SetKwInOut{Input}{输入}
\SetKwInOut{Output}{输出}
\SetKwRepeat{DoWhile}{do}{while}  % \DoWhile{条件}{循环体}
\SetKwBlock{Loop}{loop}{end}  %  \Loop{循环体}，https://tex.stackexchange.com/questions/264256

%% 本来定义了下面一系列在条件判断和循环判断语句所在行添加注释的命令，谁知道algorithm2e宏包早早提供了实现该操作的接口，只需要在相应条件输入前添加“(<注释内容>)”即可，例如：\For(条件注释){条件}{循环体}。纯纯小丑，哈哈哈哈。
%\newcommand{\CIf}[3]{
	%	\SetKwIF{cIf}{cElseIf}{cElse}{if}{then#2}{elif}{else}{end}
	%	\cIf{#1}{#3}
	%}  % 伪码中能给判断条件增加注释的if判断语句：\CIf{条件}{条件注释}{条件体}
%\newcommand{\CElseIf}[3]{
	%	\SetKwIF{cIf}{cElseIf}{cElse}{if}{then#2}{elif}{else}{end}
	%	\cElseIf{#1}{#3}
	%}  % 伪码中能给判断条件增加注释的elif判断语句：\CElseIf{条件}{条件注释}{条件体}
%\newcommand{\CElse}[2]{
	%	\SetKwIF{cIf}{cElseIf}{cElse}{if}{then}{elif}{else#1}{end}
	%	\cElse{#2}
	%}  % 伪码中能给判断条件增加注释的else语句：\CElse{注释}{条件体}
%\newcommand{\CeIf}[5]{{
		%	\SetKwIF{If}{ElseIf}{Else}{if}{then#2}{elif}{else#4}{end}
		%	\eIf{#1}{#3}{#5}
		%}}  % 伪码中能给判断条件增加注释的if elif判断语句：\CeIf{条件}{条件注释}{条件体1}{条件体2}
%\newcommand{\CFor}[3]{
	%	\SetKwFor{cFor}{for}{do#2}{end}
	%	\cFor{#1}{#3}
	%}  % 伪码中能给循环条件增加注释的for循环语句：\CFor{条件}{条件注释}{循环体}
%\newcommand{\CWhile}[3]{
	%	\SetKwFor{cWhile}{while}{do#2}{end}
	%	\cWhile{#1}{#3}
	%}  % 伪码中能给循环条件增加注释的while循环语句：\CWhile{条件}{条件注释}{循环体}
%\newcommand{\CRepeat}[3]{
	%	\SetKwRepeat{cRepeat}{repeat#2}{until}
	%	\cRepeat{#1}{#3}
	%}  % 伪码中能给循环条件增加注释的repeat until循环语句：\CRepeat{条件}{注释}{循环体}
%\newcommand{\CDoWhile}[3]{
	%	\SetKwRepeat{cDoWhile}{do#2}{while}
	%	\cDoWhile{#1}{#3}
	%}  % 伪码中能给循环条件增加注释的do while循环语句：\CDoWhile{条件}{注释}{循环体}
%\newcommand{\CLoop}[2]{
	%	\SetKwBlock{cLoop}{loop#1}{end}
	%	\cLoop{#2}
	%}  % 伪码中能给循环增加注释的loop循环语句：\CLoop{注释}{循环体}

%% 重新封装算法环境，使之宽度可调，基于xparse宏包实现多个可选参数：https://tex.stackexchange.com/questions/11349
\NewDocumentEnvironment{algo}{O{htbp} D(){4em}}{
	\begin{figure}[#1]
		\centering
		\begin{minipage}{\linewidth-#2}
			\begin{algorithm}[H]
	}{
			\end{algorithm}
		\end{minipage}
	\end{figure}
}


%%%%%% 致谢
\newcommand{\acknowledgement}{
	\chapter*{致\hspace{1em}谢}
	\markboth{致\hspace{1em}谢}{\evenpagemark}
	\addcontentsline{toc}{chapter}{致\hspace{1em}谢}
}


%%%%%% 附录
\let\oldappendix\appendix
\renewcommand{\appendix}{
	\oldappendix
	\renewcommand{\thechapter}{附录\Alph{chapter}}
	\renewcommand{\thesection}{\Alph{chapter}.\arabic{section}}
	\renewcommand{\thefigure}{\Alph{chapter}-\arabic{figure}}
	\renewcommand{\thetable}{\Alph{chapter}-\arabic{table}}
	\renewcommand{\theequation}{\Alph{chapter}-\arabic{equation}}
	\renewcommand{\thedefinition}{\Alph{chapter}.\arabic{definition}}
	\renewcommand{\thetheorem}{\Alph{chapter}.\arabic{theorem}}
	\renewcommand{\theproposition}{\Alph{chapter}.\arabic{proposition}}
	\renewcommand{\thecorollary}{\Alph{chapter}.\arabic{corollary}}
	\renewcommand{\thelemma}{\Alph{chapter}.\arabic{lemma}}
	\renewcommand{\thealgocf}{\Alph{chapter}-\arabic{algocf}}
	\renewcommand\chaptermarkprefix{附录\Alph{chapter}}
}


%%%%%% 成果
\newcommand{\achievement}{
	\chapter*{\achievementtext}
	\markboth{\achievementtext}{\evenpagemark}
	\addcontentsline{toc}{chapter}{\achievementtext}
	% 调整成果章的itemize环境缩进、enumerate环境缩进及编号样式
	\setlist[itemize,1]{
		leftmargin=2em,
		label=$\bullet$,
	}
	\setlist[enumerate,1]{
		leftmargin=2em,
		labelsep=0.3em,
		label=[\arabic*],
		align=left,
	}
}



%%%%%% 脚注
% 定义新脚注字体大小，并更新默认脚注大小：
% https://tex.stackexchange.com/questions/249415/set-font-size-for-footnotes
\newcommand\uestcfootnotesize{%
	\@setfontsize\uestcfootnotesize\@ixpt{9}%
	\abovedisplayskip 8\p@ \@plus2\p@ \@minus4\p@
	\abovedisplayshortskip \z@ \@plus\p@
	\belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
	\def\@listi{\leftmargin\leftmargini
		\topsep 4\p@ \@plus2\p@ \@minus2\p@
		\parsep 2\p@ \@plus\p@ \@minus\p@
		\itemsep \parsep}%
	\belowdisplayskip \abovedisplayskip
}
\renewcommand{\footnotesize}{\uestcfootnotesize}

% 调整脚注序号为带圈数字，https://zhuanlan.zhihu.com/p/74515148
\AtBeginUTFCommand[\textcircled]{\begingroup\EnclosedNumbers}
\AtEndUTFCommand[\textcircled]{\endgroup}
\xeCJKDeclareCharClass{Default}{"24EA, "2460->"2473, "3251->"32BF}
\newfontfamily\EnclosedNumbers[Path=./font/,]{Source Han Serif SC}
\renewcommand\thefootnote{\textcircled{\@arabic\c@footnote}}
% 保持正文中脚注序号为上标，脚注部分的编号为非上标
\xpatchcmd\@makefntext
	{{\hss\@makefnmark}}
	{{\hss\@makefnmark@nosuperscript}\space}
	{}{\fail}
\def\@makefnmark@nosuperscript{\hbox{\normalfont\@thefnmark}}
% 调整分割线长度
\xpatchcmd\footnoterule
	{.4\columnwidth}
	{12em}
	{}{\fail}

% 设置脚注文本的缩进，https://www.latexstudio.net/archives/321.html
\deffootnote{1.5em}{0em}{\makebox[1.5em][l]{\thefootnotemark}}



%%%%%% 调整list的边距和编号样式，参考enumitem宏包文档，
% https://tex.stackexchange.com/questions/170525/itemize-left-margin
% https://blog.csdn.net/beifangyu/article/details/116452301
\setlist{
	itemsep=0bp,
	partopsep=0bp,
	parsep=0bp,
	topsep=0bp,
}
\setlist[itemize,1]{
	leftmargin=3em,
	label=$\bullet$,
}
\setlist[itemize,2]{
	leftmargin=1em,
	label=$\circ$,
}
\setlist[enumerate,1]{
	leftmargin=4em,
	labelsep=0em,
	label=（\arabic*）,
}
\setlist[enumerate,2]{
	leftmargin=1.5em,
	labelsep=0em,
	label=\arabic*）,
}
\setlist[description]{
	leftmargin=3em,
	labelsep=0.2em,
}



%%%%%% 定义上标引用命令
\newcommand{\citess}[1]{\textsuperscript{\cite{#1}}}

%%%%%% 调整学士论文引用公式编号的形式
\ifthenelse{\equal{\dissertationtype}{bachelor}}%
	{\renewcommand{\eqref}[1]{（\ref{#1}）}}%
	{}%


%% 修改\url{URL}命令的排版字体风格，https://tex.stackexchange.com/questions/261434
\urlstyle{rm}



%%%%%% 自定义graphicx宏包在draft选项下排版图片完整文本的方式
%% 调整fbox框线粗细以及与内容间的距离，https://www.latexstudio.net/archives/51609.html
\setlength{\fboxrule}{0.5bp}
\setlength{\fboxsep}{-0.5bp}
%% 基于graphicx宏包源码进行修改，使之在draft选项下让过长的文本换行，https://ctan.org/tex-archive/macros/latex/required/graphics
\def\Gin@setfile#1#2#3{%
	\ifx\\#2\\\Gread@false\fi
	\ifGin@bbox\else
	  \ifGread@
		\csname Gread@%
		   \expandafter\ifx\csname Gread@#1\endcsname\relax
			 eps%
		   \else
			 #1%
		   \fi
		\endcsname{\Gin@base#2}%
	  \else
		\Gin@nosize{#3}%
	  \fi
	\fi
	\Gin@viewport@code
	\Gin@nat@height\Gin@ury bp%
	\advance\Gin@nat@height-\Gin@lly bp%
	\Gin@nat@width\Gin@urx bp%
	\advance\Gin@nat@width-\Gin@llx bp%
	\Gin@req@sizes
	\expandafter\ifx\csname Ginclude@#1\endcsname\relax
	  \Gin@drafttrue
	  \expandafter\ifx\csname Gread@#1\endcsname\relax
		\@latex@error{Can not include graphics of type: #1}\@ehc
		\global\expandafter\let\csname Gread@#1\endcsname\@empty
	  \fi
	\fi
	\leavevmode
	\ifGin@draft
		\edef\@tempa{#3}%
		\fbox{%
			\parbox[b][\Gin@req@height][c]{\Gin@req@width}{%
				\,\ttfamily\footnotesize\expandafter\strip@prefix\meaning\@tempa%
			}%
		}%
		% \hb@xt@\Gin@req@width{%
		%   \vrule\hss
		%   \vbox to \Gin@req@height{%
		% 	 \hrule \@width \Gin@req@width
		% 	 \vss
		% 	 \edef\@tempa{#3}%
		% 	 \rlap{ \ttfamily\expandafter\strip@prefix\meaning\@tempa}%
		% 	 \vss
		% 	 \hrule}%
		%   \hss\vrule}%
	\else
	  \@addtofilelist{#3}%
	  \ProvidesFile{#3}[Graphic file (type #1)]%
	  \setbox\z@\hbox{\csname Ginclude@#1\endcsname{#3}}%
	  \dp\z@\z@
	  \ht\z@\Gin@req@height
	  \wd\z@\Gin@req@width
	\box\z@
	\fi}