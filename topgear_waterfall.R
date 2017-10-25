sales <- data.frame(labels = c("Prev yr","jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec","prent yr"), 
value = c(45,2,-18,-25,6,7.6,9.8,-6.8,-10,7.7,8.5,-16,5,15.8),
logic = c(TRUE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,FALSE,TRUE)
)
library(ggplot2)
sales$labels <- factor(sales$labels, levels = sales$labels)
sales$end <- cumsum(sales$value)
sales$end <-c(head(sales$end,-1),0)
sales$start <- c(0,head(sales$end, -1))
sales$id <- seq_along(sales$value)
sales$logic1 = as.logical(sign(sales$value) == 1)
ggplot(sales, aes(value, fill = logic1)) + geom_rect(aes(x = labels, xmin = id - 0.45, xmax = id + 0.45, ymin = end,ymax = start)) + ggtitle("Waterfall Plot to showing financial data")+     theme(plot.title = element_text(hjust = 0.5))
