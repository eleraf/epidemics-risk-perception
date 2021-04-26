/*******************************************************************************
Estimated excess mortality in Italy: Scortichini M, Schneider Dos Santos R, De' 
Donato F, De Sario M, Michelozzi P, Davoli M, Masselot P, Sera F, Gasparrini A. 
Excess mortality during the COVID-19 outbreak in Italy: a two-stage interrupted 
time-series analysis. Int J Epidemiol. 2021 Jan 23;49(6):1909-1917.

Estimated excess mortality in Sweden using daily deaths
https://www.scb.se/om-scb/nyheter-och-pressmeddelanden/scb-publicerar-preliminar-statistik-over-doda-i-sverige/
******************************************************************************/

import delimited "data.txt", delimiter(space) clear
gen newdate = mdy(month,day,year)

format newdate %d
tsset provcode newdate, daily

drop if newdate>=22067

gen tcovid = 0 if newdate<mdy(3,1,2020)

replace tcovid = 1 if newdate>=mdy(3,1,2020)
gen tcovid_trend = 0 if tcovid==0

bspline, xvar(tspost) knots(10 25 50) gen(season)

gen lag_temp = L21.tmean
bspline, xvar(lag_temp) knots(10 25 50) gen(s_temp)

replace tcovid_trend = newdate - 21975 if tcovid==1

gen day_week = dow(newdate)

poisson y tcovid day_week season* s_temp* if provcode==15, irr

mepoisson y tcovid day_week season* s_temp* if regcode==1 || provcode: ,  irr
mepoisson y tcovid day_week season* s_temp* if regcode==2 || provcode: ,  irr
mepoisson y tcovid day_week season* s_temp* if regcode==3 || provcode: ,  irr
mepoisson y tcovid day_week season* s_temp* if regcode==4 || provcode: ,  irr
mepoisson y tcovid day_week season* s_temp* if regcode==5 || provcode: ,  irr
poisson y tcovid day_week season* s_temp* if regcode==6,  irr
mepoisson y tcovid day_week season* s_temp* if regcode==7 || provcode: ,  irr
mepoisson y tcovid day_week season* s_temp* if regcode==8 || provcode: ,  irr

mepoisson y tcovid day_week season* s_temp* || provcode: ,  irr
