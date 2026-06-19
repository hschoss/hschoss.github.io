# 01-load-data.R
# author: hannes
# date: 2026-06-18

# setwd("")

##############################################################################

# 1. Load the data

# 1.1 read data file
dat <- read.csv("data/data_combined_prepared_for_analysis.csv",
                fileEncoding = "UTF-8")

# 1.2 demographics of sample prior to exclusions
demo <- dat[!duplicated(dat$participant),
            c("participant", "age", "sex", "native_language"),]

# absolute frequency of sexes
table(demo$sex)

# age distribution
summary(demo$age)
#  Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#  18.00   20.00   22.00   30.26   41.00   83.00 

length(unique(dat$participant))
# [1] 335


##############################################################################

## 2. Outliers and Exclusions 
# the dataframe has already been cleaned, and all participants included have
# completed the study, provided informed consent and are above 18 years old.

## 2.1 remove native language different from german
dat <- dat[!dat$native_language == "bulgarisch",]
dat <- dat[!dat$native_language == "Bulgarisch",]
dat <- dat[!dat$native_language == "russisch",]
dat <- dat[!dat$native_language == "Russisch",]
dat <- dat[!dat$native_language == "Tamil",]
dat <- dat[!dat$native_language == "Türkisch",]

dat$native_language <- sub("Deutsch", "deutsch", dat$native_language)
dat$native_language <- sub("DEUTSCH", "deutsch", dat$native_language)
dat$native_language <- sub("^deu$", "deutsch", dat$native_language)
dat$native_language <- sub("deutsch ", "deutsch", dat$native_language)

# number of subjects
length(unique(dat$participant))
# [1] 328

## 2.2 remove low performers in the attention check task (act)
act_accuracy <- aggregate(repetition_task_replacement_correct ~ participant,
                          dat, mean)

act_good_participant <- act_accuracy[
  act_accuracy$repetition_task_replacement_correct >= 0.8,
]$participant

dat <- dat[
  dat$participant %in% act_good_participant,
]

length(unique(dat$participant))


## 2.3 remove low performers in the lexical decision task (ldt)
ldt_accuracy <- aggregate(key_resp.corr ~ participant,
  dat[dat$item_type != "practice", ], mean)

is_good_participant <- ldt_accuracy$key_resp.corr >= 0.8

ldt_good_participant <- ldt_accuracy[is_good_participant,]$participant
dat <- dat[dat$participant %in% ldt_good_participant,]

length(unique(dat$participant))

## 2.4 remove practice trials and fillers
dat <- dat[dat$item_type == "experimental",]

## 2.5 remove trials with wrong responses
dat <- dat[dat$key_resp.corr == "1",]

## 2.6 remove trials with response times lower than 250 ms or higher than 6 seconds
dat <- dat[!dat$key_resp.rt < .25, ]
dat <- dat[!dat$key_resp.rt > 6, ]

## 2.7 remove low trial count (ltc) participants with less than 4 trials left 
# in one of the 8 conditions
dat$condition <- paste(dat$delay, dat$prime_target_relation, sep ="_")
trial_count <- aggregate(key_resp.corr ~ participant + prime_target_relation + delay, dat, sum)
ltc_participant <- trial_count[trial_count$key_resp.corr < 4,]$participant
dat <- dat[!dat$participant %in% ltc_participant,]

length(unique(dat$participant))

## 2.8 remove participants who already knew the experiment
non_naive <- dat[dat$materials_known == 1,]$participant |> unique()
dat <- dat[!dat$participant %in% non_naive,]

length(unique(dat$participant))

## 2.9 demographics of final sample

demo <- dat[!duplicated(dat$participant),
            c("participant", "age", "sex", "native_language")]

# absolute frequency of sexes
table(demo$sex)
#   divers männlich weiblich 
#        4      121      188

# age distribution
summary(demo$age)
# Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
# 18.0    20.0    22.0    29.9    38.0    80.0 

length(unique(dat$participant))
# 313


##############################################################################

## 3. aggregating and formatting data

# This section is intended to make sure to aggregate the data such that
# there is one value for each participant in each condition for the
# following visualization and analyses.

## 3.1 aggregation
ag <- aggregate(
  key_resp.rt ~ participant + age + delay + prime_target_relation,
  dat,
  mean
)

va <- aggregate(
  key_resp.rt ~ delay + prime_target_relation + target_type + participant,
  dat,
  mean
)

va$key_resp.rt <- va$key_resp.rt * 1000
va$delay <- va$delay * 1000

# 3.2 graphical inspection

plot(key_resp.rt ~ participant,
     va[va$target_type == "word" & va$prime_target_relation == "Unrelated", ])

va[va$target_type == "word" &
   va$prime_target_relation == "Unrelated",]$key_resp.rt |> summary()
#   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
#  486.7   642.4   732.7   778.1   845.2  2376.2 

# 3.2 graphical inspection
hist(va$key_resp.rt)
