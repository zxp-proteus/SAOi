! SAOi:
! SAOi: Sat May 02 09:04:51 SAST 2009, Albert Groenwold, Stellenbosch
! SAOi: objective and constraint functions
! SAOi:

      subroutine SAOi_funcs (n, m, ni, ne, x, f, c, iuser, luser, cuser,
     &                       ruser, eqn, lin, ictrl, lctrl, rctrl,
     &                       cctrl)
!----------------------------------------------------------------------!
!                                                                      !
!  Compute the objective function f and the inequality constraint      !
!  functions c(j), j=1,ni                                              !
!                                                                      !
!  Please see the users manual for type declarations and comments      !
!                                                                      !
!----------------------------------------------------------------------!
      implicit         none
      include          'ctrl.h'
      logical          eqn(*), lin(*)
      integer          i, j, n, m, ni, ne
      double precision f, x(n), c(m)
! 
      f    = (x(1) - 1.d0)**2 + (x(2) - 2.d0)**2 + x(3)**2 + x(4)**2
!   
      c(1)= x(1) + x(2) + x(3) - x(4) - 1.d0
      c(2)= x(1)**2 + x(2)**2 + x(3)**2 + x(4)**2 - 1.d0
!
      return
      end subroutine SAOi_funcs
