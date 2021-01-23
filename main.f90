!!! Written by Zhufeng HOU, Jan. 25,2010
!   Purpose: post-process the calculated XAS data of selected atoms
!   Input file: axas.in (the main file with free format. see the
!                         beginning part of readctrl.f 
!                         for the explanation of each parameter.)
!               *.spectrum (the output files of cp2k)
!   Output files: *-original.dat (after shifting the energies in .spectrum,
!                         in order to draw the vertical line of
!                          each transition energy level)
!                 *-xas.dat (broadened data for each atom)
!                 tot-xas.dat (the total XAS data for selected atoms)  
!  Usage:  run make.sh to get an executable file
!          run the obtained executable file  
      program main
      use prec, only: short, q
      use constant
      use paramlist

      implicit none
      integer(short) i, j

!  read the data for controlling parameter
      call readctrl()
      
      do i = 1, natom
! read the data in .spectrum file for each atom      
        call readspectrum(iatom(i))
        if(lsum) then
            if(i==1) then
              tsp%nts= ne
              allocate(tsp%en(tsp%nts))
              allocate(tsp%wt(tsp%nts,1))
              tsp%en = 0.0_q
              tsp%wt = 0.0_q
            end if
! If the XAS data for selected atoms are summed up, 
! a common value will be adopted for the starting energy point in broadened data
            call smearing(ebmin, eb(i), eexcit(i)) 
            do j = 1, nsatom
               if(isatom(j)==iatom(i)) then
                   tsp%en = nsp%en
                   tsp%wt(:,1) = tsp%wt(:,1) + nsp%wt(:,1)*isrepeat(j)
                end if
            end do
        else
!If the XAS data of each atom are broadened separately,
! "osp%en(1)-5.0 eV" will be taken as the starting energy point in broadened data,
!  where osp%en(1) (in eV) is the first energy point in .spectrum after
!  shifting by  E_tot(excited state) - E_tot(ground state)
! 
          call smearing(osp%en(1), eb(i),eexcit(i))
        end if
        call writespectrum(iatom(i))
        deallocate(osp%en,osp%wt)
        deallocate(nsp%en,nsp%wt)
      end do

!! write the total spectra of selected atoms
      if(lsum) then
         open(5, file='tot-xas.dat')
         do i = 1, tsp%nts
           write(5,'(F8.4,F20.8)') tsp%en(i), tsp%wt(i,1)
         end do
         deallocate(tsp%en, tsp%wt, isatom)
      end if

      deallocate(iatom,eb,eexcit)

      end program
