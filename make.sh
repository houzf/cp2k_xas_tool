rm *.o -f
ifort     -o brodenxas.x  prec.f90 constant.f90 string_type.f90 paramlist.f90 readctrl.f90 readspectrum.f90  smearing.f90  writespectrum.f90  main.f90
#ifort    -o brodenxas.x  prec.f90 constant.f90 string_type.f90 paramlist.f90 readctrl.f90 readspectrum.f90  smearing.f90  writespectrum.f90  main.f90
#g95      -o brodenxas.x  prec.f90 constant.f90 string_type.f90 paramlist.f90 readctrl.f90 readspectrum.f90  smearing.f90  writespectrum.f90  main.f90
#gfortran -o brodenxas.x prec.f90 constant.f90 string_type.f90 paramlist.f90 readctrl.f90 readspectrum.f90  smearing.f90  writespectrum.f90  main.f90
