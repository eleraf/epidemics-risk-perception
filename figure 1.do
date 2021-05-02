/*******************************************************************************
Figure 1
Title: Figure 1 Mortality rate and daily occupancy of intensive care unit rate 
for COVID-19 per 100 000 individuals and the level of restrictive measures 
- the Stringency Index - in Italy and Sweden during 2020.
The Stringency Index considers 9 domains (school closures; workplace closures;
 cancellation of public events; restrictions on public gatherings; closures 
 of public transport; stay-at-home requirements; public information campaigns; 
 restrictions on internal movements; and international travel controls).

Databases

ECDC. Data on hospital and ICU admission rates and current occupancy for COVID-19, 
https://www.ecdc.europa.eu/en/publications-data/download-data-hospital-and-icu-admission-rates-and-current-occupancy-covid-19

ECDC. Historical data (to 14 December 2020) on daily number of COVID-19 cases 
and deaths by country worldwide, <https://www.ecdc.europa.eu/en/publications-data/download-todays-data-geographic-distribution-covid-19-cases-worldwide

Covid-stringency-index
Hale, T. et al. A global panel database of pandemic policies 
(Oxford COVID-19 Government Response Tracker). 
Nature human behaviour, doi:10.1038/s41562-021-01079-8 (2021).
*******************************************************************************/

clear all
import delimited  covid-stringency-index,  delimiter(",")
rename entity country
keep if country=="Italy" | country=="Sweden"
 
gen date = date(day,"YMD") 
format date %d 

keep country stringency_index date

reshape wide stringency_index, i(date) j(country) string
tempfile  stringency_index
save `stringency_index'

*icu
clear 
import excel icu, firstrow

 
 keep if country=="Italy" | country=="Sweden"
 keep if indicator =="Daily hospital occupancy"
 
gen data = date(date,"YMD") 
drop date
rename data date
format date %d 

keep country value date

reshape wide value, i(date) j(country) string
tempfile  icu
save `icu'

clear
 import delimited data, varnames(1)
 
 rename countriesandterritories country
 
 keep if country=="Italy" | country=="Sweden"
  
  gen date = date(daterep,"DMY") 
format date %d 

gen rate = death/ popdata2019*100000
keep country rate date popdata2019

reshape wide rate popdata2019, i(date) j(country) string


merge 1:1 date using `stringency_index'

keep if _merge==3
drop _merge

merge 1:1 date using `icu'

keep if _merge==3
drop _merge

replace valueItaly = valueItaly/ popdata2019Italy*100000
replace valueSweden = valueSweden/ popdata2019Sweden*100000

set scheme s1mono // black and white

twoway line  rateSweden rateItaly date,  plotregion(style(outline)) legend(order(1 "Sweden" 2 "Italy")) xtitle("time") ytitle("Mortality rate" "for 100 000 individuals")
gr save rate_1.gph, replace
twoway line  valueSweden valueItaly date, plotregion(style(outline)) legend(order(1 "Sweden" 2 "Italy")) xtitle("time") ytitle("Daily occupancy of intensive care units" "for 100 000 individuals")
gr save rate_2.gph, replace
twoway line  stringency_indexSweden stringency_indexItaly date, plotregion(style(outline)) legend(order(1 "Sweden" 2 "Italy")) xtitle("time") ytitle("Stringency Index")
gr save rate_3.gph, replace

