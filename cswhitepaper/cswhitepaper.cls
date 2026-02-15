\NeedsTeXFormat{LaTeX2e}[2020/10/01]
\ProvidesClass{cswhitepaper}[2026/02/15 v1.0 Professional whitepaper document class]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Class Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{kvoptions}
\SetupKeyvalOptions{family=cwp,prefix=cwp@}

% Print annotations and comments
\DeclareBoolOption{printcoms}

% Forward all other options to quantumarticle
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{quantumarticle}}
\ProcessKeyvalOptions*
\makeatletter

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Load Base Class
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\LoadClass{quantumarticle}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PDF Configuration
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\pdfoutput=1                                    % Force PDF output
\RequirePackage[2.0,objcompress,compress]{bxpdfver}  % PDF version control

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Language and Typography
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[english]{babel}                 % Language support
\RequirePackage{microtype}                      % Microtypographic refinements
\RequirePackage{textcomp}                       % Additional text symbols
\RequirePackage{moresize}                       % Extra font sizes
\RequirePackage{setspace}                       % Line spacing
\setstretch{1.10}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Colors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[x11names,dvipsnames]{xcolor}    % Extended color support
\colorlet{docucolor}{blue!50!black}             % Primary accent color

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Text Formatting and Utilities
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[autostyle=true,csdisplay=true]{csquotes}  % Context-sensitive quotes
\RequirePackage[normalem]{ulem}                 % Underline control
\RequirePackage{comment}                        % Comment blocks
\RequirePackage{emptypage}                      % Suppress headers on empty pages
\RequirePackage{etoolbox}                       % Programming tools
\RequirePackage{lipsum}                         % Dummy text
\RequirePackage{marginnote}                     % Margin notes
\RequirePackage{pifont}                         % Dingbats and symbols
\RequirePackage{soul}                           % Highlighting and spacing
\RequirePackage{xspace}                         % Smart spacing after macros
\RequirePackage{xurl}                           % Line-breakable URLs

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Graphics and Figures
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{adjustbox}                      % Box adjustments
\RequirePackage{float}                          % Improved float placement
\RequirePackage{graphicx}                       % Include graphics
\RequirePackage{pdflscape}                      % Landscape pages
\RequirePackage{pdfpages}                       % Include external PDFs
\RequirePackage{placeins}                       % Float barriers
\RequirePackage{rotating}                       % Rotated objects
\RequirePackage{subcaption}                     % Subfigures

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Tables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{array}                          % Extended array/tabular
\RequirePackage{booktabs}                       % Professional tables
\RequirePackage{colortbl}                       % Colored table cells
\RequirePackage{dashbox}                        % Dashed boxes
\RequirePackage{diagbox}                        % Diagonal split cells
\RequirePackage{fbox}                           % Framed boxes
\RequirePackage{longtable}                      % Multi-page tables
\RequirePackage{multicol}                       % Multi-column layouts
\RequirePackage{multirow}                       % Multi-row cells
\RequirePackage{supertabular}                   % Multi-page tables
\RequirePackage{tabularray}                     % Advanced tabular
\RequirePackage{tabularx}                       % Flexible-width tables

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Mathematics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsmath}                        % AMS mathematics
\RequirePackage{amssymb}                        % AMS symbols
\RequirePackage{amsfonts}                       % AMS fonts
\RequirePackage{mathtools}                      % Extensions to amsmath
\RequirePackage{bm}                             % Bold math symbols
\RequirePackage{mathrsfs}                       % Script fonts
\RequirePackage{nicefrac}                       % Compact fractions
\RequirePackage{siunitx}                        % Units and scientific notation
\let\mathbfcal\relax
\let\mathbfscr\relax
\RequirePackage[cal=cm,bb=bboldx,scr=dutchcal]{mathalpha}  % Math alphabets

