# coda4dummies

Functions to summarize inconvenient rjags or jagsUI coda outputs. Especially helpful when your coda summary contains timeseries variables of different lengths (e.g., when calculating posteriors for variables at daily, weekly, and seasonal timescales within the same model framework). The main function of this package is to streamline the model fitting/ output summarizing process with the least amount of thinking possible. Many functions included here are wrapper functions around functions from the postjags package developed by Michael Fell (https://github.com/fellmk/PostJAGS).

To install the package add the following code to your R script:

```{r}
install.packages("devtools")
library(devtools)
```

First download Mike Fell's postjags package, which is a dependency:  
```{r}
devtools::install_github("fellmk/PostJAGS/postjags")
library(postjags)
```

Then download the coda4dummies package:  
```{r}
devtools::install_github("egreich/coda4dummies", build_vignettes = TRUE)
library(coda4dummies)
```

Note that you will have to load postjags with library(postjags) everytime you use coda4dummies.


## Example

```{r}
## Organize the coda object as a dataframe
df_model <- dumsum(jagsobj = jagsui, type = "jagsUI")

# Connect dates to the dataframe by variable
  df_model <- dateconnect(dfobj = df_model, datevect = DOY, datename = "DOY", identifier = "ID2", varlist = c("dYdX"))
  df_model <- dateconnect(dfobj = df_model, datevect = YIN$TIMESTAMP, datename = "TIMESTAMP", identifier = NULL, varlist = c("WUE.pred", "T.ratio", "T.pred", "ET.pred"))


## Save initials for future runs

# inits to save
init_names = names(initslist[[1]]) # get the initial names from the list of initials you used to start the model

# create a saved_state object with initials for next run
# saved_state[[1]] will be the names of the initials
# saved_state[[2]] will be the list of initials
# saved_state[[3]] will be the chain number with lowest deviance
saved_state <- keepvars(codaobj = jagsui, to_keep = init_names, paramlist = params, type="jagsUI")

save(saved_state, file = initfilename) # saving the saved_state locally

## Restarting the model with initials based on the lowest deviance chain

load(initfilename) # loading the saved_state

initlow <- saved_state[[3]] # initlow is just the lowest dev chain number

# take chain with lowest deviance, and make remaining chains vary around it
saved_state[[2]][[1]] = saved_state[[2]][[initlow]] # Best (low dev) initials for chain 1
saved_state[[2]][[2]] = lapply(saved_state[[2]][[initlow]],"*",10)
saved_state[[2]][[3]] = lapply(saved_state[[2]][[initlow]],"/",10)

```




