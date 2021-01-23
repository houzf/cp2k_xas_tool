      subroutine readspectrum(iat) 
      use prec
      use paramlist
      use string_type

      implicit none
      integer(short) i, j, id_ts, temp_nts
      integer istat
      character*50  ifile,appendix
      character*50  temp 
      real(q) temp_en
      real(q), dimension(4):: temp_wt
      character(len=*), intent(in):: iat
      type(string) s1, s2

      s1=trim(t_ifile)
      s2=trim(iat)
      s2=s1//s2
      appendix = '.spectrum'
      s1=s2
      s2=appendix
      s2=s1//s2

      ifile=s2

!-- Here, this part only for get the number of transition energy levels
      open(4,file=ifile,status='old')
      read(4,*) temp
      temp_nts = 0
      do while (.true.)
         read(4,*, iostat= istat) &
            id_ts, temp_en, (temp_wt(i),i=1,4)
         if (istat/=0) exit
         temp_nts = temp_nts + 1
      end do
      close(4)
!---
      osp%nts = temp_nts 
      allocate(osp%en(osp%nts))
      allocate(osp%wt(osp%nts,4))

      open(4,file=ifile,status='old')

      read(4,*) temp
      do i = 1, osp%nts 
         read(4,*) id_ts, osp%en(i), (osp%wt(i,j),j=1,4)
      end do
      close(4)


      return
      end subroutine readspectrum
