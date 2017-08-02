
#####################################
# "Interger" mode for germline CNVs
#####################################

finalcall <- segment(Y_qc, Yhat, optK = optK, K = 1:optK, sampname_qc,
                     ref_qc, chr, lmax = 200, mode = "integer")
head(finalcall)
# generate all CNV segments including copy number neutral region.
finalcall.all=finalcall[,1:11]
for(sampi in sampname_qc){
  if(length(which(finalcall[,1]==sampi))==0){
    finalcall.temp=c(sampi,chr,'neutral',start(ref_qc)[1],end(ref_qc)[length(ref_qc)],
      round((end(ref_qc)[length(ref_qc)]-start(ref_qc)[1]+1)/1000,3),1,
      length(ref_qc),sum(Y_qc[,which(sampname_qc==sampi)]),
      sum(Yhat[[optK]][,which(sampname_qc==sampi)]),2)
    finalcall.temp=t(as.matrix(finalcall.temp))
    finalcall.all=rbind(finalcall.all,finalcall.temp)
  } else{
    cn.index=which(finalcall[,1]==sampi)
    st.temp=c(1,as.numeric(finalcall[cn.index,'ed_exon'])+1)
    ed.temp=c(as.numeric(finalcall[cn.index,'st_exon'])-1,length(ref_qc))
    for(t in 1:length(st.temp)){
      finalcall.temp=c(sampi,chr,'neutral',start(ref_qc)[st.temp[t]],end(ref_qc)[ed.temp[t]],
                       round((end(ref_qc)[ed.temp[t]]-start(ref_qc)[st.temp[t]]+1)/1000,3),
                       st.temp[t],ed.temp[t],sum(Y_qc[(st.temp[t]):(ed.temp[t]),which(sampname_qc==sampi)]),
                       sum(Yhat[[optK]][(st.temp[t]):(ed.temp[t]),which(sampname_qc==sampi)]),2)
      finalcall.temp=t(as.matrix(finalcall.temp))
      finalcall.all=rbind(finalcall.all,finalcall.temp)
    }
  }
}

finalcall.all=finalcall.all[order(finalcall.all[,1],as.numeric(finalcall.all[,'st_bp'])),]



################################################################
# "Fractional" mode for somatic CNVs from heterogenous samples
################################################################

finalcall <- segment(Y_qc, Yhat, optK = optK, K = 1:optK, sampname_qc,
                     ref_qc, chr, lmax = 200, mode = "fraction")
head(finalcall)
# generate all CNV segments including copy number neutral region.
finalcall.all=finalcall[,1:11]
for(sampi in sampname_qc){
  if(length(which(finalcall[,1]==sampi))==0){
    finalcall.temp=c(sampi,chr,'neutral',start(ref_qc)[1],end(ref_qc)[length(ref_qc)],
                     round((end(ref_qc)[length(ref_qc)]-start(ref_qc)[1]+1)/1000,3),1,
                     length(ref_qc),sum(Y_qc[,which(sampname_qc==sampi)]),
                     sum(Yhat[[optK]][,which(sampname_qc==sampi)]),
                     round(2*sum(Y_qc[,which(sampname_qc==sampi)])/sum(Yhat[[optK]][,which(sampname_qc==sampi)]),3))
    finalcall.temp=t(as.matrix(finalcall.temp))
    finalcall.all=rbind(finalcall.all,finalcall.temp)
  } else{
    cn.index=which(finalcall[,1]==sampi)
    st.temp=c(1,as.numeric(finalcall[cn.index,'ed_exon'])+1)
    ed.temp=c(as.numeric(finalcall[cn.index,'st_exon'])-1,length(ref_qc))
    for(t in 1:length(st.temp)){
      finalcall.temp=c(sampi,chr,'neutral',start(ref_qc)[st.temp[t]],end(ref_qc)[ed.temp[t]],
                       round((end(ref_qc)[ed.temp[t]]-start(ref_qc)[st.temp[t]]+1)/1000,3),
                       st.temp[t],ed.temp[t],sum(Y_qc[(st.temp[t]):(ed.temp[t]),which(sampname_qc==sampi)]),
                       sum(Yhat[[optK]][(st.temp[t]):(ed.temp[t]),which(sampname_qc==sampi)]),
                       round(2*sum(Y_qc[(st.temp[t]):(ed.temp[t]),which(sampname_qc==sampi)])/sum(Yhat[[optK]][(st.temp[t]):(ed.temp[t]),which(sampname_qc==sampi)]),3))
      finalcall.temp=t(as.matrix(finalcall.temp))
      finalcall.all=rbind(finalcall.all,finalcall.temp)
    }
  }
}

finalcall.all=finalcall.all[order(finalcall.all[,1],as.numeric(finalcall.all[,'st_bp'])),]
