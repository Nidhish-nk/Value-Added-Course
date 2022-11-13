library(rvest)
library(dplyr)
library(robotstxt)

path = paths_allowed("https://www.imdb.com/search/title/?groups=top_250&sort=user_rating")

link <- "https://www.imdb.com/search/title/?groups=top_250&sort=user_rating"
web <- read_html(link)

name <- web %>%
  html_nodes(".lister-item-header a") %>% html_text
view(name)

year <- web %>% html_nodes(".text-muted.unbold") %>% html_text()
view(year)

rating <- web %>%
  html_no9des(".ratings-imdb-rating strong") %>% html_text()
view(rating)

duration <- web%>% html_nodes(".runtime") %>% html_text()
view(duration)

imdb.ratings <- data.frame(name, year, rating, duration)
view(imdb.rating)

write.csv (imdb.ratings. "My_movie data.csv")