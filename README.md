# Biostatistician
Notes for the different analysis in biostatistics

## Update packages in R
installed_packages <- installed.packages()

installed_packages <- installed_packages[, c("Package", "Version")]

write.csv(installed_packages, "directory_to_location/installed_packages.csv", row.names = FALSE)

### Read the list of installed packages
installed_packages <- read.csv("directory_to_location/installed_packages.csv", stringsAsFactors = FALSE)

### Reinstall packages
install.packages(installed_packages$Package)

### update.packages(ask = FALSE, checkBuilt = TRUE)


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

# Correlogram in R
```
library(corrplot)
# Baseline
baseline_cor <- cor(df_data %>% select(Baseline_magnitude:Baseline_count), use = "pairwise.complete.obs")
corrplot(baseline_cor, method = "ellipse", type = "lower", tl.cex = 0.8)
```


