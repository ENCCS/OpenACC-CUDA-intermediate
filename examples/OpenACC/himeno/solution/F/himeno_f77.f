C*********************************************************************
C
C This benchmark test program is measuring a cpu performance
C of floating point operation by a Poisson equation solver.
CC
C If you have any question, please ask me via email.
C written by Ryutaro HIMENO, November 26, 2001.
C Version 3.0
C ----------------------------------------------
C Ryutaro Himeno, Dr. of Eng.
C Head of Computer Information Division,
C RIKEN (The Institute of Pysical and Chemical Research)
C Email : himeno@postman.riken.go.jp
C ---------------------------------------------------------------
C You can adjust the size of this benchmark code to fit your target
C computer. In that case, please chose following sets of
C (mimax,mjmax,mkmax):
C small : 65,33,33
C small : 129,65,65
C midium: 257,129,129
C large : 513,257,257
C ext.large: 1025,513,513
C This program is to measure a computer performance in MFLOPS
C by using a kernel which appears in a linear solver of pressure
C Poisson eq. which appears in an incompressible Navier-Stokes solver.
C A point-Jacobi method is employed in this solver as this method can 
C be easyly vectrized and be parallelized.
C ------------------
C Finite-difference method, curvilinear coodinate system
C Vectorizable and parallelizable on each grid point
C No. of grid points : imax x jmax x kmax including boundaries
C ------------------
C A,B,C:coefficient matrix, wrk1: source term of Poisson equation
C wrk2 : working area, OMEGA : relaxation parameter
C BND:control variable for boundaries and objects ( = 0 or 1)
C P: pressure
C -------------------

      INCLUDE "himeno_f77.h"
C
C     ttarget specifys the measuring period in sec
	PARAMETER (ttarget=60.0)

      REAL*8 cpu,cpu0,cpu1,gettime
      EXTERNAL gettime

      omega=0.8
      imax=mimax-1
      jmax=mjmax-1
      kmax=mkmax-1
CC Initializing matrixes
      call initmt
      write(*,*) ' mimax=',mimax,' mjmax=',mjmax,' mkmax=',mkmax
      write(*,*) ' imax=',imax,' jmax=',jmax,' kmax=',kmax
CC Start measuring
C
      nn=3
      write(*,*) ' Start rehearsal measurement process.'
      write(*,*) ' Measure the performance in 3 times.'
C
      cpu0=gettime()
C
C Jacobi iteration
      call jacobi(nn,gosa)
C
      cpu1= gettime()
      cpu = cpu1-cpu0
      flop=real(kmax-2)*real(jmax-2)*real(imax-2)*34.0*real(nn)
      xmflops2=flop/cpu*1.0e-6
      write(*,*) ' Gosa :',gosa
      write(*,*) '  MFLOPS:',xmflops2,'  time(s):',cpu
C
C     end the test loop

C AH: This estimate is now used to choose a number of iterations for the 
C     main performance measurement (aiming to take around a minute)
      nn=int(ttarget/(cpu/3.0))
      write(*,*) 'Now, start the actual measurement process.'
      write(*,*) 'The loop will be excuted in',nn,' times.'
      write(*,*) 'This will take about one minute.'
      write(*,*) 'Wait for a while.'
C
C Jacobi iteration
      cpu0=gettime()
      call jacobi(nn,gosa)
C
      cpu1= gettime()
      cpu = cpu1-cpu0
      flop=real(kmax-2)*real(jmax-2)*real(imax-2)*34.0*real(nn)
      xmflops2=flop*1.0e-6/cpu
C
CCC      xmflops2=nflop/cpu*1.0e-6*float(nn)
C
      write(*,*) ' Loop executed for ',nn,' times'
      write(*,*) ' Gosa :',gosa
      write(*,*) ' MFLOPS:',xmflops2, '  time(s):',cpu
      score=xmflops2/82.84
      write(*,*) ' Score based on Pentium III 600MHz :',score
C
c      pause
c      stop
      END
