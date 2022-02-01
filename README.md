# datajoint-citations
This repository contains BibTeX collections of papers about DataJoint or using DataJoint.
- `citations_all.bib` collects all papers, including those that briefly mention DataJoint, or foundational papers on relational database infrastructire.
- `citations_all.tex` categorizes these papers
- `citations_used.bib` collects papers that either discuss DataJoint directly, or used DataJoint as part of their experiment.
- `citations_used.tex` is used to generate the corresponding markdown file for publication on our website.
- `apa.csl` contains specifications for APA citation formatting

New papers that use DataJoint should be added to both `.bib` files.

# Usage

To download dependencies:
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
--metadata title="Publications that Discuss or Use DataJoint"
```

This markdown file then requires minor edits to turn the default table at the top into a header.
