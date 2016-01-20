#################################################################
# Generates poems pages 
# Author: Gaston Sanchez
#################################################################

# ===============================================================
# Helpers to generate md files with yaml header
# ===============================================================

poem_title <- function(poem_name) {
  poem_name <- str_replace_all(poem_name, '.md', '')
  poem_name <- str_replace_all(poem_name, '-', ' ')
  str_to_title(poem_name)
}
#poem_title('a-veces.md')

make_href <- function(poem_name) {
  poem_name <- str_replace_all(poem_name, '.md', '')
  poema <- poem_title(poem_name)
  paste0('\t<li><a href="io/', poem_name, 
         '">', poema, '</a></li>\n')
}



build_index <- function(poems) {
  infile <- 'index.html'
  cat('---\n', file = infile)
  cat('layout: default\n', file = infile, append = TRUE)
  cat('title: Home\n', file = infile, append = TRUE)
  cat('---\n\n', file = infile, append = TRUE)
  # start unordered list
  cat('<ul>\n', file = infile, append = TRUE)
  for (poem in poems) {
    poem_href <- make_href(poem)
    cat(poem_href, file = infile, append = TRUE)
  }
  # end unordered list
  cat('</ul>\n', file = infile, append = TRUE)
}



# ===============================================================
# Building index.html
# ===============================================================

setwd('~/Dropbox/poemar')
all_files <- dir('io')
poems <- grep('*.md', all_files, value = TRUE)

build_index(poems)



