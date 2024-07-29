library(tidyverse)

set.seed(321)
read.csv("../../../datasets/acleddata/clean/clean0.csv") %>%
    	select(event_id_cnty, actor1, actor2,assoc_actor_1, assoc_actor_2, notes) %>%
	slice_sample(n = 100, replace = FALSE) %>%
    	write.csv("../../../datasets/acleddata/entity-extraction-antisemitism-ACLED/experiment-1/sample.csv", row.names=FALSE)


