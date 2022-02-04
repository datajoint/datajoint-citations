# datajoint-citations
This repository contains BibTeX collections of papers.
- `citations_all.bib` collects all papers, including those that briefly mention DataJoint, or foundational papers on relational database infrastructure.
- `citations_all.tex` categorizes these papers into...
   - Neuroscience studies that use DataJoint
   - Other studies that use DataJoint
   - Publications describing DataJoint
   - Data infrastructure papers involving DataJoint
   - Other papers that make mention of DataJoint
- `citations_used.bib` collects papers that used DataJoint as part of their study (i.e., top two categories above)
- `citations_used.tex` is used to generate the corresponding markdown file for our website.
- `apa.csl` contains specifications for APA citation formatting

New papers that use DataJoint should be added to both `.bib` files.

Future work on this repository should investigate tools to generate `citations_used.bib` based on mention in corresponding sections of `citations_all.tex`.

# Usage

To download dependencies for OSX:
```bash
brew install basictex pandoc
tlmgr install fourier enumitem apacite
```

To generate a pdf from a `.tex` file, and remove auxiliary files:
```bash
pdflatex citations_<version>.tex
bibtex citations_<version>
pdflatex citations_<version>.tex
pdflatex citations_<version>.tex
rm *.aux *.blg *.out *.bbl *.log
```

To generate a markdown file:
```bash
pandoc -s --bibliography citations_used.bib --citeproc --csl=apa.csl \
citations_used.tex -t gfm -o citations_used.md \
--metadata title="Publications that use DataJoint"
```

This markdown file then requires minor edits to turn the default table at the top into a header:
```
---
bibliography: citations_used.bib
csl: apa.csl
title: Publications using DataJoint
---
```
becomes: `#Publications using DataJoint`
