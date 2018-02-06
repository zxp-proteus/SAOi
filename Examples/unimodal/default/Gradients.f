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
      double precision x(*), gf(*), gc(ni,*)
      double precision tmp0, tmp1, tmp2, tmp3, tmp4
!
! some often occurring terms
      tmp0 = 0.124d0
      tmp1 = dsqrt(1.d0 + x(2)**2)
      tmp2 = 8.d0/x(1) + 1.d0/(x(1)*x(2))
      tmp3 = 8.d0/x(1) - 1.d0/(x(1)*x(2))
      tmp4 = 2.d0*x(2)

! derivatives of the objective function
!----------------------------------------------------------------------!
      gf(1) = tmp1
      gf(2) = x(1)/(2.d0*tmp1)*tmp4

! derivatives of the inequality constraints
!----------------------------------------------------------------------!
      gc(1,1) = -tmp0*tmp1*(8.d0/x(1)**2 + 1.d0/(x(1)**2*x(2)))
      gc(1,2) = tmp0/(2.d0*tmp1)*tmp4*tmp2 - tmp0*tmp1/(x(1)*x(2)**2)
      gc(2,1) = -tmp0*tmp1*(8.d0/x(1)**2 - 1.d0/(x(1)**2*x(2)))
      gc(2,2) = tmp0/(2.d0*tmp1)*tmp4*tmp3 + tmp0*tmp1/(x(1)*x(2)**2)
!
      return
      end subroutine SAOi_grads
