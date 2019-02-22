##############################################
##### R CARPENTRY WORKSHOP ######## 

# make 'cats' dataframe:
cats <- data.frame(coat=c("calico","black","tabby"),weight=c(2.1,3.4,5.6),likes_string=c(1, 0, 1)) # 
# c = combine values into a vector or a list
creates dataframe with columns: coat, weight, likes_string and their values
cats # returns dataframe 'cat'
write.csv(x=cats, file = "data/feline.csv",row.names = FALSE) # creates a csv of your dataframe 'cats', and with file = "data/feline.csv" it will go into the data/ directory with the name feline.csv
cats <- read.csv(file = "data/feline.csv") # this is reading the csv file into your R Studio session
cats
cats$weight # returns values for 'weight' in 'cats' dataframe
cats$coat
# we discover weight 2kg light
cats$weight+2 # adds 2kg to each value for 'weight'
paste("my cat is", cats$coat) # adds "my cat is" to each coat value
cats$coat+cats$weight # return says 'not meaningful'. coat values and weight values are not of the same type, so we cannot add them together. 



####################################
####### DATA TYPES #########
# to see what type of data you have for each column:
typeof(cats$weight)
# return is 'double'
typeof(cats$coat)
# return is 'integer'
# double, integer, complex (ex: 1+4i), logical (TRUE or FALSE), character 
x <- 1+4i
typeof(x)
typeof("A")
# what is difference between 'double' and 'character' types of data?
# 'character' data is smaller and has coatmark ("") and 'double' is bigger data
file.show("data/feline2.csv") # will open up this file 
cats <- read.csv(file = "data/feline2.csv") # now we have 2 csv files in R session
str(cats$coat) # to see what kind of data this is
# return says 'Factor w/ 3 levels "black", "calico"....
###########################


##### Creating Vectors ############
my_vector <- vector(length=3)
my_vector
# return is FALSE FALSE FALSE, because we didn't tell R what the values of 'my_vector', just the length 

another_vector <- vector(mode = 'character', length = 3)
another_vector
str(another_vector)
# return is 'chr' (character data type), '[1:3]' (1 row, 3 columns), and "" "" "" (what the values are)
str(cats$weight)


# make another vector to see how R classifies data into types (cannot have different types of data in one vector):
combine_vector <- c(2,6,3)
combine_vector

quiz_vector <- c(2,6,"3") #places coatmarks on the values because R puts everything into the same type of data. Because 3 is in "" (character data type), R put 2 and 6 as characters as well
quiz_vector
str(quiz_vector) # returns as character data type
str(combine_vector) # returns as numeric data type


character_vector <- c('2','4','6') # R clasifies data a character
character_vector
str(character_vector)
# i want this data to be numbers, not characters
character_coerce_to_number <- as.numeric(character_vector)
character_coerce_to_number # now the data is 'number' and not 'character'


character_coerce_to_logic <- as.logical(character_vector)
character_coerce_to_logic
# return is 'NA NA NA' 


cats$likes_string # as of now, likes_string values are classified as 'integers', but we want them to be classified as 'logical' (TRUE or FALSE)
cats$like_coerce_to_logic <- as.logical(cats$likes_string)
cats$like_coerce_to_logic
# now data is classified as 'logic'


# to add a value into a vector:
ab_vector <- c("a","b")
ab_vector
combine_example <- c(ab_vector,"swc")
combine_example

mySeries <- 1:10
mySeries 
seq(10) # vector of 1:10
seq(1,10, by=.1) # vector of sequence of 1:10 but increasing by 0.1 (instead of by 1)


# to return the first (head) or last (tail) values of a vector:
vector2 <- seq(10)
head(vector2,n=4) # to return the first specified values

tail(vector2,n=3) # same things as head, but returns the last specified values

length(vector2) # returns the number of values in your vector
class(vector2) # returns the type of data
typeof(vector2) # same as class() function

# to give/change names of values in a vector:
my_example <- 5:8
my_example
names(my_example) <- c("a","b","c","d") # gives the names to each value in the vector
my_example



##########################################################
##### DATA FRAMES #####
# vector is one data type
# rows are made of different data types
# list is a mix of data types







