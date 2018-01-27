\name{convertForIGV}
\alias{convertForIGV}
\title{
Convert CODEX CNV calls to .seg format for IGV
}
\description{
Takes as input the output of segment (HMM) from CODEX and converts to .seg format.  This is a preferred format for Integrative Genomics Viewer (IGV).  This function takes a single data frame as input, so combine CNV calls from all chromosomes beforehand if necessary.
}
\usage{
convertForIGV( finalcall, outPath, filterFraction )
}
\arguments{
    \item{ finalcall }{
    Final callset of CNVs with genotyping results returned from 
    \code{ \link{ segment } } or \code{ \link{ segmentHMM } } }
    \item{ outPath }{
    Directory to save to file.  If no directory is specified it is saved to the local directory.}
    \item{ filterFraction }{
    If finalcall was produced using mode = "fraction", this will remove segments with copy number between 1.5 and 2.5}
}
\value{
IGV ready file(s) in .seg format is saved to specified directory.  One file is prepared for each sample containing cnv event.  }
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

#Add simulated CNV
Y_qc[1:10,10] = 1.5*Y_qc[1:10,10]   # add a dup
Y_qc[50:60,10] = .5*Y_qc[50:60,10]  # add a del
Y_qc[1:10,15] = 1.5*Y_qc[1:10,15]   # add a dup
Y_qc[50:60,15] = .5*Y_qc[50:60,15]  # add a del
Y_qc[25:35,15] = .5*Y_qc[25:35,15]  # add a del

finalcall <- segment(Y_qc, Yhat, optK = K[which.max(BIC)], 
  K = K, sampname_qc, ref_qc, chr, lmax = 200, mode = "fraction")

#If necessary, combine (rbind) individual chromosome data frames 
#  to single data frame

convertForIGV( finalcall, outPath = NULL, filterFraction = TRUE )
}
\keyword{ package }
