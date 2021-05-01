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
rename V19_1 epidemics_impact_ind
rename V29_1 epidemics_impact_other
rename V49_1 epidemics_prep_aut
rename V39_1 epidemics_prep_ind
rename V69_1 epidemics_know_aut

rename V59_1 epidemics_know_ind


foreach var of varlist V79_1-V79_9{
replace `var'=0 if `var'==2
 }

rename V79_1 epidemics_experience

rename V100 needs
rename V110 working
replace working = 0 if working==2
label define working 0 "No" 1 "Yes"
label value working working

destring NUTS2, replace

gen country = 1 if MUN_ITA!=.
replace country = 0 if NUTS2!=.
label define country 1 "Italy" 0 "Sweden"
label value country country

rename kvotgrupp2 group
label define group 1 "Italien riksrep" 2 "Italien Rom" 3 "Sverige riksrep" 4 "Sverige Stockholm"
label value group group

destring vikt, replace

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


rename V19_1 epidemics_impact_ind


rename V29_1 epidemics_impact_other


rename V49_1 epidemics_prep_aut


rename V39_1 epidemics_prep_ind


rename V69_1 epidemics_know_aut

rename V59_1 epidemics_know_ind


foreach var of varlist V79_1-V79_9{
replace `var'=0 if `var'==2
 }

rename V79_1 epidemics_experience

* 5 more than enought
rename V100 needs
rename V110 working
replace working = 0 if working==2
label define working 0 "No" 1 "Yes"
label value working working

destring NUTS2 MUN_ITA, replace

gen country = 1 if MUN_ITA!=.
replace country = 0 if country==.
label define country 1 "Italy" 0 "Sweden"
label value country country

destring vikt, replace

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
