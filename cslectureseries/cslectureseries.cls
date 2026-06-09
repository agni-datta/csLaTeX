%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cslectureseries.cls — Lecture-series book class
%
% Author  : Agni Datta
% GitHub  : https://github.com/agni-datta/csLaTeX
% License : LPPL v1.3c
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[2020/10/01]
\ProvidesClass{cslectureseries}[2026/06/23 v1.2 Lecture series class]

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
        \setmonofont{Anonymous Pro}[Scale=MatchLowercase]
    \fi
    \ifcsls@usebsk
        \setmainfont{Libre Baskerville}[Ligatures=TeX,Scale=MatchUppercase]
        \setsansfont{Biolinum}[Scale=MatchLowercase]
        \setmonofont{Anonymous Pro}[Scale=MatchLowercase]
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
\RequirePackage{amsthm}
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
\RequirePackage{thmtools}

\declaretheoremstyle
[
    headfont      = \scshape ,
    notefont      = \normalfont ,
    bodyfont      = \itshape ,
    spaceabove    = 1em ,
    spacebelow    = 1em ,
    headpunct     = {.} ,
    postheadspace = 0.5em
]{csls@theoremlike}

\declaretheoremstyle
[
    headfont      = \scshape ,
    notefont      = \normalfont ,
    bodyfont      = \normalfont ,
    spaceabove    = 1em ,
    spacebelow    = 1em ,
    headpunct     = {.} ,
    postheadspace = 0.5em
]{csls@definitionlike}

\declaretheoremstyle
[
    headfont      = \scshape ,
    notefont      = \normalfont ,
    bodyfont      = \normalfont ,
    spaceabove    = 1em ,
    spacebelow    = 1em ,
    headpunct     = {.} ,
    postheadspace = 0.5em
]{csls@remarklike}

\declaretheoremstyle
[
    headfont      = \normalfont\sffamily ,
    notefont      = \normalfont ,
    bodyfont      = \normalfont ,
    spaceabove    = 1em ,
    spacebelow    = 1em ,
    headpunct     = {.} ,
    postheadspace = 0.5em
]{csls@highlightlike}

\declaretheoremstyle
[
    headfont      = \itshape ,
    bodyfont      = \normalfont ,
    spaceabove    = 1em ,
    spacebelow    = 1em ,
    headpunct     = {.} ,
    postheadspace = 0.5em ,
    qed           = \qedsymbol
]{csls@proofstyle}

\ProvideDocumentCommand{\setqedsymbol}{m}{ \RenewDocumentCommand{\qedsymbol}{}{#1} }
\ProvideDocumentCommand{\SetQEDSymbol}{m}{ \setqedsymbol{#1} }

\declaretheorem
[
    name         = Theorem ,
    style        = csls@theoremlike ,
    numberwithin = section
]{ theorem }

\NewDocumentCommand{\csls@declaretheoremfamily}{mm}{%
    \forcsvlist{\declaretheorem[sibling=theorem,style=#1]}{#2}%
}

\csls@declaretheoremfamily{csls@theoremlike}{%
    assertion,%
    assumption,%
    axiom,%
    claim,%
    conclusion,%
    conjecture,%
    corollary,%
    criterion,%
    fact,%
    folklore,%
    hypothesis,%
    lemma,%
    observation,%
    postulate,%
    property,%
    proposition%
}
\declaretheorem[name={Informal Theorem},sibling=theorem,style=csls@theoremlike]{informaltheorem}
\declaretheorem[name={Meta Theorem},sibling=theorem,style=csls@theoremlike]{metatheorem}
\csls@declaretheoremfamily{csls@definitionlike}{%
    application,%
    construction,%
    convention,%
    definition,%
    example,%
    experiment,%
    problem,%
    protocol,%
    result,%
    step,%
    notation%
}
\csls@declaretheoremfamily{csls@remarklike}{%
    commentary,%
    discussion,%
    exercise,%
    motivation,%
    notationabuse,%
    note,%
    openproblem,%
    question,%
    remark,%
    syntax%
}
\csls@declaretheoremfamily{csls@highlightlike}{%
    guideline,%
    highlight,%
    important,%
    insight,%
    keypoint,%
    recall,%
    summary,%
    takeaway,%
    tip,%
    warning%
}

\declaretheorem[ name = Claim ,            style = csls@theoremlike , numbered = no ]{ claim* }
\declaretheorem[ name = Conjecture ,       style = csls@theoremlike , numbered = no ]{ conjecture* }
\declaretheorem[ name = Corollary ,        style = csls@theoremlike , numbered = no ]{ corollary* }
\declaretheorem[ name = Hypothesis ,       style = csls@theoremlike , numbered = no ]{ hypothesis* }
\declaretheorem[ name = Lemma ,            style = csls@theoremlike , numbered = no ]{ lemma* }
\declaretheorem[ name = Syntax ,           style = csls@remarklike  , numbered = no ]{ syntax* }
\declaretheorem[ name = Theorem ,          style = csls@theoremlike , numbered = no ]{ theorem* }
\declaretheorem[ name = { Open~Problem } , style = csls@remarklike  , numbered = no ]{ openproblem* }

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
    \RenewDocumentCommand{\qedsymbol}{}{\ensuremath{\diamond}}%
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
