# figure-01-cut-detection-by-modality.R
# author: hannes
# date: 2026-06-18

source("02-run-statistical-analysis.R")

## 1. calculate statistics for Cut Detection Task (CDT)  

# 1.1 calculate accuracy matrices
mean_matrix <- tapply(df_performance$proportion, 
                      list(df_performance$sound, df_performance$subtitles),
                           mean, na.rm = TRUE)
sd_matrix   <- tapply(df_performance$proportion,
                      list(df_performance$sound, df_performance$subtitles),
                           sd, na.rm = TRUE)
n_matrix    <- tapply(df_performance$proportion, 
                      list(df_performance$sound, df_performance$subtitles),
                      function(x) sum(!is.na(x)))
se_matrix   <- sd_matrix / sqrt(n_matrix)

# 1.2 calculate overall delay matrices (FIXED DATAFRAME NAME)
mean_delay_all <- tapply(df_rt_final$delay, list(df_rt_final$sound, df_rt_final$subtitles), mean, na.rm = TRUE)
sd_delay_all   <- tapply(df_rt_final$delay, list(df_rt_final$sound, df_rt_final$subtitles), sd, na.rm = TRUE)
n_delay_all    <- tapply(df_rt_final$delay, list(df_rt_final$sound, df_rt_final$subtitles), function(x) sum(!is.na(x)))
se_delay_all   <- sd_delay_all / sqrt(n_delay_all)


# 2. generate the figure 1
 
# 2.1 set up graphical device

font_family <- "Times New Roman"

svg_output <- "output/figure-01-cut-detection-by-modality.svg"
png_output <- "output/figure-01-cut-detection-by-modality-2x.png"

bar_cols <- c("#A6A6A6", "#D0D0D0")

draw_cut_detection_figure <- function() {

  par(
    mfrow = c(1, 2),
    family = font_family,

    # tighter margins: bottom, left, top, right
    mar = c(3.8, 4.8, 2.8, 0.8),

    # smaller outer margin, only for shared x label
    oma = c(2.0, 0, 0, 0),

    ps = 14,
    las = 1,
    bty = "l",

    cex.axis = 0.95,
    cex.lab = 1.10,
    cex.main = 1.15
  )

  # left panel: Cut detection performance

  bp1 <- barplot(
    mean_matrix,
    beside = TRUE,
    ylim = c(0, 1.05),
    col = bar_cols,
    border = "black",
    lwd = 1.1,
    main = "Cut detection performance",
    xlab = "",
    ylab = "Proportion cuts detected [95% CI]",
    cex.names = 1.0
  )

  arrows(
    x0 = bp1,
    y0 = mean_matrix - se_matrix,
    x1 = bp1,
    y1 = mean_matrix + se_matrix,
    angle = 90,
    code = 3,
    length = 0.05,
    lwd = 1.4
  )

  abline(h = 0, lwd = 1.1)

  legend(
    "topright",
    legend = rownames(mean_matrix),
    fill = bar_cols,
    title = "Modality:",
    bty = "n",
    cex = 0.85,
    title.cex = 0.85,
    inset = c(0.01, 0.01)
  )


  # right panel: Cut detection time

  bp2 <- barplot(
    mean_delay_all,
    beside = TRUE,
    ylim = c(0, 820),
    col = bar_cols,
    border = "black",
    lwd = 1.1,
    main = "Cut detection time",
    xlab = "",
    ylab = "Cut detection time in ms [95% CI]",
    cex.names = 1.0
  )

  arrows(
    x0 = bp2,
    y0 = mean_delay_all - se_delay_all,
    x1 = bp2,
    y1 = mean_delay_all + se_delay_all,
    angle = 90,
    code = 3,
    length = 0.05,
    lwd = 1.4
  )

  abline(h = 0, lwd = 1.1)

  legend(
    "topright",
    legend = rownames(mean_matrix),
    fill = bar_cols,
    title = "Modality:",
    bty = "n",
    cex = 0.85,
    title.cex = 0.85,
    inset = c(0.01, 0.01)
  )

  mtext(
    "Subtitle condition",
    side = 1,
    outer = TRUE,
    line = 0.7,
    cex = 1.05
  )
}

# graphical device for svg

svg(
  filename = svg_output,
  width = 10.67,
  height = 6,
  pointsize = 14,
  family = font_family,
  bg = "white"
)

draw_cut_detection_figure()

dev.off()


# graphical device for png

png(
  filename = png_output,
  width = 3840,
  height = 2160,
  units = "px",
  res = 300,
  pointsize = 14,
  family = font_family,
  type = "cairo",
  bg = "white"
)

draw_cut_detection_figure()

dev.off()
