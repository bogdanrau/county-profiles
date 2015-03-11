#####################################
# County Profiles v0.0.1 (ui.R)     #
# Author & Copyright: Bogdan Rau    #
# Web: http://bogdanrau.com         #
# Input field options               #
#####################################
coOptions <- list(
    placeholder = "Choose or Search for County",
    onInitialize = I('function() { this.setValue(""); }')
    )

regOptions <- list(
    placeholder = "Choose or Search for Region",
    onInitialize = I('function() { this.setValue(""); }')
)