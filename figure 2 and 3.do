/*******************************************************************************
Figure 2
Title: Means and 95% CIs for epidemic risk perception (likelihood, impact 
on the individual, impact on the population, individual preparedness, 
authority preparedness, individual knowledge, authority knowledge) 
by country and period.
*******************************************************************************/


clear all
use "survey_august.dta"
append using "survey_november.dta"

collapse (mean) epidemics_likelihood epidemics_impact_ind epidemics_impact_other epidemics_know_ind epidemics_know_aut epidemics_prep_aut epidemics_prep_ind (semean) epidemics_likelihood_se = epidemics_likelihood epidemics_impact_ind_se = epidemics_impact_ind epidemics_impact_other_se= epidemics_impact_other epidemics_know_ind_se = epidemics_know_ind epidemics_know_aut_se = epidemics_know_aut  epidemics_prep_aut_se = epidemics_prep_aut epidemics_prep_ind_se = epidemics_prep_ind  [aweight=vikt], by (country period) 

gen epidemics_likelihood_lb =  epidemics_likelihood - 1.96*epidemics_likelihood_se
gen epidemics_likelihood_ub =  epidemics_likelihood + 1.96*epidemics_likelihood_se

gen epidemics_impact_ind_lb =  epidemics_impact_ind - 1.96*epidemics_impact_ind_se
gen epidemics_impact_ind_ub =  epidemics_impact_ind + 1.96*epidemics_impact_ind_se

gen epidemics_impact_other_lb =  epidemics_impact_other - 1.96*epidemics_impact_other_se
gen epidemics_impact_other_ub =  epidemics_impact_other + 1.96*epidemics_impact_other_se

gen epidemics_prep_aut_lb = epidemics_prep_aut - 1.96*epidemics_prep_aut_se
gen epidemics_prep_aut_ub = epidemics_prep_aut + 1.96*epidemics_prep_aut_se

gen epidemics_prep_ind_lb = epidemics_prep_ind - 1.96*epidemics_prep_ind_se
gen epidemics_prep_ind_ub = epidemics_prep_ind + 1.96*epidemics_prep_ind_se

gen epidemics_know_ind_lb =  epidemics_know_ind - 1.96*epidemics_know_ind_se
gen epidemics_know_ind_ub =  epidemics_know_ind + 1.96*epidemics_know_ind_se

gen epidemics_know_aut_lb =   epidemics_know_aut - 1.96*epidemics_know_aut_se
gen epidemics_know_aut_ub =   epidemics_know_aut + 1.96*epidemics_know_aut_se

gen country2 = country + 4
gen country3 = country + 8
gen country4 = country + 12
gen country5 = country + 16
gen country6 = country + 20
gen country7 = country + 24


set scheme s1mono // black and white
twoway ///
(scatter country epidemics_know_aut if period==0, msymbol(o) color(gs9)) ///
(scatter country epidemics_know_aut if period==1, msymbol(oh) color(gs3)) ///
(rcap epidemics_know_aut_lb epidemics_know_aut_ub country if period==0, color(gs9) horizontal) ///
(rcap epidemics_know_aut_lb epidemics_know_aut_ub country if period==1, color(gs3) horizontal) ///
(scatter country2 epidemics_know_ind if period==0, msymbol(o) color(gs9)) ///
(scatter country2 epidemics_know_ind if period==1, msymbol(oh) color(gs3)) ///
(rcap epidemics_know_ind_lb epidemics_know_ind_ub country2 if period==0,  color(gs9) horizontal) ///
(rcap epidemics_know_ind_lb epidemics_know_ind_ub country2 if period==1,  color(gs3) horizontal) ///
(scatter country3 epidemics_prep_aut if period==0, msymbol(o) color(gs9)) ///
(scatter country3 epidemics_prep_aut if period==1, msymbol(oh) color(gs3)) ///
(rcap epidemics_prep_aut_lb epidemics_prep_aut_ub country3 if period==0,  color(gs9)  horizontal) ///
(rcap epidemics_prep_aut_lb epidemics_prep_aut_ub country3 if period==1,  color(gs3)  horizontal) ///
(scatter country4 epidemics_prep_ind if period==0, msymbol(o) color(gs9)) ///
(scatter country4 epidemics_prep_ind if period==1, msymbol(oh) color(gs3)) ///
(rcap epidemics_prep_ind_lb epidemics_prep_ind_ub country4 if period==0,  color(gs9)  horizontal) ///
(rcap epidemics_prep_ind_lb epidemics_prep_ind_ub country4 if period==1,  color(gs3)  horizontal) ///
(scatter country5 epidemics_impact_other if period==0, msymbol(o) color(gs9)) ///
(scatter country5 epidemics_impact_other if period==1, msymbol(oh) color(gs3)) ///
(rcap epidemics_impact_other_lb epidemics_impact_other_ub country5 if period==0,  color(gs9)  horizontal) ///
(rcap epidemics_impact_other_lb epidemics_impact_other_ub country5 if period==1,  color(gs3)  horizontal) ///
(scatter country6 epidemics_impact_ind if period==0, msymbol(o) color(gs9)) ///
(scatter country6 epidemics_impact_ind if period==1, msymbol(oh) color(gs3)) ///
(rcap epidemics_impact_ind_lb epidemics_impact_ind_ub country6 if period==0,  color(gs9)  horizontal) ///
(rcap epidemics_impact_ind_lb epidemics_impact_ind_ub country6 if period==1,  color(gs3)  horizontal) ///
(scatter country7 epidemics_likelihood if period==0, msymbol(o) color(gs9)) ///
(scatter country7 epidemics_likelihood if period==1, msymbol(oh) color(gs3)) ///
(rcap epidemics_likelihood_lb epidemics_likelihood_ub country7 if period==0,  color(gs9) horizontal) ///
(rcap epidemics_likelihood_lb epidemics_likelihood_ub country7 if period==1,  color(gs3)  horizontal ylabel(0 "Sweden" 1 "Italy" 4 "Sweden" 5 "Italy" 8 "Sweden" 9 "Italy" 12 "Sweden" ///
 13 "Italy" 16 "Sweden" 17 "Italy" 20 "Sweden" 21 "Italy" 24 "Sweden" 25 "Italy", labsize(small) angle(0))  legend(off))
