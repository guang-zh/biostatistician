
# Load libraries
```
library(knitr)
library(data.table)
library(tidyverse)
library(dplyr)
library(formattable)
library(gtsummary)
library(ggpubr)
library(rstatix)
library(magrittr)
library(ggpmisc)
library(Hmisc)
library(scales)
library(ggplot2)
library(epiR)
library(accrualPlot)
library(lubridate)
library(devtools)
library(purrr)
library(vtable)
library(reshape2)
library(readxl)
library(writexl)
library(eulerr)
library(ggrepel)
library(ggforce)
library(viridis)
library(ggsci)
library(RColorBrewer)
library(flextable)
library(Hmisc)
library(tableone)
library(readxl)
library(patchwork)
library(e1071)
library(pROC)
library(randomForest)
library(caret)
library(report)
library(moderndive)
library(ggthemes)
library(caTools)
library(ROCR)
library(dataMeta)
library(labelled)
library(plyr)
install.packages("xfun", type = "binary") #R aborted session Issue resolved
library(xfun)
library(corrplot)
library('randomForest')
library(janitor)
```

# Set working directory
```
setwd("c:/Users/Desktop/Biostatistician/")
DIR_PATH <- "c:/Users/Desktop/Biostatistician/"
load("Data/RData/df_data.Rda")
```

# Label column
label(df_data$var_name) <- "Variable Name"
