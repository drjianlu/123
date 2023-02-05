rm(list = ls())
library(ggstatsplot)
#install.packages("palmerpenguins")
library(palmerpenguins)
#install.packages("tidyverse")
library(tidyverse)

#data("penguins", package = "palmerpenguins")
#penguins <- tidyr::drop_na(penguins)

getwd()
A = read.table(file = "111.csv",sep = "\t",header = T,stringsAsFactors = F)


plt <- ggbetweenstats(
  data = A,
  x = name,
  y = count,
  p.adjust.method = "holm",
)
extract_stats(plt)

plt <- plt + 
  # Add labels and title
  labs(
    x = "Penguins Species",
    y = "Bill Length",
    title = "Distribution of bill length across penguins species"
  ) + 
  # Customizations
  theme(
    # This is the new default font in the plot
    text = element_text(family = "Roboto", size = 8, color = "black"),
    plot.title = element_text(
      family = "Lobster Two", 
      size = 20,
      face = "bold",
      color = "#2a475e"
    ),
    # Statistical annotations below the main title
    plot.subtitle = element_text(
      family = "Roboto", 
      size = 15, 
      face = "bold",
      color="#1b2838"
    ),
    plot.title.position = "plot", # slightly different from default
    axis.text = element_text(size = 10, color = "black"),
    axis.title = element_text(size = 12)
  )

# 1. Remove axis ticks
# 2. Change default color of the axis lines with a lighter one
# 3. Remove most reference lines, only keep the major horizontal ones.
#    This reduces clutter, while keeping the reference for the variable
#    being compared.
# 4. Set the panel and the background fill to the same light color.

plt <- plt  +
  theme(
    axis.ticks = element_blank(),
    axis.line = element_line(colour = "grey50"),
    panel.grid = element_line(color = "#b4aea9"),
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.major.y = element_line(linetype = "dashed"),
    panel.background = element_rect(fill = "#fbf9f4", color = "#fbf9f4"),
    plot.background = element_rect(fill = "#fbf9f4", color = "#fbf9f4")
  )

ggsave(
  filename = here::here("img", "fromTheWeb", "web-violinplot-with-ggstatsplot.png"),
  plot = plt,
  width = 8,
  height = 8,
  device = "png"
)
#
