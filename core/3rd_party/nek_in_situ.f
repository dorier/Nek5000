c-----------------------------------------------------------------------
      subroutine in_situ_init()
#ifdef VISIT
      call visit_init()
#endif
! Damaris is initialized earlier in the code, as it requires
! to change MPI_COMM_WORLD
      end
c-----------------------------------------------------------------------
      subroutine in_situ_check()
#ifdef VISIT
      call visit_check()
#endif
#ifdef ENABLE_DAMARIS
      call damaris_check()
#endif
      end
c-----------------------------------------------------------------------
      subroutine in_situ_end()
#ifdef VISIT
      call visit_end()
#endif
#ifdef ENABLE_DAMARIS
      call damaris_end()
#endif
      end
c-----------------------------------------------------------------------

