library(tidyverse)

words <- "Palestine|Israel|Gaza|Rafah|Jew|Zio"

words <- "(?i)\\b(Palestin(e|ian|ians)?|Israel(i|ite|ites)?|Gaz(a|an)?|Rafah|Jew(ish|s)?|Zio(nist|nazi|nism)?|Naz(i|is|ism)?|Aryan|Goy|Qanon|Heil|Supremacis(t|m)|Ant(i-?semit(ic|ism)|i-?Israel|i-?Zionist)|Apartheid|Israhell|Holocaust\\s*denial|Intifada|BDS|Boycott\\s*Israel|Kike|Holohoax|Hamas|Hezbollah|West\\s*Bank|Fatah|Al\\s*Aqsa|Temple\\s*Mount|Jerusalem|Occupation|Settler(s|ment)?|Checkpoints|Two-state\\s*solution|Golan\\s*Heights|Yom\\s*Kippur\\s*War|Six-Day\\s*War|Lebanon|Sabra\\s*and\\s*Shatila|Oslo\\s*Accords|Camp\\s*David|Peace\\s*Process)\\b"

filter_data <- function(df) {
	(
	unlist(with(df, map(notes, function(x) grepl(words, x, ignore.case=T)))) |
	unlist(with(df, map(actor1, function(x) grepl(words, x, ignore.case=T)))) |
	unlist(with(df, map(actor2, function(x) grepl(words, x, ignore.case=T)))) |
	unlist(with(df, map(assoc_actor_1, function(x) grepl(words, x, ignore.case=T)))) |
	unlist(with(df, map(assoc_actor_2, function(x) grepl(words, x, ignore.case=T))))
	) %>% 
	  df[.,] 
}


read.csv("../../datasets/acleddata/raw/USA_Canada_2020_2024_Jul12.csv") %>%
    filter(country == "United States") %>%
    select(event_id_cnty, actor1, actor2,assoc_actor_1, assoc_actor_2, notes) %>%
    mutate(
	   actor1 = gsub("\n", " ", actor1),
	   actor2 = gsub("\n", " ", actor2),
	   assoc_actor_1 = gsub("\n", " ", assoc_actor_1),
	   assoc_actor_2 = gsub("\n", " ", assoc_actor_2),
	   notes = gsub("\n", " ", notes)
    ) %>%
    filter_data %>%    
    write.csv("../../datasets/acleddata/clean/clean0.csv", row.names=FALSE)


