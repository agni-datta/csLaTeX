\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cslectureseries}[2025/01/01 v1.0 Lecture series class]

\newif\ifcsls@usebsk
\newif\ifcsls@usekpf
\newif\ifcsls@draft

\csls@usekpftrue
\csls@drafttrue

\DeclareOption{bsk}{ \csls@usebsktrue \csls@usekpffalse }
\DeclareOption{kpf}{ \csls@usekpftrue \csls@usebskfalse }
\DeclareOption{draft}{ \csls@drafttrue }
\DeclareOption{final}{ \csls@draftfalse }

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

\LoadClass[11pt,letterpaper,twoside,openright]{book}

\newcommand{\@coursetitle}{Lecture Notes}
\newcommand{\coursetitle}[1]{\renewcommand{\@coursetitle}{#1}}

\RequirePackage{etoolbox}
\RequirePackage{xpatch}
\RequirePackage{xparse}
\RequirePackage{iftex}

\RequirePackage[T1]{fontenc}
\RequirePackage[english]{babel}
\RequirePackage[autostyle]{csquotes}

\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{mathtools}
\RequirePackage{siunitx}

\numberwithin{equation}{section}

\ifcsls@usekpf
    \RequirePackage[nosf,noDcommand]{kpfonts}
    \let\mathbfcal\relax
    \let\mathbfscr\relax
\fi

\ifcsls@usebsk
    \RequirePackage[proportional,osf]{Baskervaldx}
    \RequirePackage[baskervaldx,cmintegrals,bigdelims,vvarbb]{newtxmath}
\fi

\RequirePackage{biolinum}
\RequirePackage[scr=boondoxo,cal=stixplain,bb=stix]{mathalpha}

\RequirePackage[final,protrusion=true,expansion=true]{microtype}

\microtypesetup{activate=true,final,protrusion=true,expansion=true,stretch=50,factor=1250}
\UseMicrotypeSet[protrusion]{basicmath}
\UseMicrotypeSet[expansion]{alltext}

\SetExpansion{encoding=*,family=*}{stretch=50,shrink=50,step=1}

\SetProtrusion{encoding=*,family=*}{
    period    = { ,50},
    comma     = { ,40},
    colon     = { ,30},
    semicolon = { ,30}
}

\emergencystretch=2em

\RequirePackage{tikz-cd}
\RequirePackage[x11names]{xcolor}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{float}
\RequirePackage[font=small,labelfont=sc,labelsep=period]{caption}

\RequirePackage[margin=1in]{geometry}
\setlength{\headheight}{15pt}

\RequirePackage{enumitem}
\setlist{nosep}

\RequirePackage{setspace}
\setstretch{1.125}

\RequirePackage{emptypage}

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}

\renewcommand{\chaptermark}[1]{%
    \markboth{\normalfont\scshape\chaptername\ \thechapter.\ #1}{}%
}

\fancyhead[LE,RO]{\thepage}
\fancyhead[CO]{\leftmark}
\fancyhead[CE]{\scshape\@coursetitle}
\renewcommand{\headrulewidth}{0.5pt}

\RequirePackage{titlesec}

\newcommand{\csls@chapterbox}[2]{%
    \par\noindent
    \fboxsep=8pt\fboxrule=0.6pt
    \fbox{%
        \begin{minipage}{\dimexpr\linewidth-2\fboxsep-2\fboxrule\relax}%
            \centering
            \ifx\relax#1\relax
                {\large\scshape #2}%
            \else
                {\normalsize\scshape #1}\\[4pt]%
                {\LARGE\scshape #2}%
            \fi
        \end{minipage}%
    }\par
}

\titleformat{\chapter}[block]
{}{}
{0pt}
{\csls@chapterbox{\chaptertitlename\ \thechapter}}

\titleformat{name=\chapter,numberless}[block]
{}{}
{0pt}
{\csls@chapterbox{\relax}}

\titlespacing*{\chapter}{0pt}{2\baselineskip}{2\baselineskip}

\titleformat{\section}
{\normalfont\large\scshape\centering}
{\thesection}{1em}{}

\titleformat{\subsection}[runin]
{\normalfont\normalsize\scshape}
{\thesubsection}{1em}{}[.]

\RequirePackage{tocbibind}
\RequirePackage{imakeidx}
\makeindex[columns=2,title=Index,intoc]
\indexsetup{othercode=\small}

\let\csls@oldemph\emph
\renewcommand{\emph}[1]{\csls@oldemph{#1}\index{#1}}

\RequirePackage{hyperref}
\hypersetup{
    colorlinks = true,
    linkcolor  = DodgerBlue3,
    citecolor  = DodgerBlue3,
    urlcolor   = DodgerBlue3,
}

\AtBeginDocument{%
    \hypersetup{pdftitle={\@coursetitle},pdfauthor={\@author}}%
}

\RequirePackage[nameinlink,noabbrev,capitalize]{cleveref}

\RequirePackage[most]{tcolorbox}
\RequirePackage[skipabove=10pt,skipbelow=10pt,ntheorem,framemethod=TikZ]{mdframed}
\RequirePackage{thmtools}

\declaretheoremstyle[
    headfont=\scshape, notefont=\normalfont, bodyfont=\itshape,
    spaceabove=1em, spacebelow=1em, headpunct={.}, postheadspace=0.5em
]{csls@theoremlike}

\declaretheoremstyle[
    headfont=\scshape, notefont=\normalfont, bodyfont=\normalfont,
    spaceabove=1em, spacebelow=1em, headpunct={.}, postheadspace=0.5em
]{csls@definitionlike}

\declaretheoremstyle[
    headfont=\scshape, notefont=\normalfont, bodyfont=\normalfont,
    spaceabove=1em, spacebelow=1em, headpunct={.}, postheadspace=0.5em
]{csls@remarklike}

\declaretheoremstyle[
    headfont=\normalfont\sffamily, notefont=\normalfont, bodyfont=\normalfont,
    spaceabove=1em, spacebelow=1em, headpunct={.}, postheadspace=0.5em
]{csls@highlightlike}

\declaretheoremstyle[
    headfont=\itshape, bodyfont=\normalfont,
    spaceabove=1em, spacebelow=1em, headpunct={.}, postheadspace=0.5em,
    qed=\qedsymbol
]{csls@proofstyle}

\declaretheorem[name=Theorem,style=csls@theoremlike,numberwithin=section]{theorem}

\newcommand\csls@declaretheoremfamily[2]{%
    \forcsvlist{\declaretheorem[sibling=theorem,style=#1]}{#2}%
}

\csls@declaretheoremfamily{csls@theoremlike}{%
    assertion,assumption,axiom,claim,conclusion,conjecture,corollary,%
    criterion,fact,folklore,hypothesis,lemma,observation,postulate,%
    property,proposition%
}
\csls@declaretheoremfamily{csls@definitionlike}{%
    application,construction,convention,definition,example,experiment,%
    problem,protocol,result,step,notation%
}
\csls@declaretheoremfamily{csls@remarklike}{%
    commentary,discussion,exercise,motivation,notationabuse,note,%
    openproblem,question,remark,syntax%
}
\csls@declaretheoremfamily{csls@highlightlike}{%
    guideline,highlight,important,insight,keypoint,recall,summary,%
    takeaway,tip,warning%
}

\declaretheorem[name=Theorem,     style=csls@theoremlike,  numbered=no]{theorem*}
\declaretheorem[name=Lemma,       style=csls@theoremlike,  numbered=no]{lemma*}
\declaretheorem[name=Corollary,   style=csls@theoremlike,  numbered=no]{corollary*}
\declaretheorem[name=Hypothesis,  style=csls@theoremlike,  numbered=no]{hypothesis*}
\declaretheorem[name=Claim,       style=csls@theoremlike,  numbered=no]{claim*}
\declaretheorem[name=Conjecture,  style=csls@theoremlike,  numbered=no]{conjecture*}
\declaretheorem[name=Open Problem,style=csls@remarklike,   numbered=no]{openproblem*}
\declaretheorem[name=Syntax,      style=csls@remarklike,   numbered=no]{syntax*}

\let\proof\relax
\let\endproof\relax
\declaretheorem[name=Proof,style=csls@proofstyle,numbered=no]{proof}

\newenvironment{solution}
{\begin{proof}[\textnormal{\textsc{Solution}}]\renewcommand{\qedsymbol}{$\diamond$}}
{\end{proof}}

\newcommand\csls@setcrefnames[1]{\forcsvlist{\csls@setcrefname@single}{#1}}
\def\csls@setcrefname@single#1{\csls@setcrefname@parse#1\csls@nil}
\def\csls@setcrefname@parse#1/#2/#3\csls@nil{\crefname{#1}{#2}{#3}}

\csls@setcrefnames{%
    application/Application/Applications,%
    assertion/Assertion/Assertions,%
    assumption/Assumption/Assumptions,%
    axiom/Axiom/Axioms,%
    claim/Claim/Claims,%
    commentary/Commentary/Commentaries,%
    conclusion/Conclusion/Conclusions,%
    conjecture/Conjecture/Conjectures,%
    construction/Construction/Constructions,%
    convention/Convention/Conventions,%
    corollary/Corollary/Corollaries,%
    criterion/Criterion/Criteria,%
    definition/Definition/Definitions,%
    discussion/Discussion/Discussions,%
    example/Example/Examples,%
    exercise/Exercise/Exercises,%
    experiment/Experiment/Experiments,%
    fact/Fact/Facts,%
    folklore/Folklore/Folklore,%
    guideline/Guideline/Guidelines,%
    highlight/Highlight/Highlights,%
    hypothesis/Hypothesis/Hypotheses,%
    important/Important point/Important points,%
    insight/Insight/Insights,%
    keypoint/Key point/Key points,%
    lemma/Lemma/Lemmas,%
    motivation/Motivation/Motivations,%
    notation/Notation/Notations,%
    notationabuse/Notation abuse/Notation abuses,%
    note/Note/Notes,%
    observation/Observation/Observations,%
    openproblem/Open problem/Open problems,%
    postulate/Postulate/Postulates,%
    problem/Problem/Problems,%
    proof/Proof/Proofs,%
    property/Property/Properties,%
    proposition/Proposition/Propositions,%
    protocol/Protocol/Protocols,%
    question/Question/Questions,%
    recall/Recall/Recalls,%
    remark/Remark/Remarks,%
    result/Result/Results,%
    solution/Solution/Solutions,%
    step/Step/Steps,%
    summary/Summary/Summaries,%
    syntax/Syntax/Syntaxes,%
    takeaway/Takeaway/Takeaways,%
    theorem/Theorem/Theorems,%
    tip/Tip/Tips,%
    warning/Warning/Warnings%
}

\RequirePackage{marginnote}

\newcommand{\csls@brokenrefmark}[1]{%
    \marginnote[%
        {\color{Firebrick2}\normalfont\smash{\LARGE$\star$}\,\tiny\sffamily#1}%
    ]{%
        {\color{Firebrick2}\normalfont\smash{\LARGE$\star$}\,\tiny\sffamily#1}%
    }%
}

\newbool{csls@markundef}
\booltrue{csls@markundef}

\xpretocmd{\G@refundefinedtrue}{%
    \ifbool{csls@markundef}{%
        \ifcsls@draft
            \csls@brokenrefmark{\@ifundefined{@citeb}{}{\@citeb}}%
        \fi
    }{}%
}{}{}

\let\csls@old@setref\@setref
\renewcommand{\@setref}[3]{%
    \ifcsls@draft\ifx#1\relax\csls@brokenrefmark{#3}\fi\fi
    \csboolfalse{csls@markundef}%
    \csls@old@setref{#1}{#2}{#3}%
    \csbooltrue{csls@markundef}%
}

\newcommand{\newguymarker}[3]{%
    \ifcsls@draft
        \expandafter\newcommand\csname #1\endcsname[1]{%
            \textcolor{#3}{##1\ \textsc{#2}}%
            \marginnote{\textcolor{#3}{\LARGE$\star$}}%
        }%
    \else
        \expandafter\newcommand\csname #1\endcsname[1]{}%
    \fi
}

\ifcsls@draft
    \providecommand{\todo}[1]{%
        \textcolor{Red}{[\textsc{To-do}: #1]}\marginnote{\textcolor{Red}{\LARGE$\star$}}}
    \providecommand{\fixme}[1]{%
        \textcolor{OrangeRed}{[\textsc{Fix-me}: #1]}\marginnote{\textcolor{OrangeRed}{\LARGE$\star$}}}
    \providecommand{\missing}[1]{%
        \textcolor{Crimson}{#1}\marginnote{\textcolor{Crimson}{\LARGE$\star$}}}
    \providecommand{\notes}[1]{%
        \textcolor{ForestGreen}{[\textsc{Note}: #1]}\marginnote{\textcolor{ForestGreen}{\LARGE$\star$}}}
    \providecommand{\query}[1]{%
        \textcolor{Purple}{[\textsc{Q}: #1]}\marginnote{\textcolor{Purple}{\LARGE$\star$}}}
    \providecommand{\changed}[1]{%
        \textcolor{blue}{#1}\marginnote{\textcolor{blue}{\LARGE$\star$}}}
    \providecommand{\added}[1]{%
        \textcolor{OliveGreen}{#1}\marginnote{\textcolor{OliveGreen}{\LARGE$\star$}}}
    \providecommand{\removed}[1]{%
        \textcolor{Gray}{\sout{#1}}\marginnote{\textcolor{Gray}{\LARGE$\star$}}}
\else
    \providecommand{\todo}[1]{}
    \providecommand{\fixme}[1]{}
    \providecommand{\missing}[1]{}
    \providecommand{\notes}[1]{}
    \providecommand{\query}[1]{}
    \providecommand{\changed}[1]{#1}
    \providecommand{\added}[1]{#1}
    \providecommand{\removed}[1]{}
\fi

\newif\ifcsls@haspunctuation

\def\csls@checkpunctuation#1{%
    \ifx\csls@checkpunctuation#1\csls@checkpunctuation\else\csls@haspunctuationtrue\fi
}
\def\csls@checkdot#1.\csls@delim#2\csls@stop{\csls@checkpunctuation{#2}}
\def\csls@checkquestion#1?\csls@delim#2\csls@stop{\csls@checkpunctuation{#2}}
\def\csls@checkexclam#1!\csls@delim#2\csls@stop{\csls@checkpunctuation{#2}}
\def\csls@checkcolon#1:\csls@delim#2\csls@stop{\csls@checkpunctuation{#2}}

\def\csls@appendpunctuationifneeded#1{%
    \csls@haspunctuationfalse
    \csls@checkdot#1\csls@delim.\csls@delim\csls@stop
    \csls@checkquestion#1\csls@delim?\csls@delim\csls@stop
    \csls@checkexclam#1\csls@delim!\csls@delim\csls@stop
    \csls@checkcolon#1\csls@delim:\csls@delim\csls@stop
    #1\ifcsls@haspunctuation\else.\fi%
}

\def\csls@swallowpar{%
    \begingroup\catcode13=10
    \@ifnextchar\relax{\endgroup}{\endgroup}%
}

\NewDocumentCommand{\parhead}{m}{%
    \smallskip\noindent
    \textsc{\ignorespaces\csls@appendpunctuationifneeded{#1}}%
    \hskip 0.9em plus 0.3em minus 0.3em
    \csls@swallowpar
}

\NewDocumentCommand{\subparhead}{m}{%
    \smallskip\noindent
    \textit{\ignorespaces\csls@appendpunctuationifneeded{#1}}%
    \hskip 0.9em plus 0.3em minus 0.3em
    \csls@swallowpar
}

\renewcommand{\maketitle}{%
    \begin{titlepage}%
        \thispagestyle{empty}%
        \centering
        \noindent\rule{\linewidth}{1pt}\par
        \vspace{2.5cm}
        {\normalsize\scshape Lecture Notes on\par}%
        \vspace{0.75cm}
        {\Huge\scshape\@coursetitle\par}%
        \vspace{2.5cm}
        {\normalsize\itshape by\par}%
        \vspace{0.5cm}
        {\Large\scshape\@author\par}%
        \vfill
        {\normalsize\scshape\@date\par}%
        \vspace{1.5cm}
        \noindent\rule{\linewidth}{1pt}\par
    \end{titlepage}%
    \setcounter{page}{1}%
}

\AtBeginDocument{%
    \renewcommand{\paragraph}[1]{\parhead{#1}}%
    \renewcommand{\subparagraph}[1]{\subparhead{#1}}%
    \renewcommand{\Pr}{\mathop{\mathsf{Pr}}}%
}

\endinput