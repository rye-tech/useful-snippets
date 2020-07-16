# useful-snippets
## My catchall for useful data wrangling plotting or what have you

rm(list=ls()) #removes all objects in an R environment

getwd() # gets the current working directory [this is a function, which has form: function()]

setwd('..') #moves up one directory


# check data types of variables with class()
# example:

x <- 4 # take note, the old value assigned to x is replaced by 4
x
class(x)

text1 <- "Yarrr"
class(text1)


logic1 <- TRUE 
class(logic1)

rm(list = ls()) #clears the workspace


# vector fun in R

numeric_vector <- c(1, 2, 3) # creates a vector with 3 columns, with numeric values 1 2 and 3

                              #c() is a handy function called combine and can create vectors quickly

character_vector <- c("a", "b", "c") # creates a vector with 3 columns, with character values a b and c

boolean_vector <- c(TRUE, FALSE, TRUE) # creates a vector with 3 columns, with logical values T F and T

names(numeric_vector) <- character_vector # uses character values stored in character vector 
                                          #to name columns in numeric vector







