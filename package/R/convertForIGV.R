convertForIGV = function( finalcall, outPath = NULL, filterFraction = FALSE) {
  if ( filterFraction ){
    finalcall=finalcall[(finalcall$copy_no<=1.5)|(finalcall$copy_no>=2.5),] 
  }
  for ( mySample in unique( finalcall$sample_name ) ){
    finalcall.temp = finalcall[ which( finalcall$sample_name==mySample ), ]
    sampname.temp = paste( rep( mySample,nrow( finalcall.temp ) ),'.codex',sep='' )
    output = cbind( sampname.temp, finalcall.temp$chr,
                    finalcall.temp$st_bp, finalcall.temp$ed_bp,
                    finalcall.temp$ed_exon - finalcall.temp$st_exon + 1,
                    finalcall.temp$copy_no )
    colnames( output ) = c( 'Sample', 'Chromosome','Start','End','Num_Probes',  
                            'Segment_Mean' )  
    write.table( output, file = paste0( outPath, mySample,'.codex.seg' ),
                 sep = '\t', quote = F,  row.names = F )
  }
}