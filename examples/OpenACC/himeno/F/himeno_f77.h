C -*- mode:Fortran -*-  This line tells emacs which mode to use

      IMPLICIT REAL*4(a-h,o-z)
C
      PARAMETER (mimax=513,mjmax=257,mkmax=257)
C      PARAMETER (mimax=257,mjmax=129,mkmax=129)
C      PARAMETER (mimax=129,mjmax=65,mkmax=65)
C      PARAMETER (mimax=65,mjmax=33,mkmax=33)
C
CC Arrey
      common /pres/ p(mimax,mjmax,mkmax)
      common /mtrx/ a(mimax,mjmax,mkmax,4),
     +     b(mimax,mjmax,mkmax,3),c(mimax,mjmax,mkmax,3)
      common /bound/ bnd(mimax,mjmax,mkmax)
      common /work/ wrk1(mimax,mjmax,mkmax),wrk2(mimax,mjmax,mkmax)
CC Other constants
      common /others/ imax,jmax,kmax,omega
