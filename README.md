### Academic CV Template (Personal Use)

This is a LaTeX template for creating an academic CV based on the design specifications in `DESIGN.md`. The template uses the Inter and JetBrains Mono fonts and creates a clean, professional academic CV layout.

## Features

- **Custom Header**: Displays "Academic CV of" with name, address, and contact links
- **Color-coded Elements**: Different colors for various text elements as specified in the design
- **Icon Support**: Icons for email, GitHub, website, and LinkedIn links
- **Professional Sections**: Pre-designed sections for education, research, publications, teaching, awards, skills, and service
- **Flexible Layout**: Easy to customize and extend

## Files Structure

```
├── academic-cv.cls     # LaTeX class file with all formatting
├── main.tex            # Main CV document (example)
├── DESIGN.md           # Design specifications
├── compile.sh          # Compilation script
├── fonts/              # Font files directory
│   └── README.md       # Font requirements
└── images/             # Icon files directory
    └── README.md       # Icon requirements
```

## Quick Start

1. **Install Required Fonts**: Download Inter and JetBrains Mono fonts and place them in the `fonts/` directory (see `fonts/README.md`)

2. **Add Icons**: Download or create small icons for email, GitHub, website, and LinkedIn and place them in the `images/` directory (see `images/README.md`)

3. **Edit Content**: Modify `main.tex` with your personal information

4. **Compile**: Run the compilation script:
   ```bash
   ./compile.sh
   ```

## Compilation Requirements

This template requires **XeLaTeX** or **LuaLaTeX** for compilation due to custom font usage. Make sure you have a modern TeX distribution installed:

- **macOS**: MacTeX
- **Windows**: MiKTeX or TeX Live
- **Linux**: TeX Live

## Troubleshooting

1. **Font Issues**: If fonts are missing, the template will fallback to system fonts. Install the required fonts for best results.

2. **Icon Issues**: If icons are missing, links will display without icons. Add the icon files for the complete design.

3. **Compilation Errors**: Ensure you're using XeLaTeX or LuaLaTeX, not regular LaTeX.

## License

This template is provided as-is for academic and professional use. Modify as needed for your requirements.
