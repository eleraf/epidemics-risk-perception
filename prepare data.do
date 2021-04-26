/*******************************************************************************
data access

Mondino, E., Di Baldassarre, G., Mård, J. et al. Public perceptions of multiple 
risks during the COVID-19 pandemic in Italy and Sweden. Sci Data 7, 434 (2020).
*******************************************************************************/

clear all
import excel using "Uppsala Universitet_without labels.xlsx", firstrow

foreach var of varlist V9_1-V130{
replace `var'=. if `var'==999
replace `var'=. if `var'==997
 }

replace gender =0 if gender ==2
label define gender 1 "male" 0 "famale"
label value gender gender

rename V9_1 epidemics_likelihood
rename V9_2 floods_likelihood
rename V9_3 drought_likelihood
rename V9_4 wildfires_likelihood
rename V9_5 earthquakes_likelihood
rename V9_6 terror_attacks_likelihood
rename V9_7 domestic_violence_likelihood
rename V9_8 economic_crises_likelihood
rename V9_9 climate_change_likelihood

rename V19_1 epidemics_impact_ind
rename V19_2 floods_impact_ind
rename V19_3 drought_impact_ind
rename V19_4 wildfires_impact_ind
rename V19_5 earthquakes_impact_ind
rename V19_6 terror_attacks_impact_ind
rename V19_7 domestic_violence_impact_ind
rename V19_8 economic_crises_impact_ind
rename V19_9 climate_change_impact_ind

rename V29_1 epidemics_impact_other
rename V29_2 floods_impact_other
rename V29_3 drought_impact_other
rename V29_4 wildfires_impact_other
rename V29_5 earthquakes_impact_other
rename V29_6 terror_attacks_impact_other
rename V29_7 domestic_violence_impact_other
rename V29_8 economic_crises_impact_other
rename V29_9 climate_change_impact_other

rename V49_1 epidemics_prep_aut
rename V49_2 floods_prep_aut
rename V49_3 drought_prep_aut
rename V49_4 wildfires_prep_aut
rename V49_5 earthquakes_prep_aut
rename V49_6 terror_attacks_prep_aut
rename V49_7 domestic_violence_prep_aut
rename V49_8 economic_crises_prep_aut
rename V49_9 climate_change_prep_aut

rename V39_1 epidemics_prep_ind
rename V39_2 floods_prep_ind
rename V39_3 drought_prep_ind
rename V39_4 wildfires_prep_ind
rename V39_5 earthquakes_prep_ind
rename V39_6 terror_attacks_prep_ind
rename V39_7 domestic_violence_prep_ind
rename V39_8 economic_crises_prep_ind
rename V39_9 climate_change_prep_ind

rename V69_1 epidemics_know_aut
rename V69_2 floods_know_aut
rename V69_3 drought_know_aut
rename V69_4 wildfires_know_aut
rename V69_5 earthquakes_know_aut
rename V69_6 terror_attacks_know_aut
rename V69_7 domestic_violence_know_aut
rename V69_8 economic_crises_know_aut
rename V69_9 climate_change_know_aut

rename V59_1 epidemics_know_ind
rename V59_2 floods_know_ind
rename V59_3 drought_know_ind
rename V59_4 wildfires_know_ind
rename V59_5 earthquakes_know_ind
rename V59_6 terror_attacks_know_ind
rename V59_7 domestic_violence_know_ind
rename V59_8 economic_crises_know_ind
rename V59_9 climate_change_know_ind

foreach var of varlist V79_1-V79_9{
replace `var'=0 if `var'==2
 }

rename V79_1 epidemics_experience
rename V79_2 floods_experience
rename V79_3 drought_experience
rename V79_4 wildfires_experience
rename V79_5 earthquakes_experience
rename V79_6 terror_attacks_experience
rename V79_7 domestic_violence_experience
rename V79_8 economic_crises_experience
rename V79_9 climate_change_experience

rename V100 needs
rename V110 working
replace working = 0 if working==2
label define working 0 "No" 1 "Yes"
label value working working

