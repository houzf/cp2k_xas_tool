      MODULE paramlist 
      use prec, only: short, q

!     implicit none
      integer(short) ne, natom, nsatom
!     integer(short), allocatable :: iatom(:)
      real(q), allocatable :: eb(:),  eexcit(:)
      real(q) sigma_min, sigma_max
      real(q) egs, ecor, ebmin
      character(LEN=50) t_ifile, t_ofile
      character(LEN=5), allocatable :: iatom(:),isatom(:)
      integer(short), allocatable :: isrepeat(:)
      logical  lsum

      type spectrum
           integer(short) nts
           real(q), pointer :: en(:)
           real(q), pointer :: wt(:,:)
      end type spectrum

      type(spectrum) osp, nsp, tsp

      END MODULE
