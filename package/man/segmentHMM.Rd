\name{segmentHMM}
\alias{segmentHMM}
\title{
Hidden Markov model for segmentation of CNV events and genotyping
}
\description{
Hidden Markov model for segmentation of CNV events and genotyping, using 
normalized read depth from whole exome sequencing.  This algorithm incorporates distance between exons as information. 
}
\usage{
segmentHMM(Y_qc, Yhat, optK, K, sampname_qc, ref_qc, chr)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{Y_qc}{
    Raw read depth matrix after quality control procedure returned from 
    \code{\link{qc}}}
    \item{Yhat}{Normalized read depth matrix returned from 
    \code{\link{normalize}}}
    \item{optK}{
    Optimal value \code{K} returned from \code{\link{choiceofK}}}
    \item{K}{
    Number of latent Poisson factors. Can be an integer if optimal solution has
    been chosen or a vector of integers so that AIC, BIC, and RSS are computed
    for choice of optimal k.}
    \item{sampname_qc}{
    Vector of sample names after quality control procedure returned from 
    \code{\link{qc}}}
    \item{ref_qc}{
    IRanges object of genomic positions of each exon after quality control 
    procedure returned from \code{\link{qc}}}
    \item{chr}{
    Chromosome number returned from \code{\link{getbambed}}}
}
\value{
    Final callset of CNVs with genotyping results.
}
\author{
 Yuchao Jiang \email{yuchaoj@wharton.upenn.edu} 
 
 Gene Urrutia \email{urutia@live.unc.edu} 
}
\examples{
Y_qc <- qcObjDemo$Y_qc
Yhat <- normObjDemo$Yhat
BIC <- normObjDemo$BIC
K <- normObjDemo$K
sampname_qc <- qcObjDemo$sampname_qc
ref_qc <- qcObjDemo$ref_qc
chr <- bambedObjDemo$chr
finalcall <- segmentHMM(Y_qc, Yhat, optK = K[which.max(BIC)], K = K, sampname_qc,
    ref_qc, chr)
finalcall
}
\keyword{ package }

