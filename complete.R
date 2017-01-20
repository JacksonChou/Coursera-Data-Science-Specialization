


complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating the location of
  ## the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers to be used
  
  ## Return a data frame of the form: id nobs 1 117 2 1041 ...  where 'id' is
  ## the monitor ID number and 'nobs' is the number of complete cases
  filelist <- list.files(directory, full.names = TRUE)
  dataframe <- data.frame()
  
  for (i in id) {
    file_i <- read.csv(filelist[i])
    nobs <- sum(complete.cases(file_i))
    dataframe_i <- data.frame(i, nobs)
    dataframe <- rbind(dataframe, dataframe_i)
  
  }
  
dataframe
}

