# descriptive-analysis.R
# author: hannes
# last edited: 2026-04-13

# setwd("")

# generates a factorized dataframe from experiment data
source("01-load-data.R")

################################################################################

## 1. manipulation check and exclusions 

# 1.1 age > 18
unique(df$age) >= 18 

# 1.2 language
unique(df$language)

# 1.3 corrected to normal vision
unique(df$sight)

# 1.4 consent
unique(df$consent)

# 1.5 attention Check
df$attention_correct <- df$attention_key == df$correct_key_required
ac <- aggregate(attention_correct ~ participant, df, mean)
ac$attention_correct >= 0.70

# 1.6 removing duplicated participant
table(df$participant)
table(df$participant)[table(df$participant) > 200]
# 600683 
# 301

df <- subset(df, participant != "600683")

table(df$participant)
n <- length(unique(df$participant))
n
# the data from all 25 participants can be analyzed. No exclusions. 


################################################################################

## 2. descriptive statistics

# 2.1 age distribution
age_df <- aggregate(age ~ participant, df, mean)
summary(age_df$age)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 18.00   21.00   22.50   35.85   56.00   64.00 
sd(age_df$age)
# 18.19907

# 2.2 gender distribution
df_gender <- unique(df[, c("participant", "gender")])
table(df_gender[[2]])
# female   male 
# 12     13 

# 2.3 Watch hours Per Week
df_hoursPerWeek <- unique(df[, c("participant", "hoursPerWeek")])
table(df_hoursPerWeek[[2]]) / n
# <1 1-2 3-4  >5 
# 4   4   3  14 

# 2.4 Subtitle Usage
df_subtitlesUse <- unique(df[, c("participant", "subtitlesUse")])
table(df_subtitlesUse[[2]]) / n
# never rarely  often always 
# 7      9      6      3

# 2.5 Subtitles Legibility
unique(df$subtitlesLegible)
# yes
# Levels: no yes idk

# 2.6 Movie experience
mov <- aggregate(movie_experience ~ participant, data = df, mean)
mean(mov$movie_experience, na.rm = TRUE)
# 1.181818

################################################################################

## 3. Cut Detection Task (CDT)

# 3.2 generate Cut Detection Performance (CDP) measure
cdp <- df

cond_first <- !is.na(cdp$delay_first_cut) & cdp$n_cut >= 1 
cond_second <- !is.na(cdp$delay_second_cut) & cdp$n_cut == 2 

cdp$hit_first <- as.numeric(cond_first)
cdp$hit_second <- as.numeric(cond_second)
cdp$trial_hits <- cdp$hit_first + cdp$hit_second

# 3.3 merge a mixed table to calculate the proportion of Correctly detected cuts 
# aggregate n_cut from the big df
df_total_cuts <- aggregate(n_cut ~ participant + subtitles + sound, 
                           data = df, 
                           FUN = function(x) sum(x, na.rm = TRUE))

# aggregate trial_hits from the filtered dataframe
df_total_hits <- aggregate(trial_hits ~ participant + subtitles + sound, 
                           data = cdp, 
                           FUN = function(x) sum(x, na.rm = TRUE))

df_performance <- merge(df_total_cuts, df_total_hits, 
                        by = c("participant", "subtitles", "sound"), 
                        all.x = TRUE)

df_performance$trial_hits[is.na(df_performance$trial_hits)] <- 0
df_performance$proportion <- df_performance$trial_hits / df_performance$n_cut


################################################################################

## 4. perform Cut Detection Performance (CDP) ANOVA

# makes sure the predictors are factors
df_performance$participant <- as.factor(df_performance$participant)
df_performance$subtitles <- as.factor(df_performance$subtitles)
df_performance$sound <- as.factor(df_performance$sound)

performance_anova <- aov(proportion ~ subtitles * sound + Error(participant / (subtitles * sound)), 
                      data = df_performance)

summary(performance_anova)
# Error: participant
#           Df Sum Sq Mean Sq F value Pr(>F)
# Residuals 24   0.92 0.03833               
# 
# Error: participant:subtitles
#           Df  Sum Sq Mean Sq F value  Pr(>F)   
# subtitles  1 0.04027 0.04027   8.268 0.00833 **
# Residuals 24 0.11690 0.00487                   
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Error: participant:sound
#           Df  Sum Sq Mean Sq F value  Pr(>F)   
# sound      1 0.04418 0.04418   8.186 0.00861 **
# Residuals 24 0.12954 0.00540                   
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Error: participant:subtitles:sound
#                 Df  Sum Sq Mean Sq F value Pr(>F)
# subtitles:sound  1 0.00014 0.00014   0.028  0.869
# Residuals       24 0.12192 0.00508               


