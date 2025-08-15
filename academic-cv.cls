%% academic-cv.cls
%% Academic CV Class File
%% Based on design specifications

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{academic-cv}[2025/08/15 Academic CV Class]

% Load base class
\LoadClass[11pt,a4paper]{article}

% Required packages
\RequirePackage[margin=2cm]{geometry}
\RequirePackage{fontspec}
\RequirePackage{xcolor}
\RequirePackage{hyperref}
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{calc}

% Set up fonts with fallbacks
% Try to use local fonts first, fallback to system fonts
\IfFontExistsTF{./fonts/Inter-Regular.ttf}{
    \setmainfont{Inter}[
        Path = ./fonts/,
        Extension = .ttf,
        UprightFont = *-Regular,
        BoldFont = *-Bold,
        ItalicFont = *-Italic,
        BoldItalicFont = *-BoldItalic
    ]
    
    \newfontfamily\interlight{Inter}[
        Path = ./fonts/,
        Extension = .ttf,
        UprightFont = *-Light
    ]
    
    \newfontfamily\interextrabold{Inter}[
        Path = ./fonts/,
        Extension = .ttf,
        UprightFont = *-ExtraBold
    ]
}{
    % Fallback to system fonts or similar
    \setmainfont{Inter}[Scale=1.0]
    \newfontfamily\interlight{Inter Light}[Scale=1.0]
    \newfontfamily\interextrabold{Inter ExtraBold}[Scale=1.0]
}

\IfFontExistsTF{./fonts/JetBrainsMono-Regular.ttf}{
    \setmonofont{JetBrains Mono}[
        Path = ./fonts/,
        Extension = .ttf,
        UprightFont = *-Regular,
        BoldFont = *-Bold,
        ItalicFont = *-Italic,
        BoldItalicFont = *-BoldItalic
    ]
}{
    % Fallback to system font
    \setmonofont{JetBrains Mono}[Scale=1.0]
}

% Define colors
\definecolor{headertext}{HTML}{666666}
\definecolor{lastname}{HTML}{365B9D}
\definecolor{address}{HTML}{535353}
\definecolor{black}{HTML}{000000}
\definecolor{linkcolor}{HTML}{365B9D}
\definecolor{linkdivider}{HTML}{848484}

% Remove page numbers
\pagestyle{empty}

% Hyperlink setup
\hypersetup{
    colorlinks=false,
    linkcolor=linkcolor,
    urlcolor=linkcolor,
    pdftitle={Academic CV},
    pdfauthor={Your Name}
}

