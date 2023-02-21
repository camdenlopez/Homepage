library(cowplot)
library(dplyr)
library(tidyr)
library(ggplot2)

theme_set(theme_nothing())

set.seed(1)
maxt <- 100
tbl <-
  tibble(t = 1:maxt) %>%
  mutate(d =
           sample(c(-1, 1), n(),
                  prob = c(0.5, 0.5),
                  replace = TRUE),
         y = cumsum(d))

ggplot(tbl) +
  geom_line(aes(x = t,
                y = y),
            size = 1,
            color = "white") +
  scale_x_continuous(expand = expansion(mult = 0.2)) +
  scale_y_continuous(expand = expansion(mult = 0.5)) +
  theme(panel.background =
          element_rect(fill = "#1572B2",
                       color = "#1572B2"))

ggsave("static/images/logo.png",
       width = 512, height = 512, units = "px")
