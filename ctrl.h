! SAOi: 
! SAOi: Sat May 02 09:04:51 SAST 2009, Albert Groenwold, Stellenbosch
! SAOi: PRIVATE header.
! SAOi:
!


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!                                                                      !
!      This is a private SAOi file, do not edit this file. EVER. If    !
!      you really think you need to, send mail to albertg@sun.ac.za    !
!                                                                      !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
      include 'size.h'
!
      integer          nictrl, nlctrl, nrctrl, ncctrl
      parameter        (nictrl=50, nlctrl=50, nrctrl=50, ncctrl=50)
!
      integer          ictrl(nictrl)    !  array of private parameters
      logical          lctrl(nlctrl)    !  array of private parameters
      double precision rctrl(nrctrl)    !  array of private parameters
      character*24     cctrl(ncctrl)    !  array of private parameters
!
      integer approx_f                  !  ictrl(1)
      integer approx_c                  !  ictrl(2)
      integer force_converge            !  ictrl(3)
      integer subsolver                 !  ictrl(4)
      integer outermax                  !  ictrl(5)
      integer innermax                  !  ictrl(6)
      integer ksubmax                   !  ictrl(7)
      integer itglobalmax               !  ictrl(8)
      integer iprint                    !  ictrl(9)
      integer iaggressive               !  ictrl(10)
      integer structure                 !  ictrl(11)
      integer nprob                     !  ictrl(12)
      integer ifalk                     !  ictrl(13)
      integer iwolfe                    !  ictrl(14)
      integer n_lbfgs                   !  ictrl(15)
      integer cplex_method              !  ictrl(16)
      integer cplex_feas                !  ictrl(17)
      integer alg_unconstr              !  ictrl(18)
!     integer idum1                     !  ictrl(19) 
!     integer nadd                      !  ictrl(20)
!     integer idum2                     !  ictrl(21) 
      integer sph_dia_hess              !  ictrl(22) 
      integer current_mode_num          !  ictrl(23) 
      integer QPform_A                  !  ictrl(24)
      integer QPform_H                  !  ictrl(25)
!                                       !  current max is 50; last one is reserved ...
!
      logical convex                    !  lctrl(1)
      logical random_start              !  lctrl(2)
      logical finite_diff               !  lctrl(3)
      logical check_grad                !  lctrl(4)
      logical conservative              !  lctrl(5)
      logical trust_region              !  lctrl(6)
      logical unconstrained             !  lctrl(7)
      logical use_active_set            !  lctrl(8)
      logical allow_f                   !  lctrl(9)
      logical allow_c                   !  lctrl(10)
      logical classic_conserv           !  lctrl(11)
      logical classic_trust             !  lctrl(12)
      logical slack                     !  lctrl(13)
      logical relax                     !  lctrl(14)
      logical multimodal                !  lctrl(15)
      logical debug                     !  lctrl(16)
      logical special                   !  lctrl(17)
      logical calc_kkt                  !  lctrl(18)
      logical strict_struct             !  lctrl(19)
      logical mayStop                   !  lctrl(20)
!     logical ldum1                     !  lctrl(21)
      logical mayReturn                 !  lctrl(22)
      logical GetFinDiffGradHessDense   !  lctrl(23)
      logical FormHessSparse            !  lctrl(24)
      logical ResetDualVars             !  lctrl(25)
!                                       !  current max is 50; last one is reserved ...
!
      double precision big              !  rctrl(1)
      double precision xtol             !  rctrl(2)
      double precision ftol             !  rctrl(3)
      double precision feaslim          !  rctrl(4)
      double precision deltx            !  rctrl(5)
      double precision ci_slack         !  rctrl(6)
      double precision di_slack         !  rctrl(7)
      double precision actlim           !  rctrl(8)
      double precision tlimit           !  rctrl(9)
      double precision xtol_inf         !  rctrl(10)
      double precision rho_l_min        !  rctrl(11)
      double precision rho_l_max        !  rctrl(12)
      double precision biglam           !  rctrl(13)
      double precision kkt_tol          !  rctrl(14)
      double precision sfracmin         !  rctrl(15)
      double precision atol1            !  rctrl(16)
      double precision btol1            !  rctrl(17)
      double precision fapriori         !  rctrl(18)
      double precision atol2            !  rctrl(19)
      double precision btol2            !  rctrl(20)
      double precision filter_hi        !  rctrl(21)
      double precision pen1             !  rctrl(22)
      double precision pen2             !  rctrl(23)
      double precision dummy1           !  rctrl(24)
      double precision ymax             !  rctrl(25)
      double precision mma_lo           !  rctrl(26)
      double precision mma_hi           !  rctrl(27)
      double precision ptarget          !  rctrl(28)
      double precision tol_bayes        !  rctrl(29)
      double precision dml_infinity     !  rctrl(30)
      double precision rangemax         !  rctrl(31)
      double precision ztol             !  rctrl(32)
      double precision kkt_min          !  rctrl(33)
      double precision drand0           !  rctrl(34)
      double precision priv1            !  rctrl(35)
      double precision DualTrustRadius  !  rctrl(36)
!     double precision dmatengine       !  rctrl(37)
!     double precision rdum1            !  rctrl(38)
      double precision shift_tol        !  rctrl(39) 
      double precision deltxH           !  rctrl(40)
!                                       !  current max is 50; last one is reserved ...
!
      character*24 cname1               !  cctrl(1)
      character*24 cname2               !  cctrl(2)
!     character*24 func_f_name          !  cctrl(3)
!     character*24 grad_f_name          !  cctrl(4)
!     character*24 hess_f_name          !  cctrl(5)
!                                       !  current max is 50; last three are reserved ...
!