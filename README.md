<img border="0" src="http://bioconductor.org/shields/availability/release/CODEX.svg"/>
<img border="0" src="http://bioconductor.org/shields/downloads/CODEX.svg"/>
<img border="0" src="http://bioconductor.org/shields/build/release/bioc/CODEX.svg"/>
<img border="0" src="http://bioconductor.org/shields/years-in-bioc/CODEX.svg"/>


# CODEX
Package: CODEX

Type: Package

Title: A Normalization and Copy Number Variation Detection Method for Whole Exome Sequencing

Author: Yuchao Jiang, Nancy R. Zhang

Maintainer: Yuchao Jiang <yuchaoj@wharton.upenn.edu>

Description: A normalization and copy number variation calling procedure for
    whole exome DNA sequencing data. CODEX relies on the availability of 
    multiple samples processed using the same sequencing pipeline for 
    normalization, and does not require matched controls. The normalization 
    model in CODEX includes terms that specifically remove biases due to GC 
    content, exon length and targeting and amplification efficiency, and latent
    systemic artifacts. CODEX also includes a Poisson likelihood-based recursive
    segmentation procedure that explicitly models the count-based exome 
    sequencing data.

License: GPL-2

Depends: R (>= 3.2.3), Rsamtools, GenomeInfoDb, BSgenome.Hsapiens.UCSC.hg19

Suggests: WES.1KG.WUGSC

biocViews: ExomeSeq, Normalization, QualityControl, CopyNumberVariation

LazyData: yes