rename V120 job
label define job 1	"Industry, technology and manufacturing" 2	"IT & Telecom" 3 "Media and communication" 4 "Health and social care" 5	"Construction and real estate" 6	"Trade" 7	"Transport and logistics" 8	"Hotel and restaurant activities" 9	"Organizations and associations" 10	"Banking, finance and insurance" 11	"Other consulting services" 12	"Public administration and defense" 13	"Education (from childcare to high school)" 14	"Education (college / university)" 15	"Culture, fun and leisure" 16	"Energy & environment" 17	"Agriculture, forestry and fishing" 18	"Other service activities" 996	"Other sector"
label value job job

gen job2 = job
recode job2 2=1 3 =1 5=1 6=1 7=1 9=1 10=1 11=1 16=1 17=1 18=1 996=1 4=2 8=3 15=3 12=4 13=5 14=5 
label define job2 1 "Other jobs" 2 "Health and social care"  3 "food service and entertainment workers"  4 "Public administration and defence" 5 "Education"
label value job2 job2

rename V130 political_orientation
label define political_orientation 1 "Clear to the left" 2 "A bit to the left" 3 "Neither left nor right" 4 "A bit to the right" 5 "Clear to the right"
label value political_orientation political_orientation

destring NUTS2, replace

gen country = 1 if MUN_ITA!=.
replace country = 0 if NUTS2!=.
label define country 1 "Italy" 0 "Sweden"
label value country country

rename kvotgrupp2 group
label define group 1 "Italien riksrep" 2 "Italien Rom" 3 "Sverige riksrep" 4 "Sverige Stockholm"
label value group group

destring vikt, replace

order INTNR gender age country epidemics_likelihood epidemics_impact_ind epidemics_impact_other

gen education = V90
recode education 1=0 2=0 3=0 4=0 6=0 7=0 5=1 8=1
label define education 0 "no university" 1 "university"
label value education education

gen age_c = age
recode age_c min/49 = 0 50/69 = 1 70/max=2

gen period = 0

replace we = 0.767350929 if group==3
replace we = 0.232649071 if group==4
replace we = 0.90260106  if group==1
replace we = 0.09739894  if group==2

save "survey_august.dta", replace



******
******


clear all
import excel using "Uppsala Universitet_without labels_nov.xlsx", firstrow

foreach var of varlist V9_1-V130{
replace `var'=. if `var'==999
replace `var'=. if `var'==997
 }
*

rename BG_Age age
rename BG_Gender gender
replace gender =0 if gender ==2
label define gender 1 "male" 0 "famale"
label value gender gender

rename V9_1 epidemics_likelihood
rename V9_2 floods_likelihood
rename V9_3 drought_likelihood
rename V9_4 wildfires_likelihood
rename V9_5 earthquakes_likelihood
rename V9_6 terror_attacks_likelihood
rename V9_7 domestic_violence_likelihood
rename V9_8 economic_crises_likelihood
rename V9_9 climate_change_likelihood

rename V19_1 epidemics_impact_ind
rename V19_2 floods_impact_ind
rename V19_3 drought_impact_ind
rename V19_4 wildfires_impact_ind
rename V19_5 earthquakes_impact_ind
rename V19_6 terror_attacks_impact_ind
rename V19_7 domestic_violence_impact_ind
rename V19_8 economic_crises_impact_ind
rename V19_9 climate_change_impact_ind

rename V29_1 epidemics_impact_other
rename V29_2 floods_impact_other
rename V29_3 drought_impact_other
rename V29_4 wildfires_impact_other
rename V29_5 earthquakes_impact_other
rename V29_6 terror_attacks_impact_other
rename V29_7 domestic_violence_impact_other
rename V29_8 economic_crises_impact_other
rename V29_9 climate_change_impact_other

rename V49_1 epidemics_prep_aut
rename V49_2 floods_prep_aut
rename V49_3 drought_prep_aut
rename V49_4 wildfires_prep_aut
rename V49_5 earthquakes_prep_aut
rename V49_6 terror_attacks_prep_aut
rename V49_7 domestic_violence_prep_aut
rename V49_8 economic_crises_prep_aut
rename V49_9 climate_change_prep_aut

