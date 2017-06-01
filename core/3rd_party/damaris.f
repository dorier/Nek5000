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
      include 'SIZE'
      include 'TOTAL'


      integer ierr
      integer first
      integer block

      save first
      data first /1/

      if (first.eq.1) then
         call damaris_parameter_set_f("NX1",nx1,SIZEOF(nx1),ierr)
         call damaris_parameter_set_f("NY1",ny1,SIZEOF(ny1),ierr)
         if(IF3D) then
           call damaris_parameter_set_f("NZ1",nz1,SIZEOF(nz1),ierr)
         endif
         first = first+1
      endif

      do block=1,nelv
         call damaris_write_block_f("coords/xm1", block-1, 
     &                               xm1(1,1,1,block),ierr)
         call damaris_write_block_f("coords/ym1", block-1, 
     &                               ym1(1,1,1,block),ierr)
         if(IF3D) then
           call damaris_write_block_f("coords/zm1", block-1, 
     &                               zm1(1,1,1,block),ierr)
         endif
         call damaris_write_block_f("x_velocity", block-1, 
     &                               VX(1,1,1,block), ierr)
         call damaris_write_block_f("y_velocity", block-1, 
     &                               VY(1,1,1,block), ierr)
         if(IF3D) then
           call damaris_write_block_f("z_velocity", block-1, 
     &                               VZ(1,1,1,block), ierr)
         endif
         call damaris_write_block_f("temperature",block-1, 
     &                               T(1,1,1,block,1),ierr)
         call damaris_write_block_f("pressure",   block-1,
     &                               PR(1,1,1,block), ierr)
      enddo

      call damaris_end_iteration_f(ierr)

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

