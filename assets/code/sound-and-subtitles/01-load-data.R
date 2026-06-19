# 01-load-data.R
# author: hannes
# last edited: 10.04.26

# setwd("")

##############################################################################

## 1. load the PsychoPy data from the csv files

# 1.1 get all csv files from the "data" directory
filenames <- list.files(path = "data/psychopy", pattern = "\\.csv$", 
                        full.names = TRUE, recursive = TRUE)

# 1.2 read data files in a list and filter for length
library(readr)

data_list <- lapply(filenames, function(f) {
  # detect character separation
  first_line <- readr::read_lines(f, n_max = 1)
  sep_char <- if(stringr::str_detect(first_line, ";")) ";" else ","
  
  # read file 
  tmp <- tryCatch({
    df <- read.csv(f, sep = sep_char, 
                   stringsAsFactors = FALSE, check.names = FALSE)
    if("participant" %in% names(df)) {
      df$participant <- as.character(df$participant)
    }
    df
  }, error = function(e) NULL)
  
  # handle empty files
  if (is.null(tmp) || nrow(tmp) == 0) {
    warning(paste("Konnte Datei nicht lesen oder leer:", basename(f)))
    return(NULL)
  }
  
  # attrition analysis
  if (nrow(tmp) < 140) {
    warning(paste("Experiment unvollständig bearbeitet:", basename(f)))
  } 
  
  tmp$source_file <- basename(f)
  return(tmp)
})

data_list <- Filter(Negate(is.null), data_list)
cat(length(data_list), "Dateien erfolgreich geladen.\n")

# filter for participants who actually finished
data_list_clean <- data_list[sapply(data_list, nrow) > 145]

cat(length(data_list_clean), "Teilnehmende haben das Experiment beendet.\n")

# 1.3 fill columns in all dataframes with NA's, to connect them better
all_colnames <- unique(unlist(lapply(data_list_clean, colnames)))
all_colnames <- all_colnames[all_colnames != "" & !is.na(all_colnames)]
all_colnames <- all_colnames[!grepl("^\\.\\.\\.", all_colnames)]

data_list_filled <- lapply(data_list_clean, function(df) {
  missing_cols <- setdiff(all_colnames, colnames(df))
  df[missing_cols] <- NA
  return(df[, all_colnames])
})

# 1.4 create a long dataframe with all of the participants data
df_total <- do.call(rbind, data_list_filled)

df_total <- unique(df_total)


##############################################################################

## 2. configure a smaller experiment dataframe for effective data analysis

# 2.1 define the target columns

target_cols <- c("participant", "correct_key_required", "date", "experiment_trials.thisN",
                 "video_used", "audio_used", "condition_modality", "all_cut_rts",
                 "experiment_trials.thisN", "exp_atttention_resp.keys")

df_long <- df_total[, target_cols]


################################################################################

## 3. merge experiment data with other data frames 

# 3.1 load the demographic data from the xlsx files
library(openxlsx)

demo_intro <- read.xlsx("data/questionnaire/demo_intro.xlsx", sheet = 1)
demo_outro <- read.xlsx("data/questionnaire/demo_outro.xlsx", sheet = 1)

# 3.2 clean the survey dataframes
# clean the intro survey
intro_cols <- !grepl("question", names(demo_intro))
demo_intro_clean <- demo_intro[, intro_cols]
names(demo_intro_clean) <- gsub("block_1\\.", "", names(demo_intro_clean))

# delete columns
cols_to_drop <- c("sessionToken", "surveyId", "experimentId", "isComplete",
                  "participant", "responseDate", "responseId", "surveyStatus", 
                  "length_ch", "expanded")
demo_intro_clean <- demo_intro_clean[, !(names(demo_intro_clean) %in% cols_to_drop)]

# clean the Outro
outro_cols <- !grepl("question", names(demo_outro))
demo_outro_clean <- demo_outro[, outro_cols]
names(demo_outro_clean) <- gsub("block_1\\.", "", names(demo_outro_clean))

# delete columns
cols_to_drop <- c("sessionToken", "surveyId", "experimentId", "isComplete",
                  "participant", "responseDate", "responseId", "surveyStatus",
                  "length_ch", "expanded")
demo_outro_clean <- demo_outro_clean[, !(names(demo_outro_clean) %in% cols_to_drop)]

# remove duplicate participants in the survey
demo_intro_clean <- demo_intro_clean[!duplicated(demo_intro_clean$participant_ID), ]
demo_outro_clean <- demo_outro_clean[!duplicated(demo_outro_clean$participant_ID), ]

# 3.3  load the conditions data from the xlsx file
h_cond <- read.xlsx("data/h_conditions.xlsx", sheet = 1)

pj_cond <- read.xlsx("data/pj_conditions.xlsx", sheet = 1)

# 3.4 merge all dataframes in one big

# 3.3 Load the conditions data from the xlsx files
h_cond <- read.xlsx("data/h_conditions.xlsx", sheet = 1)
pj_cond <- read.xlsx("data/pj_conditions.xlsx", sheet = 1)

h_cond$clip_path_old <- h_cond$clip_path
pj_cond$clip_path_old <- pj_cond$clip_path

df_long$participant <- as.numeric(df_long$participant)

# 3.5 merge the dataframes
# need to differentiate because two different conditions files were used
h_cond <- h_cond[!duplicated(h_cond$clip_path), ]
pj_cond <- pj_cond[!duplicated(pj_cond$clip_path), ]

df_long$participant <- as.numeric(df_long$participant)

