#!/usr/bin/env Rscript

library(methods) # show
library(scales) # percent
library(ggplot2) # for motive histograms

original <- data.frame(
  "labels" = c("sensible", "unique", "differences"),
  "values" = c(0.352, 69.4, 6.9)
)

modified <- data.frame(
  "labels" = c("sensible", "unique", "differences"),
  "values" = c(0.924, 12, 3.1)
)


fullexp <- data.frame(
)


graphit <- function(data) {
  data$labels <- factor(
    data$labels, levels=c("unique", "sensible", "differences")
  )

  g <- ggplot(data, aes(x=labels, fill=labels))
  g <- g + geom_bar(aes(y=values), stat="identity", color="#000000")
  g <- g + guides(fill=FALSE)
  g <- g + ylab("percent sensible results")
  g <- g + scale_y_continuous(labels=percent)
  g <- g + theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor.y = element_blank(),
    #axis.text.x = element_text(size=26, angle=90, vjust=0.5, hjust=1),
    axis.text.x = element_text(size=26),
    axis.text.y = element_text(size=14),
    axis.title.x = element_blank(),
    axis.title.y = element_text(size=20),
    axis.ticks.x = element_blank(),
    axis.ticks.y = element_blank()
  )

  return(g)
}

gorig <- graphit(original)
gmod <- graphit(modified)

pdf(file="tram-exp-graph.pdf", title="TRAM Tradeoffs")
show(gorig)
show(gmod)
dev.off()
