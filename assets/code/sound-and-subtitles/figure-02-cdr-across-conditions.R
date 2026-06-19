# figure-02-cdr-across-conditions.R
# author: hannes
# date: 2026-06-18

source("02-run-statistical-analysis.R")

# set output
figure_file_svg <- "output/figure-02-cdr-across-conditions.svg"
figure_file_png <- "output/figure-02-cdr-across-conditions-2x.png"

# set colors

fill_first  <- adjustcolor("#D9D9D9", alpha.f = 0.75)
fill_second <- adjustcolor("#8C8C8C", alpha.f = 0.55)
border_col  <- "#333333"

# axis limits and breaks
x_lims <- c(200, 1500)
breaks_seq <- seq(x_lims[1], x_lims[2], length.out = 40)

sounds <- levels(factor(df$sound))
subs   <- levels(factor(df$subtitles))

# compute common y-axis maximum
count_max <- 0

for (s in sounds) {
  for (sub in subs) {

    d_cond <- subset(df, sound == s & subtitles == sub)

    rt1 <- na.omit(d_cond$delay_first_cut)
    rt2 <- na.omit(d_cond$delay_second_cut)
    rt1 <- rt1[rt1 >= x_lims[1] & rt1 <= x_lims[2]]
    rt2 <- rt2[rt2 >= x_lims[1] & rt2 <= x_lims[2]]
    h1 <- hist(rt1, breaks = breaks_seq, plot = FALSE)
    h2 <- hist(rt2, breaks = breaks_seq, plot = FALSE)

    count_max <- max(count_max, h1$counts, h2$counts, na.rm = TRUE)
  }
}

y_max <- ceiling((count_max * 1.10) / 5) * 5

# define a drawing function
draw_histogram_figure <- function() {

  par(
    mfrow = c(2, 2),
    family = font_family,

    # tighter panel margins: bottom, left, top, right
    mar = c(2.7, 3.4, 1.8, 0.5),

    # much tighter outer margins
    oma = c(0.3, 0.3, 1.6, 0.2),

    ps = 14,
    bty = "l",
    las = 1,

    cex.axis = 0.90,
    cex.lab  = 1.00,
    cex.main = 1.00,

    mgp = c(1.8, 0.55, 0),
    tcl = -0.3
  )

  panel_index <- 1

  for (s in sounds) {
    for (sub in subs) {

      d_cond <- subset(df, sound == s & subtitles == sub)

      rt1 <- na.omit(d_cond$delay_first_cut)
      rt2 <- na.omit(d_cond$delay_second_cut)

      rt1 <- rt1[rt1 >= x_lims[1] & rt1 <= x_lims[2]]
      rt2 <- rt2[rt2 >= x_lims[1] & rt2 <= x_lims[2]]

      sound_label <- switch(
        as.character(s),
        "audiovisual" = "audiovisual",
        "visual" = "visual",
        tools::toTitleCase(as.character(s))
      )

      sub_label <- if (sub == "sub") "with subtitles" else "without subtitles"
      plot_title <- paste(sound_label, sub_label)

      hist(
        rt1,
        breaks = breaks_seq,
        xlim = x_lims,
        ylim = c(0, y_max),
        freq = TRUE,
        col = fill_first,
        border = border_col,
        lwd = 1.0,
        main = plot_title,
        xlab = "Response time (ms)",
        ylab = "Frequency",
        cex.main = 1.00
      )

      hist(
        rt2,
        breaks = breaks_seq,
        freq = TRUE,
        add = TRUE,
        col = fill_second,
        border = border_col,
        lwd = 1.0
      )

      if (panel_index == 1) {
        legend(
          "topright",
          legend = c("First cut", "Second cut"),
          fill = c(fill_first, fill_second),
          border = border_col,
          bty = "n",
          cex = 0.80
        )
      }

      panel_index <- panel_index + 1
    }
  }

  mtext(
    "Cut detection response times across conditions",
    side = 3,
    outer = TRUE,
    line = 0.2,
    font = 2,
    cex = 1.20
  )
}


# export svg
svg(
  filename = figure_file_svg,
  width = 10.67,
  height = 6,
  pointsize = 14,
  family = font_family,
  bg = "white"
)

draw_histogram_figure()

dev.off()


# export png

png(
  filename = figure_file_png,
  width = 3840,
  height = 2160,
  units = "px",
  res = 300,
  pointsize = 14,
  family = "Times New Roman",
  type = "cairo",
  bg = "white"
)

draw_histogram_figure()

dev.off()
