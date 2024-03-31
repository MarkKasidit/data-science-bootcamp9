# load library
library(tidyverse)
library(glue)
library(lubridate)

# glue messages
my_name <- "Mark"
my_age <- 23

glue("Hi! my name is {my_name}. Today I'm {my_age} years old.")

# library tidyverse
# data transformation +> dplyr

# 1. select
# 2. filter
# 3. arrange
# 4. mutate => create new column
# 5. summarise

mtcars <- rownames_to_column(mtcars,"model")
view(mtcars)

select(mtcars, model, mpg, hp, wt)
select(mtcars, model, mpg, 11, wt, 5)
select(mtcars, starts_with("m"))
select(mtcars, ends_with("m"))
select(mtcars, contains("m"))

##pipeline
m1 <- mtcars %>%
  select(model, mpg, hp, wt) %>%
  filter(hp > 200) %>%
  arrange(hp, desc(mpg))

##Regular Expression: using grep, grepl
mtcars %>%
  select(model,mpg,hp,wt,am) %>%
  filter(grepl("^M",model) & hp > 150)

mtcars %>%
  select(model, mpg, hp, wt, am) %>%
  filter(between(hp, 100, 200)) %>%
  arrange(am, desc(hp))

## write csv file
write_csv(mtcars, "result.csv")

## mutate to create new column/ adjust column
mtcars %>%
  filter(mpg >= 20) %>%
  select(model, mpg, hp, wt, am) %>%
  mutate(model_upper = toupper(model),
         mpg_double = mpg*2,
         mpg_hahaha = mpg_double+10,
         new_col = 100,
         am = if_else(am==0,"auto","manual")
  )

## summarise
## aggregate function in SQL
m4 <- mtcars %>%
  mutate(am = if_else(am==0,"auto","manual")) %>%
  group_by(am) %>%
  summarise(avg_mpg = mean(mpg),
            sum_mpg = sum(mpg),
            min_mpg = min(mpg),
            max_hp = max(hp),
            n = n())

write_csv(m4, "datayouask.csv")

## Join in R
band_members %>%
  mutate(name_upper = toupper(name)) %>%
  left_join(band_instruments, by="name")

band_members %>%
  select(member_name = name,
         band_name = band) %>%
  left_join(band_instruments, by = c("member_name" = "name"))

## random sampling
mtcars %>%
  sample_n(5) %>%
  pull(model)

mtcars %>%
#  sample_frac(0.15) %>%
  summarise(avg_hp = mean(hp))
#  pull(model)

## count
mtcars <- mtcars %>% 
  mutate(am = if_else(am==0, "Auto", "Manual"))
view(mtcars)

mtcars %>%
  count(am)

mtcars %>%
  count(am) %>%
  mutate(pct = n/sum(n))

mtcars %>%
  count(am, cyl)
