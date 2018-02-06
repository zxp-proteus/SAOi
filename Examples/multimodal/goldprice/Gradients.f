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
      double precision x(n), gf(n), gc(*)
      double precision t1, t2, t3, t4, t5, t6, t7, x1, x2
!
      x1=x(1)
      x2=x(2)
      t1=x1+x2+1.d0
      t2=19.d0-14.d0*x1+3.d0*x1*x1-14.d0*x2+6.d0*x1*x2+3.d0*x2*x2
      t3=2.d0*x1-3.d0*x2
      t4=18.d0-32.d0*x1+12.d0*x1*x1+48.d0*x2-36.d0*x1*x2+27.d0*x2*x2
      t5=-14.d0+6.d0*x1+6.d0*x2
      t6=-32.d0+24.d0*x1-36.d0*x2
      t7=48.d0-36.d0*x1+54.d0*x2
!
      gf(1)= (2.d0*t1*t2+t1*t1*t5)*(30.d0+t3*t3*t4)
     &     + (1.d0+t1*t1*t2)*(4.d0*t3*t4+t3*t3*t6)
      gf(2)= (2.d0*t1*t2+t1*t1*t5)*(30.d0+t3*t3*t4)
     &     + (1.d0+t1*t1*t2)*(-6.d0*t3*t4+t3*t3*t7)
!
      return
      end subroutine SAOi_grads
