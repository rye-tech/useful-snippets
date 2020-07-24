# Deployable code for data wrangling #

# Basic Data assessment #############################################


# check data types of variables with class()
# example:

x <- 4 # take note, the old value assigned to x is replaced by 4
x
class(x)

text1 <- "Yarrr"
class(text1)


logic1 <- TRUE 
class(logic1)




#pulling medians for all desired variables


sfx.df <- sfx.df %>%
  group_by(datetime.tag) %>%
  summarise(pH_int_v = median(pH_int_v),
            pH_ext_v = median(pH_ext_v),
            abs_v_diff = median(abs_v_diff),
            pH_temp = median(pH_temp), 
            ctd_sal = median(ctd_sal),
            pH_int_cell =  median(pH_int_cell), 
            pH_ext_cell =  median(pH_ext_cell), 
            abs_pH_diff =  median(abs_pH_diff),
            ctd_temp =  median(ctd_temp),
            ctd_o2_mg_l = median(ctd_o2_mg_l),
            ctd_chla =  median(ctd_chla),
            ctd_turb =  median(ctd_turb))











# Data Tidying ##########################################


#renaming a single variable. Add multiple with commas. Quotes are optional

sfx.df <- sfx.df %>%                     
  rename(datetime = "datetime.tag")


#filters for BOB data labeled B-001 etc
df1 <- filter(df1, grepl('B', Sample.Name))

#filters for MARI data labeled M-001 etc
df1 <- filter(df1, grepl('M', Sample.Name))


#above pulled from:
mtcars$type <- rownames(mtcars)
dplyr::filter(mtcars, grepl('Toyota|Mazda', type))


# output  should look like:

# mpg cyl  disp  hp drat    wt  qsec vs am gear carb           type
# 1 21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4      Mazda RX4
# 2 21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4  Mazda RX4 Wag
# 3 33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1 Toyota Corolla
# 4 21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1  Toyota Corona




#flag out bad voltages NEED TO ADD INTO FLAGGING PROCESS INSTEAD
# 
# df1 <- filter(df1, pH_int_v > mari.2018.screen.df$int.v.min & pH_int_v < mari.2018.screen.df$int.v.max)
# 
# df1 <- filter(df1, pH_ext_v > mari.2018.screen.df$ext.v.min & pH_ext_v < mari.2018.screen.df$ext.v.max)



#reorder and pull select vars

df <- select(df, datetime, og_pH_int, og_pH_ext, pH_temp, pH_int_v, pH_ext_v)



# remove datetime generation vars
df <- select(df, -day, -date, -hms)



# bind data frame with same columns

df <- bind_rows(df1,df2, df3, .id= NULL)









# Dates and Times ######################################################

# convert to POSIXcT with character in format dd-Mon-yyyy hh:mm:ss
df1$datetime <- dmy_hms(df1$Date)
















