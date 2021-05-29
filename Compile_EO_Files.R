# Author: lundeak
# Date: 4/29/21

# Purpose: This script pulls a list of EO txt files for separate missions 
# row binds all missions into one data frame with an added attribute designating 
# which mission each entry originated from, and writes out to a txt file in the
# same directory


library(tidyverse)
library(stringr)


setwd('E:\\Spherical_Imagery\\03_EO\\EO_AOI')

filelist = list.files(pattern = ".*.txt")
filenames = lapply(filelist, FUN=str_sub, end=-8)
names(filelist) <- filenames
datalist <- lapply(filelist, FUN=read.table, header=TRUE, sep = ',')
df <- dplyr::bind_rows(datalist, .id = 'mission')

write.table(df, "2021_Compiled_EO_AOI.txt", sep=',', row.names=F)
