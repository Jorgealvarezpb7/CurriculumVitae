# Curriculum Vitae
 
My CV as a software developer, written in LaTeX with a custom `developercv` class.
 
**Jorge Álvarez** · [alvarezjorge.com](https://alvarezjorge.com/) · [GitHub](https://github.com/jorgealvarezpb7) · [LinkedIn](https://www.linkedin.com/in/jorgealvarezpb7/)
 
## Structure
 
```
.
├── src/
│   ├── main.tex          # CV content
│   └── developercv.cls   # Document class (layout, icons, sections)
├── justfile              # Local build commands
└── .github/workflows/    # CI build on every push
```
 
## Requirements
 
- [Docker](https://www.docker.com/) (or [OrbStack](https://orbstack.dev/) on macOS) — make sure it's running before building
- [just](https://github.com/casey/just)
No local TeX installation is needed: the build runs inside the [`danteev/texlive`](https://hub.docker.com/r/danteev/texlive) image. The first build pulls the image, so it takes a while.
 
## Build
 
```bash
just build
```
 
This runs `latexmk -pdf ./src/main.tex` inside Docker. The output is written to the **repo root** (where the command runs), not to `src/`:
 
```
main.pdf   # the CV
main.aux, main.log, main.out, main.fls, main.fdb_latexmk   # build artifacts
```
 
Open it with:
 
```bash
open main.pdf
```
 
To check the page count, look for this line at the end of the build output:
 
```
Output written on main.pdf (1 page, ...)
```
 
## CI
 
Every push triggers the **Build** workflow, which compiles `src/main.tex` with `dante-ev/latex-action` and uploads the result as the `Documentation.pdf` artifact. Download it from the run page in the **Actions** tab.
 
## Troubleshooting
 
- **`failed to connect to the docker API ... docker.sock`**: Docker/OrbStack isn't running. Start it and try again.
- **`You have requested document class './src/developercv'...`**: harmless warning, caused by loading the class by path.
- **No PDF generated**: open `main.log` in the repo root and search for lines starting with `!`.
- **CV spills onto a second page**: shorten descriptions rather than shrinking the font or spacing.
 