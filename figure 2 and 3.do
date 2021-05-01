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

collapse (mean) epidemics_likelihood epidemics_impact_ind epidemics_impact_other epidemics_know_ind epidemics_know_aut epidemics_prep_aut epidemics_prep_ind (semean) epidemics_likelihood_se = epidemics_likelihood epidemics_impact_ind_se = epidemics_impact_ind epidemics_impact_other_se= epidemics_impact_other epidemics_know_ind_se = epidemics_know_ind epidemics_know_aut_se = epidemics_know_aut  epidemics_prep_aut_se = epidemics_prep_aut epidemics_prep_ind_se = epidemics_prep_ind  [aw=we], by (country period) 

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

twoway ///
(scatter epidemics_know_aut country7  if period==0 & country==0, msymbol(o) color(green*0.5))  ///
(scatter epidemics_know_aut country7  if period==0 & country==1, msymbol(o) color(blue*0.5)) ///
(scatter epidemics_know_aut country7  if period==1 & country==0, msymbol(oh) color(green)) ///
(scatter epidemics_know_aut country7  if period==1 & country==1, msymbol(oh) color(blue))  ///
(rcap epidemics_know_aut_lb epidemics_know_aut_ub country7 if period==0 & country==0, color(green*0.5)) ///
(rcap epidemics_know_aut_lb epidemics_know_aut_ub country7 if period==0 & country==1, color(blue*0.5)) ///
(rcap epidemics_know_aut_lb epidemics_know_aut_ub country7 if period==1 & country==0, color(green)) ///
(rcap epidemics_know_aut_lb epidemics_know_aut_ub country7 if period==1 & country==1, color(blue)) ///
(scatter epidemics_know_ind country6 if period==0 & country==0, msymbol(o) color(green*0.5)) ///
(scatter epidemics_know_ind country6 if period==0 & country==1, msymbol(o) color(blue*0.5)) ///
(scatter epidemics_know_ind country6 if period==1 & country==0, msymbol(oh) color(green)) ///
(scatter epidemics_know_ind country6 if period==1 & country==1, msymbol(oh) color(blue)) ///
(rcap epidemics_know_ind_lb epidemics_know_ind_ub country6 if period==0 & country==0,  color(green*0.5)) ///
(rcap epidemics_know_ind_lb epidemics_know_ind_ub country6 if period==0 & country==1,  color(blue*0.5)) ///
(rcap epidemics_know_ind_lb epidemics_know_ind_ub country6 if period==1 & country==0,  color(green)) ///
(rcap epidemics_know_ind_lb epidemics_know_ind_ub country6 if period==1 & country==1,  color(blue)) ///
(scatter epidemics_prep_aut country5 if period==0 & country==0, msymbol(o) color(green*0.5)) ///
(scatter epidemics_prep_aut country5 if period==0 & country==1, msymbol(o) color(blue*0.5)) ///
(scatter epidemics_prep_aut country5 if period==1 & country==0, msymbol(oh) color(green)) ///
(scatter epidemics_prep_aut country5 if period==1 & country==1, msymbol(oh) color(blue)) ///
(rcap epidemics_prep_aut_lb epidemics_prep_aut_ub country5 if period==0 & country==0,  color(green*0.5)) ///
(rcap epidemics_prep_aut_lb epidemics_prep_aut_ub country5 if period==0 & country==1,  color(blue*0.5)) ///
(rcap epidemics_prep_aut_lb epidemics_prep_aut_ub country5 if period==1 & country==0,  color(green)) ///
(rcap epidemics_prep_aut_lb epidemics_prep_aut_ub country5 if period==1 & country==1,  color(blue)) ///
(scatter epidemics_prep_ind country4 if period==0 & country==0, msymbol(o) color(green*0.5)) ///
(scatter epidemics_prep_ind country4 if period==0 & country==1, msymbol(o) color(blue*0.5)) ///
(scatter epidemics_prep_ind country4 if period==1 & country==0, msymbol(oh) color(green)) ///
(scatter epidemics_prep_ind country4 if period==1 & country==1, msymbol(oh) color(blue)) ///
(rcap epidemics_prep_ind_lb epidemics_prep_ind_ub country4 if period==0 & country==0,  color(green*0.5)) ///
(rcap epidemics_prep_ind_lb epidemics_prep_ind_ub country4 if period==0 & country==1,  color(blue*0.5)) ///
(rcap epidemics_prep_ind_lb epidemics_prep_ind_ub country4 if period==1 & country==0,  color(green)) ///
(rcap epidemics_prep_ind_lb epidemics_prep_ind_ub country4 if period==1 & country==1,  color(blue)) ///
(scatter epidemics_impact_other country3 if period==0 & country==0, msymbol(o) color(green*0.5)) ///
(scatter epidemics_impact_other country3 if period==0 & country==1, msymbol(o) color(blue*0.5)) ///
(scatter epidemics_impact_other country3 if period==1 & country==0, msymbol(oh) color(green)) ///
(scatter epidemics_impact_other country3 if period==1 & country==1, msymbol(oh) color(blue)) ///
(rcap epidemics_impact_other_lb epidemics_impact_other_ub country3 if period==0 & country==0,  color(green*0.5)) ///
(rcap epidemics_impact_other_lb epidemics_impact_other_ub country3 if period==0 & country==1,  color(blue*0.5)) ///
(rcap epidemics_impact_other_lb epidemics_impact_other_ub country3 if period==1 & country==0,  color(green)) ///
(rcap epidemics_impact_other_lb epidemics_impact_other_ub country3 if period==1 & country==1,  color(blue)) ///
(scatter epidemics_impact_ind country2 if period==0 & country==0, msymbol(o) color(green*0.5)) ///
(scatter epidemics_impact_ind country2 if period==0 & country==1, msymbol(o) color(blue*0.5)) ///
(scatter epidemics_impact_ind country2 if period==1 & country==0, msymbol(oh) color(green)) ///
(scatter epidemics_impact_ind country2 if period==1 & country==1, msymbol(oh) color(blue)) ///
(rcap epidemics_impact_ind_lb epidemics_impact_ind_ub country2 if period==0 & country==0,  color(green*0.5)) ///
(rcap epidemics_impact_ind_lb epidemics_impact_ind_ub country2 if period==0 & country==1,  color(blue*0.5)) ///
(rcap epidemics_impact_ind_lb epidemics_impact_ind_ub country2 if period==1 & country==0,  color(green)) ///
(rcap epidemics_impact_ind_lb epidemics_impact_ind_ub country2 if period==1 & country==1,  color(blue)) ///
(scatter epidemics_likelihood country if period==0 & country==0, msymbol(o) color(green*0.5)) ///
(scatter epidemics_likelihood country if period==0 & country==1, msymbol(o) color(blue*0.5)) ///
(scatter epidemics_likelihood country if period==1 & country==0, msymbol(oh) color(green)) ///
(scatter epidemics_likelihood country if period==1 & country==1, msymbol(oh) color(blue)) ///
(rcap epidemics_likelihood_lb epidemics_likelihood_ub country if period==0 & country==0,  color(green*0.5)) ///
(rcap epidemics_likelihood_lb epidemics_likelihood_ub country if period==0 & country==1,  color(blue*0.5)) ///
(rcap epidemics_likelihood_lb epidemics_likelihood_ub country if period==1 & country==0,  color(green)) ///
(rcap epidemics_likelihood_lb epidemics_likelihood_ub country if period==1 & country==1,  color(blue)  legend(off))
graph export figure1.png, replace width(2000) height(1500)


