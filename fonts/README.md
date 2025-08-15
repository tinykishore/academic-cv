# Required Fonts

This directory should contain the Inter and JetBrains Mono font files as specified in the design.

## Inter Font Family
Download from: https://fonts.google.com/specimen/Inter

Required files:
- `Inter-Regular.ttf`
- `Inter-Light.ttf`
- `Inter-Bold.ttf`
- `Inter-ExtraBold.ttf`
- `Inter-Italic.ttf`
- `Inter-BoldItalic.ttf`

## JetBrains Mono Font Family
Download from: https://fonts.google.com/specimen/JetBrains+Mono

Required files:
- `JetBrainsMono-Regular.ttf`
- `JetBrainsMono-Bold.ttf`
- `JetBrainsMono-Italic.ttf`
- `JetBrainsMono-BoldItalic.ttf`

## Alternative Setup
If you prefer to use system fonts, you can modify the `academic-cv.cls` file to use system-installed versions of these fonts by removing the `Path` and `Extension` parameters from the font setup commands.

## Compilation Note
This CV requires XeLaTeX or LuaLaTeX for compilation due to the custom font usage. Use:
```
xelatex main.tex
```
or
```
lualatex main.tex
```
