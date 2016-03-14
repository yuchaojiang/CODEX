<img border="0" src="http://bioconductor.org/shields/availability/release/CODEX.svg"/>
<img border="0" src="http://bioconductor.org/shields/downloads/CODEX.svg"/>
<img border="0" src="http://bioconductor.org/shields/build/release/bioc/CODEX.svg"/>
<img border="0" src="http://bioconductor.org/shields/years-in-bioc/CODEX.svg"/>


# CODEX
A Normalization and Copy Number Variation Detection Method for Whole Exome Sequencing

## Install the current release from Bioconductor
```r
## try http:// if https:// URLs are not supported
source("https://bioconductor.org/biocLite.R")
biocLite("CODEX")
```

## Author
Yuchao Jiang, Nancy R. Zhang

## Maintainer
Yuchao Jiang <yuchaoj@wharton.upenn.edu>

## Description
A normalization and copy number variation calling procedure for
whole exome DNA sequencing data. CODEX relies on the availability of 
multiple samples processed using the same sequencing pipeline for 
normalization, and does not require matched controls. The normalization 
model in CODEX includes terms that specifically remove biases due to GC 
content, exon length and targeting and amplification efficiency, and latent
systemic artifacts. CODEX also includes a Poisson likelihood-based recursive
segmentation procedure that explicitly models the count-based exome 
sequencing data.

## URL
https://sites.google.com/a/cornell.edu/yuchaojiang/home/research/codex