/*******************************************************************************
Figure 3
Title: Means and 95% CIs for epidemic risk perception in Sweden and Italy by 
affected areas and period.
*******************************************************************************/

**** figure 3, Sweden
clear all
use "survey_august.dta"
append using "survey_november.dta"

keep if country==0

gen risk=0 if group==3
replace risk =1  if group==4

collapse (mean) epidemics_likelihood epidemics_impact_ind epidemics_impact_other epidemics_know_ind epidemics_know_aut epidemics_prep_aut epidemics_prep_ind (semean) epidemics_likelihood_se = epidemics_likelihood epidemics_impact_ind_se = epidemics_impact_ind epidemics_impact_other_se= epidemics_impact_other epidemics_know_ind_se = epidemics_know_ind epidemics_know_aut_se = epidemics_know_aut  epidemics_prep_aut_se = epidemics_prep_aut epidemics_prep_ind_se = epidemics_prep_ind  [aw=we], by (risk period) 

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

rename risk country

gen country2 = country + 4
gen country3 = country + 8
gen country4 = country + 12
gen country5 = country + 16
gen country6 = country + 20
gen country7 = country + 24

twoway ///
(scatter epidemics_know_aut country7  if period==0 & country==0, msymbol(o) color(dkgreen*0.7))  ///
(scatter epidemics_know_aut country7  if period==0 & country==1, msymbol(o) color(lime*0.2)) ///
(scatter epidemics_know_aut country7  if period==1 & country==0, msymbol(oh) color(dkgreen)) ///
(scatter epidemics_know_aut country7  if period==1 & country==1, msymbol(oh) color(lime))  ///
(rcap epidemics_know_aut_lb epidemics_know_aut_ub country7 if period==0 & country==0, color(dkgreen*0.7)) ///
(rcap epidemics_know_aut_lb epidemics_know_aut_ub country7 if period==0 & country==1, color(lime*0.2)) ///
(rcap epidemics_know_aut_lb epidemics_know_aut_ub country7 if period==1 & country==0, color(dkgreen)) ///
(rcap epidemics_know_aut_lb epidemics_know_aut_ub country7 if period==1 & country==1, color(lime)) ///
(scatter epidemics_know_ind country6 if period==0 & country==0, msymbol(o) color(dkgreen*0.7)) ///
(scatter epidemics_know_ind country6 if period==0 & country==1, msymbol(o) color(lime*0.2)) ///
(scatter epidemics_know_ind country6 if period==1 & country==0, msymbol(oh) color(dkgreen)) ///
(scatter epidemics_know_ind country6 if period==1 & country==1, msymbol(oh) color(lime)) ///
(rcap epidemics_know_ind_lb epidemics_know_ind_ub country6 if period==0 & country==0,  color(dkgreen*0.7)) ///
(rcap epidemics_know_ind_lb epidemics_know_ind_ub country6 if period==0 & country==1,  color(lime*0.2)) ///
(rcap epidemics_know_ind_lb epidemics_know_ind_ub country6 if period==1 & country==0,  color(dkgreen)) ///
(rcap epidemics_know_ind_lb epidemics_know_ind_ub country6 if period==1 & country==1,  color(lime)) ///
(scatter epidemics_prep_aut country5 if period==0 & country==0, msymbol(o) color(dkgreen*0.7)) ///
(scatter epidemics_prep_aut country5 if period==0 & country==1, msymbol(o) color(lime*0.2)) ///
(scatter epidemics_prep_aut country5 if period==1 & country==0, msymbol(oh) color(dkgreen)) ///
(scatter epidemics_prep_aut country5 if period==1 & country==1, msymbol(oh) color(lime)) ///
(rcap epidemics_prep_aut_lb epidemics_prep_aut_ub country5 if period==0 & country==0,  color(dkgreen*0.7)) ///
(rcap epidemics_prep_aut_lb epidemics_prep_aut_ub country5 if period==0 & country==1,  color(lime*0.2)) ///
(rcap epidemics_prep_aut_lb epidemics_prep_aut_ub country5 if period==1 & country==0,  color(dkgreen)) ///
(rcap epidemics_prep_aut_lb epidemics_prep_aut_ub country5 if period==1 & country==1,  color(lime)) ///
(scatter epidemics_prep_ind country4 if period==0 & country==0, msymbol(o) color(dkgreen*0.7)) ///
(scatter epidemics_prep_ind country4 if period==0 & country==1, msymbol(o) color(lime*0.2)) ///
(scatter epidemics_prep_ind country4 if period==1 & country==0, msymbol(oh) color(dkgreen)) ///
(scatter epidemics_prep_ind country4 if period==1 & country==1, msymbol(oh) color(lime)) ///
(rcap epidemics_prep_ind_lb epidemics_prep_ind_ub country4 if period==0 & country==0,  color(dkgreen*0.7)) ///
(rcap epidemics_prep_ind_lb epidemics_prep_ind_ub country4 if period==0 & country==1,  color(lime*0.2)) ///
(rcap epidemics_prep_ind_lb epidemics_prep_ind_ub country4 if period==1 & country==0,  color(dkgreen)) ///
(rcap epidemics_prep_ind_lb epidemics_prep_ind_ub country4 if period==1 & country==1,  color(lime)) ///
(scatter epidemics_impact_other country3 if period==0 & country==0, msymbol(o) color(dkgreen*0.7)) ///
(scatter epidemics_impact_other country3 if period==0 & country==1, msymbol(o) color(lime*0.2)) ///
(scatter epidemics_impact_other country3 if period==1 & country==0, msymbol(oh) color(dkgreen)) ///
(scatter epidemics_impact_other country3 if period==1 & country==1, msymbol(oh) color(lime)) ///
(rcap epidemics_impact_other_lb epidemics_impact_other_ub country3 if period==0 & country==0,  color(dkgreen*0.7)) ///
(rcap epidemics_impact_other_lb epidemics_impact_other_ub country3 if period==0 & country==1,  color(lime*0.2)) ///
(rcap epidemics_impact_other_lb epidemics_impact_other_ub country3 if period==1 & country==0,  color(dkgreen)) ///
(rcap epidemics_impact_other_lb epidemics_impact_other_ub country3 if period==1 & country==1,  color(lime)) ///
(scatter epidemics_impact_ind country2 if period==0 & country==0, msymbol(o) color(dkgreen*0.7)) ///
(scatter epidemics_impact_ind country2 if period==0 & country==1, msymbol(o) color(lime*0.2)) ///
(scatter epidemics_impact_ind country2 if period==1 & country==0, msymbol(oh) color(dkgreen)) ///
(scatter epidemics_impact_ind country2 if period==1 & country==1, msymbol(oh) color(lime)) ///
(rcap epidemics_impact_ind_lb epidemics_impact_ind_ub country2 if period==0 & country==0,  color(dkgreen*0.7)) ///
(rcap epidemics_impact_ind_lb epidemics_impact_ind_ub country2 if period==0 & country==1,  color(lime*0.2)) ///
(rcap epidemics_impact_ind_lb epidemics_impact_ind_ub country2 if period==1 & country==0,  color(dkgreen)) ///
(rcap epidemics_impact_ind_lb epidemics_impact_ind_ub country2 if period==1 & country==1,  color(lime)) ///
(scatter epidemics_likelihood country if period==0 & country==0, msymbol(o) color(dkgreen*0.7)) ///
(scatter epidemics_likelihood country if period==0 & country==1, msymbol(o) color(lime*0.2)) ///
(scatter epidemics_likelihood country if period==1 & country==0, msymbol(oh) color(dkgreen)) ///
(scatter epidemics_likelihood country if period==1 & country==1, msymbol(oh) color(lime)) ///
(rcap epidemics_likelihood_lb epidemics_likelihood_ub country if period==0 & country==0,  color(dkgreen*0.7)) ///
(rcap epidemics_likelihood_lb epidemics_likelihood_ub country if period==0 & country==1,  color(lime*0.2)) ///
(rcap epidemics_likelihood_lb epidemics_likelihood_ub country if period==1 & country==0,  color(dkgreen)) ///
(rcap epidemics_likelihood_lb epidemics_likelihood_ub country if period==1 & country==1,  color(lime) legend(off))
graph export figure3_sw.png, replace width(2000) height(1500)

