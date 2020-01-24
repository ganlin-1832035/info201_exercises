# Exercise 2: working with data frames

# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100")
# Hint: use the `paste()` function and vector recycling to add a number to the word
# "Employee"

employees <- paste("Employee", 1:100)
print(employees)

# Create a vector of 100 random salaries for the year 2017
# Use the `runif()` function to pick random numbers between 40000 and 50000

?runif
salaries_2017 <- runif(100, 40000, 50000)

# Create a vector of 100 annual salary adjustments between -5000 and 10000.
# (A negative number represents a salary decrease due to corporate greed)
# Again use the `runif()` function to pick 100 random numbers in that range.

adjustments <- runif(100, -5000, 10000)

# Create a data frame `salaries` by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!

salaries <- data.frame(employees, salaries_2017, adjustments, stringsAsFactors = FALSE)

# Add a column to the `salaries` data frame that represents each person's
# salary in 2018 (e.g., with the salary adjustment added in).

salaries$salaries_2018 <- salaries$salaries_2017 + salaries$adjustments
print(salaries)

# Add a column to the `salaries` data frame that has a value of `TRUE` if the 
# person got a raise (their salary went up)

salaries$raise <- c(salaries$adjustments > 0)
print(salaries)

### Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)

# What was the 2018 salary of Employee 57

Employee_57 <- salaries[ salaries$employees == "Employee 57", "salaries_2018"]
print(Employee_57)

# How many employees got a raise?

got_raise <- nrow(salaries[salaries$raise == TRUE, ])         
# You need a comma so it only filters that specific column, but not rows
print(got_raise)

# What was the dollar value of the highest raise?

biggest_raise <- salaries[ salaries$adjustments == max(salaries$adjustments), "adjustments"]
print(biggest_raise)

# What was the "name" of the employee who received the highest raise?

lucky_one <- salaries[salaries$adjustments == max(salaries$adjustments), "employees"]
print(lucky_one)

# What was the largest decrease in salaries between the two years?

largest_decrease <- salaries[ salaries$adjustments == min(salaries$adjustments), "adjustments"]
print(largest_decrease)

# What was the name of the employee who recieved largest decrease in salary?

unlucky_one <- salaries[ salaries$adjustments == min(salaries$adjustments), "employees"]
print(unlucky_one)

# What was the average salary change?

avg_salary <- mean(salaries$adjustments)
print(avg_salary)                   

# For people who did not get a raise, how much money did they lose on average?

paycut <- mean(salaries[salaries$raise == FALSE, "adjustments"])
print(paycut)

## Consider: do the above averages match what you expected them to be based on 
## how you generated the salaries?

# Yes, since the average is really close to what I have set for the random salaries.

# Write a .csv file of your salary data to your working directory

write.csv(salaries, "salary.csv")
salary.csv <- read.csv("salary.csv", stringsAsFactors = FALSE)
print(salary.csv)
