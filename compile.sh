#!/bin/bash
# Compile the Academic CV

echo "Compiling Academic CV..."

# Check if XeLaTeX is available
if command -v xelatex &> /dev/null; then
    echo "Using XeLaTeX..."
    xelatex main.tex
    echo "Compilation complete! Output: main.pdf"
elif command -v lualatex &> /dev/null; then
    echo "Using LuaLaTeX..."
    lualatex main.tex
    echo "Compilation complete! Output: main.pdf"
else
    echo "Error: XeLaTeX or LuaLaTeX is required for this document."
    echo "Please install a TeX distribution that includes these compilers."
    echo "Recommended: TeX Live or MiKTeX"
    exit 1
fi

# Clean up auxiliary files
echo "Cleaning up auxiliary files..."
rm -f *.aux *.log *.out *.fdb_latexmk *.fls *.synctex.gz

echo "Done!"