% Number equations within sections
\numberwithin{equation}{section}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Captions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{caption}
\AtBeginDocument{%
    \captionsetup{%
        font={rm},
        labelfont={color=black,rm},
        labelsep=period,
        skip=5pt
    }%
}
\captionsetup[table]{position=bottom,skip=5pt}
\captionsetup[figure]{position=bottom,skip=5pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Lists
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{enumitem}
\setlist{nosep}
\setlist[enumerate,1]{label=(\arabic*)}
\setlist[enumerate,2]{label=(\alph*)}
\setlist[enumerate,3]{label=(\Roman*)}
\setlist[itemize,1]{label=\ensuremath{\text{-}}}
\setlist[itemize,2]{label=\ensuremath{\bullet}}
\setlist[itemize,3]{label=\ensuremath{\circ}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TikZ and Graphics
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{tikz}
\RequirePackage{tikz-cd}
\RequirePackage{tikz-3dplot}
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.18}

\usetikzlibrary{
    arrows,
    automata,
    backgrounds,
    calc,
    decorations.markings,
    decorations.pathmorphing,
    decorations.text,
    fit,
    graphs,
    intersections,
    matrix,
    patterns,
    positioning,
    scopes,
    shapes.geometric
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Boxes and Frames
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[most]{tcolorbox}
\RequirePackage[skipabove=10pt,skipbelow=10pt,ntheorem,framemethod=Tikz]{mdframed}
\RequirePackage{epigraph}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Hyperlinks and References
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{nameref}
\RequirePackage[nocompress]{cite}
\RequirePackage{xr}

\RequirePackage[
    frenchlinks=true,
    unicode=true,
    bookmarksnumbered=true,
    breaklinks=true,
    colorlinks=true,
    linkcolor=RoyalBlue2,
    citecolor=SlateBlue2,
    urlcolor=SpringGreen2,
    pdfusetitle,
    pdfpagelabels=true,
    pagebackref
]{hyperref}

% Backreference customization
\renewcommand*{\backref}[1]{}
\renewcommand*{\backrefalt}[4]{%
    \ifcase #1\or (Cited on p.~#2).%
    \else (Cited on pp.~#2).%
    \fi
}

\RequirePackage[nameinlink,capitalise,noabbrev]{cleveref}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Table of Contents
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[titles]{tocloft}
\addtolength{\cftsubsecnumwidth}{3.5pt}
\addtolength{\cftsubsubsecnumwidth}{3.5pt}
\addtolength{\cftsecindent}{5pt}
\addtolength{\cftsubsecindent}{8.5pt}
\addtolength{\cftsubsubsecindent}{12pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Appendices
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[page,title,header,titletoc,toc]{appendix}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Section and Title Formatting with Color
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\let\orig@title\title
\let\orig@seccntformat\@seccntformat
\let\orig@section\section
\let\orig@subsection\subsection
\let\orig@subsubsection\subsubsection

% Redefine \title to use color
\renewcommand{\title}[1]{%
    \orig@title{\textcolor{docucolor}{#1}}%
}

% Redefine section numbering format
\renewcommand{\@seccntformat}[1]{%
    \textcolor{docucolor}{\csname the#1\endcsname}\quad%
}

% Redefine \section with color
\renewcommand{\section}{%
    \@ifstar
    {\orig@section*}
    {\@sectionColor}
}
\newcommand{\@sectionColor}[1]{%
    \orig@section{\textcolor{docucolor}{#1}}%
}

% Redefine \subsection with color
\renewcommand{\subsection}{%
    \@ifstar
    {\orig@subsection*}
    {\@subsectionColor}
}
\newcommand{\@subsectionColor}[1]{%
    \orig@subsection{\textcolor{docucolor}{#1}}%
}

% Redefine \subsubsection with color
\renewcommand{\subsubsection}{%
    \@ifstar
    {\orig@subsubsection*}
    {\@subsubsectionColor}
}
\newcommand{\@subsubsectionColor}[1]{%
    \orig@subsubsection{\textcolor{docucolor}{#1}}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Paragraph Headings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Provides inline paragraph headings with automatic punctuation
% Appends period if text doesn't end with . ? ! :

\newif\ifcwp@haspunctuation

\def\cwp@checkpunctuation#1{%
    \ifx\cwp@checkpunctuation#1\cwp@checkpunctuation
    \else
        \cwp@haspunctuationtrue
    \fi
}

\def\cwp@checkdot#1.\cwp@delim#2\cwp@stop{\cwp@checkpunctuation{#2}}
\def\cwp@checkquestion#1?\cwp@delim#2\cwp@stop{\cwp@checkpunctuation{#2}}
\def\cwp@checkexclam#1!\cwp@delim#2\cwp@stop{\cwp@checkpunctuation{#2}}
\def\cwp@checkcolon#1:\cwp@delim#2\cwp@stop{\cwp@checkpunctuation{#2}}

\def\cwp@appendpunctuationifneeded#1{%
    \cwp@haspunctuationfalse
    \cwp@checkdot#1\cwp@delim.\cwp@delim\cwp@stop
    \cwp@checkquestion#1\cwp@delim?\cwp@delim\cwp@stop
    \cwp@checkexclam#1\cwp@delim!\cwp@delim\cwp@stop
    \cwp@checkcolon#1\cwp@delim:\cwp@delim\cwp@stop
    #1\ifcwp@haspunctuation \else.\fi%
}

\def\cwp@ignorewhitespaceandimplicitpars{%
    \begingroup
    \catcode13=10 %
    \@ifnextchar\relax
    {\endgroup}
    {\endgroup}%
}

\newcommand{\cwp@paragraphhead}[1]{%
    \smallskip
    \noindent
    \textbf{\boldmath\ignorespaces\cwp@appendpunctuationifneeded{#1}}%
    \hskip 0.9em plus 0.3em minus 0.3em
    \cwp@ignorewhitespaceandimplicitpars
}

\newcommand{\parhead}[1]{\cwp@paragraphhead{#1}}

\newcommand{\cwp@subparagraphhead}[1]{%
    \smallskip
    \noindent
    \textsc{\ignorespaces\cwp@appendpunctuationifneeded{#1}}%
    \hskip 0.9em plus 0.3em minus 0.3em
    \cwp@ignorewhitespaceandimplicitpars
}

\newcommand{\subparhead}[1]{\cwp@subparagraphhead{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Annotation System
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Collaborative annotation framework with visual margin markers
% Active only when printcoms option is enabled

% Annotation command generator
% Syntax: \newguymarker{cmdname}{displaylabel}{color}

\newcommand{\newguymarker}[3]{%
    \ifcwp@printcoms
        \expandafter\newcommand\csname #1\endcsname[1]{%
            \textcolor{#3}{##1\ \textsc{#2}}%
            \marginnote{\textcolor{#3}{\LARGE$\star$}}%
        }%
    \else
        \expandafter\newcommand\csname #1\endcsname[1]{}%
    \fi
}

\ifcwp@printcoms
    % Workflow annotations
    \providecommand{\todo}[1]{%
        \textcolor{Red}{[\textsc{To-do}: #1]}%
        \marginnote{\textcolor{Red}{\LARGE$\star$}}%
    }
    \providecommand{\fixme}[1]{%
        \textcolor{OrangeRed}{[\textsc{Fix-me}: #1]}%
        \marginnote{\textcolor{OrangeRed}{\LARGE$\star$}}%
    }
    \providecommand{\missing}[1]{%
        \textcolor{Crimson}{#1}%
        \marginnote{\textcolor{Crimson}{\LARGE$\star$}}%
    }
    \providecommand{\notes}[1]{%
        \textcolor{ForestGreen}{[\textsc{Note}: #1]}%
        \marginnote{\textcolor{ForestGreen}{\LARGE$\star$}}%
    }
    \providecommand{\query}[1]{%
        \textcolor{Purple}{[\textsc{Q}: #1]}%
        \marginnote{\textcolor{Purple}{\LARGE$\star$}}%
    }
    % Revision tracking
    \providecommand{\changed}[1]{%
        \textcolor{blue}{#1}%
        \marginnote{\textcolor{blue}{\LARGE$\star$}}%
    }
    \providecommand{\added}[1]{%
        \textcolor{OliveGreen}{#1}%
        \marginnote{\textcolor{OliveGreen}{\LARGE$\star$}}%
    }
    \providecommand{\removed}[1]{%
        \textcolor{Gray}{\sout{#1}}%
        \marginnote{\textcolor{Gray}{\LARGE$\star$}}%
    }
\else
    % Workflow annotations (disabled)
    \providecommand{\todo}[1]{}
    \providecommand{\fixme}[1]{}
    \providecommand{\missing}[1]{}
    \providecommand{\notes}[1]{}
    \providecommand{\query}[1]{}
    % Revision tracking (disabled)
    \providecommand{\changed}[1]{#1}
    \providecommand{\added}[1]{#1}
    \providecommand{\removed}[1]{}
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Custom Environments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Executive note block
\newenvironment{executivenote}[1][]{%
    \begingroup
    \color{gray}%
    \sffamily%
    \small%
    \noindent
    \ifx\relax#1\relax\else
        \textcolor{docucolor}{\textsf{\textbf{#1}}}\par\vspace{0.5em}%
    \fi
}{%
    \endgroup
}

% Abstract block with optional title
\renewenvironment{abstract}[1][]{%
    \noindent\textcolor{docucolor}{\rule{\textwidth}{1pt}}\par
    \begingroup
    \color{black}%
    \sffamily%
    \small%
    \noindent
    \ifx\relax#1\relax\else
        \textcolor{docucolor}{\textsf{\textbf{#1}}}%
    \fi
}{%
    \endgroup
    \par\noindent\textcolor{docucolor}{\rule{\textwidth}{1pt}}
}

% Acknowledgment environment
\newenvironment{acknowledgment}[1][Acknowledgment]{%
    \noindent\textsf{#1.}%
}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Theorem System with thmtools
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsthm}
\RequirePackage{thmtools}

% Theorem style definitions
\declaretheoremstyle[%
    headfont=\sffamily,
    notefont=\normalfont\sffamily,
    bodyfont=\normalfont,
    spaceabove=3pt,
    spacebelow=3pt,
    headpunct=.,
    postheadspace=.5em
]{csam@theoremlike}

\declaretheoremstyle[%
    headfont=\sffamily,
    notefont=\normalfont\sffamily,
    bodyfont=\normalfont,
    spaceabove=3pt,
    spacebelow=3pt,
    headpunct=.,
    postheadspace=.5em
]{csam@definitionlike}

\declaretheoremstyle[%
    headfont=\normalfont\sffamily,
    bodyfont=\normalfont,
    spaceabove=3pt,
    spacebelow=3pt,
    headpunct=.,
    postheadspace=.5em
]{csam@remarklike}

\declaretheoremstyle[%
    headfont=\normalfont\sffamily,
    bodyfont=\normalfont,
    spaceabove=3pt,
    spacebelow=3pt,
    headpunct=.,
    postheadspace=.5em
]{csam@highlightlike}

% Base theorem environment
\declaretheorem[%
    name=Theorem,
    style=csam@theoremlike,
    numberwithin=section
]{theorem}

% Helper macro for declaring sibling environments
\newcommand\csw@declaretheoremfamily[2]{%
    \forcsvlist{\declaretheorem[sibling=theorem,style=#1]}{#2}%
}

% Theorem-like environments (require proof)
\csw@declaretheoremfamily{csam@theoremlike}{%
    assertion,assumption,axiom,claim,conclusion,conjecture,corollary,%
    criterion,fact,folklore,hypothesis,lemma,observation,postulate,%
    property,proposition%
}

% Definition-like environments (introduce concepts)
\csw@declaretheoremfamily{csam@definitionlike}{%
    application,construction,convention,definition,example,experiment,%
    problem,protocol,result,solution,step,notation%
}

% Remark-like environments (observations and commentary)
\csw@declaretheoremfamily{csam@remarklike}{%
    commentary,discussion,exercise,motivation,notationabuse,note,%
    openproblem,question,remark,syntax%
}

% Highlight-like environments (pedagogical emphasis)
\csw@declaretheoremfamily{csam@highlightlike}{%
    guideline,highlight,important,insight,keypoint,recall,summary,%
    takeaway,tip,warning%
}

% Unnumbered theorem variants
\declaretheorem[name=Theorem,style=csam@theoremlike,numbered=no]{theorem*}
\declaretheorem[name=Lemma,style=csam@theoremlike,numbered=no]{lemma*}
\declaretheorem[name=Corollary,style=csam@theoremlike,numbered=no]{corollary*}
\declaretheorem[name=Hypothesis,style=csam@theoremlike,numbered=no]{hypothesis*}
\declaretheorem[name=Claim,style=csam@theoremlike,numbered=no]{claim*}
\declaretheorem[name=Conjecture,style=csam@theoremlike,numbered=no]{conjecture*}
\declaretheorem[name=Open Problem,style=csam@remarklike,numbered=no]{openproblem*}
\declaretheorem[name=Syntax,style=csam@remarklike,numbered=no]{syntax*}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CLEVEREF CONFIGURATION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Assigns human-readable names to all cross-reference types.
% Uses loop macro for efficient bulk assignment.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Sectional units
\crefname{section}{\textsection}{\textsection\textsection}
\Crefname{section}{\textsection}{\textsection\textsection}
\crefname{subsection}{\textsection}{\textsection\textsection}
\Crefname{subsection}{\textsection}{\textsection\textsection}
\crefname{subsubsection}{\textsection}{\textsection\textsection}
\Crefname{subsubsection}{\textsection}{\textsection\textsection}
\crefname{paragraph}{paragraph}{paragraphs}
\Crefname{paragraph}{Paragraph}{Paragraphs}
\crefname{subparagraph}{subparagraph}{subparagraphs}
\Crefname{subparagraph}{Subparagraph}{Subparagraphs}

% Bulk cref name assignment helper
\newcommand\csw@setcrefnames[1]{%
    \forcsvlist{\csw@setcrefname@single}{#1}%
}
\def\csw@setcrefname@single#1{%
    \csw@setcrefname@parse#1\csw@nil
}
\def\csw@setcrefname@parse#1/#2/#3\csw@nil{%
    \crefname{#1}{#2}{#3}%
}

% Theorem environment names
\csw@setcrefnames{%
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
    proof/Proof/Proofs
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
    warning/Warning/Warnings,%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Document-Level Customizations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{%
    \renewcommand{\paragraph}[1]{\parhead{#1}}%
    \renewcommand{\subparagraph}[1]{\noindent\textsc{#1}}%
    \let\oldPr\Pr
    \renewcommand{\Pr}{\mathop{\mathsf{Pr}}}%
}

\makeatother

\endinput