# main effect of subtitles: significant
# the presence or absence of subtitles significantly influenced the 
# cut detection performance, (f(1, 24)=8.27, p=.008).

# main effect of sound: significant
# the presence or absence of sound significantly influence the cut detection 
# performance, (f(1,24)=8.17,p=.009).

# interaction effect: not significant
# there is no significant interaction between subtitles and sound. a p-value of 
# 0.519 is much higher than 0.05 (F(1,24)=0.028,p=.869).
# the effect that subtitles have on cut detection is the same regardless whether 
# the video has sound or is silent. 
# the same way, the effect of sound is the same regardless of whether subtitles 
# are present. the two factors influence accuracy independently of one another.


library(effectsize)
eta_squared(performance_anova)
# # Effect Size for ANOVA (Type I)
# 
# Group                       |       Parameter | Eta2 (partial) |       95% CI
# -----------------------------------------------------------------------------
#   participant:subtitles       |       subtitles |           0.26 | [0.05, 1.00]
# participant:sound           |           sound |           0.25 | [0.04, 1.00]
# participant:subtitles:sound | subtitles:sound |       1.15e-03 | [0.00, 1.00]
# 
# - One-sided CIs: upper bound fixed at [1.00].

aggregate(proportion ~  sound + subtitles, df_performance, mean)
# sound subtitles proportion
# 1 audiovisual     nosub  0.8168870
# 2      visual     nosub  0.8612973
# 3 audiovisual       sub  0.7791217
# 4      visual       sub  0.8187912

################################################################################

## 5. perform Cut Detection Response (CDR) ANOVA (Undifferentiated Cuts)

# 5.1 create a long dataframe: extract first cuts
rt1 <- df[!is.na(df$delay_first_cut), c("participant", "subtitles", "sound", "delay_first_cut")]
colnames(rt1)[4] <- "delay"
rt1$cut_number <- "first"

# 5.2 extract second cuts (only for 2-cut trials)
rt2 <- df[!is.na(df$delay_second_cut) & df$n_cut == 2, c("participant", "subtitles", "sound", "delay_second_cut")]
colnames(rt2)[4] <- "delay"
rt2$cut_number <- "second"

# 5.3 bind them together into a clean, cut-level dataset
cdr_long <- rbind(rt1, rt2)

# 5.4 ensure factors
cdr_long$participant <- as.factor(cdr_long$participant)
cdr_long$subtitles <- as.factor(cdr_long$subtitles)
cdr_long$sound <- as.factor(cdr_long$sound)

# 5.5 Get the final true mean RT per participant per condition
df_rt_final <- aggregate(delay ~ participant + subtitles + sound, 
                         data = cdr_long, 
                         FUN = mean)

# 5.6 Run the ANOVA
rm_anova_rt_combined <- aov(delay ~ subtitles * sound + 
                              Error(participant/(subtitles * sound)), 
                            data = df_rt_final)

summary(rm_anova_rt_combined)
# Error: participant
#           Df  Sum Sq Mean Sq F value Pr(>F)
# Residuals 24 1087093   45296               
# 
# Error: participant:subtitles
#           Df Sum Sq Mean Sq F value Pr(>F)  
# subtitles  1  11001   11001   5.811 0.0239 *
# Residuals 24  45435    1893                 
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Error: participant:sound
#           Df Sum Sq Mean Sq F value Pr(>F)
# sound      1    183   182.8   0.152    0.7
# Residuals 24  28788  1199.5               
# 
# Error: participant:subtitles:sound
#                 Df Sum Sq Mean Sq F value Pr(>F)
# subtitles:sound  1    926   926.1   0.364  0.552
# Residuals       24  61093  2545.5   

# main effect of subtitles: significant
# the presence or absence of subtitles significantly influenced the 
# cut detection time, (f(1, 24)=5.81, p=.024).

# main effect of sound: not significant
# the presence or absence of sound significantly did not influence the cut 
# detection time performance, (f(1,24)=0.152,p=.07).

# interaction effect: not significant
# there is no significant interaction between subtitles and sound. a p-value of 
# 0.152 is higher than 0.05 (F(1,24)=0.152,p=.7).
# the effect that subtitles have on cut detection time is the same regardless 
# whether the video has sound or is silent. 

# 5.7 Calculate Effect Size
library(effectsize)
# eta_squared(rm_anova_rt_combined)
# # Effect Size for ANOVA (Type I)
# 
# Group                       |       Parameter | Eta2 (partial) |       95% CI
# -----------------------------------------------------------------------------
# participant:subtitles       |       subtitles |           0.19 | [0.02, 1.00]
# participant:sound           |           sound |       6.31e-03 | [0.00, 1.00]
# participant:subtitles:sound | subtitles:sound |           0.01 | [0.00, 1.00]
# 
# - One-sided CIs: upper bound fixed at [1.00].

