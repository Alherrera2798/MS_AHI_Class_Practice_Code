library(dbplyr)
## Setting two different variables that are going to contain an array of numbers

morningbloodsugar <- c(100, 98, 115, 98, 84, 114, 119, 156, 150) #X-axis
eveningbloodsugar <- c(113, 115, 97, 130, 120, 52, 78, 93, 100) #Y-axis

#First thing want to do before conducting any tyoe of analysis
## Check statistical assumptions ->
# 1. See if there is a normal distribution of values
# 2. Is the homogeneity of variance good
# 3. Is there a linear relationship that exist between these two diff. datasets 

### STEP 1: IS THERE A LINEAR RELATIONSHIP BETWEEN THESE TWO SETS OF DATA? ###
# Easiest way to see that is to perform a scatter plot 

## plotting a scatter plot function == plot(x,y)
plot(morningbloodsugar, eveningbloodsugar)

#FAILED - Step 1 visaully does not appear to be a linear relationship between morsning and evening blood sugar levels

### STEP 2: NORMAL DISTRIBUTION
## mean(x) == to find the average of the variable
## sd(x) == finding the standard deviation
morningBSmean <- mean(morningbloodsugar)
morningBSsd <- sd(morningbloodsugar)

eveningBSmean <- mean(eveningbloodsugar)
eveningBSsd <- sd(eveningbloodsugar)

#PASSED! - Step 2 The mean is larger than the standard deviation for booth variables
# Leaning toward a NON-PARAMETRIC test 

### STEP 3: HOMOGENEITY OF VARIANCE ###
## FAILED HOMOGENITY OF VARIANCE

### STEP 4: PERFORMING A NON-PARAMETRIC CORRELATION TEST ###
# Pearson test - out
# Kendall/Spearman test to choose from -> nested in cor.test() documentation -> Test for Association/Correlation/ etween Paired Samples
# cor.test -> two values x,y and methods()-> the type of test we want
## cor.test(x,y, method = "pearson, kendall, spearman"), conf.level = 0.95
## SPEAMAN Test 
spearmanOutput = cor.test(morningbloodsugar, eveningbloodsugar, 
         method = c("spearman"), 
         conf.level =0.95)
## rho -> -0.44 means hypothetically there is a negative trend between two data points

## KENDALL Test
kendallOutput = cor.test(morningbloodsugar, eveningbloodsugar, 
                          method = c("kendall"), 
                          conf.level =0.95)
# What does it mean???
# If the method is kendall/spearman we get -> rho statistics 
## > used to estimate a ranked-based measure of association. 
## >> These test may be used to if the data do not necessarily come from a bi-variate normal distribution

