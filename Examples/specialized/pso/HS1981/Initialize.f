! SAOi:
! SAOi: Sat May 02 09:04:51 SAST 2009, Albert Groenwold, Stellenbosch
! SAOi: initialization
! SAOi:

      subroutine SAOi_init (n, ni, ne, x, x_lower, x_upper, ictrl,
     &                      lctrl, rctrl, cctrl, iuser, luser, cuser,
     &                      ruser, nnz, nnzh, eqn, lin, shift)
!----------------------------------------------------------------------!
!                                                                      !
!  Initialization of the SAOi algorithm; please see the users manual   !
!  for type declarations and comments                                  !
!                                                                      !
!----------------------------------------------------------------------!
      implicit         none
      include          'ctrl.h'
      logical          eqn(*), lin(*)
      integer          i, j, n, m, ni, ne, nnz, nnzh
      double precision x(*), x_lower(*), x_upper(*), shift(*)
      include          'ctrl_get.inc'
!
      n              =  5        !  the number of design variables
      ni             =  6       !  the number of inequality constraints
      ne             =  0        !  the number of equality constraints
!
      x(1)           =  90.d0    !  the starting point
      x(2)           =  40.d0
      x(3)           =  35.d0    !  the starting point
      x(4)           =  35.d0
      x(5)           =  35.d0    !  the starting point
!
      x_lower(1)     =  78.d0    !  the lower bounds
      x_lower(2)     =  33.d0
      x_lower(3)     =  27.d0
      x_lower(4)     =  27.d0
      x_lower(5)     =  27.d0
!
      x_upper(1)     =  102.d0   !  the upper bounds
      x_upper(2)     =   45.d0
      x_upper(3)     =   45.d0
      x_upper(4)     =   45.d0
      x_upper(5)     =   45.d0
!
      cname1 = 'HS-1989'    ! problem name; max 24 characters
!
!
!  specify a few OPTIONAL parameters - sometimes desirable
!
!
      multimodal     =  .true.   ! assume multimodality?
      finite_diff    =  .true.   ! use finite differences?
!     force_converge =  0        ! enforce local convergence? 0 = No; 1 through 3 = Yes (see manual)
!     approx_f       =  1        ! select approx_f (see manual)
!     approx_c       =  1        ! select approx_c (see manual)
!
!
!  specify a few more OPTIONAL parameters - normally not necessary
!
!
!     check_grad     = .true.    ! check the user supplied gradients
!     subsolver      =  1        ! specify the solver for the subproblems
!     xtol           =  1.d-4    ! specify the x-tolerance (Euclidian norm)
!     xtol_inf       =  1.d-6    ! specify the x-tolerance (infinity norm)
!     ftol           = -1.d-10   ! specify the f-tolerance. NOT recommended in general. Values < 0 disable this
!     outermax       =  500      ! the number of outer loops allowed
!     innermax       =  50       ! the number of inner loops allowed
!     dml_infinity   =  0.2d0    ! the infinity move limit
!     random_start   =  .false.  ! use random starting point?
!     biglam         =  1.d8     ! upper bound on the dual variables
!
      include          'ctrl_set.inc'
      return
      end subroutine SAOi_init
