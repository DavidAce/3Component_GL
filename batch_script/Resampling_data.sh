#!/bin/bash

################# This script computes for a set of L (the array is defined in the .py files): ####################################
#	-the maximum transient time among all the observables
#	-the maximum autocorrelation time among all the observables
#	-Given these two times it perform a bootstrap resampling to compute the mean value and the variance of the observables 
###################################################################################################################################



############# Parameters of the Hamiltonian ##################
H_a=0
H_b=1
H_eta=1
H_e=0
H_h=0.2
H_nu=0
H_blow=10.55
H_bhigh=11.75

nbeta=64

#LList="\"[[8] [10]]\""

LList=("8 10 12")

BASEDIR="/Users/ilaria/Desktop/MultiComponents_SC/Output_3C/e_${H_e}/nu_${H_nu}"


for L in $LList; do
    DIRECTORY=$BASEDIR/L${L}_a${H_a}_b${H_b}_eta${H_eta}_e${H_e}_h${H_h}_nu${H_nu}_bmin${H_blow}_bmax${H_bhigh}
    python3 New_Autocorr_time.py ${H_blow} ${H_bhigh} ${nbeta} ${DIRECTORY} ${L} ${H_nu} ${H_e}
    python3 New_LogBoxing.py ${H_blow} ${H_bhigh} ${nbeta} ${DIRECTORY} ${L} ${H_nu} ${H_e}

done

LList=("8 10 12")


#python3 New_Bootstrap_Energy.py ${H_blow} ${H_bhigh} ${nbeta} ${H_e} ${H_h} ${H_nu} ${LList[@]}
python3 New_Bootstrap_HelicityModulus.py ${H_blow} ${H_bhigh} ${nbeta} ${H_e} ${H_h} ${H_nu} ${LList[@]}
python3 New_Bootstrap_Magnetization.py ${H_blow} ${H_bhigh} ${nbeta} ${H_e} ${H_h} ${H_nu} ${LList[@]}
#python3 New_Bootstrap_DualStiffness.py ${H_blow} ${H_bhigh} ${nbeta} ${H_e} ${H_h} ${H_nu} ${LList[@]}
#python3 New_Bootstrap_PsiDensity.py ${H_blow} ${H_bhigh} ${nbeta} ${H_e} ${H_h} ${H_nu} ${LList[@]}

