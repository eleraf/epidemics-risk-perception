/*******************************************************************************
Table 1
Title: Country (Italy vs. Sweden) effect modification on the association between
period and pandemic risk perception.
*******************************************************************************/

clear all
use "survey_august.dta"
append using "survey_november.dta"

 gen country_per= 0 if country==0 & period==0
  replace country_per = 1 if country==0 & period==1
   replace country_per = 2 if country==1 & period==0
     replace country_per = 3 if country==1 & period==1
 gen int_term = country*period
	 
ologit epidemics_likelihood i.country_per [aweight=we], or  cformat(%9.2fc)
ologit epidemics_likelihood country period int_term [aweight=we], or  cformat(%9.2fc)
nlcom exp(_b[period] + _b[country] + _b[int_term]) - exp(_b[period])  - exp(_b[country]) + 1
ologit epidemics_likelihood country if period==1 [aweight=we], or  cformat(%9.2fc)
ologit epidemics_likelihood country if period==0 [aweight=we], or  cformat(%9.2fc)

ologit epidemics_impact_ind i.country_per [aweight=we], or  cformat(%9.2fc)
ologit epidemics_impact_ind country period int_term [aweight=we], or  cformat(%9.2fc)
nlcom exp(_b[period] + _b[country] + _b[int_term]) - exp(_b[period])  - exp(_b[country]) + 1
ologit epidemics_impact_ind country if period==1 [aweight=we], or  cformat(%9.2fc)

ologit epidemics_impact_other i.country_per [aweight=we], or  cformat(%9.2fc)
ologit epidemics_impact_other country period int_term [aweight=we], or  cformat(%9.2fc)
nlcom exp(_b[period] + _b[country] + _b[int_term]) - exp(_b[period])  - exp(_b[country]) + 1
ologit epidemics_impact_other country if period==1 [aweight=we], or  cformat(%9.2fc)

ologit epidemics_prep_ind i.country_per [aweight=we], or  cformat(%9.2fc)
ologit epidemics_prep_ind country period int_term [aweight=we], or  cformat(%9.2fc)
nlcom exp(_b[period] + _b[country] + _b[int_term]) - exp(_b[period])  - exp(_b[country]) + 1
ologit epidemics_prep_ind country if period==1 [aweight=we], or  cformat(%9.2fc)

ologit epidemics_prep_aut i.country_per [aweight=we], or  cformat(%9.2fc)
ologit epidemics_prep_aut country period int_term [aweight=we], or  cformat(%9.2fc)
nlcom exp(_b[period] + _b[country] + _b[int_term]) - exp(_b[period])  - exp(_b[country]) + 1
ologit epidemics_prep_aut country if period==1 [aweight=we], or  cformat(%9.2fc)

ologit epidemics_know_ind i.country_per [aweight=we], or  cformat(%9.2fc)
ologit epidemics_know_ind country period int_term [aweight=we], or  cformat(%9.2fc)
nlcom exp(_b[period] + _b[country] + _b[int_term]) - exp(_b[period])  - exp(_b[country]) + 1
ologit epidemics_know_ind country if period==1 [aweight=we], or  cformat(%9.2fc)

ologit epidemics_know_aut i.country_per [aweight=we], or  cformat(%9.2fc)
ologit epidemics_know_aut country period int_term [aweight=we], or  cformat(%9.2fc)
nlcom exp(_b[period] + _b[country] + _b[int_term]) - exp(_b[period])  - exp(_b[country]) + 1
ologit epidemics_know_aut country if period==1 [aweight=we], or  cformat(%9.2fc)


/*******************************************************************************
Table 2
Title: Factors associated with epidemic risk perception by country and period.
*******************************************************************************/
clear all
use "survey_august.dta"
append using "survey_november.dta"

ologit epidemics_likelihood gender i.age_c working needs education epidemics_experience [aweight=we] if country==0 & period==0, or  cformat(%9.2fc)
ologit epidemics_likelihood gender i.age_c working needs education epidemics_experience [aweight=we] if country==0 & period==1, or  cformat(%9.2fc)
ologit epidemics_likelihood gender i.age_c working needs education epidemics_experience [aweight=we] if country==1 & period==0, or  cformat(%9.2fc)
ologit epidemics_likelihood gender i.age_c working needs education epidemics_experience [aweight=we] if country==1 & period==1, or  cformat(%9.2fc)

ologit epidemics_impact_ind gender i.age_c working needs education epidemics_experience [aweight=we] if country==0 & period==0, or  cformat(%9.2fc)
ologit epidemics_impact_ind gender i.age_c working needs education epidemics_experience [aweight=we] if country==0 & period==1, or  cformat(%9.2fc)
ologit epidemics_impact_ind gender i.age_c working needs education epidemics_experience [aweight=we] if country==1 & period==0, or  cformat(%9.2fc)
ologit epidemics_impact_ind gender i.age_c working needs education epidemics_experience [aweight=we] if country==1 & period==1, or  cformat(%9.2fc)

ologit epidemics_impact_other gender i.age_c working needs education epidemics_experience [aweight=we] if country==0 & period==0, or  cformat(%9.2fc)
ologit epidemics_impact_other gender i.age_c working needs education epidemics_experience [aweight=we] if country==0 & period==1, or  cformat(%9.2fc)
ologit epidemics_impact_other gender i.age_c working needs education epidemics_experience [aweight=we] if country==1 & period==0, or  cformat(%9.2fc)
ologit epidemics_impact_other gender i.age_c working needs education epidemics_experience [aweight=we] if country==1 & period==1, or  cformat(%9.2fc)

