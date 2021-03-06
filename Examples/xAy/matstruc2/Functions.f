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
!  functions c(j), j=1,m                                              !
!                                                                      !
!  Please see the users manual for type declarations and comments      !
!                                                                      !
!----------------------------------------------------------------------!
      implicit          none
      include           'ctrl.h'
      logical           eqn(*), lin(*)
      integer           i, j, k, l, n, m, p, d, e, ni, ne, k1
      integer           allocatestatus
      double precision  f, x(n), c(m), r1, r2
      double precision, dimension(:),    allocatable :: xs, mode, temp
      double precision, dimension(:, :), allocatable :: toeplitz, xx
!
      k = iuser(1)  !  problem specific - number of requested eigen values
      p = iuser(2)  !  problem specific - length of each eigen vector column  
!
      allocate ( xs(p), stat = allocatestatus)
      if (allocatestatus /= 0) 
     &          STOP " not enough memory to allocate xs"
!
      allocate ( temp(p), stat = allocatestatus)
      if (allocatestatus /= 0) 
     &          STOP " not enough memory to allocate temp"
!
      allocate ( mode(p), stat = allocatestatus)
      if (allocatestatus /= 0) 
     &          STOP " not enough memory to allocate mode"
!
      allocate ( xx(p, k), stat = allocatestatus)
      if (allocatestatus /= 0) 
     &          STOP " not enough memory to allocate xx"
!
      allocate ( toeplitz(p, p), stat = allocatestatus)
      if (allocatestatus /= 0) 
     &          STOP " not enough memory to allocate toeplitz"
!
      xs = (/ 4.d0, 1.d0, 0.d0, 0.d0, 0.d0 /)
!
      do i = 1,p
        toeplitz(i,i:p) = xs(1:(p+1-i))
        toeplitz(i:p,i) = xs(1:(p+1-i))
      end do  
!      
!       do i=1,p 
!         write(*,*) i,(toeplitz(i,j),j=1,p)
!       enddo
!       stop
!
!  Construct k eigenvectors in xx from the single design variable array x
!
      do l = 1,k
        xx(:,l) = x((l-1)*p+1:l*p)
      enddo
!
!  Construct objective
!
      f = 0.d0
!
      do l = 1,k
        mode(:) = xx(:,l) 
        temp = matmul(toeplitz,mode)           ! toeplitz * mode 
        f = f - dot_product(temp,mode)*dble(k+100*l-100) ! maximize weighted objectve: mode' * toeplitz * mode * weight 
      enddo 
!
!  Construct constraints
!
      c = 0.d0
!
!  Enforce off-diagonal terms = 0
!       
      i=0 
      do l=1,k-1
        mode(:) = xx(:,l)
        do d = l+1,k
          i = i+1
          temp(:) = xx(:,d)
          c(i) = dot_product(mode,temp)
        enddo  
      enddo  
!
!  Enforce diagonal terms - 1 = 0
!
      k1=k*(k-1)/2
      do i=1,k
        mode(:) = xx(:,i)
        c(i+k1) = dot_product(mode,mode) - 1.d0 
      enddo      
!            
!  Deallocate some stuff here ...
!
      return
      end subroutine SAOi_funcs
