# Regenerates listing thumbnails for project pages.
# Run from the project root:  Rscript R/make_thumbnails.R
library(ggplot2)
source("R/theme_md.R")

set.seed(4)
players <- do.call(rbind, lapply(paste("Player", 1:6), function(p) {
  base <- runif(1, 250, 450)
  trend <- if (p == "Player 3") 25 else 0
  data.frame(player = p, session = 1:10, hsr = base + trend * (1:10) + rnorm(10, 0, 25))
}))
players <- players[order(players$player == "Player 3"), ]

p <- ggplot(players, aes(session, hsr, colour = player, group = player)) +
  annotate("rect", xmin = -Inf, xmax = Inf, ymin = 300, ymax = 450, fill = md_colours$signal_soft) +
  geom_line(aes(linewidth = player == "Player 3")) +
  scale_linewidth_manual(values = c(0.6, 1.3), guide = "none") +
  md_highlight("Player 3") +
  labs(title = "Grey for context, signal for the point", x = NULL, y = NULL) +
  theme_md(base_size = 13) +
  theme(axis.text.x = element_blank())

ggsave("projects/products/slate-and-signal/thumbnail.png", p,
       width = 8, height = 4.5, dpi = 150, device = ragg::agg_png, bg = md_colours$surface)