graph export figure1.png, replace width(1500) height(1500)


/*******************************************************************************
Figure 3
Title: Means and 95% CIs for epidemic risk perception in Sweden and Italy by 
affected areas and period.
*******************************************************************************/

clear all
use "survey_august.dta"
append using "survey_november.dta"


keep if country==1

gen risk=0
replace risk =1  if MUN_ITA==4

collapse (mean) epidemics_likelihood epidemics_impact_ind epidemics_impact_other epidemics_know_ind epidemics_know_aut epidemics_prep_aut epidemics_prep_ind (semean) epidemics_likelihood_se = epidemics_likelihood epidemics_impact_ind_se = epidemics_impact_ind epidemics_impact_other_se= epidemics_impact_other epidemics_know_ind_se = epidemics_know_ind epidemics_know_aut_se = epidemics_know_aut  epidemics_prep_aut_se = epidemics_prep_aut epidemics_prep_ind_se = epidemics_prep_ind  [aweight=vikt], by (risk period) 

gen epidemics_likelihood_lb =  epidemics_likelihood - 1.96*epidemics_likelihood_se
gen epidemics_likelihood_ub =  epidemics_likelihood + 1.96*epidemics_likelihood_se

gen epidemics_impact_ind_lb =  epidemics_impact_ind - 1.96*epidemics_impact_ind_se
gen epidemics_impact_ind_ub =  epidemics_impact_ind + 1.96*epidemics_impact_ind_se

gen epidemics_impact_other_lb =  epidemics_impact_other - 1.96*epidemics_impact_other_se
gen epidemics_impact_other_ub =  epidemics_impact_other + 1.96*epidemics_impact_other_se

gen epidemics_prep_aut_lb = epidemics_prep_aut - 1.96*epidemics_prep_aut_se
gen epidemics_prep_aut_ub = epidemics_prep_aut + 1.96*epidemics_prep_aut_se

gen epidemics_prep_ind_lb = epidemics_prep_ind - 1.96*epidemics_prep_ind_se
gen epidemics_prep_ind_ub = epidemics_prep_ind + 1.96*epidemics_prep_ind_se

gen epidemics_know_ind_lb =  epidemics_know_ind - 1.96*epidemics_know_ind_se
gen epidemics_know_ind_ub =  epidemics_know_ind + 1.96*epidemics_know_ind_se

gen epidemics_know_aut_lb =   epidemics_know_aut - 1.96*epidemics_know_aut_se
gen epidemics_know_aut_ub =   epidemics_know_aut + 1.96*epidemics_know_aut_se

gen risk2 = risk + 4
gen risk3 = risk + 8
gen risk4 = risk + 12
gen risk5 = risk + 16
gen risk6 = risk + 20
gen risk7 = risk + 24