ologit epidemics_prep_ind gender i.age_c working needs education epidemics_experience [aweight=we] if country==0 & period==0, or  cformat(%9.2fc)
ologit epidemics_prep_ind gender i.age_c working needs education epidemics_experience [aweight=we] if country==0 & period==1, or  cformat(%9.2fc)
ologit epidemics_prep_ind gender i.age_c working needs education epidemics_experience [aweight=we] if country==1 & period==0, or  cformat(%9.2fc)
ologit epidemics_prep_ind gender i.age_c working needs education epidemics_experience [aweight=we] if country==1 & period==1, or  cformat(%9.2fc)

ologit epidemics_prep_aut gender i.age_c working needs education epidemics_experience [aweight=we] if country==0 & period==0, or  cformat(%9.2fc)
ologit epidemics_prep_aut gender i.age_c working needs education epidemics_experience [aweight=we] if country==0 & period==1, or  cformat(%9.2fc)
ologit epidemics_prep_aut gender i.age_c working needs education epidemics_experience [aweight=we] if country==1 & period==0, or  cformat(%9.2fc)
ologit epidemics_prep_aut gender i.age_c working needs education epidemics_experience [aweight=we] if country==1 & period==1, or  cformat(%9.2fc)

ologit epidemics_know_ind gender i.age_c working needs education epidemics_experience [aweight=we] if country==0 & period==0, or  cformat(%9.2fc)
ologit epidemics_know_ind gender i.age_c working needs education epidemics_experience [aweight=we] if country==0 & period==1, or  cformat(%9.2fc)
ologit epidemics_know_ind gender i.age_c working needs education epidemics_experience [aweight=we] if country==1 & period==0, or  cformat(%9.2fc)
ologit epidemics_know_ind gender i.age_c working needs education epidemics_experience [aweight=we] if country==1 & period==1, or  cformat(%9.2fc)

ologit epidemics_know_aut gender i.age_c working needs education epidemics_experience [aweight=we] if country==0 & period==0, or  cformat(%9.2fc)
ologit epidemics_know_aut gender i.age_c working needs education epidemics_experience [aweight=we] if country==0 & period==1, or  cformat(%9.2fc)
ologit epidemics_know_aut gender i.age_c working needs education epidemics_experience [aweight=we] if country==1 & period==0, or  cformat(%9.2fc)
ologit epidemics_know_aut gender i.age_c working needs education epidemics_experience [aweight=we] if country==1 & period==1, or  cformat(%9.2fc)


/*******************************************************************************
Table 3
Title: Association between excess mortality (for each 10% increase) and domains of risk perceptions.
*******************************************************************************/

clear all
use "survey_august.dta"

merge m:1 MUN_ITA using excess_mortality_itaty.dta
drop _merge

replace ExcessPer= ExcessPer/10

ologit epidemics_likelihood gender i.age_c needs ExcessPer [aweight=we] if period==0, or
ologit epidemics_impact_ind gender i.age_c needs ExcessPer [aweight=we] if period==0, or
ologit epidemics_impact_other gender i.age_c needs ExcessPer [aweight=we] if period==0, or
ologit epidemics_prep_ind gender i.age_c needs ExcessPer [aweight=we] if period==0, or
ologit epidemics_prep_aut gender i.age_c needs ExcessPer [aweight=we] if period==0, or
ologit epidemics_know_ind gender i.age_c needs ExcessPer [aweight=we] if period==0, or
ologit epidemics_know_aut gender i.age_c needs ExcessPer [aweight=we] if period==0, or

clear all
use "survey_august.dta"

merge m:1 NUTS2 using excess_mortality_sweden.dta
drop _merge

replace ExcessPer= ExcessPer/10

ologit epidemics_likelihood gender i.age_c needs ExcessPer [aweight=we] if period==0, or
ologit epidemics_impact_ind gender i.age_c needs ExcessPer [aweight=we] if period==0, or
ologit epidemics_impact_other gender i.age_c needs ExcessPer [aweight=we] if period==0, or
ologit epidemics_prep_ind gender i.age_c needs ExcessPer [aweight=we] if period==0, or
ologit epidemics_prep_aut gender i.age_c needs ExcessPer [aweight=we] if period==0, or
ologit epidemics_know_ind gender i.age_c needs ExcessPer [aweight=we] if period==0, or
ologit epidemics_know_aut gender i.age_c needs ExcessPer [aweight=we] if period==0, or


/*******************************************************************************
Table 4
Title: Association between the level of national policy response (Stringency index)
and domains of risk perceptions.
*******************************************************************************/

clear all
use "survey_august.dta"
append using "survey_november.dta"

*national policy response (Stringency index), area under the curve
gen AUC = 9346.04/9346.04 if country ==0 & period==0
replace AUC = 12453.41/9346.04 if country ==1 & period==0
replace AUC = 13963.07/9346.04 if country ==0 & period==1
replace AUC = 16966.42/9346.04 if country ==1 & period==1

ologit epidemics_likelihood AUC gender i.age_c needs [aweight=we], or  cformat(%9.2fc)
ologit epidemics_impact_ind AUC gender i.age_c needs [aweight=we], or  cformat(%9.2fc)
ologit epidemics_impact_other AUC gender i.age_c needs [aweight=we], or  cformat(%9.2fc)
ologit epidemics_know_ind AUC gender i.age_c needs[aweight=we], or  cformat(%9.2fc)
ologit epidemics_know_aut AUC gender i.age_c needs [aweight=we], or  cformat(%9.2fc)
ologit epidemics_prep_aut AUC gender i.age_c needs [aweight=we], or  cformat(%9.2fc)
ologit epidemics_prep_ind AUC gender i.age_c needs [aweight=we], or  cformat(%9.2fc)




