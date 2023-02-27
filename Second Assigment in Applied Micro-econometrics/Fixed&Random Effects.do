clear all
cd "C:\metaptyxiako\mikrooikonomikh\ergasia6"

***** Entering data ***** 
 use "C:\metaptyxiako\mikrooikonomikh\ergasia6\abdataset.dta" 

* Define our global variables
global id id 
global t year 
global ylist indoutpt
global xlist cap emp

* Describe the cross-sectional dimension,the time dimension and  X, Y variables
describe $id $t $ylist $xlist

* Summarize the data
summarize $id $t $ylist $xlist

* Set data as panel data
sort $id $t
xtset $id $t 
xtdescribe
xtsum $id $t $ylist $xlist

* Log
gen lindoutpt = ln(indoutpt)
gen lcap = ln(cap)
gen lemp = ln(emp)

* Define our global variables 
global ylist lindoutpt 
global xlist lcap lemp

* Pooled OLS estimator
reg $ylist $xlist

* Fixed effects or within estimator
xtreg $ylist $xlist, fe

* Random effects estimators
xtreg $ylist $xlist, re



