\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hsrthesis}[2012/06/06 A LaTex template for HSR Thesis]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

\LoadClass[a4paper]{article}
\RequirePackage{ifthen}
\RequirePackage{graphicx}
\newcommand{\nothing}{}


% Including mostly used packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{textcomp}
\usepackage{mathptmx}
\usepackage[scaled=0.85]{helvet}
\usepackage{hyperref}
\usepackage{array}
\usepackage{ngerman}
%\usepackage{glossaries}
\usepackage{color}
\usepackage{listings} \lstset{backgroundcolor=\color{lightgrey}} \lstset{language=Python}
\usepackage{wrapfig}
\usepackage{url}
\usepackage{float}
\usepackage{natbib}
\usepackage{tabu}
\usepackage{tabularx}
\usepackage{caption}
\usepackage{booktabs}
\usepackage{titlesec}
\usepackage[acronym]{glossaries}
\definecolor{lightgrey}{rgb}{.9,.9,.9}

% drawing things
\usepackage{tikz}
\usetikzlibrary{positioning,shadings}
\usetikzlibrary{arrows}

\renewcommand*\familydefault{\sfdefault}

% Table Stylings
% http://tex.stackexchange.com/a/13748
%%%%%%%%%%%%%%%%%%%%

%\newcommand*\heading[1]{\bfseries{#1}}
\newcommand*\beforeheading{\toprule}
\newcommand*\afterheading{\midrule}
\newcommand*\normalline{}
\newcommand*\lastline{\bottomrule}
\newcommand{\sectionbreak}{\clearpage}


% Titlepage
%%%%%%%%%%%

\if@titlepage
	\renewcommand{\maketitle}{
		\begin{titlepage}
		% Logos
		\begin{picture}(0,200)(0,-100)
      		\put(-60, -30){\includegraphics[height=30mm]{images/hsrlogo.png}}
      		\put(200, -15){\includegraphics[height=20mm]{images/partnerlogo.png}}
		\end{picture}

		% title
		\begin{center}
			\Large\thesistype\\[2ex]
			\huge\thesistitle\\[2ex]
			\large\school\\[1ex]
			\normalsize\term\\
			\normalsize\thedate
			\vfill
		\end{center}

		\begin{minipage}{\textwidth}
			\begin{flushleft}
				\large
				\begin{tabular}[t]{ll}
				% Checking Autor(s)
				\ifthenelse{\equal{\thesisauthora}{}}{\message{blub}}{\ifthenelse{\equal{\thesisauthorb}{}}{\emph{Autor:} & \thesisauthora\\[3pt]}{\ifthenelse{\equal{\thesisauthorc}{}}{\emph{Autoren:} & \thesisauthora \ \& \thesisauthorb\\[3pt]}{\emph{Autoren:} & \thesisauthora \ \& \thesisauthorb \ \& \thesisauthorc\\[3pt]}}}
				% Checking Supporter
				\ifthenelse{\equal{\professor}{}}{\\}{\emph{Betreuer:} & \professor\\[3pt]}
					\emph{Projektpartner:} & \partner\\[3pt]
					\emph{Arbeitsperiode:} & \timeperiode\\[3pt]
					\emph{Arbeitsumfang:} & \workload\\[3pt]
				\end{tabular}
			\end{flushleft}
		\end{minipage}
\end{titlepage}%    
}
   \else
   \renewcommand{\maketitle}{%
     \begin{flushleft}
       \null\hfill
       \vskip 2cm
       \sffamily\bfseries\upshape\huge
       \@title\\
       \mdseries\upshape\large
       \vspace{.5em}%
       \@author, \@date\\
	% \rule{\textwidth}{.5mm}\\
     \end{flushleft}
     \@thanks
     \par
     \vskip 1cm
     }
   \fi