df_pj <- merge(x = df_long[which(df_long$participant < 300), ], 
                     y = pj_cond, 
                     by.x = "video_used", 
                     by.y = "clip_path", 
                     all.x = TRUE,
                     sort = FALSE)

df_h <- merge(x = df_long[which(df_long$participant >= 300), ], 
                   y = h_cond, 
                   by.x = "video_used", 
                   by.y = "clip_path", 
                   all.x = TRUE,
                   sort = FALSE)
df_merged <- rbind(df_pj, df_h)

df_merged <- merge(x = demo_intro_clean, 
                   y = df_merged,
                   by.x = "participant_ID", 
                   by.y = "participant",
                   all.y = TRUE,
                   sort = FALSE)

df_merged <- merge(x = demo_outro_clean, 
                   y = df_merged, 
                   by.x = "participant_ID",
                   all.y = TRUE,
                   sort = FALSE)

names(df_merged)[names(df_merged) == "participant_ID"] <- "participant"
names(df_merged)[names(df_merged) == "exp_atttention_resp.keys"] <- "attention_key"
names(df_merged)[names(df_merged) == "experiment_trials.thisN"] <- "trials"


###############################################################################

## 4. clean the merged data frame 

# sort by participant, then chronologically by trial
# df <- df_merged[order(df_merged$participant, df_merged$trials), ]

df <- df_merged


# 4.1 add a sound condition column
df$sound <- with(df, 
                 ifelse(audio_used == "" | is.na(audio_used), NA,
                 ifelse(grepl("silence", audio_used), "visual",
                 ifelse(grepl("\\.mp3", audio_used), "audiovisual", NA))))


# 4.2 factorize the columns with yes / no answers
cols_yes_no <- c("claude", "dampf", "herz", "holo", "hund", "lied", 
                 "weißt", "wurst")

recode_map <- c("yes" = 1, "no" = 0, "idk" = NA)

df$subtitlesLegible <- as.factor(df$subtitlesLegible)


df[cols_yes_no] <- lapply(df[cols_yes_no], function(x) {
  unname(recode_map[trimws(x)]) 
})

df$movie_experience <- rowSums(df[cols_yes_no])


# 4.3 factorize the columns with multiple answers
df$hoursPerWeek <- factor(trimws(df_merged$hoursPerWeek), 
                                 levels = c("<1", "1-2", "3-4", ">5"), 
                                 ordered = TRUE)

df$consent <- gsub("\\[|\\]|\\\"", "", df_merged$consent)
df$consent <- factor(trimws(df$consent))

df$subtitlesUse <- factor(trimws(df_merged$subtitlesUse), 
                          levels = c("never", "rarely", "often", "always"), 
                          ordered = TRUE)

cols_to_factor <- c("consent", "gender", "movie", "subtitles", "sight", "sound",
                    "condition_modality")
df[cols_to_factor] <- lapply(df[cols_to_factor], 
                             function(x) factor(trimws(x)))

# 4.4 clean the attention check columns
none_condition <- df$attention_key == "None"
none_condition[is.na(none_condition)] <- FALSE

cols_to_na <- c("attention_check_question",
                "attention_check_correct", 
                "attention_check_distractor_1", 
                "attention_check_distractor_2", 
                "attention_check_distractor_3")

df[none_condition, cols_to_na] <- NA

# 4.5 change columns to numeric
df$first_cut <- as.numeric(df_merged$first_cut)
df$second_cut <- as.numeric(df_merged$second_cut)
df$n_cut <- as.numeric(df_merged$n_cut)
df$participant <- as.numeric(df_merged$participant)

# 4.6 clean the reaction time column (all_cuts_rts)
clean_rts <- gsub("\\[|\\]", "", df$all_cut_rts)
list_rts <- lapply(strsplit(clean_rts, ","), as.numeric)

results <- mapply(function(rts_sec, fc_ms, sc_ms) {
  
  res <- c(first_cut_rt = NA, delay_first_cut = NA, 
           second_cut_rt = NA, delay_second_cut = NA)
  
  # if no keys were pressed fill in NA's
  if (length(rts_sec) == 0 || all(is.na(rts_sec))) {
    return(res)
  }
  
  # change reaction time to millisecond 
  # and subtract 700 ms for the fixation cross
  rts_ms <- round((rts_sec - 0.7) * 1000, 0)
  
  # first_cut 
  if (!is.na(fc_ms)) {
    valid_first <- rts_ms[rts_ms >= (fc_ms + 200)]
    
    if (length(valid_first) > 0) {
      
      delay1 <- valid_first[1] - fc_ms
      
      if (delay1 <= 1500) {
        # Check if there is NO second cut, 
        # OR if this reaction is strictly before the second cut
        if (is.na(sc_ms) || valid_first[1] < sc_ms) {
          res["first_cut_rt"] <- valid_first[1] 
          res["delay_first_cut"] <- delay1      
        }
      }
    }
  }
  
  # second_cut
  if (!is.na(sc_ms)) {
    valid_second <- rts_ms[rts_ms >= (sc_ms + 200)]
    
    if (length(valid_second) > 0) {
      res["second_cut_rt"] <- valid_second[1] 
      
      delay2 <- valid_second[1] - sc_ms
      
      if (delay2 <= 1500) {
        res["delay_second_cut"] <- delay2     
      }
    }
  } 
  
  return(res)
  
}, list_rts, df$first_cut, df$second_cut, SIMPLIFY = FALSE)

res_df <- do.call(rbind, results)
df <- cbind(df, res_df)

###############################################################################
