### Set up the coda4dummies package

library("usethis")

# Create a new package -------------------------------------------------
#create_package(getwd()) ## used this to create package-specific folders

# Modify the description ----------------------------------------------
#use_mit_license("Emma Reich")

# Make a Vignette ----------------------------------------------

# Require external dependencies ----------------------------------------------
use_package("dplyr", "Imports")
use_package("utils", "Imports")

# Run this to update documentation
devtools::document()
