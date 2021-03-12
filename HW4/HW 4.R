rm(list=ls())
print(getwd())

# Practice 1
# a) Use read.csv() to load the data into the R dataframe with name college
college <- read.csv("College.csv")
print(college)

# b) find the number of data objects in this dataframe
nrow(college) # 777 obs
ncol(college) # 19 columns


# c) Use fix() and View() function to quickly check the dataframe that you just loaded. 
# And use rownames(college) to check the names in row direction (3 points)
fix(college)
View(college)
rownames(college)

# d) Try the following code:
rownames(college) = college [,1]
View(college)

# What do you find after these 2 lines of codes? (2 points)
# The repeated first column is removed.

# e)  Let's continue to modify the dataframe to be a good look
college =college [,-1]
View(college)
# What do you find after these 2 lines of codes? (2 points)
# Column 1 is set as the index column and no longer has the variable X

# f) generate a numerical summary of the variable in the data set, 
# draw a short statement of what you find.
summary(college)
# There are more than twice as many private universitied than public ones
# A median of 1558 apps are presented, a median 2019 of them are accepted, 
# and a median of 434 students end up enrolling. 
# The means for this data are around twice as much as the median, 
# meaning that the data is significantly skewed to the right.
#There is also data on the undergrads, outstate, room and board, books, personal, PHD students, etc. Some
# of these would require some metadata to fully understand what they mean.

# g. Create a new qualitative variable with name Elite, we are going to do some 
# study for attribute Top10perc, We are going to divide universities into two groups 
# based on whether or not the proportion of students coming from the top 10% of their 
# high school classes exceeds 50%.

Elite =rep ("No",nrow(college ))
Elite [college$Top10perc >50]=" Yes"
Elite =as.factor (Elite)
college =data.frame(college ,Elite)

# Use summary() to see how many elite 
# universities in datafram (4 points)
summary(college)
# There are 78 elite universities in the dataFrame


# Use hist() function to plot the histogram for attributes: 
# Top10perc, Top25perc, F.Undergrad, Outstate (4 points)
top10hist <- hist(college$Top10perc, main="Top 10 Percent")
top25hist <- hist(college$Top25perc, main="Top 25 Percent")
fUndergradHist <- hist(college$F.Undergrad, main="F.Undergerad")
outStateHist <- hist(college$Outstate, main="Outstate")


# Practice 2
# Read the data file into a dataframe. (2 points)
auto <- read.csv("auto.csv")
print(auto)

# b. Find the dimension of the dataframe, 
# how many data objects and attributes are in this data frame (3 points)
nrow(auto) # 397 obs
ncol(auto) # 9 columns

# Now use the following line to re-load the Auto.csv to the dataframe
auto = read.csv("Auto.csv", header = TRUE, na.string = "?")

# c) Use R functions to remove data with missing values (2 points)
auto = na.omit(auto)
nrow(auto) # 392 obs

# d) What is the range of each quantitative attribute? 
# You can answer this using the range() function. (4 points)

# Find quantitative data data
colnames(auto)
summary(auto)
#find range of quantitative attributes
mpgRange <- range(auto$mpg)
mpgRange
cylindersRange <- range(auto$cylinders)
cylindersRange
dispRange <- range(auto$displacement)
dispRange
hpRange <- range(auto$horsepower)
hpRange
weightRange <- range(auto$weight)
weightRange
accRange <- range(auto$acceleration)
accRange
yearRange <- range(auto$year)
yearRange

# e) What is the mean and standard deviation of each quantitative attribute?
mpgMean <- mean(auto$mpg)
mpgMean
mpgSD <- sd(auto$mpg)
mpgSD

cylindersMean <- mean(auto$cylinders)
cylindersMean
cylindersSD <- sd(auto$cylinders)
cylindersSD

dispMean <- mean(auto$displacement)
dispMean
dispSD <- sd(auto$displacement)
dispSD

hpMean <- mean(auto$horsepower)
hpMean
hpSD <- sd(auto$horsepower)
hpSD

weightMean <- mean(auto$weight)
weightMean
weightSD <- sd(auto$weight)
weightSD

accMean <- mean(auto$acceleration)
accMean
accSD <- sd(auto$acceleration)
accSD

meanYear <- mean(auto$year)
meanYear
yearSD <- sd(auto$year)
yearSD

# Now remove the 10th through 85th observations. What is the range, 
# mean, and standard deviation of each attribute in the subset of the data that remains?
autosCleaned <- auto[-(10:85),]
autosCleaned
nrow(autosCleaned) # 316 obs

mpgRangeCleaned <- range(auto$mpg)
mpgRangeCleaned
mpgMeanCleaned <- mean(autosCleaned$mpg)
mpgMeanCleaned
mpgSDCleaned <- sd(autosCleaned$mpg)
mpgSDCleaned

cylindersRangeCleaned <- range(autosCleaned$cylinders)
cylindersRangeCleaned
cylindersMeanCleaned <- mean(autosCleaned$cylinders)
cylindersMeanCleaned
cylindersSDCleaned <- sd(autosCleaned$cylinders)
cylindersSDCleaned

dispRangeCleaned <- range(autosCleaned$displacement)
dispRangeCleaned
dispMeanCleaned <- mean(autosCleaned$displacement)
dispMeanCleaned
dispSDCleaned <- sd(autosCleaned$displacement)
dispSDCleaned

hpRangeCleaned <- range(autosCleaned$horsepower)
hpRangeCleaned
hpMeanCleaned <- mean(autosCleaned$horsepower)
hpMeanCleaned
hpSDCleaned <- sd(autosCleaned$horsepower)
hpSDCleaned

weightRangeCleaned <- range(autosCleaned$weight)
weightRangeCleaned
weightMeanCleaned <- mean(autosCleaned$weight)
weightMeanCleaned
weightSDCleaned <- sd(autosCleaned$weight)
weightSDCleaned

accRangeCleaned <- range(autosCleaned$acceleration)
accRangeCleaned
accMeanCleaned <- mean(autosCleaned$acceleration)
accMeanCleaned
accSDCleaned <- sd(autosCleaned$acceleration)
accSDCleaned

yearRangeCleaned <- range(autosCleaned$year)
yearRangeCleaned
meanYearCleaned <- mean(autosCleaned$year)
meanYearCleaned
yearSDCleaned <- sd(autosCleaned$year)
yearSDCleaned

# Question 3
# Create a binary operator %&% that will concatenate two strings as a single string with a space as a seperator. 
# Write an operator function in which the quotation marks around the terms are optional.
# The following output is for quoted and/or unquoted arguments.
"%&%" <- function(x, y) {
  paste(as.character(substitute(x)), as.character(substitute(y)))
}

Hello %&% World

"Hello" %&% "World!"


