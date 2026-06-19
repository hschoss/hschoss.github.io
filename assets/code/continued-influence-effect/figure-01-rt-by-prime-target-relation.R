# figure-01-rt-by-prime-target-relation.R
# author: hannes
# last edited: 2026-06-18

figure_file_svg <- "output/figure-01-response-time-by-delay-relation.svg"
figure_file_png <- "output/figure-01-response-time-by-delay-relation-2x.png"

plot_dat <- aggregate(
  key_resp.rt ~ delay + prime_target_relation,
  va,
  mean
)

relations <- c(
  "Negated Entity",
  "Unrelated",
  "Good Alternative",
  "Worse Alternative"
)

point_symbols <- c(2, 1, 0, 4)

draw_delay_relation_plot <- function() {
  par(
    family = "Times New Roman",

    # tighter margins: bottom, left, top, right
    mar = c(4.2, 5.0, 0.5, 0.8),

    ps = 14,
    bty = "o",
    las = 1,
    cex.axis = 1.05,
    cex.lab = 1.25,
    mgp = c(2.6, 0.75, 0),
    tcl = -0.35
  )

  plot(
    key_resp.rt ~ delay,
    plot_dat,
    type = "n",
    xaxt = "n",
    xlab = "Delay (ms)",
    ylab = "Response Time (ms)",
    xlim = c(-140, 890),

    # tighter vertical range
    ylim = c(660, 800)
  )

  axis(
    1,
    at = c(0, 750),
    labels = c("0", "750")
  )

  for (i in seq_along(relations)) {
    relation_data <- plot_dat[
      plot_dat$prime_target_relation == relations[i],
    ]

    relation_data <- relation_data[order(relation_data$delay), ]

    lines(
      relation_data$delay,
      relation_data$key_resp.rt,
      type = "b",
      pch = point_symbols[i],
      lty = 1,
      lwd = 1.4,
      cex = 1.15
    )
  }

  legend(
    "topright",
    legend = relations,
    pch = point_symbols,
    lty = 0,
    bty = "o",
    cex = 1.05,
    pt.cex = 1.15,
    inset = 0.02
  )
}

# svg export

svg(
  filename = figure_file_svg,
  width = 10,
  height = 10,
  pointsize = 14,
  family = "Times New Roman",
  bg = "white"
)

draw_delay_relation_plot()

dev.off()

# png export

png(
  filename = figure_file_png,
  width = 2400,
  height = 2400,
  units = "px",
  res = 300,
  pointsize = 14,
  family = "Times New Roman",
  type = "cairo",
  bg = "white"
)

draw_delay_relation_plot()

dev.off()
