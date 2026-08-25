%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cslectureseries.cls — Lecture-series book class
%
% Author  : Agni Datta
% GitHub  : https://github.com/agni-datta/csLaTeX
% License : LPPL v1.3c
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[2020/10/01]
\ProvidesClass{cslectureseries}[2026/08/25 v1.3 Lecture series class]

\RequirePackage{l3keys2e}
\makeatletter
\ExplSyntaxOn

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\bool_new:N \g_csls_usebsk_bool
\bool_new:N \g_csls_usekpf_bool
\bool_new:N \g_csls_draft_bool

\keys_define:nn { cslectureseries }
{
    bsk     .code:n = { \bool_gset_true:N  \g_csls_usebsk_bool
            \bool_gset_false:N \g_csls_usekpf_bool } ,
    kpf     .code:n = { \bool_gset_true:N  \g_csls_usekpf_bool
            \bool_gset_false:N \g_csls_usebsk_bool } ,
    draft   .code:n = { \bool_gset_true:N  \g_csls_draft_bool  } ,
    final   .code:n = { \bool_gset_false:N \g_csls_draft_bool  } ,
    unknown .code:n = { \PassOptionsToClass{#1}{book} } ,
}
\bool_gset_true:N  \g_csls_usekpf_bool
\bool_gset_false:N \g_csls_usebsk_bool
\bool_gset_true:N  \g_csls_draft_bool
\ProcessKeysOptions { cslectureseries }

\newif\ifcsls@usebsk \bool_if:NTF \g_csls_usebsk_bool { \csls@usebsktrue } { \csls@usebskfalse }
\newif\ifcsls@usekpf \bool_if:NTF \g_csls_usekpf_bool { \csls@usekpftrue } { \csls@usekpffalse }
\newif\ifcsls@draft  \bool_if:NTF \g_csls_draft_bool { \csls@drafttrue  } { \csls@draftfalse  }

\ExplSyntaxOff

\LoadClass[11pt,letterpaper,twoside,openright]{book}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course title
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\@coursetitle{Lecture Notes}
\NewDocumentCommand{\coursetitle}{m}{\def\@coursetitle{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Core packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{etoolbox}
\RequirePackage{iftex}
\RequirePackage{xpatch}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Typography and fonts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifPDFTeX
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
\else
    \RequirePackage{fontspec}
    \ifcsls@usekpf
        \setmainfont{KpRoman}[Ligatures=TeX]
        \setsansfont{KpSans}[Scale=MatchLowercase]
        \setmonofont{Inconsolatazi4-Regular.otf}[
            BoldFont          = Inconsolatazi4-Bold.otf,
            ItalicFont        = Inconsolatazi4-Regular.otf,
            ItalicFeatures    = {FakeSlant=0.2},
            BoldItalicFont    = Inconsolatazi4-Bold.otf,
            BoldItalicFeatures = {FakeSlant=0.2},
            Scale             = MatchLowercase
        ]
    \fi
    \ifcsls@usebsk
        \setmainfont{Libre Baskerville}[Ligatures=TeX,Scale=MatchUppercase]
        \setsansfont{Biolinum}[Scale=MatchLowercase]
        \setmonofont{Inconsolatazi4-Regular.otf}[
            BoldFont          = Inconsolatazi4-Bold.otf,
            ItalicFont        = Inconsolatazi4-Regular.otf,
            ItalicFeatures    = {FakeSlant=0.2},
            BoldItalicFont    = Inconsolatazi4-Bold.otf,
            BoldItalicFeatures = {FakeSlant=0.2},
            Scale             = MatchLowercase
        ]
    \fi
\fi

\RequirePackage[final,protrusion=true,expansion=true]{microtype}
\microtypesetup{activate=true,final,protrusion=true,expansion=true,stretch=30,factor=1500}
\UseMicrotypeSet[protrusion]{basicmath}
\UseMicrotypeSet[expansion]{alltext}
\SetExpansion{encoding=*,family=*}{stretch=30,shrink=30,step=1}
\SetProtrusion{encoding=*,family=*}{
    period    = { ,50},
    comma     = { ,40},
    colon     = { ,30},
    semicolon = { ,30}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Language and quotation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{babel}
\RequirePackage[autostyle]{csquotes}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Mathematics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage[scr=boondoxo,cal=stixplain,bb=stix]{mathalpha}

\numberwithin{equation}{section}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Color, graphics, and floats
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[dvipsnames,table,x11names]{xcolor}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage{float}
\RequirePackage[font=small,labelfont=sc,labelsep=period]{caption}
\RequirePackage{tikz-cd}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Page layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[margin=1in]{geometry}
\setlength{\headheight}{15pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Lists
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{enumitem}
\setlist{nosep}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Spacing and empty pages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{emptypage}
\RequirePackage{setspace}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Headers and footers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}

\RenewDocumentCommand{\chaptermark}{m}{%
    \markboth{\normalfont\scshape\chaptername\ \thechapter.\ #1}{}%
}

\fancyhead[LE,RO]{\thepage}
\fancyhead[CO]{\leftmark}
\fancyhead[CE]{\scshape\@coursetitle}
\RenewDocumentCommand{\headrulewidth}{}{0.5pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Section headings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{titlesec}

\NewDocumentCommand{\csls@chapterbox}{mm}{%
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Table of contents and index
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{tocbibind}
\RequirePackage{imakeidx}
\makeindex[columns=2,title=Index,intoc]
\indexsetup{othercode=\small}

\let\csls@oldemph\emph
\NewDocumentCommand{\emphindex}{m}{\csls@oldemph{#1}\index{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% References
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{hyperref}
\hypersetup{
    colorlinks = true,
    citecolor  = SteelBlue4,
    linkcolor  = SteelBlue4,
    urlcolor   = SteelBlue4,
}

\AtBeginDocument{%
    \hypersetup{pdftitle={\@coursetitle},pdfauthor={\@author}}%
}

\RequirePackage[nameinlink,noabbrev,capitalize]{cleveref}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Theorem environments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[
    skipabove   = 0.5\baselineskip ,
    skipbelow   = 0.5\baselineskip ,
    framemethod = default
]{mdframed}
\@ifpackageloaded{ntheorem}{%
	\@ifpackagewith{ntheorem}{amsmath}{}{%
		\PackageError{csLaTeX}{ntheorem was loaded without its amsmath option}
		{Load ntheorem with the amsmath, amsthm, hyperref, and thmmarks options.}%
	}
	\@ifpackagewith{ntheorem}{amsthm}{}{%
		\PackageError{csLaTeX}{ntheorem was loaded without its amsthm option}
		{Load ntheorem with the amsmath, amsthm, hyperref, and thmmarks options.}%
	}
	\@ifpackagewith{ntheorem}{hyperref}{}{%
		\PackageError{csLaTeX}{ntheorem was loaded without its hyperref option}
		{Load ntheorem with the amsmath, amsthm, hyperref, and thmmarks options.}%
	}
	\@ifpackagewith{ntheorem}{thmmarks}{}{%
		\PackageError{csLaTeX}{ntheorem was loaded without its thmmarks option}
		{Load ntheorem with the amsmath, amsthm, hyperref, and thmmarks options.}%
	}
}{%
	\@ifpackageloaded{amsthm}{%
		\@ifclassloaded{amsart}{}{%
			\@ifclassloaded{amsbook}{}{%
				\PackageError{csLaTeX}{amsthm.sty is incompatible with this ntheorem backend}
				{Remove the explicit amsthm package load.}%
			}%
		}%
	}{}
	% AMS classes predefine these styles and proof commands. ntheorem owns them after this point.
	\@ifclassloaded{amsart}{\let\th@plain\relax\let\th@definition\relax\let\th@remark\relax}{}
	\@ifclassloaded{amsbook}{\let\th@plain\relax\let\th@definition\relax\let\th@remark\relax}{}
	\let\proof\relax
	\let\endproof\relax
	\let\proofname\relax
	\let\openbox\relax
	\RequirePackage[amsmath,amsthm,hyperref,thmmarks]{ntheorem}%
}

% TeX Live 2026's ntheorem drops an end mark after ordinary text when no trailing skip is present.
\@ifundefined{cslatex@ntheoremendmarkpatched}{%
	\gdef\@endtrivlist#1{%
		\if@inlabel \indent\fi
		\if@newlist \@noitemerr\fi
		\ifhmode
			\ifdim\lastskip >\z@ \unskip\fi
			#1\unskip\par
		\fi
		\if@noparlist\else
			\ifdim\lastskip >\z@
				\@tempskipa\lastskip \vskip-\lastskip
				\advance\@tempskipa\parskip \advance\@tempskipa-\@outerparskip
				\vskip\@tempskipa
			\fi
			\@endparenv
		\fi
	}%
	\global\let\cslatex@ntheoremendmarkpatched\@empty
}{}

\newtheoremstyle{cslsplain}
{\item[\hskip\labelsep\theorem@headerfont ##1\ ##2\unskip\theorem@separator]}
{\item[\hskip\labelsep\theorem@headerfont ##1\ ##2\ {\normalfont(##3)}\unskip\theorem@separator]}
\newtheoremstyle{nonumbercslsplain}
{\item[\hskip\labelsep\theorem@headerfont ##1\unskip\theorem@separator]}
{\item[\hskip\labelsep\theorem@headerfont ##1\ {\normalfont(##3)}\unskip\theorem@separator]}

\def\csls@configuretheorem#1#2{%
    \theoremstyle{cslsplain}%
    \theoremheaderfont{#1}%
    \theorembodyfont{#2}%
    \theoremseparator{.}%
    \theorempreskip{1em}%
    \theorempostskip{1em}%
    \theoremsymbol{}%
}
\def\csls@newtheorem#1{\expandafter\csls@newtheorem@parse#1\csls@nil}
\def\csls@newtheorem@parse#1/#2\csls@nil{\newtheorem{#1}[theorem]{#2}}
\def\csls@newtheoremfamily#1#2#3{\csls@configuretheorem{#1}{#2}\forcsvlist{\csls@newtheorem}{#3}}
\def\csls@renewtheoremstar#1{\expandafter\csls@renewtheoremstar@parse#1\csls@nil}
\def\csls@renewtheoremstar@parse#1/#2\csls@nil{\renewtheorem*{#1}{#2}}

\csls@configuretheorem{\scshape}{\itshape}
\newtheorem{theorem}{Theorem}[section]
\csls@newtheoremfamily{\scshape}{\itshape}{%
    assertion/Assertion,assumption/Assumption,axiom/Axiom,claim/Claim,
    conclusion/Conclusion,conjecture/Conjecture,corollary/Corollary,
    criterion/Criterion,fact/Fact,folklore/Folklore,hypothesis/Hypothesis,
    informaltheorem/Informal Theorem,lemma/Lemma,metatheorem/Meta Theorem,
    observation/Observation,postulate/Postulate,property/Property,proposition/Proposition%
}
\csls@newtheoremfamily{\scshape}{\normalfont}{%
    application/Application,construction/Construction,convention/Convention,
    definition/Definition,example/Example,experiment/Experiment,problem/Problem,
    protocol/Protocol,result/Result,step/Step,notation/Notation,
    commentary/Commentary,discussion/Discussion,exercise/Exercise,motivation/Motivation,
    notationabuse/Notation Abuse,note/Note,openproblem/Open Problem,question/Question,
    remark/Remark,syntax/Syntax%
}
\csls@newtheoremfamily{\normalfont\sffamily}{\normalfont}{%
    guideline/Guideline,highlight/Highlight,important/Important,insight/Insight,
    keypoint/Key Point,recall/Recall,summary/Summary,takeaway/Takeaway,tip/Tip,warning/Warning%
}
\csls@configuretheorem{\scshape}{\itshape}
\forcsvlist{\csls@renewtheoremstar}{%
    claim*/Claim,conjecture*/Conjecture,corollary*/Corollary,hypothesis*/Hypothesis,
    lemma*/Lemma,theorem*/Theorem%
}
\csls@configuretheorem{\scshape}{\normalfont}
\forcsvlist{\csls@renewtheoremstar}{syntax*/Syntax,openproblem*/Open Problem}

\global\qedsymbol{\ensuremath{\square}}
\renewcommand{\proofSymbol}{\the\qedsymbol}
\ProvideDocumentCommand{\setqedsymbol}{m}{\global\qedsymbol{#1}}
\ProvideDocumentCommand{\SetQEDSymbol}{m}{\setqedsymbol{#1}}

\NewDocumentEnvironment{proofsketch}{o}
{
    \IfNoValueTF{#1}
    { \begin{proof}[Proof~(Sketch)] }
    { \begin{proof}[Proof~(Sketch~#1)] }
}
{ \end{proof} }

\NewDocumentEnvironment{proofidea}{o}
{
    \IfNoValueTF{#1}
    { \begin{proof}[Proof~(Idea)] }
    { \begin{proof}[Proof~(Idea~#1)] }
}
{ \end{proof} }

\NewDocumentEnvironment{proofofclaim}{o}
{
    \IfNoValueTF{#1}
    { \begin{proof}[Proof~of~Claim] }
    { \begin{proof}[Proof~of~Claim~(#1)] }
}
{ \end{proof} }

\NewDocumentEnvironment{solution}{}{%
    \begingroup
    \begin{proof}[\textnormal{\textsc{Solution}}]%
    \qedsymbol{\ensuremath{\diamond}}%
}{%
    \end{proof}%
    \endgroup
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Cross-reference names (cleveref)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NewDocumentCommand{\csls@setcrefnames}{m}{\forcsvlist{\csls@setcrefname@single}{#1}}
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Broken-reference markers
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{marginnote}

\NewDocumentCommand{\csls@brokenrefmark}{m}{%
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
\RenewDocumentCommand{\@setref}{m m m}{%
    \ifcsls@draft\ifx#1\relax\csls@brokenrefmark{#3}\fi\fi
    \boolfalse{csls@markundef}%
    \csls@old@setref{#1}{#2}{#3}%
    \booltrue{csls@markundef}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Draft annotations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NewDocumentCommand{\newguymarker}{mmm}{%
    \ifcsls@draft
        \expandafter\NewDocumentCommand\csname #1\endcsname{m}{%
            \textcolor{#3}{##1\ \textsc{#2}}%
            \marginnote{\textcolor{#3}{\LARGE$\star$}}%
        }%
    \else
        \expandafter\NewDocumentCommand\csname #1\endcsname{m}{}%
    \fi
}

\ifcsls@draft
    \ProvideDocumentCommand{\todo}   {m}{\textcolor{Red}{[\textsc{To-do}: #1]}\marginnote{\textcolor{Red}{\LARGE$\star$}}}
    \ProvideDocumentCommand{\fixme}  {m}{\textcolor{OrangeRed}{[\textsc{Fix-me}: #1]}\marginnote{\textcolor{OrangeRed}{\LARGE$\star$}}}
    \ProvideDocumentCommand{\missing}{m}{\textcolor{Crimson}{#1}\marginnote{\textcolor{Crimson}{\LARGE$\star$}}}
    \ProvideDocumentCommand{\notes}  {m}{\textcolor{ForestGreen}{[\textsc{Note}: #1]}\marginnote{\textcolor{ForestGreen}{\LARGE$\star$}}}
    \ProvideDocumentCommand{\query}  {m}{\textcolor{Purple}{[\textsc{Q}: #1]}\marginnote{\textcolor{Purple}{\LARGE$\star$}}}
    \ProvideDocumentCommand{\changed}{m}{\textcolor{blue}{#1}\marginnote{\textcolor{blue}{\LARGE$\star$}}}
    \ProvideDocumentCommand{\added}  {m}{\textcolor{OliveGreen}{#1}\marginnote{\textcolor{OliveGreen}{\LARGE$\star$}}}
    \ProvideDocumentCommand{\removed}{m}{\textcolor{Gray}{\sout{#1}}\marginnote{\textcolor{Gray}{\LARGE$\star$}}}
\else
    \ProvideDocumentCommand{\todo}   {m}{}
    \ProvideDocumentCommand{\fixme}  {m}{}
    \ProvideDocumentCommand{\missing}{m}{}
    \ProvideDocumentCommand{\notes}  {m}{}
    \ProvideDocumentCommand{\query}  {m}{}
    \ProvideDocumentCommand{\changed}{m}{#1}
    \ProvideDocumentCommand{\added}  {m}{#1}
    \ProvideDocumentCommand{\removed}{m}{}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Paragraph headings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
    \hskip 0.30em
    \ignorespaces
}

\NewDocumentCommand{\subparhead}{m}{%
    \smallskip\noindent
    \textit{\ignorespaces\csls@appendpunctuationifneeded{#1}}%
    \hskip 0.30em
    \ignorespaces
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RenewDocumentCommand{\maketitle}{}{%
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% AtBeginDocument hooks
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtBeginDocument{%
    \RenewDocumentCommand{\paragraph}   {m}{\parhead{#1}}%
    \RenewDocumentCommand{\subparagraph}{m}{\subparhead{#1}}%
    \RenewDocumentCommand{\Pr}          {}{\mathop{\mathsf{Pr}}}%
}

\makeatother
\endinput
