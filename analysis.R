library(dplyr)
library(tidyr)
library(foreign)
library(ggplot2)

# Variable Wave Identification
# V1 to V199 – 1st Wave Survey data 14
# V201 to V399 – 2nd Wave Survey data 17
# V401 to V499 – 3rd Wave Survey data 24
# P1 to P144 – Parent Survey data
d <- read.dta("data/20520-0001-Data.dta")

parent.country <- d %>% drop_na(V9, V15) 

# Top 10 countries born in for father
father.country <- parent.country %>% group_by(V9) %>%
  summarise(total = n()) %>%
  top_n(10, total)

# Top 10 countries born in for mother
mother.country <- parent.country %>% group_by(V15) %>%
  summarise(total = n()) %>%
  top_n(10, total)

############################################################
############################################################
############################################################



parent.edu.income <- d %>% select(P31, P55, C20, P34) %>% na.omit()


parent.edu.income$P31 <- factor(parent.edu.income$P31,
                     levels = c("No Schooling","Eighth Grade or Less",
                                "Beyone Eighth Grade but not HS Graduate", "High School Graduate",
                                "Less than One Year Voc./Trade/Business School", "One to Two Years Voc./Trade/Business School",
                                "Two Years Plus Voc./Trade/Business School", "Less than Two Years of College",
                                "Two or More Years of College", "Finished Four or Five Year College Program",
                                "Master's Degree or Equivalent", "Ph.D., M.D., or Other Advanced Degree"),
                     labels = c(0:11))

parent.edu.income$P34 <- factor(parent.edu.income$P34,
                                levels = c("Employed Full Time","Employed Part Time",
                                           "Unemployed and Looking for Work", "Unemployed and Not Looking for Work",
                                           "Attending School Full- or Part-Time", "Retired",
                                           "Disabled", "Keeping House",
                                           "Other"),
                                labels = c(1:9))

colnames(parent.edu.income) <- c("ea", "mi", "english", "work")


#Turn to numerics
parent.edu.income$ea <- as.numeric(parent.edu.income$ea)
parent.edu.income$work <- as.numeric(parent.edu.income$work)

write.csv(parent.edu.income, file = "parent.edu.income/parent.edu.income.csv")

fit <- lm(mi ~ ea + english + work, data=parent.edu.income)

# Multiple linear regression
immigrant.edu.income <- d %>% select(V407, V421) %>% na.omit()
summary(fit)

immigrant.edu.income$V407 <- factor(immigrant.edu.income$V407,
                                levels = c("Some High School (Grades 9-12, No Diploma)","Graduated from High School",
                                           "1 or 2 Yrs of Post-High School Voc. Training/College", "Graduated 2-Yr-College/Voc. School(Assoc. Degree)",
                                           "3 or More Yrs of College (No Degree Yet)", "Graduated from 4/5-Yr-College (e.g. Bachelor's Degree)",
                                           "Some Graduate School (No Degree Yet)", "Master's Degree",
                                           "Professional/Doctoral Degree (JD, MD, DDS, Ph.D)", "Other"),
                                labels = c(1:10))
colnames(parent.edu.income) <- c("mi", "ea")
write.csv(parent.edu.income, file = "parent.edu.income/immigrant.edu.income.csv")

############################################################
############################################################
############################################################
# deprresion vs 
d1

ggplot()