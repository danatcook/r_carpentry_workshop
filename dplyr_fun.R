# Learning about the dplyr package
gapminder <- read.csv("data/gapminder_data.csv")

#subset in base R
gapminder[gapminder$continent=="Africa", "gdpPercap"] #i want every row in gapminder dataset with continent == (exactly written as) 'Africa'

#want the mean of this data subset
mean(gapminder[gapminder$continent=="Africa", "gdpPercap"])

#load our package
#install.packages("dplyr")
library(dplyr)

#dplyr doesn't make you put quotes around column names

#select columns
year_country_gdp <- gapminder %>% # %>% is the pipe function, saying take 'gapminder' dataset, and pipe it into this next function, shortcut is 'Shift''Ctrl''m'
  select(year,country,gdpPercap)

#let's just select rows by using filter()
year_country_gdp_africa <- gapminder %>% 
  filter(continent=="Africa") %>%
  select(year,country,gdpPercap)

#piping works in an order of operations, what you write first it will operate first, so KEEP THIS IN MIND


#summarise by groups
gdp_by_continents <- gapminder %>%
  group_by(continent) %>% 
  summarize(mean_gdp = mean(gdpPercap)) #summarize() reduces multiple values down to a single value

gdp_by_continents

#tibbles --> tells us about the data summary, i.e. gives us size (5 rows by 2 columns), data type (factor, double)


#calculate ave lifeExp by country
lifeExp_country_means <- gapminder %>%
  group_by(country) %>% 
  summarize(mean_lifeExp = mean(lifeExp))

# find max and min of lifeExp ave (can do 2 ways)
#1st way:
#find min
lifeExp_country_means %>% 
  filter(mean_lifeExp==min(mean_lifeExp)) # filte for all rows that the mean_lifeExp is equal to the minimum of mean_lifeExp
#find max
lifeExp_country_means %>% 
  filter(mean_lifeExp==max(mean_lifeExp))

#2nd way:
lifeExp_country_means %>%
  arrange(mean_lifeExp) #arrange mean_lifeExp values from least to greatest, will print the top few

lifeExp_country_means %>% 
  arrange(desc(mean_lifeExp))
  
#3rd way:
#find min
lifeExp_country_means %>% 
  arrange(mean_lifeExp) %>% 
  head()

#find max
lifeExp_country_means %>% 
  arrange(mean_lifeExp) %>% 
  tail()



#how many continents are there in each year?
#use count to find the number of rows
gapminder %>%
  filter(year == 2002) %>% 
  count(continent) #not the same number of rows in each continent, because there's a different number of countries per continent 


gapminder %>%
  filter(year == 2009) %>% 
  count(continent) %>% 
  summarize(
    mean_lifeExp = mean(lifeExp),
    se_lifeExp = sd(lifeExp)/sqrt(n())
  )
# go back and fix this, not recognizing 'lifeExp' for some reason

unique(gapminder$year) #will print out the unique values for the specified column. this is helpful if you want to check the levels of a factor, or all the unique values for a column (so if you misspell a site name, this would show up if you did unique(df$sites))



#using mutate
gdp_pop_summary <- gapminder %>%
  mutate(gdp_billions = gdpPercap*pop/10^9) #added a new column, 'gdp_billions' using mutate that manipulatives the gdpPercap values by putting them into billions
head(gdp_pop_summary)

gdp_pop_summary <- gapminder %>%
  group_by(continent,year) %>% 
  summarize(mean_gdp_bill = mean(gdp_billions))

# ask Mary what's going on here, why doesn't R recognize the object 'gdp_billions'? it's the name of the column in my df






















