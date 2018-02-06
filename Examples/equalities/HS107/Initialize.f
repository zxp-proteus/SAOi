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
      n              =  9        !  the number of design variables
      ni             =  0        !  the number of inequality constraints
      ne             =  6        !  the number of equality constraints
!
      x(1)           =  0.8d0    !  the starting point
      x(2)           =  0.8d0
      x(3)           =  0.2d0
      x(4)           =  0.2d0
      x(5)           =  1.0454d0
      x(6)           =  1.0454d0
      x(7)           =  1.0454d0
      x(8)           =  0.d0
      x(9)           =  0.d0
!
      x_lower(1)     = -1.d0     !  the lower bounds
      x_lower(2)     = -1.d0
      x_lower(3)     = -1.d0     
      x_lower(4)     = -1.d0
      x_lower(5)     = 0.90909d0     
      x_lower(6)     = 0.90909d0
      x_lower(7)     = 0.90909d0
      x_lower(8)     = -1.d0     
      x_lower(9)     = -1.d0
!
      x_upper(1)     =  3.d0     !  the upper bounds
      x_upper(2)     =  3.d0
      x_upper(3)     =  3.d0     
      x_upper(4)     =  3.d0
      x_upper(5)     =  1.0909d0     
      x_upper(6)     =  1.0909d0
      x_upper(7)     =  1.0909d0     
      x_upper(8)     =  3.d0
      x_upper(9)     =  3.d0
!
      eqn(1)         = .true.
      eqn(2)         = .true.
      eqn(3)         = .true. 
      eqn(4)         = .true.
      eqn(5)         = .true.
      eqn(6)         = .true. 
!
      cname1         = 'HOCK_107'   ! problem name; max 24 characters
!
!
!  specify a few OPTIONAL parameters - sometimes desirable
!
!     multimodal = .true.
!     finite_diff    =  .false.  ! use finite differences?
!     force_converge =  2        ! enforce local convergence? 0 = No; 1 through 3 = Yes (see manual)
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