C
C
C**************************************************************
      subroutine initmt
C**************************************************************
      
      INCLUDE "himeno_f77.h"

C TODO: Implement data initialization with OpenACC on device
  
C TODO: Implement computation with OpenACC on device

      do k=1,mkmax
         do j=1,mjmax
            do i=1,mimax
               a(i,j,k,1)=0.0
               a(i,j,k,2)=0.0
               a(i,j,k,3)=0.0
               a(i,j,k,4)=0.0
               b(i,j,k,1)=0.0
               b(i,j,k,2)=0.0
               b(i,j,k,3)=0.0
               c(i,j,k,1)=0.0
               c(i,j,k,2)=0.0
               c(i,j,k,3)=0.0
               p(i,j,k) =0.0
               wrk1(i,j,k)=0.0   
               bnd(i,j,k)=0.0 
            enddo
         enddo
      enddo
C
      do k=1,kmax
         do j=1,jmax
            do i=1,imax
               a(i,j,k,1)=1.0
               a(i,j,k,2)=1.0
               a(i,j,k,3)=1.0
               a(i,j,k,4)=1.0/6.0
               b(i,j,k,1)=0.0
               b(i,j,k,2)=0.0
               b(i,j,k,3)=0.0
               c(i,j,k,1)=1.0
               c(i,j,k,2)=1.0
               c(i,j,k,3)=1.0
               p(i,j,k) =float((k-1)*(k-1))/float((kmax-1)*(kmax-1))
               wrk1(i,j,k)=0.0
               bnd(i,j,k)=1.0
            enddo
         enddo
      enddo
C
      return
      end
C
C*************************************************************
      subroutine jacobi(nn,gosa)
C*************************************************************

      INCLUDE "himeno_f77.h"

C TODO: Implement data initialization with OpenACC on device
  
      DO loop=1,nn
         gosa=0.0
C
C TODO: Implement computation with OpenACC on device
         gosa1= 0.0
         DO K=2,kmax-1
            DO J=2,jmax-1
               DO I=2,imax-1
                  S0=a(I,J,K,1)*p(I+1,J,K)+a(I,J,K,2)*p(I,J+1,K)
     1                 +a(I,J,K,3)*p(I,J,K+1)
     2                 +b(I,J,K,1)*(p(I+1,J+1,K)-p(I+1,J-1,K)
     3                 -p(I-1,J+1,K)+p(I-1,J-1,K))
     4                 +b(I,J,K,2)*(p(I,J+1,K+1)-p(I,J-1,K+1)
     5                 -p(I,J+1,K-1)+p(I,J-1,K-1))
     6                 +b(I,J,K,3)*(p(I+1,J,K+1)-p(I-1,J,K+1)
     7                 -p(I+1,J,K-1)+p(I-1,J,K-1))
     8                 +c(I,J,K,1)*p(I-1,J,K)+c(I,J,K,2)*p(I,J-1,K)
     9                 +c(I,J,K,3)*p(I,J,K-1)+wrk1(I,J,K)
                  SS=(S0*a(I,J,K,4)-p(I,J,K))*bnd(I,J,K)
                  GOSA1=GOSA1+SS*SS
                  wrk2(I,J,K)=p(I,J,K)+OMEGA *SS
               enddo
            enddo
         enddo

C TODO: Implement computation with OpenACC on device
         DO K=2,kmax-1
            DO J=2,jmax-1
               DO I=2,imax-1
                  p(I,J,K)=wrk2(I,J,K)
               enddo
            enddo
         enddo

         gosa= gosa + gosa1

C
      enddo

      return
      end

C*************************************************************

C AH: Added this function to provide timing.
C     It uses Fortran90.

C*************************************************************
      function gettime() result(rtime)
C*************************************************************

      implicit none

      integer(kind=selected_int_kind(18)) :: ic,ir,im
      real(kind=8) :: rtime

      call system_clock(ic,ir,im)

      rtime= real(ic,8)/real(ir,8)

      end function 