# 5.8 Get the descriptive means for interpretation
aggregate(delay ~ sound + subtitles, data = df_rt_final, FUN = mean)
# sound subtitles    delay
# 1 audiovisual     nosub 599.6693
# 2      visual     nosub 596.2872
# 3 audiovisual       sub 614.5606
# 4      visual       sub 623.3510


################################################################################
## 6. Perform 3-Way ANOVA: Subtitles x Sound x Cut Number

# 6.1 aggregate the mean RT per participant per condition AND per cut
df_rt_cut <- aggregate(delay ~ participant + subtitles + sound + cut_number, 
                       data = cdr_long, 
                       FUN = mean)

# 6.2 Make sure the new predictor is a factor
df_rt_cut$cut_number <- as.factor(df_rt_cut$cut_number)

# 6.3 Run the 3-Way Repeated Measures ANOVA
rm_anova_3way <- aov(delay ~ subtitles * sound * cut_number + 
                       Error(participant/(subtitles * sound * cut_number)), 
                     data = df_rt_cut)

# 6.4 View Results
summary(rm_anova_3way)
# Error: participant
#           Df  Sum Sq Mean Sq F value Pr(>F)
# Residuals 24 2221672   92570               
# 
# Error: participant:subtitles
#           Df Sum Sq Mean Sq F value Pr(>F)  
# subtitles  1  26481   26481   4.534 0.0437 *
# Residuals 24 140165    5840                 
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Error: participant:sound
#           Df Sum Sq Mean Sq F value Pr(>F)
# sound      1    317     317   0.086  0.772
# Residuals 24  88132    3672               
# 
# Error: participant:cut_number
#            Df Sum Sq Mean Sq F value  Pr(>F)    
# cut_number  1 127444  127444   23.04 6.9e-05 ***
# Residuals  24 132730    5530                    
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Error: participant:subtitles:sound
#                 Df Sum Sq Mean Sq F value Pr(>F)
# subtitles:sound  1   1882    1882   0.212  0.649
# Residuals       24 213053    8877               
# 
# Error: participant:subtitles:cut_number
#                      Df Sum Sq Mean Sq F value Pr(>F)
# subtitles:cut_number  1   2471    2471   0.624  0.437
# Residuals            24  95094    3962               
# 
# Error: participant:sound:cut_number
#                  Df Sum Sq Mean Sq F value Pr(>F)
# sound:cut_number  1   1688    1688   0.422  0.522
# Residuals        24  96085    4004               
# 
# Error: participant:subtitles:sound:cut_number
#                            Df Sum Sq Mean Sq F value Pr(>F)
# subtitles:sound:cut_number  1     43      43   0.008   0.93
# Residuals                  24 130801    5450               


# main effect of subtitles: significant
# the presence or absence of subtitles significantly influenced the 
# cut detection time, (f(1, 24)=4.54, p=.044).

# main effect of sound: not significant
# the presence or absence of sound significantly did not influence the cut 
# detection time performance, (f(1,24)=0.086,p=.772).

# main effect of cut number: significant
# the number of cut significantly influenced the cut detection performance,
# F(1,24)=23.04, p<0,001
# First cuts were actually faster than second cuts.

# interaction effects were not significant


# 6.5 calculate Effect Sizes
library(effectsize)
eta_squared(rm_anova_3way)
# # Effect Size for ANOVA (Type I)
# 
# Group                                  |                  Parameter | Eta2 (partial) |       95% CI
# ---------------------------------------------------------------------------------------------------
#   participant:subtitles                  |                  subtitles |           0.16 | [0.00, 1.00]
# participant:sound                      |                      sound |       3.58e-03 | [0.00, 1.00]
# participant:cut_number                 |                 cut_number |           0.49 | [0.24, 1.00]
# participant:subtitles:sound            |            subtitles:sound |       8.75e-03 | [0.00, 1.00]
# participant:subtitles:cut_number       |       subtitles:cut_number |           0.03 | [0.00, 1.00]
# participant:sound:cut_number           |           sound:cut_number |           0.02 | [0.00, 1.00]
# participant:subtitles:sound:cut_number | subtitles:sound:cut_number |       3.32e-04 | [0.00, 1.00]
# 


# 6.6 get descriptive means to interpret the results
print("--- Means by Cut Number ---")
aggregate(delay ~ cut_number, data = df_rt_cut, FUN = mean)
# cut_number    delay
# 1      first 596.9509
# 2     second 647.4372


print("--- Means by Subtitles and Cut Number ---")
aggregate(delay ~ subtitles + cut_number, data = df_rt_cut, FUN = mean)
# subtitles cut_number    delay
# 1     nosub      first 588.9589
# 2       sub      first 604.9428
# 3     nosub     second 632.4156
# 4       sub     second 662.4588

