! SAOi:
! SAOi: Sat May 02 09:04:51 SAST 2009, Albert Groenwold, Stellenbosch
! SAOi: objective and constraint functions gradients
! SAOi:

      subroutine SAOi_grads (n, m, ni, ne, x, gf, gc, nnz, Acol, Aptr,
     &                       iuser, luser, cuser, ruser, eqn, lin,
     &                       ictrl, lctrl, rctrl, cctrl)
!----------------------------------------------------------------------!
!                                                                      !
!  Compute the gradients gf(i) of the objective function f, and the    !
!  derivatives gc(k) of the inequality constraint functions c          !
!  w.r.t. the variables x(i)                                           !
!                                                                      !
!  Please see the users manual for type declarations and comments      !
!                                                                      !
!                                                                      !
!  The default storage scheme is the dense storage scheme. In          !
!      this scheme, it is only required to specify the vector          !
!      gf and the matrix gc. The dimensions of gf and gc are           !
!      gf(n) and gc(ni,n) respectively. For details, please            !
!      see the users manual                                            !
!                                                                      !
!  The default storage scheme if the sparse implementation is          !
!      selected is the compressed sparse row (CSR) storage scheme.     !
!      The dimensions of Acol and Aptr in the CSR storage sheme        !
!      are Acol(nnz) and Aptr(ni+1) respectively. For details,         !
!      please see the users manual                                     !
!                                                                      !
!  nnz is the number of non-zero entries in gc. If the standard        !
!      sparse storage structure is used, nnz should be declared        !
!      in Initialize.f, and its value should not be changed            !
!                                                                      !
!  Acol and Aptr are to be declared here if the sparse storage         !
!      structure is used. For details, please see the users manual     !
!                                                                      !
!  iuser, luser, cuser and ruser are user arrays, which may be used    !
!      at will to pass arbitrary data around between the user          !
!      routines                                                        !
!                                                                      !
!----------------------------------------------------------------------!
      implicit         none
      include          'ctrl.h'
      logical          eqn(*), lin(*)
      integer          i, j, n, m, ni, ne, nnz, Acol(*), Aptr(*)
      double precision x(n), gf(n), gc(*), x1, x2, x3, pi 
!
      x1 = x(1)
      x2 = x(2)
      x3 = x(3)
      pi = 4.0d0*datan(1.0d0)
!      
      gf(1) = -(x1*2.d0-x2*2.d0)*1.d0/((x1-x2)**2+1.d0)**2
     &        -(dexp(-((x1+x3)/x2-2.d0)**2)*((x1+x3)/x2-2.d0)*2.d0)/x2
      gf(2) = (x1*2.0-x2*2.0)*1.0/((x1-x2)**2+1.0)**2
     &      + pi*x3*dcos(pi*x2*x3*5.0d-1)*5.0d-1+1.0/x2**2
     &      * dexp(-((x1+x3)/x2-2.d0)**2)*(x1+x3)*((x1+x3)/x2-2.d0)*2.d0
      gf(3) = (dexp(-((x1+x3)/x2-2.d0)**2)*((x1+x3)/x2-2.d0)*(-2.d0))
     &      / x2+pi*x2*dcos(pi*x2*x3*5.0d-1)*5.0d-1
!
      gf(1) = - gf(1)
      gf(2) = - gf(2)
      gf(3) = - gf(3)
!
      return
      end subroutine SAOi_grads
