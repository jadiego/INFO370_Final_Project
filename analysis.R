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
dtsv <- read.csv("data/20520-0001-Data.tsv", sep = "\t")

# How close are you to your culture and country => Feel discrimianted?
vietnam <- dtsv %>% select(v21, v148, p31,p55, p20, p34) %>% na.omit() %>% filter(v21 == 31)
hmong <- dtsv %>% select(v21, v148, p31,p55, p20, p34) %>% na.omit() %>% filter(v21 == 34)
cuba <- dtsv %>% select(v21, v148) %>% na.omit() %>% filter(v21 == 1)

#socioeconomic status of Vietnamese
ggplot(vietnam,aes(v148)) + geom_histogram(bins = 50)

#socioeconomic status of Hmong
ggplot(hmong, aes(v148)) + geom_histogram(bins = 50)

#socioecnomic status of Cuba
ggplot(cuba, aes(v148)) + geom_histogram(bins = 50)



ggplot(discrimination.sei, aes(x=v148, y= v415e)) + geom_point() + 
  stat_smooth(method="glm")

#model
model <- lm(v415e ~ v148, data=discrimination.sei)
summary(model) # show results


ggplot(dat, aes(x=mpg, y=vs)) + geom_point() + 
  stat_smooth(method="glm", method.args=list(family="binomial"), se=FALSE)


#Distribution of race
ggplot(dtsv, aes(v436)) + geom_histogram()

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


hmong.parent.edu.income <- dtsv %>% 
  select(p31, p55, c20, p34, v21) %>% na.omit() %>% 
  filter(v21 == 34)
colnames(hmong.parent.edu.income) <- c("ea", "mi", "english", "work", "no")

write.csv(hmong.parent.edu.income, 
          file = "parent.edu.income/hmong.parent.edu.income.csv")



vietnam.parent.edu.income <- dtsv %>% 
  select(p31, p55, c20, p34, v21) %>% na.omit() %>% 
  filter(v21 == 31)
colnames(vietnam.parent.edu.income) <- c("ea", "mi", "english", "work", "no")
write.csv(vietnam.parent.edu.income, 
          file = "parent.edu.income/vietnam.parent.edu.income.csv")



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
