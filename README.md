<img border="0" src="http://bioconductor.org/shields/availability/release/CODEX.svg"/>
<img border="0" src="http://bioconductor.org/shields/downloads/CODEX.svg"/>
<img border="0" src="http://bioconductor.org/shields/build/devel/bioc/CODEX.svg"/>
<img border="0" src="http://bioconductor.org/shields/years-in-bioc/CODEX.svg"/>


# CODEX
A Normalization and Copy Number Variation Detection Method for Whole Exome Sequencing

## Install the current release from Bioconductor
```r
## try http:// if https:// URLs are not supported
source("https://bioconductor.org/biocLite.R")
biocLite("CODEX")
```

## Install the devel version from GitHub
```r
install.packages("devtools")
library(devtools)
install_github("yuchaojiang/CODEX/package")
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

## Citation
Jiang, Y., Oldridge, D.A., Diskin, S.J. and Zhang, N.R., 2015. CODEX: a normalization and copy number variation detection method for whole exome sequencing. *Nucleic acids research*, 43(6), pp.e39-e39. [[html](http://nar.oxfordjournals.org/content/43/6/e39), [pdf](http://nar.oxfordjournals.org/content/43/6/e39.full.pdf+html)]

## Google user group (Q&A)
https://groups.google.com/d/forum/codex_wes_cnv

## Bioconductor
* [Bioconductor page](http://www.bioconductor.org/packages/release/bioc/html/CODEX.html)
* [Bioconductor download stats](http://bioconductor.org/packages/stats/bioc/CODEX/)
* [Vignettes](http://www.bioconductor.org/packages/devel/bioc/vignettes/CODEX/inst/doc/CODEX_vignettes.pdf)
* [Demo code](http://www.bioconductor.org/packages/devel/bioc/vignettes/CODEX/inst/doc/CODEX_vignettes.R)

## IMPORTANT: CODEX for cancer genomics
When apply CODEX to whole-exome sequencing and targeted sequencing of cancer patients:
* In normalization step, use *normalize2(...)* function if there are normal samples and specify the index of the normal samples as a numerical vector in the *normal_index* argument;
* In segmentation step, use **fractional** mode for somatic CNA detection (cancer is heterogenous) and **interger** mode for germline CNV detection (you will get CNV calls in your blood samples, which are germline).
* For segmentation with paired tumor-normal experimental design, a modified CBS (circular binary segmentation) algorithm can be adopted, which ultilizes the pair information. Note that, from our experience, the default segmentation by CODEX (not using the pair information) does not make much difference. Normalization is the first order effect in WES study design. Refer to the paired_tumor_normal_segmentation folder for code (not actively updated/maintained).

## CODEX for targeted sequencing
We've adapted CODEX for targeted sequencing. Instead of normalizing and segmenting each chromosome separately, for targeted sequencing, we combine all targets across the genome to perform normalization, followed by segmentation within each gene. Refer to codes below (need to source segment_targeted.R for gene-based segmentation).
* [codex_targeted.R](https://github.com/yuchaojiang/CODEX/blob/master/targeted_sequencing/codex_targeted.R)
* [segment_targeted.R](https://github.com/yuchaojiang/CODEX/blob/master/targeted_sequencing/segment_targeted.R)

## Visualization by IGV
One can load CODEX's CNV calling results into [IGV](http://www.broadinstitute.org/igv/) for visualization by generating a tab-delimited seg file for each sample. Below is a sample code that we use in our daily practice -- for each sample, a *.seg.txt file is generated with six columns and header 'Sample', 'Chromosome','Start','End','Num_Probes','Segment_Mean', which correspond to sample name, chromosome, CNV start bp, CNV end bp, number of exonic targets, and log ratio of raw/observed depths of coverage versus normalized/expected coverage (deletion has a negative log ratio, duplication has a positive log ratio, copy-neutral region has a log ratio around 0).
* [CODEX_IGV.R](https://github.com/yuchaojiang/CODEX/blob/master/IGV_visualization/CODEX_IGV.R)

## CODEX for mouse genome
CODEX can be applied to WES of the mouse genome. The library for the mm10 mouse genome sequencing needs to be loaded: 
* [BSgenome.Mmusculus.UCSC.mm10](http://bioconductor.org/packages/release/data/annotation/html/BSgenome.Mmusculus.UCSC.mm10.html).

The GC content and the mappability can be obtained from the code below with minor adaptations for the mouse genome:
* [GC content](https://github.com/yuchaojiang/CODEX/blob/master/mouse/getgc.R)
* [Mappability pre-calculation](https://github.com/yuchaojiang/CODEX/blob/master/mouse/mapp.R) (Note: This step can be computationally expensive and thus parallel computing is recommended. For CODEX in its default setting, the mappability for exonic targets in human h19 assembly is pre-computed and stored as part of the package).
* [Mappability](https://github.com/yuchaojiang/CODEX/blob/master/mouse/getmapp.R)