set scheme s1mono // black and white
twoway ///
(scatter risk epidemics_know_aut if period==0, msymbol(o) color(gs9)) ///
(scatter risk epidemics_know_aut if period==1, msymbol(oh) color(gs3)) ///
(rcap epidemics_know_aut_lb epidemics_know_aut_ub risk if period==0, color(gs9) horizontal) ///
(rcap epidemics_know_aut_lb epidemics_know_aut_ub risk if period==1, color(gs3) horizontal) ///
(scatter risk2 epidemics_know_ind if period==0, msymbol(o) color(gs9)) ///
(scatter risk2 epidemics_know_ind if period==1, msymbol(oh) color(gs3)) ///
(rcap epidemics_know_ind_lb epidemics_know_ind_ub risk2 if period==0,  color(gs9) horizontal) ///
(rcap epidemics_know_ind_lb epidemics_know_ind_ub risk2 if period==1,  color(gs3) horizontal) ///
(scatter risk3 epidemics_prep_aut if period==0, msymbol(o) color(gs9)) ///
(scatter risk3 epidemics_prep_aut if period==1, msymbol(oh) color(gs3)) ///
(rcap epidemics_prep_aut_lb epidemics_prep_aut_ub risk3 if period==0,  color(gs9)  horizontal) ///
(rcap epidemics_prep_aut_lb epidemics_prep_aut_ub risk3 if period==1,  color(gs3)  horizontal) ///
(scatter risk4 epidemics_prep_ind if period==0, msymbol(o) color(gs9)) ///
(scatter risk4 epidemics_prep_ind if period==1, msymbol(oh) color(gs3)) ///
(rcap epidemics_prep_ind_lb epidemics_prep_ind_ub risk4 if period==0,  color(gs9)  horizontal) ///
(rcap epidemics_prep_ind_lb epidemics_prep_ind_ub risk4 if period==1,  color(gs3)  horizontal) ///
(scatter risk5 epidemics_impact_other if period==0, msymbol(o) color(gs9)) ///
(scatter risk5 epidemics_impact_other if period==1, msymbol(oh) color(gs3)) ///
(rcap epidemics_impact_other_lb epidemics_impact_other_ub risk5 if period==0,  color(gs9)  horizontal) ///
(rcap epidemics_impact_other_lb epidemics_impact_other_ub risk5 if period==1,  color(gs3)  horizontal) ///
(scatter risk6 epidemics_impact_ind if period==0, msymbol(o) color(gs9)) ///
(scatter risk6 epidemics_impact_ind if period==1, msymbol(oh) color(gs3)) ///
(rcap epidemics_impact_ind_lb epidemics_impact_ind_ub risk6 if period==0,  color(gs9)  horizontal) ///
(rcap epidemics_impact_ind_lb epidemics_impact_ind_ub risk6 if period==1,  color(gs3)  horizontal) ///
(scatter risk7 epidemics_likelihood if period==0, msymbol(o) color(gs9)) ///
(scatter risk7 epidemics_likelihood if period==1, msymbol(oh) color(gs3)) ///
(rcap epidemics_likelihood_lb epidemics_likelihood_ub risk7 if period==0,  color(gs9) horizontal) ///
(rcap epidemics_likelihood_lb epidemics_likelihood_ub risk7 if period==1,  color(gs3)  horizontal ylabel(0 "Other regions" 1 "Lombardy region" 4 "Other regions" 5 "Lombardy region" 8 "Other regions" 9 "Lombardy region" 12 "Other regions" ///
 13 "Lombardy region" 16 "Other regions" 17 "Lombardy region" 20 "Other regions" 21 "Lombardy region" 24 "Other regions" 25 "Lombardy region", labsize(small) angle(0))  legend(off))
graph export figure3_it.png, replace width(1600) height(1500)



**** figure
clear all
use "survey_august.dta"
append using "survey_november.dta"

keep if country==0

gen risk=0 if group==3
replace risk =1  if group==4

collapse (mean) epidemics_likelihood epidemics_impact_ind epidemics_impact_other epidemics_know_ind epidemics_know_aut epidemics_prep_aut epidemics_prep_ind (semean) epidemics_likelihood_se = epidemics_likelihood epidemics_impact_ind_se = epidemics_impact_ind epidemics_impact_other_se= epidemics_impact_other epidemics_know_ind_se = epidemics_know_ind epidemics_know_aut_se = epidemics_know_aut  epidemics_prep_aut_se = epidemics_prep_aut epidemics_prep_ind_se = epidemics_prep_ind  [aweight=vikt], by (risk period) 

gen epidemics_likelihood_lb =  epidemics_likelihood - 1.96*epidemics_likelihood_se
gen epidemics_likelihood_ub =  epidemics_likelihood + 1.96*epidemics_likelihood_se

gen epidemics_impact_ind_lb =  epidemics_impact_ind - 1.96*epidemics_impact_ind_se
gen epidemics_impact_ind_ub =  epidemics_impact_ind + 1.96*epidemics_impact_ind_se

gen epidemics_impact_other_lb =  epidemics_impact_other - 1.96*epidemics_impact_other_se
gen epidemics_impact_other_ub =  epidemics_impact_other + 1.96*epidemics_impact_other_se

