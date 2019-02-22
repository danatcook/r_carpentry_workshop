##############################################
##### R SOFTWARE CARPENTRY WORKSHOP ######## 
# friday, february 22, 2019
# dana cook

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
str(cats$weight) # str is for 'structure'


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
# vector is made up of one data type
# rows are made of different data types
# list is a mix of data types

# rows are lists, and columns are vectors

#the difference between a 'vector' and a 'factor':
#a vector is a string, where a factor is one type of data

str(cats$weight) # str = structure

# logical values get stored as inteters of '0' and '1' (in GitHub? or in R?)
# factors get stored as integers, but another part of the data structure keeps track of the values


############################################################
##### EXPLORING DATA FRAMES #######

# create 'cats' dataframe:
cats <- data.frame(coat = c("calico", "black", "tabby"), 
                   weight = c(2.1, 5.0,3.2), 
                   likes_string = c(1, 0, 1))
# add 'age' vector:
age <- c(2, 3, 5)

#combine 'cats' and 'age' dataframes:
cats <- cbind(cats, age)

newRow <- list("tortoiseshell", 3.3, TRUE, 9)
cats <- rbind(cats, newRow)

cats$coat <- as.character(cats$coat)
cats
str(cats)

################
# create new coat factor, 'tortoiseshell':
levels(cats$coat) <- c(levels(cats$coat), "tortoiseshell")

# to add to cats df, you must add values to fill the other factors (columns):
cats <- rbind(cats, list("tortoiseshell", 3.3, TRUE, 9))

# change coat values to characters:
cats$coat <- as.character(cats$coat)
str(cats) # see structure (data types)

cats


# when you're adding columns, you add a vector
# when you're adding rows, you add a list

####### Dataframe Challenge ##############

human_age <- cats$age *7
human_age

human_age <- as.factor(human_age) # change from numeric to factor
str(human_age)

human_age <- as.numeric(human_age) # change from factor to numeric
str(human_age)

human_age <- human_age /7 # divide each value by 7
human_age


# start with numeric, convert to character, convert to factor, then can convert back to numeric and you will start with same numeric values


#################################################################


###### GRAPHS with ggplot #######

library("ggplot2")

# iniate new variable called gapminder, to read gapminder file in dataset
gapminder <- read.csv("data/gapminder_data.csv", header=TRUE)

# visually inspect gapminder
View(gapminder)

# data subsetting
gapminder[1,1] # returns values of row 1, column 1

# look at row 1
gapminder[1, ] # returns all of row 1, since we left column blank

# preview top few lines
head(gapminder)

#preview bottom few lines
tail(gapminder)

#let's look at the middle
#1704 observations by 6 variables = 1704 rows, 6 columns, so set parameters to 900-905 rows, leave column blank to show all columns)
gapminder[900:905, ]

###################################################



#install.packages("ggplot2")
library("ggplot2")

str(gapminder) # can use this to see column names - know what to put in for x and y values for ggplot
# OR
colnames(gapminder) #returns the column names  

#call ggplot function to create new plot, GLOBAL option, applies to ALL layers
# aes - aesthetic properties, x and y locations; look for column headings
# geom - this layer tells how we want to visually represent data (geom_point - scatterplot)

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point()


#easy CHALLENGE 1
# modify the line below to show how life expectancy has changed over time

ggplot(data = gapminder, aes(x = year, y = lifeExp)) +
  geom_point()


#medium CHALLENGE 2
#aesthetic property of color
#modify code to color the points by continent column
#what trends do you see? are they what you expected?

ggplot(data = gapminder, aes(x = year, y = lifeExp, colour = continent)) +
  geom_point()


##### LAYERS ##########
#scatterplot is hard to visualize change over time
#line plot instead
#add geom_line layer instead of geom_point
#by aesthetic draws line for each country

ggplot(data = gapminder, aes( x=year, y=lifeExp, by=country, colour=continent)) +
  geom_line()

str(gapminder)

#add column of countries as characters, instead of factors
countries_character <- as.character(gapminder$country)
gapminder2 <- cbind(gapminder,countries_character)

#View(gapminder2)

ggplot(data = gapminder2, aes( x=year, y=lifeExp, by=countries_character, colour=continent)) +
  geom_line()

#plots came out the same for countries read as factor and countries read as character


ggplot(data = gapminder, aes( x=year, y=lifeExp, by=continent, colour=continent)) +
  geom_line()

#set year as factor in gapminder2 df
#gapminder2$year <- as.factor(gapminder2$year)
#ggplot(data = gapminder2, aes( x=year, y=lifeExp, by=continent, colour=continent)) +
  geom_line()
gapminder2$year <- as.integer(gapminder2$year)
str(gapminder2)

ggplot(data = gapminder, aes( x=year, y=lifeExp, by=country, colour=continent)) +
  geom_line() + 
  geom_point() +
  theme_bw() #took away ugly gray background

###### TRANSFORMATION AND STATISTICS ##########
#overlay statistical models over data
#color by continent

ggplot(data = gapminder, aes( x=gdpPercap, y=lifeExp, colour=continent)) +
  geom_point()

#hard to see relationship due to the points due to some outliers
#we can change the scale of the units with the scale function
#scale function controsl data and visual values, alpha function controls transparency, which can be helpful when we have a large amount of data that is clustered

#use scale function (change x axis), alpha function (transparency)
ggplot(data = gapminder, aes( x=gdpPercap, y=lifeExp, color=continent)) +
  geom_point(alpha=0.5) +
  scale_x_log10() + #transforms scale to a log base 10
  theme_bw()

#geom_smooth, adding another layer here
ggplot(data = gapminder, aes( x=gdpPercap, y=lifeExp, color=continent)) +
  geom_point(alpha=0.5) +
  scale_x_log10() + #transforms scale to a log base 10
  theme_bw() +
  geom_smooth(method="lm") #adds regression (least squares) for each continent, relationship between gdpPercap and lifeExp

#make line thicker
ggplot(data = gapminder, aes( x=gdpPercap, y=lifeExp, color=continent)) +
  geom_point(alpha=0.5) +
  scale_x_log10() + #transforms scale to a log base 10
  theme_bw() +
  geom_smooth(method="lm", size=1.5)

#CHALLENGE
#modify color and size of points on the point layer in the previous example
#hint: do not use the aes function

ggplot(data = gapminder, aes( x=gdpPercap, y=lifeExp, color=continent)) +
  geom_point(alpha=0.5, size=2, shape=7) +
  scale_x_log10() + #transforms scale to a log base 10
  theme_bw() +
  geom_smooth(method="lm", size=1.5)


#create multi-panel figures with facet_wrap()
ggplot(data = gapminder, aes( x=gdpPercap, y=lifeExp, color=continent)) +
  geom_point(alpha=0.5, size=0.5) +
  scale_x_log10() + #transforms scale to a log base 10
  theme_bw() +
  geom_smooth(method="lm", size=1.5) +
  facet_wrap( ~ continent)






























