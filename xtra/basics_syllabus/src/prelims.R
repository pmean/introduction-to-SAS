default_path <- "data"
semester_start <- "2020-06-08"

suppressMessages(suppressWarnings(library(lubridate)))
suppressMessages(suppressWarnings(library(magrittr)))
dat1 <- as.Date(semester_start, format="%Y-%m-%d")
d <- dat1+(0:15)*7
f <- "%A, %B %d, %Y"
mon <- format(d, f)
tue <- format(d+1, f)
wed <- format(d+2, f)
thu <- format(d+3, f)
fri <- format(d+4, f)
read_text <- function(fn, due="", path=default_path, char_max=999999) {
  "../" %>%
    paste0(path) %>%
    paste0("/") %>%
    paste0(fn) %>% 
    paste0(".txt") -> full_name
  if (!file.exists(full_name)) {
    return(paste("### ", full_name, " not found!\n"))
  }
  full_name %>%
    readLines  -> text_lines
  text_lines %>%
    nchar %>%
    cumsum %>%
    pmax(char_max) -> line_count
  n <- sum(line_count==char_max)
  if (n==0) {n <- 1}
  if (n < length(text_lines)) {
    text_lines <- text_lines[1:n]
    text_lines[n+1] <- "..."
  }  
  text_lines %>% 
    gsub("<<due date>>", due, .) %>% 
    paste0(collapse="\n") %>%
    return
}
