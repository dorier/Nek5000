c---------------------------------------------------------------------
c Damaris Client Code for Nek5000
c
c   Provide a connection to Damaris. 
c---------------------------------------------------------------------

c---------------------------------------------------------------------
c damaris_check
c---------------------------------------------------------------------
      subroutine damaris_check()
      implicit none
      include "mpif.h"

! TODO

      end

c---------------------------------------------------------------------
c damaris_end
c---------------------------------------------------------------------
      subroutine damaris_end()
      implicit none

      integer ierr

      call damaris_stop_f(ierr)
      call damaris_finalize_f(ierr)

      end

