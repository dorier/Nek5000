c-----------------------------------------------------------------------
      subroutine get_session_info(intracomm)
      include 'mpif.h'
      include 'SIZE'
      include 'PARALLEL'
      include 'INPUT'

#ifdef ENABLE_DAMARIS
      integer is_client
#endif

C     Find out the session name:
C

      call mpi_initialized(mpi_is_initialized, ierr) !  Initialize MPI
      if ( mpi_is_initialized .eq. 0 ) call mpi_init (ierr)

      nekcomm=mpi_comm_world

#ifdef ENABLE_DAMARIS
      call damaris_initialize_f('nek5.xml', mpi_comm_world, ierr)
      call damaris_start_f(is_client, ierr)
      if(is_client.gt.0) then
         call damaris_client_comm_get_f(nekcomm, ierr)
      else
         call damaris_finalize_f(ierr)
         call mpi_finalize(ierr)
         stop
      endif
#endif

      call mpi_comm_dup(nekcomm,intracomm,ierr)
      call iniproc(intracomm)

      CALL BLANK(SESSION,132)
      CALL BLANK(PATH   ,132)

      ierr = 0
      IF(NID.EQ.0) THEN
        OPEN (UNIT=8,FILE='SESSION.NAME',STATUS='OLD',ERR=24)
        READ(8,10) SESSION
        READ(8,10) PATH
  10      FORMAT(A132)
        CLOSE(UNIT=8)
        GOTO 23
  24    CONTINUE
        write(6,*) 'No file SESSION.NAME; using defaults of '
        write(6,*) 'PATH=. and SESSION=NEK.'
        PATH='.'
        SESSION='NEK'
  23    ENDIF

      call err_chk(ierr,' Cannot open SESSION.NAME!$')
   
      call bcast(SESSION,132*CSIZE)
      call bcast(PATH,132*CSIZE)

      IFNEKNEK   = .false.
      IFNEKNEKM  = .false.

      return
      end

c-----------------------------------------------------------------------
      subroutine userchk_set_xfer

c     Dummy for singlmesh 

      return
      end

c-----------------------------------------------------------------------
      subroutine setintercomm(nekcommtrue,nptrue) 

c     Dummy for singlmesh 

      return
      end

c-----------------------------------------------------------------------
      subroutine unsetintercomm(nekcommtrue,nptrue)

c     Dummy for singlmesh 

      return
      end
c------------------------------------------------------------------------
      subroutine uglmin(a,n)

c     Dummy for singlmesh 

      return
      end
c------------------------------------------------------------------------
      subroutine happy_check(iflag)

c     Dummy for singlmesh 

      return
      end
c------------------------------------------------------------------------
      subroutine bcopy

c     Dummy for singlmesh

      return
      end
c------------------------------------------------------------------------
      subroutine chk_outflow

c     Dummy for singlmesh 

      return
      end
c------------------------------------------------------------------------
      subroutine multimesh_create

c     Dummy for singlmesh 

      return
      end
c------------------------------------------------------------------------
