#' Did the toast fall on the butter side?
#'
#' A dataset containing the results of 100 trials.
#'
#' @usage data(tartine1)
#' @format A data frame with 100 rows and 2 variables:
#' \describe{
#'   \item{trial}{the trial number}
#'   \item{side}{the side of the toast, 1 is butter}
#'   }
#' @source Home-made dataset
"tartine1"

#' Did the toast fall on the butter side?
#'
#' A dataset containing the results of 500 trials.
#'
#' @usage data(tartine2)
#' @format A data frame with 500 rows and 2 variables:
#' \describe{
#'   \item{trial}{the trial number}
#'   \item{side}{the side of the toast, 1 is butter}
#'   }
#' @source home-made dataset
"tartine2"

#' Estimating the probability of presence in a Psychology experiment
#'
#' A dataset containing the presence percentage according to weekdays.
#'
#' @usage data(absence)
#' @format A data frame with 13 rows and 6 variables:
#' \describe{
#'   \item{day}{day of the week}
#'   \item{inscription}{inscription mode}
#'   \item{reminder}{whether a reminder email was sent}
#'   \item{absence}{the number of absent participants}
#'   \item{presence}{the number of present participants}
#'   \item{total}{the total number of participants}
#'   }
#' @source home-made dataset
"absence"

#' How long does it take to get a coffee?
#'
#' A dataset containing the time it takes to get a coffee at various coffee
#' places.
#'
#' @usage data(robot)
#' @format A data frame with 200 rows and 3 variables:
#' \describe{
#'   \item{cafe}{id for the place}
#'   \item{afternoon}{morning or afternoon}
#'   \item{wait}{waiting time in minutes}
#'   }
#' @source Home-made dataset, adapted from the `rethinking package`.
"robot"

#' How long does it take to get a coffee?
#'
#' A dataset containing the time it takes to get a coffee at various coffee
#' places, with unequal variance.
#'
#' @usage data(robot_unequal)
#' @format A data frame with 450 rows and 3 variables:
#' \describe{
#'   \item{cafe}{id for the place}
#'   \item{afternoon}{morning or afternoon}
#'   \item{wait}{waiting time in minutes}
#'   }
#' @source Home-made dataset, adapted from the `rethinking package`.
"robot_unequal"

#' Apples growth
#'
#' A dataset containing the diameter of apples recorded over multiple days and
#' multiple trees.
#'
#' @usage data(apples)
#' @format A data frame with 480 rows and 5 variables:
#' \describe{
#'   \item{tree}{id of the tree}
#'   \item{apple}{id of the apple (per apple)}
#'   \item{id}{id for each tree-apple combination}
#'   \item{time}{time in days}
#'   \item{diam}{diameter (in cm)}
#'   }
#' @source home-made dataset
"apples"

#' How moral was it?
#'
#' A dataset containing morality judgements in multiple conditions.
#'
#' @usage data(morale)
#' @format A data frame with 9930 rows and 7 variables:
#' \describe{
#'   \item{response}{how moral was it? response from 1 to 5}
#'   \item{id}{id of the subject}
#'   \item{age}{age of the subject}
#'   \item{male}{gender indicator}
#'   \item{action}{action condition (binary)}
#'   \item{intention}{intention condition (binary)}
#'   \item{contact}{contact conditio (binary)}
#'   }
#' @source home-made dataset
"morale"

#' Height...
#'
#' A dataset containing height data...
#'
#' @usage data(parents)
#' @format A data frame with 40 rows and 4 variables:
#' \describe{
#'   \item{gender}{...}
#'   \item{height}{...}
#'   \item{mother}{...}
#'   \item{father}{...}
#'   }
#' @source home-made dataset
"parents"

#' Titanic data...
#'
#' Titanic data...
#'
#' @usage data(titanic)
#' @format A data frame with 539 rows and 5 variables:
#' \describe{
#'   \item{survival}{...}
#'   \item{pclass}{...}
#'   \item{gender}{...}
#'   \item{age}{...}
#'   \item{parch}{...}
#'   }
#' @source home-made dataset
"titanic"

#' Howell !Kung demography data
#'
#' Demographic data from Kalahari !Kung San people collected by Nancy Howell
#'
#' @usage data(howell)
#' @format A data frame with 544 rows and 4 variables:
#' \describe{
#'   \item{height}{height in cm}
#'   \item{weight}{weight in kg}
#'   \item{age}{age in years}
#'   \item{male}{gender indicator}
#'   }
#' @source Downloaded from https://tspace.library.utoronto.ca/handle/1807/10395
#' and re-used from the `rethinking` package.
"howell"

#' Waffle House and marriage statistics
#'
#' Data for the individual States of the United States, describing number of
#' Waffle House diners and various marriage and demographic facts.
#'
#' @usage data(waffle)
#' @format A data frame with 50 rows and 13 variables:
#' \describe{
#'   \item{Location}{State name}
#'   \item{Loc}{State abbreviation}
#'   \item{Population}{2010 population in millions}
#'   \item{MedianAgeMarriage}{2005-2010 median age at marriage}
#'   \item{Marriage}{2009 marriage rate per 1000 adults}
#'   \item{Marriage.SE}{Standard error of rate}
#'   \item{Divorce}{2009 divorce rate per 1000 adults}
#'   \item{Divorce.SE}{Standard error of rate}
#'   \item{WaffleHouses}{Number of diners}
#'   \item{South}{1 indicates Southern State}
#'   \item{Slaves1860}{Number of slaves in 1860 census}
#'   \item{Population1860}{Population from 1860 census}
#'   \item{PropSlaves1860}{Proportion of total population that were slaves in 1860}
#'   }
#' @source 1860 census data from http://mapserver.lib.virginia.edu.
#' Marriage and divorce rates from 2009 American Community Survey (ACS).
#' Waffle House density data from wafflehouse.com (retrieved January 2012).
"waffle"

#' Milk data...
#'
#' Milk data...
#'
#' @usage data(milk)
#' @format A data frame with 29 rows and 8 variables:
#' \describe{
#'   \item{clade}{...}
#'   \item{species}{...}
#'   \item{kcal.per.g}{...}
#'   \item{perc.fat}{...}
#'   \item{perc.protein}{...}
#'   \item{perc.lactose}{...}
#'   \item{mass}{...}
#'   \item{neocortex.perc}{...}
#'   }
#' @source ...
"milk"

#' Tulips data...
#'
#' Tulips data...
#'
#' @usage data(tulips)
#' @format A data frame with 29 rows and 8 variables:
#' \describe{
#'   \item{bed}{...}
#'   \item{water}{...}
#'   \item{shade}{...}
#'   \item{blooms}{...}
#'   }
#' @source ...
"tulips"

#' Rugged data...
#'
#' Rugged data...
#'
#' @usage data(tulips)
#' @format A data frame with 234 rows and 5 variables:
#' \describe{
#'   \item{isocode}{...}
#'   \item{country}{...}
#'   \item{rugged}{...}
#'   \item{cont_africa}{...}
#'   \item{rgdppc_2000}{...}
#'   }
#' @source ...
"rugged"