**** figure 3, Italy
clear all
use "survey_august.dta"
append using "survey_november.dta"

keep if country==1

gen risk=0
replace risk =1  if MUN_ITA==4

collapse (mean) epidemics_likelihood epidemics_impact_ind epidemics_impact_other epidemics_know_ind epidemics_know_aut epidemics_prep_aut epidemics_prep_ind (semean) epidemics_likelihood_se = epidemics_likelihood epidemics_impact_ind_se = epidemics_impact_ind epidemics_impact_other_se= epidemics_impact_other epidemics_know_ind_se = epidemics_know_ind epidemics_know_aut_se = epidemics_know_aut  epidemics_prep_aut_se = epidemics_prep_aut epidemics_prep_ind_se = epidemics_prep_ind  [aw=we], by (risk period) 

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

rename risk country

gen country2 = country + 4
gen country3 = country + 8
gen country4 = country + 12
gen country5 = country + 16
gen country6 = country + 20
gen country7 = country + 24

twoway ///
(scatter epidemics_know_aut country7  if period==0 & country==0, msymbol(o) color(navy*0.7))  ///
(scatter epidemics_know_aut country7  if period==0 & country==1, msymbol(o) color(ebblue*0.5)) ///
(scatter epidemics_know_aut country7  if period==1 & country==0, msymbol(oh) color(navy)) ///
(scatter epidemics_know_aut country7  if period==1 & country==1, msymbol(oh) color(ebblue))  ///
(rcap epidemics_know_aut_lb epidemics_know_aut_ub country7 if period==0 & country==0, color(navy*0.7)) ///
(rcap epidemics_know_aut_lb epidemics_know_aut_ub country7 if period==0 & country==1, color(ebblue*0.5)) ///
(rcap epidemics_know_aut_lb epidemics_know_aut_ub country7 if period==1 & country==0, color(navy)) ///
(rcap epidemics_know_aut_lb epidemics_know_aut_ub country7 if period==1 & country==1, color(ebblue)) ///
(scatter epidemics_know_ind country6 if period==0 & country==0, msymbol(o) color(navy*0.7)) ///
(scatter epidemics_know_ind country6 if period==0 & country==1, msymbol(o) color(ebblue*0.5)) ///
(scatter epidemics_know_ind country6 if period==1 & country==0, msymbol(oh) color(navy)) ///
(scatter epidemics_know_ind country6 if period==1 & country==1, msymbol(oh) color(ebblue)) ///
(rcap epidemics_know_ind_lb epidemics_know_ind_ub country6 if period==0 & country==0,  color(navy*0.7)) ///
(rcap epidemics_know_ind_lb epidemics_know_ind_ub country6 if period==0 & country==1,  color(ebblue*0.5)) ///
(rcap epidemics_know_ind_lb epidemics_know_ind_ub country6 if period==1 & country==0,  color(navy)) ///
(rcap epidemics_know_ind_lb epidemics_know_ind_ub country6 if period==1 & country==1,  color(ebblue)) ///
(scatter epidemics_prep_aut country5 if period==0 & country==0, msymbol(o) color(navy*0.7)) ///
(scatter epidemics_prep_aut country5 if period==0 & country==1, msymbol(o) color(ebblue*0.5)) ///
(scatter epidemics_prep_aut country5 if period==1 & country==0, msymbol(oh) color(navy)) ///
(scatter epidemics_prep_aut country5 if period==1 & country==1, msymbol(oh) color(ebblue)) ///
(rcap epidemics_prep_aut_lb epidemics_prep_aut_ub country5 if period==0 & country==0,  color(navy*0.7)) ///
(rcap epidemics_prep_aut_lb epidemics_prep_aut_ub country5 if period==0 & country==1,  color(ebblue*0.5)) ///
(rcap epidemics_prep_aut_lb epidemics_prep_aut_ub country5 if period==1 & country==0,  color(navy)) ///
(rcap epidemics_prep_aut_lb epidemics_prep_aut_ub country5 if period==1 & country==1,  color(ebblue)) ///
(scatter epidemics_prep_ind country4 if period==0 & country==0, msymbol(o) color(navy*0.7)) ///
(scatter epidemics_prep_ind country4 if period==0 & country==1, msymbol(o) color(ebblue*0.5)) ///
(scatter epidemics_prep_ind country4 if period==1 & country==0, msymbol(oh) color(navy)) ///
(scatter epidemics_prep_ind country4 if period==1 & country==1, msymbol(oh) color(ebblue)) ///
(rcap epidemics_prep_ind_lb epidemics_prep_ind_ub country4 if period==0 & country==0,  color(navy*0.7)) ///
(rcap epidemics_prep_ind_lb epidemics_prep_ind_ub country4 if period==0 & country==1,  color(ebblue*0.5)) ///
(rcap epidemics_prep_ind_lb epidemics_prep_ind_ub country4 if period==1 & country==0,  color(navy)) ///
(rcap epidemics_prep_ind_lb epidemics_prep_ind_ub country4 if period==1 & country==1,  color(ebblue)) ///
(scatter epidemics_impact_other country3 if period==0 & country==0, msymbol(o) color(navy*0.7)) ///
(scatter epidemics_impact_other country3 if period==0 & country==1, msymbol(o) color(ebblue*0.5)) ///
(scatter epidemics_impact_other country3 if period==1 & country==0, msymbol(oh) color(navy)) ///
(scatter epidemics_impact_other country3 if period==1 & country==1, msymbol(oh) color(ebblue)) ///
(rcap epidemics_impact_other_lb epidemics_impact_other_ub country3 if period==0 & country==0,  color(navy*0.7)) ///
(rcap epidemics_impact_other_lb epidemics_impact_other_ub country3 if period==0 & country==1,  color(ebblue*0.5)) ///
(rcap epidemics_impact_other_lb epidemics_impact_other_ub country3 if period==1 & country==0,  color(navy)) ///
(rcap epidemics_impact_other_lb epidemics_impact_other_ub country3 if period==1 & country==1,  color(ebblue)) ///
(scatter epidemics_impact_ind country2 if period==0 & country==0, msymbol(o) color(navy*0.7)) ///
(scatter epidemics_impact_ind country2 if period==0 & country==1, msymbol(o) color(ebblue*0.5)) ///
(scatter epidemics_impact_ind country2 if period==1 & country==0, msymbol(oh) color(navy)) ///
(scatter epidemics_impact_ind country2 if period==1 & country==1, msymbol(oh) color(ebblue)) ///
(rcap epidemics_impact_ind_lb epidemics_impact_ind_ub country2 if period==0 & country==0,  color(navy*0.7)) ///
(rcap epidemics_impact_ind_lb epidemics_impact_ind_ub country2 if period==0 & country==1,  color(ebblue*0.5)) ///
(rcap epidemics_impact_ind_lb epidemics_impact_ind_ub country2 if period==1 & country==0,  color(navy)) ///
(rcap epidemics_impact_ind_lb epidemics_impact_ind_ub country2 if period==1 & country==1,  color(ebblue)) ///
(scatter epidemics_likelihood country if period==0 & country==0, msymbol(o) color(navy*0.7)) ///
(scatter epidemics_likelihood country if period==0 & country==1, msymbol(o) color(ebblue*0.5)) ///
(scatter epidemics_likelihood country if period==1 & country==0, msymbol(oh) color(navy)) ///
(scatter epidemics_likelihood country if period==1 & country==1, msymbol(oh) color(ebblue)) ///
(rcap epidemics_likelihood_lb epidemics_likelihood_ub country if period==0 & country==0,  color(navy*0.7)) ///
(rcap epidemics_likelihood_lb epidemics_likelihood_ub country if period==0 & country==1,  color(ebblue*0.5)) ///
(rcap epidemics_likelihood_lb epidemics_likelihood_ub country if period==1 & country==0,  color(navy)) ///
(rcap epidemics_likelihood_lb epidemics_likelihood_ub country if period==1 & country==1,  color(ebblue) legend(off))
graph export figure3_it.png, replace width(2000) height(1500)
