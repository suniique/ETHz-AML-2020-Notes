\ProvidesClass{note}[]
\typeout{Document Class `note' v0.0.2 by Suniique (2020/12/01)}

\LoadClass[11pt,linespread=1.2,a4paper,oneside,openany]{book}

\RequirePackage{marginnote}
\RequirePackage[top=2.75cm, bottom=2.25cm, outer=3.75cm, inner=2.25cm, heightrounded, marginparwidth=2.25cm, marginparsep=0.5cm]{geometry}

\RequirePackage[unicode, linkcolor=black]{hyperref}
\RequirePackage{titlesec}
\hypersetup{colorlinks}
\RequirePackage{graphicx,float}
\RequirePackage{booktabs}
\RequirePackage{tocloft}
\RequirePackage{xcolor}
\RequirePackage{adjustbox}
\RequirePackage{titlesec}  

%\usepackage{cmbright}
\RequirePackage{setspace}
\RequirePackage{amsmath,amssymb,amsfonts,mathrsfs,bbm,amsbsy}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage{lmodern}

\DeclareMathOperator*{\argmin}{argmin}
\DeclareMathOperator*{\argmax}{argmax}
\DeclareMathOperator*{\sign }{sign}
\usepackage{mathtools}
\DeclarePairedDelimiter{\ceil}{\lceil}{\rceil}

\DeclareFontFamily{U}{futm}{}
\DeclareFontShape{U}{futm}{m}{n}{
  <-> s * [1.1] fourier-bb
  }{}
\DeclareSymbolFont{Ufutm}{U}{futm}{m}{n}
\DeclareSymbolFontAlphabet{\mathbb}{Ufutm}
\DeclareSymbolFontAlphabet{\mathbbm}{Ufutm}

\usepackage{subfig}
\usepackage{tikz}
\usepackage{mathtools}
\usetikzlibrary{arrows.meta}
\usepackage{tcolorbox}

\usepackage{etoolbox}
\usepackage{cmbright}
%\usepackage[math]{arev}

\RequirePackage{fix-cm}
\DeclareMathSizes{11}{10}{8}{7}

\RequirePackage{url}
\PassOptionsToPackage{hyphens}{url}
\def\UrlFont{\ttfamily}
\newcommand{\mailto}[1]{\href{mailto:#1}{\texttt{#1}}}

\RequirePackage[linesnumbered,ruled,vlined]{algorithm2e}
\SetKwInput{KwIn}{Input}
\SetKwInput{KwOut}{Output}
\SetKwComment{Comment}{$\triangleright$\ }{}
\newcommand{\commentstyle}[1]{{#1}}
\SetCommentSty{commentstyle}

\RequirePackage{fancyhdr}

\setlength{\headheight}{15pt}
\setlength{\footskip}{20pt}

\pagestyle{fancy}
\fancyhf{}
\lhead{\hw@assignmentnumber}
%\chead{\textit{\hw@coursetitle}}
%\rhead{\hw@studentname}
\rhead{\textit{\hw@coursetitle}}
\renewcommand{\headrulewidth}{0.75pt}

\cfoot{\thepage}
\renewcommand{\footrulewidth}{0pt}
\setlength{\footskip}{30pt}

\RequirePackage{multirow,dcolumn,float}

\RequirePackage{stringstrings}

\newcommand{\newproblemset}[3]{
	\newcounter{#1}[section]
	\@namedef{make#1}{\section*{#3}\renewcommand{\theequation}{\substring{#2}{1}{1}\arabic{#1}.\arabic{equation}}}

	\newenvironment{#1}[1][\empty]{
		\refstepcounter{#1}
		\setcounter{equation}{0}
		
		\ifx\empty##1\subsection*{#2 \csname the#1\endcsname}\else\subsection*{#2 \csname the#1\endcsname: ##1}\fi
		\kaiti}{}

	\newenvironment{#1*}[1][\empty]{	
		\renewcommand{\theequation}{\arabic{equation}}
		\setcounter{equation}{0}
		\ifx\empty##1\subsection*{#2}\else\subsection*{#2: ##1}\fi
		\kaiti}{}
}

\titleformat{\chapter}[display]   
{\normalfont\huge\bfseries}{\chaptertitlename\ \thechapter}{20pt}{\Huge}   
\titlespacing*{\chapter}{0pt}{-30pt}{50pt}

\newenvironment{answer}{
	\vspace*{2mm}
	\noindent
	\textit{\textbf{Answer}}:\enskip}{}

\newenvironment{answer*}{
	\renewcommand{\theequation}{\arabic{equation}}
	\vspace*{2mm}
	\noindent
	\textit{Answer:}\enskip}{}

\newcommand{\oldmaketitle}{\maketitle}
\renewcommand{\maketitle}{
	\pagestyle{fancy}
	\thispagestyle{plain}
	\newpage
	\setcounter{page}{1}
	\noindent
	\begin{center}
		\framebox[\textwidth][c]{
			\vbox{
				\vspace{2mm}
				
				\makebox[0pt][l]{\small \quad \textit{\hw@coursetitle}~\hw@semester}%
				\hfill
				\makebox[0pt][r]{\small Last Update: \today \quad}

				\vspace{3mm}
				\begin{center}
				\ifx\hw@assignmenttitle\empty\textbf{\Large \hw@assignmentnumber}\else\textbf{\Large \hw@assignmentnumber:
					\hw@assignmenttitle}\fi
				\end{center}
				\textit{\large \hw@lecturer}
				
				\vspace{6mm}
				\makebox[\textwidth][c]{\textbf \hw@studentname}
				\makebox[\textwidth][c]{\hw@studentaffliation}
				\makebox[\textwidth][c]{\mailto{\hw@studentemail}}
				
				\vspace{2mm}
			}
		}
	\end{center}
	\vspace*{1mm}
}

\providecommand{\myqedsymbol}{$\blacksquare $}
\newcommand{\mathqed}{\quad\hbox{\myqedsymbol}}
\DeclareRobustCommand{\myqed}{%
  \ifmmode \mathqed
  \else
    \leavevmode\unskip\penalty9999 \hbox{}\nobreak\hfill
    \quad\hbox{\myqedsymbol}%
  \fi
}

\def\hw@coursetitle{}
\def\hw@semester{}
\def\hw@university{}
\def\hw@assignmenttitle{}
\def\hw@assignmentnumber{}
\def\hw@studentname{}
\def\hw@studentnumber{}
\def\hw@studentaffliation{}
\def\hw@studentemail{}
\def\hw@lecturer{}
\newcommand{\course}[4]{%
	\def\hw@coursetitle{#1}
	\def\hw@semester{#2}
	\def\hw@university{#3}
	\def\hw@lecturer{#4}
}
\newcommand{\assignment}[2]{%
	\def\hw@assignmentnumber{#1}
	\def\hw@assignmenttitle{#2}
}
\newcommand{\student}[4]{%
	\def\hw@studentname{#1}
	\def\hw@studentnumber{#2}
	\def\hw@studentaffliation{#3}
	\def\hw@studentemail{#4}
}



\renewcommand{\cftbeforechapskip}{1\baselineskip}      % allow spacing after each chapter/section entry
\renewcommand{\contentsname}{Contents}
\renewcommand{\cftaftertoctitle}{\hfill}
\renewcommand{\cfttoctitlefont}{\hfill\Large\bfseries\sffamily} %!some command to make the heading huge and bold
\renewcommand{\cftbeforetoctitleskip}{0.25in}        % Title is 1in from top
\renewcommand{\cftaftertoctitleskip}{1.0\baselineskip}% 1 double space after title
\renewcommand{\cftchapfont}{\large\bfseries\sffamily}                         % Can make it bold faced here; don't put a space in the {}
\renewcommand{\cftchappagefont}{\large\bfseries\sffamily}                         % Can make it bold faced here; don't put a space in the {}
\renewcommand{\cftchapleader}{\cftdotfill{\cftchapdotsep}}
\renewcommand{\cftchapdotsep}{\cftdotsep}             % Puts dots after chapter entries
\renewcommand{\cftchappresnum}{}             %
\renewcommand{\cftchapaftersnum}{}                    % Don't put a space in the {}
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}%
\renewcommand{\cftchappagefont}{}                      %
\renewcommand{\cftchapnumwidth}{0.3in}
\renewcommand{\cftsecindent}{0.3in}% 1 double space after title
\renewcommand{\cftchappagefont}{\sffamily\bfseries}
\renewcommand{\cftsubsecfont}{\sffamily\small}
\setlength{\cftsubsecindent}{0.65in}

\setcounter{tocdepth}{2}


\makeatletter
\patchcmd{\chapter}{\if@openright\cleardoublepage\else\clearpage\fi}{}{}{}
\makeatother

\newcommand{\E}[2]{\mathbb{E}_{#1}\left[ #2 \right]}
\newcommand{\EE}[0]{\mathbb{E}}
\newcommand{\EEE}[1]{\mathbb{E}\left[ #1 \right]}
\newcommand{\VV}[1]{\mathbb{V}\left[ #1 \right]}
\newcommand{\R}{\mathbb{R}}
\newcommand{\Ind}[1]{\;\mathbbm{1}\left\{\textstyle \, #1\right\}}
\newcommand{\onehalf }{\frac{1}{2}}
\newcommand{\norm }[1]{\left\lVert #1 \right\rVert}
\newcommand{\diff}[1]{\frac{\partial}{\partial #1}}
\newcommand{\Diff}[2]{\frac{\partial #1}{\partial #2}}
\newcommand{\ddiff}[1]{\frac{\partial^2}{\partial #1^2}}
\newcommand{\DDiff}[2]{\frac{\partial^2 #1}{\partial #2^2}}

% mathbf
\newcommand{\bfA}{\mathbf{A}}
\newcommand{\bfB}{\mathbf{B}}
\newcommand{\bfC}{\mathbf{C}}
\newcommand{\bfD}{\mathbf{D}}
\newcommand{\bfE}{\mathbf{E}}
\newcommand{\bfF}{\mathbf{F}}
\newcommand{\bfI}{\mathbf{I}}
\newcommand{\bfK}{\mathbf{K}}
\newcommand{\bfU}{\mathbf{U}}
\newcommand{\bfV}{\mathbf{V}}
\newcommand{\bfW}{\mathbf{W}}
\newcommand{\bfX}{\mathbf{X}}
\newcommand{\bfY}{\mathbf{Y}}
\newcommand{\bfZ}{\mathbf{Z}}
\newcommand{\bfLM}{\mathbfdddddddddddddddddd{\Lambda}}
\newcommand{\bfmu}{\boldsymbol{\mu}}
\newcommand{\bfSigma}{\mathbf{\Sigma}}

\newcommand{\bfa}{\mathbf{a}}
\newcommand{\bfb}{\mathbf{b}}
\newcommand{\bfc}{\mathbf{c}}
\newcommand{\bff}{\mathbf{f}}
\newcommand{\bfk}{\mathbf{k}}
\newcommand{\bfu}{\mathbf{u}}
\newcommand{\bfv}{\mathbf{v}}
\newcommand{\bfw}{\mathbf{w}}
\newcommand{\bfx}{\mathbf{x}}
\newcommand{\bfy}{\mathbf{y}}
\newcommand{\bfz}{\mathbf{z}}

% cal
\newcommand{\cA}{\mathcal{A}}
\newcommand{\cC}{\mathcal{C}}
\newcommand{\cD}{\mathcal{D}}
\newcommand{\cL}{\mathcal{L}}
\newcommand{\cH}{\mathcal{H}}
\newcommand{\cN}{\mathcal{N}}
\newcommand{\cP}{\mathcal{P}}
\newcommand{\cR}{\mathcal{R}}
\newcommand{\cS}{\mathcal{S}}
\newcommand{\cT}{\mathcal{T}}
\newcommand{\cX}{\mathcal{X}}
\newcommand{\cY}{\mathcal{Y}}
\newcommand{\cZ}{\mathcal{Z}}

% bm
\newcommand{\bmA}{\bm{A}}
\newcommand{\bmB}{\bm{B}}
\newcommand{\bmC}{\bm{C}}
\newcommand{\bmD}{\bm{D}}
\newcommand{\bmE}{\bm{E}}
\newcommand{\bmF}{\bm{F}}
\newcommand{\bmI}{\boldsymbol{I}}
\newcommand{\bmU}{\bm{U}}
\newcommand{\bmV}{\bm{V}}
\newcommand{\bmW}{\bm{W}}
\newcommand{\bmX}{\bm{X}}
\newcommand{\bmY}{\bm{Y}}
\newcommand{\bmZ}{\bm{Z}}
\newcommand{\bmLM}{\boldsymbol{\Lambda}}

\newcommand{\bma}{\bm{a}}
\newcommand{\bmb}{\bm{b}}
\newcommand{\bmc}{\bm{c}}
\newcommand{\bmd}{\bm{d}}
\newcommand{\bme}{\bm{e}}
\newcommand{\bmf}{\bm{f}}
\newcommand{\bmg}{\bm{g}}
\newcommand{\bmh}{\bm{h}}
\newcommand{\bmi}{\boldsymbol{i}}
\newcommand{\bmu}{\bm{u}}
\newcommand{\bmv}{\bm{v}}
\newcommand{\bmw}{\bm{w}}
\newcommand{\bmx}{\bm{x}}
\newcommand{\bmy}{\bm{y}}
\newcommand{\bmz}{\bm{z}}

\newcommand{\NN}{\mathcal{N}}

\newcommand{\dx}{\ \mathrm{d}x}
\newcommand{\dy}{\ \mathrm{d}y}

\newcommand{\dxx}{\ \mathrm{d}\bfx}
\newcommand{\dyy}{\ \mathrm{d}\bfy}

\newcommand{\where}{\quad \text{where}\ \ }
\newcommand{\remark}{\textbf{Remark}.~}
\newenvironment{proof}{\textit{Proof. }}{\hfill$\blacksquare $}
\newenvironment{sol}{\textbf{Solution }}{\hfill$\blacksquare $}

\newproblemset{problem}{Problem}{Problems}

\theoremstyle{definition}
\newtheorem{definition}{Definition}[section]

\theoremstyle{example}
\newtheorem{example}{Example}[section]

\theoremstyle{exercise}
\newtheorem{exercise}{Exercise}[section]

\theoremstyle{theorem}
\newtheorem{theorem}{Theorem}[section]

\theoremstyle{property}
\newtheorem{property}{Property}[section]