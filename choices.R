#####################################
# County Profiles v0.0.1 (ui.R)     #
# Author & Copyright: Bogdan Rau    #
# Web: http://bogdanrau.com         #
# Choice lists for selection panel  #
#####################################

## Define population list (populates the "Select Population" field)
population <- list(
        "0-17 (Child & Teen)"   = "0-17",
        "18-64 (Adults)"        = "18-64"
        )

## Define year list (populates the "Select Year" field)
year <- list(
        "2011-2012" = "2011-2012"           
        )

## Define locationType list (populates the "Select Geography" field)
geography <- list(
        "Regions"       = "Regions",
        "Counties"      = "Counties",
        "SPAs (LA)"     = "SPA",
        "HHSAs (SD)"    = "HHSA"
        )

# THE FOLLOWING LISTS ARE USED IN CONDITIONAL FIELDS
## Define the county list (populates the "Select County" CONDITIONAL field)
counties <- list(
        "Alameda"       = "Alameda",
        "Alpine"        = "Alpine",
        "Amador"        = "Amador",
        "Butte"         = "Butte",
        "Calaveras"     = "Calaveras",
        "Colusa"        = "Colusa",
        "Contra Costa"  = "ContraCosta",
        "Del Norte"     = "DelNorte",
        "El Dorado"     = "ElDorado",
        "Fresno"        = "Fresno",
        "Glenn"         = "Glenn",
        "Humboldt"      = "Humboldt",
        "Imperial"      = "Imperial",
        "Inyo"          = "Inyo",
        "Kern"          = "Kern",
        "Kings"         = "Kings",
        "Lake"          = "Lake",
        "Lassen"        = "Lassen",
        "Los Angeles"   = "LosAngeles",
        "Madera"        = "Madera",
        "Merced"        = "Merced",
        "Modoc"         = "Modoc",
        "Mono"          = "Mono",
        "Monterey"      = "Monterey",
        "Napa"          = "Napa",
        "Nevada"        = "Nevada",
        "Orange"        = "Orange",
        "Placer"        = "Placer",
        "Plumas"        = "Plumas",
        "Riverside"     = "Riverside",
        "Sacramento"    = "Sacramento",
        "San Benito"    = "SanBenito",
        "San Bernardino"="SanBernardino",
        "San Diego"     = "SanDiego",
        "San Francisco" = "SanFrancisco",
        "San Joaquin"   = "SanJoaquin",
        "San Luis Obispo"="SanLuisObispo",
        "San Mateo"     = "SanMateo",
        "Santa Barbara" = "SantaBarbara",
        "Santa Clara"   = "SantaClara",
        "Santa Cruz"    = "SantaCruz",
        "Shasta"        = "Shasta",
        "Sierra"        = "Sierra",
        "Siskiyou"      = "Siskiyou",
        "Solano"        = "Solano",
        "Sonoma"        = "Sonoma",
        "Stanislaus"    = "Stanislaus",
        "Sutter"        = "Sutter",
        "Tehama"        = "Tehama",
        "Trinity"       = "Trinity",
        "Tulare"        = "Tulare",
        "Tuolumne"      = "Tuolumne",
        "Ventura"       = "Ventura",
        "Yolo"          = "Yolo",
        "Yuba"          = "Yuba"
        )

## Define the region list (populates the "Select Region" CONDITIONAL field)
regions <- list(
        "Central Coast"         = "CentralCoast",
        "Greater Bay Area"      = "GreaterBayArea",
        "Los Angeles County"    = "LosAngelesCounty",
        "Northern Sierra"       = "NorthernSierra"
        
        )