library(ggplot2)
library(tibble)
library(dplyr)
library(extrafont)
extrafont::loadfonts()


# Function to define the theme
apply_pattern_theme <- function(bg_hex, caption_hex){
  theme(
    plot.background = element_rect(fill = bg_hex),
    panel.background = element_rect(fill = bg_hex),
    panel.grid = element_blank(),
    plot.caption = element_text(family = "Open Sans",
                                size = 6,
                                color = caption_hex),
    legend.position = "none",
    axis.title = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank()
  )
}


# Define base lines
lines <- tibble(
  x = seq(0, 19, by = .5),
  xend = x,
  y =  c(rep(c(5, 8), 19), 5),
  yend = rep(0, 39),
  speed = 3)


# Define line for petals
petal1 <- tibble(
  x = seq(0, 18.5, by = .5),
  xend = x + rep(c(0.5, 0), 19),
  y =  rep(c(10, 5), 19),
  yend = rep(5, 38))


petal2 <- tibble(
  x = seq(0.5, 19, by = 0.5),
  xend = x + rep(c(0.5, 0), 19),
  y =  rep(c(5, 10), 19),
  yend = rep(10, 38))


# Define dots
dots <- lines %>%
  dplyr::select(x, y)


ggplot() +
  geom_segment(data = lines,
               aes(x = x,
                   y = y,
                   xend = xend,
                   yend = yend),
               color = "white") +
  geom_segment(data = petal1,
               aes(x = x,
                   y = y,
                   xend = xend,
                   yend = yend),
               color = "#c4bbd1") +
  geom_segment(data = petal2,
               aes(x = x,
                   y = y,
                   xend = xend,
                   yend = yend),
               color = "#c4bbd1") +
  geom_point(data = dots,
             aes(x = x, y = y),
             color = "#ffb0b2",
             size = 1.5) +
  scale_x_continuous(limits = c(0, 19)) +
  scale_y_continuous(limits = c(-2, 10)) +
  coord_polar() +
  labs(caption = "@rutkr") +
  apply_pattern_theme(bg_hex = "#4d6091",
                      caption_hex = "white")
