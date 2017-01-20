

corr <- function(directory, threshold = 0){
  
  
  filelist <- list.files(directory, full.names = TRUE)
  numvect <- vector(mode = "numeric", length = 0) 
  
  for (i in 1:length(filelist)){
    
    file_i <- read.csv(filelist[i]) 
    cmpltcases <- sum((!is.na(file_i$sulfate)) & (!is.na(file_i$nitrate))) 
    
    if (cmpltcases > threshold){
      
      filter_sulfate <- file_i[which(!is.na(file_i$sulfate)), ] 
      filter_total <- filter_sulfate[which(!is.na(filter_sulfate$nitrate)), ] 
      numvect <- c(numvect, cor(filter_total$sulfate, filter_total$nitrate))
    
    } 
  
  }
  
  numvect
}
