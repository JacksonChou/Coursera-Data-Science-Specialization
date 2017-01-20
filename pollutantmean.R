#Calculate mean of pollutant (sulfate or nitrate) in specdata

setwd("E:/Users/Jackson/One Drive/OneDrive/R stuff/R Programming/Week 2 Assignment")

pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  
  #Read the file names within the directory
  file.names <- list.files(paste("E:/Users/Jackson/One Drive/OneDrive/R stuff/R Programming/Week 2 Assignment/", directory, sep=""))
  
  #We use the sub() function to take the numbers from the csv file name
  file.numbers <- as.numeric(sub('\\.csv$','', file.names)) 

  
  #Now we match the user input "id" to the file numbers, this will be our selected files to calculate the  mean
  selected.files <- na.omit(file.names[match(id, file.numbers)])
  
  #use lapply to pass the user input numbers and read in the selected csv file
  selected.dfs <- lapply(file.path(paste("E:/Users/Jackson/One Drive/OneDrive/R stuff/R Programming/Week 2 Assignment/", directory, sep=""),selected.files), read.csv)
  
  e <- sapply(selected.dfs, function(x) x[ ,pollutant])
  n<-unlist(e) 
  mean(n, na.rm = TRUE)
  
}

