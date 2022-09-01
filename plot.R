#!/usr/bin/Rscript
require(ggplot2)

data <- read.table("results.tab", header = FALSE)
names(data) <- c("n", "arithmetic", "code", "value")
data$arithmetic <- as.factor(data$arithmetic)
data$code <- as.factor(data$code)


data$error <- 0
for (N in unique(data$n)) {
    for (C in unique(data$code)) {
        ref <- data[data$n == N & data$code == C & data$arithmetic == "ref", ]$value

        data[data$n == N & data$code == C, ]$error <- abs(data[data$n == N & data$code == C, ]$value - ref)
    }
}


data <- data[data$arithmetic != "ref", ]
# data$n <- as.factor(data$n)
print(summary(data))

ggplot(data = data, aes(x = n, y = error, color = code, shape = code)) +
    geom_point(alpha = 1) +
    #    geom_boxplot() +
    scale_y_log10() +
    scale_x_log10() +
    theme_bw() +
    theme(legend.position = "top") +
    facet_wrap(~arithmetic)

ggsave("variance.pdf", width = 12, height = 6)