gen epidemics_prep_aut_lb = epidemics_prep_aut - 1.96*epidemics_prep_aut_se
gen epidemics_prep_aut_ub = epidemics_prep_aut + 1.96*epidemics_prep_aut_se

gen epidemics_prep_ind_lb = epidemics_prep_ind - 1.96*epidemics_prep_ind_se
gen epidemics_prep_ind_ub = epidemics_prep_ind + 1.96*epidemics_prep_ind_se

gen epidemics_know_ind_lb =  epidemics_know_ind - 1.96*epidemics_know_ind_se
gen epidemics_know_ind_ub =  epidemics_know_ind + 1.96*epidemics_know_ind_se

gen epidemics_know_aut_lb =   epidemics_know_aut - 1.96*epidemics_know_aut_se
gen epidemics_know_aut_ub =   epidemics_know_aut + 1.96*epidemics_know_aut_se

gen risk2 = risk + 4
gen risk3 = risk + 8
gen risk4 = risk + 12
gen risk5 = risk + 16
gen risk6 = risk + 20
gen risk7 = risk + 24


set scheme s1mono // black and white
twoway ///
(scatter risk epidemics_know_aut if period==0, msymbol(o) color(gs9)) ///
(scatter risk epidemics_know_aut if period==1, msymbol(oh) color(gs3)) ///
(rcap epidemics_know_aut_lb epidemics_know_aut_ub risk if period==0, color(gs9) horizontal) ///
(rcap epidemics_know_aut_lb epidemics_know_aut_ub risk if period==1, color(gs3) horizontal) ///
(scatter risk2 epidemics_know_ind if period==0, msymbol(o) color(gs9)) ///
(scatter risk2 epidemics_know_ind if period==1, msymbol(oh) color(gs3)) ///
(rcap epidemics_know_ind_lb epidemics_know_ind_ub risk2 if period==0,  color(gs9) horizontal) ///
(rcap epidemics_know_ind_lb epidemics_know_ind_ub risk2 if period==1,  color(gs3) horizontal) ///
(scatter risk3 epidemics_prep_aut if period==0, msymbol(o) color(gs9)) ///
(scatter risk3 epidemics_prep_aut if period==1, msymbol(oh) color(gs3)) ///
(rcap epidemics_prep_aut_lb epidemics_prep_aut_ub risk3 if period==0,  color(gs9)  horizontal) ///
(rcap epidemics_prep_aut_lb epidemics_prep_aut_ub risk3 if period==1,  color(gs3)  horizontal) ///
(scatter risk4 epidemics_prep_ind if period==0, msymbol(o) color(gs9)) ///
(scatter risk4 epidemics_prep_ind if period==1, msymbol(oh) color(gs3)) ///
(rcap epidemics_prep_ind_lb epidemics_prep_ind_ub risk4 if period==0,  color(gs9)  horizontal) ///
(rcap epidemics_prep_ind_lb epidemics_prep_ind_ub risk4 if period==1,  color(gs3)  horizontal) ///
(scatter risk5 epidemics_impact_other if period==0, msymbol(o) color(gs9)) ///
(scatter risk5 epidemics_impact_other if period==1, msymbol(oh) color(gs3)) ///
(rcap epidemics_impact_other_lb epidemics_impact_other_ub risk5 if period==0,  color(gs9)  horizontal) ///
(rcap epidemics_impact_other_lb epidemics_impact_other_ub risk5 if period==1,  color(gs3)  horizontal) ///
(scatter risk6 epidemics_impact_ind if period==0, msymbol(o) color(gs9)) ///
(scatter risk6 epidemics_impact_ind if period==1, msymbol(oh) color(gs3)) ///
(rcap epidemics_impact_ind_lb epidemics_impact_ind_ub risk6 if period==0,  color(gs9)  horizontal) ///
(rcap epidemics_impact_ind_lb epidemics_impact_ind_ub risk6 if period==1,  color(gs3)  horizontal) ///
(scatter risk7 epidemics_likelihood if period==0, msymbol(o) color(gs9)) ///
(scatter risk7 epidemics_likelihood if period==1, msymbol(oh) color(gs3)) ///
(rcap epidemics_likelihood_lb epidemics_likelihood_ub risk7 if period==0,  color(gs9) horizontal) ///
(rcap epidemics_likelihood_lb epidemics_likelihood_ub risk7 if period==1,  color(gs3)  horizontal  ylabel(0 "Other regions" 1 "Stockholm region" 4 "Other regions" 5 "Stockholm region" 8 "Other regions" 9 "Stockholm region" 12 "Other regions" ///
 13 "Stockholm region" 16 "Other regions" 17 "Stockholm region" 20 "Other regions" 21 "Stockholm region" 24 "Other regions" 25 "Stockholm region", labsize(small)  angle(0)) legend(off))
graph export figure3_sw.png, replace width(1600) height(1500)