% Command for the CV header - exactly 4 links: email, linkedin, github, website
% Separator macro to guarantee perfectly even spacing around the vertical bar
\newcommand{\linksep}{\kern0.5em{\color{linkcolor}|}\kern1.5em}
\newcommand{\cvheader}[7]{%
    \begin{center}
        % Line 1: "Academic CV of" text
        {\fontsize{11pt}{13pt}\selectfont\interextrabold\color{headertext}Academic CV of}\\[0.5em]
        
        % Line 2: Name with different colors for first and last name (2pt spacing top and bottom)
        \vspace{2pt}
        {\fontsize{20pt}{24pt}\selectfont\interextrabold\color{black}#1 \color{lastname}#2}\\
        \vspace{2pt}
        
        % Line 3: Address (0pt spacing top, 3pt spacing bottom)
        {\fontsize{11pt}{13pt}\selectfont\interlight\color{address}#3}\\
        \vspace{3pt}
        
    % Line 4: Links with icons and proper spacing (8pt top and bottom)
    \vspace{8pt}
    {\fontsize{10pt}{12pt}\selectfont\ttfamily\bfseries\color{linkcolor}%
    #4\linksep#5\linksep#6\linksep#7}\par
    % Full width divider line (approx 2px thickness)
    \vspace{6pt}
    {\color{linkdivider}\rule{\textwidth}{1.5pt}}% 1.5pt ≈ 2px visual weight
    \vspace{10pt}
    \end{center}
    \vspace{1em}
}

% Command for creating a link with icon and proper spacing
\newcommand{\cvlink}[3]{% #1=icon, #2=url, #3=text
    \href{#2}{%
        \color{linkcolor}\ttfamily\bfseries%
        \underline{#3}% Only underline the text
        \IfFileExists{#1}{%
            \hspace{0.25em}% px-1 left spacing for icon
            \raisebox{-0.3em}{\includegraphics[height=1.4em]{#1}}%
            \hspace{0.25em}% px-1 right spacing for icon
        }{%
            % Fallback: just use text without icon, but add some space for consistency
            \hspace{0.5em}%
        }%
    }%
}

% Email link
\newcommand{\emaillink}[1]{%
    \cvlink{images/email.png}{mailto:#1}{#1}
}

% GitHub link
\newcommand{\githublink}[1]{%
    \cvlink{images/github.png}{https://github.com/#1}{#1}
}

% Website link
\newcommand{\websitelink}[1]{%
    \cvlink{images/website.png}{https://#1}{#1}
}

% LinkedIn link
\newcommand{\linkedinlink}[1]{%
    \cvlink{images/linkedin.png}{https://linkedin.com/in/#1}{#1}
}

% LinkedIn placeholder (clickable) showing placeholder text while linking to actual profile.
% Usage: \linkedinplaceholder{LinkedIn}{actual-id}
% This renders styled text + icon as a clickable hyperlink.
\newcommand{\linkedinplaceholder}[2]{%
    \href{https://linkedin.com/in/#2}{%
        \color{linkcolor}\ttfamily\bfseries%
        \underline{#1}% placeholder text (underlined as clickable link)
        \IfFileExists{images/linkedin.png}{%
            \hspace{0.25em}\raisebox{-0.2em}{\includegraphics[height=1.2em]{images/linkedin.png}}\hspace{0.25em}%
        }{}%
    }%
}

% GitHub placeholder (clickable) showing placeholder text while linking to actual profile.
% Usage: \githubplaceholder{GitHub}{actual-username}
\newcommand{\githubplaceholder}[2]{%
    \href{https://github.com/#2}{%
        \color{linkcolor}\ttfamily\bfseries%
        \underline{#1}% placeholder text (underlined as clickable link)
        \IfFileExists{images/github.png}{%
            \hspace{0.25em}\raisebox{-0.2em}{\includegraphics[height=1.2em]{images/github.png}}\hspace{0.25em}%
        }{}%
    }%
}

% Website placeholder (clickable) showing placeholder text while linking to actual website.
% Usage: \websiteplaceholder{Website}{actual-domain.com}
\newcommand{\websiteplaceholder}[2]{%
    \href{https://#2}{%
        \color{linkcolor}\ttfamily\bfseries%
        \underline{#1}% placeholder text (underlined as clickable link)
        \IfFileExists{images/website.png}{%
            \hspace{0.25em}\raisebox{-0.2em}{\includegraphics[height=1.2em]{images/website.png}}\hspace{0.25em}%
        }{}%
    }%
}

% Section command
\newcommand{\cvsection}[1]{%
    \vspace{1em}
    {\Large\bfseries #1}
    \vspace{0.5em}
    \hrule
    \vspace{0.5em}
}

% Subsection command
\newcommand{\cvsubsection}[1]{%
    \vspace{0.5em}
    {\large\bfseries #1}
    \vspace{0.3em}
}

% Item command for CV entries
\newcommand{\cvitem}[4]{%
    \begin{tabularx}{\textwidth}{@{}X r@{}}
        {\bfseries #1} & {\itshape #2} \\
        {\itshape #3} & \\
    \end{tabularx}
    \vspace{0.2em}
    #4
    \vspace{0.5em}
}

% Simple item command
\newcommand{\cvsimpleitem}[2]{%
    \begin{tabularx}{\textwidth}{@{}X r@{}}
        #1 & #2 \\
    \end{tabularx}
    \vspace{0.3em}
}

% List environment for CV
\newenvironment{cvlist}{%
    \begin{itemize}
    \setlength{\itemsep}{0.2em}
    \setlength{\parskip}{0pt}
    \setlength{\parsep}{0pt}
}{%
    \end{itemize}
}
