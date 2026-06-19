# 02-statistical-analysis.R
# author: hannes
# last edited: 2026-06-18

source("01-load-data.R")

#############################################################################

## 1. Analyses

## 1.1 Hypothese - Negated Entity, Unrelated 

# The activation of the negated entity decreases over time. That is, we
# expect an interaction between prime-target-relation (negated entity,
# unrelated) and delay (0 ms, 750 ms).

dat1 <- dat[dat$prime_target_relation %in% c("Negated Entity", "Unrelated"),]
aov <- aov(key_resp.rt ~delay * prime_target_relation 
           + Error(participant + participant:prime_target_relation +
participant:delay), data = dat1)
summary(aov)

# Haupteffekt prime_target_relation mit F(1) = 44.604 und p < 0.05
# kein signifikanter Interaktionseffekt mit F(1) = 0.099 und p = 0.753 
# Hypothese nicht bestätigt

## 1.2 Hypothese - Good Alternative, Unrelated

# The activation for good alternatives increases over time. That is, we
# expect an interaction between prime-target-relation (good alternative,
# unrelated) and delay (0 ms, 750 ms).

dat2 <- dat[dat$prime_target_relation %in% c("Good Alternative", "Unrelated"),]
aov <- aov(key_resp.rt ~ delay * prime_target_relation 
             + Error(participant + participant:prime_target_relation +
participant:delay), data = dat2) 
summary(aov)

# Haupteffekt für prime_target_relation mit F(1) = 7.847 und p = 0.0051
# kein siginifikanter Interaktionseffekt mit F(1) = 00.797 und p = 0.3720
# Hypothese nicht bestätigt

## 1.3 Hypothese - Good Alternative, Worse Alternative

# The activation for good alternatives increases more than for worse
# alternatives over time. That is, we expect an interaction between
# prime-target-relation (good alternative, worse alternative) and delay (0 ms,
# 750 ms).

dat3 <- dat[dat$prime_target_relation %in% c("Good Alternative", "Worse Alternative"),]
aov <- aov(key_resp.rt ~ delay * prime_target_relation
       + Error(participant + participant:prime_target_relation +
participant:delay), data = dat3)
summary(aov)

# kein signifikanter Haupteffekt, aber delay ist knapp davor signifikant zu
# sein mit F(1) = 2.733 und p = 0.0983 (post-hoc-analyse sinnvoll?)
# kein signifikanter Interaktionseffekt mit F(1) = 0.337 und p = 0.5613
# Hypothese nicht bestätigt

## 1.4 Hypothese - Worse Alternative, Unrelated

# Worse alternatives are inhibited over time. That is, we expect an
# interaction between prime-target-relation (worse alternative, unrelated) and
# delay (0 ms, 750 ms).

dat4 <- dat[dat$prime_target_relation %in% c("Worse Alternative", "Unrelated"),]
aov <- aov(key_resp.rt ~ delay * prime_target_relation
      + Error(participant + participant:prime_target_relation +
participant:delay), data = dat4)
summary(aov)

# Haupteffekt von prime_target_relation mit F(1) = 7.604 und p = 0.00583
# kein signifikanter Interaktionseffekt mit F(1) = 0.114 und p = 0.73569
# Hypothese nicht bestätigt

sp <- 230
spa <- 50
spb <- 50
