      subroutine writespectrum(iat) 
      use prec
      use paramlist
      use string_type

      implicit none
      integer(short) i, j 
      character(len=50)  ofile,appendix
      character(len=*), intent(in):: iat
      type(string) s1, s2


      s1=trim(t_ofile)
      s2=trim(iat)
      s2=s1//s2
      appendix = '-original.dat'
      s1=s2
      s2=appendix
      s2=s1//s2

      ofile=s2
      open(5,file=ofile)
      write(5,*) '##E (eV)---total itensity'
      do i = 1, osp%nts
        write(5,'(f12.4, f20.8)') osp%en(i), 0.0
        write(5,'(f12.4, f20.8)') osp%en(i), osp%wt(i,4)/8.0
        write(5,'(f12.4, f20.8)') osp%en(i), osp%wt(i,4)/4.0
        write(5,'(f12.4, f20.8)') osp%en(i), osp%wt(i,4)/2.0
        write(5,'(f12.4, f20.8)') osp%en(i), osp%wt(i,4)
        write(5,*)
      end do
      close(5)

      s1=trim(t_ofile)
      s2=trim(iat)
      s2=s1//s2
      appendix = '-xas.dat'
      s1=s2
      s2=appendix
      s2=s1//s2

      ofile=s2
      open(5,file=ofile)
      write(5,*) '##E (eV)---total itensity'
      do i = 1, nsp%nts
        write(5,'(f12.4, f20.8)') nsp%en(i), nsp%wt(i,1)
      end do
      close(5)

      return
      end subroutine writespectrum