rename V39_1 epidemics_prep_ind
rename V39_2 floods_prep_ind
rename V39_3 drought_prep_ind
rename V39_4 wildfires_prep_ind
rename V39_5 earthquakes_prep_ind
rename V39_6 terror_attacks_prep_ind
rename V39_7 domestic_violence_prep_ind
rename V39_8 economic_crises_prep_ind
rename V39_9 climate_change_prep_ind

rename V69_1 epidemics_know_aut
rename V69_2 floods_know_aut
rename V69_3 drought_know_aut
rename V69_4 wildfires_know_aut
rename V69_5 earthquakes_know_aut
rename V69_6 terror_attacks_know_aut
rename V69_7 domestic_violence_know_aut
rename V69_8 economic_crises_know_aut
rename V69_9 climate_change_know_aut

rename V59_1 epidemics_know_ind
rename V59_2 floods_know_ind
rename V59_3 drought_know_ind
rename V59_4 wildfires_know_ind
rename V59_5 earthquakes_know_ind
rename V59_6 terror_attacks_know_ind
rename V59_7 domestic_violence_know_ind
rename V59_8 economic_crises_know_ind
rename V59_9 climate_change_know_ind

foreach var of varlist V79_1-V79_9{
replace `var'=0 if `var'==2
 }

rename V79_1 epidemics_experience
rename V79_2 floods_experience
rename V79_3 drought_experience
rename V79_4 wildfires_experience
rename V79_5 earthquakes_experience
rename V79_6 terror_attacks_experience
rename V79_7 domestic_violence_experience
rename V79_8 economic_crises_experience
rename V79_9 climate_change_experience

* 5 more than enought
rename V100 needs
rename V110 working
replace working = 0 if working==2
label define working 0 "No" 1 "Yes"
label value working working

rename V120 job
label define job 1	"Industry, technology and manufacturing" 2	"IT & Telecom" 3 "Media and communication" 4 "Health and social care" 5	"Construction and real estate" 6	"Trade" 7	"Transport and logistics" 8	"Hotel and restaurant activities" 9	"Organizations and associations" 10	"Banking, finance and insurance" 11	"Other consulting services" 12	"Public administration and defense" 13	"Education (from childcare to high school)" 14	"Education (college / university)" 15	"Culture, fun and leisure" 16	"Energy & environment" 17	"Agriculture, forestry and fishing" 18	"Other service activities" 996	"Other sector"
label value job job

gen job2 = job
recode job2 2=1 3 =1 5=1 6=1 7=1 9=1 10=1 11=1 16=1 17=1 18=1 996=1 4=2 8=3 15=3 12=4 13=5 14=5 
label define job2 1 "Other jobs" 2 "Health and social care"  3 "food service and entertainment workers"  4 "Public administration and defence" 5 "Education"
label value job2 job2

rename V130 political_orientation
label define political_orientation 1 "Clear to the left" 2 "A bit to the left" 3 "Neither left nor right" 4 "A bit to the right" 5 "Clear to the right"
label value political_orientation political_orientation

destring NUTS2 MUN_ITA, replace

gen country = 1 if MUN_ITA!=.
replace country = 0 if country==.
label define country 1 "Italy" 0 "Sweden"
label value country country

destring vikt, replace

order INTNR gender age country epidemics_likelihood epidemics_impact_ind epidemics_impact_other

gen education = V90
recode education 1=0 2=0 3=0 4=0 6=0 7=0 5=1 8=1
label define education 0 "no university" 1 "university"
label value education education

rename kvotgrupp group
label define group 1 "Italien riksrep" 2 "Italien Rom" 3 "Sverige riksrep" 4 "Sverige Stockholm"
label value group group

gen age_c = age
recode age_c min/49 = 0 50/69 = 1 70/max=2

gen period = 1

replace we = 0.767350929 if group==3
replace we = 0.232649071 if group==4
replace we = 0.90260106  if group==1
replace we  = 0.09739894  if group==2

save "survey_november.dta", replace
