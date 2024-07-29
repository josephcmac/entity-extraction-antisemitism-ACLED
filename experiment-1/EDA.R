library(tidyverse)

# Read the dataset
df <- read.csv( "../../../datasets/acleddata/entity-extraction-antisemitism-ACLED/experiment-1/manual.csv", 
               sep=",",
	       na.strings = c("-"),
               header=TRUE, 
               quote = "\"") %>% 
  na.omit()

df %>% head


df1 <- df %>% group_by(manual) %>% summarise(count = n()) %>% arrange(desc(count))

nrow(df)

df1$count <- df1$count/sum(df1$count)*100

log(df1$count)

