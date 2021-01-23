      subroutine smearing(e0, emin, eexcited) 
      use prec, only: short, q
      use paramlist
      use constant

      implicit none
      integer(short) i, j
      real(q) sigma, delta, ecorr,emax
      real(q), intent(IN) :: emin, eexcited, e0
!     emin: the ionization energy (i.e., binding energy) 
!           of 1s of atom
!     eexcited: the total energy of excitied state in DSCF calculation
!     e0:  the lowest value in the energy axis      

      emax = emin + 20.0_q
      ecorr = (eexcited - egs) - osp%en(1) 

      do i = 1, osp%nts 
        osp%en(i) = osp%en(i) + ecorr
      end do

      nsp%nts= ne
      allocate(nsp%en(nsp%nts))
      allocate(nsp%wt(nsp%nts,1))
     
!      delta = (osp%en(osp%nts)-osp%en(1)+5.0_q)/real(ne) 
       delta = 50.0_q/real(ne) 

      do i = 1, nsp%nts 
        nsp%wt(i,1) = 0.0  
        nsp%en(i) = e0 + delta * (i-1) - 5.0_q 
        if ( nsp%en(i) < emin ) then
           sigma = sigma_min
           else if ( emin <= nsp%en(i) .AND. nsp%en(i) <= emax ) then
            sigma = (nsp%en(i)-emin)*  &
                (sigma_max-sigma_min)/(emax-emin) + sigma_min
           else 
              sigma = sigma_max
        end if
        do j = 1, osp%nts 
!        wnew(i,4) = wnew(i,4)+wold(j,4)*gauss(e,sigma)
         nsp%wt(i,1) = nsp%wt(i,1)+osp%wt(j,4)*      &
             exp(-((nsp%en(i)-osp%en(j))/sigma)**2)* &
             sqrtpm1*(1.0_q/sigma)
        end do
      end do
      end subroutine smearing 
