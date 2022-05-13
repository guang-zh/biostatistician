# biostatistician
Notes for the different analysis in biostatistics

# Summary tables Resources
https://www.danieldsjoberg.com/gtsummary/articles/tbl_summary.html

# Stacked Barplot
```
library(ggplot2)
ggplot(df_data, aes(x=reorder(therapy, order), y=valuePercent, fill=variable)) +
  geom_bar(position = "fill", stat="identity") +
  scale_y_continuous(labels = scales::percent) +
  geom_text(aes(label=paste0(valuePercent*100,"%")),
            position= position_stack(vjust=0.5), size=4)+
  xlab("Therapy") + ylab("Percent of Frequency")+ 
  labs(fill="Category")+
  theme_bw() +
  theme(panel.border = element_blank(), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(), axis.line = element_line(colour = "black"), 
        legend.position = "top")
```
