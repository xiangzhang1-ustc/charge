SUBROUTINE READRHO
! THIS FILE IS PART OF THE VASPKIT PACKAGE.
! COPYRIGHT (C) 2014 V. WANG
! THIS FILE IS DISTRIBUTED UNDER THE TERMS OF THE GNU GENERAL PUBLIC LICENSE
  USE MODULE 
  IMPLICIT NONE
  INTEGER :: I,J,K
  CALL READPOS
  READ(11,*)    
  READ(11,*) NGX,NGY,NGZ

! READ CHARGE DENSITY
  ALLOCATE(CHGRHO(NGX,NGY,NGZ))
  IF (TAG.EQ.31 .OR. TAG.EQ.34 .OR. TAG.EQ.41) THEN
     PROGRESS='Reading Charge Density From '//TRIM(ADJUSTL(INFILE))//' File...'
     CALL READPRT
     READ(11,*) (((CHGRHO(I,J,K),I=1,NGX),J=1,NGY),K=1,NGZ)
     CLOSE(11)
  ELSEIF (TAG.EQ.32 .OR. TAG.EQ.33 .OR. TAG.EQ.35) THEN
     ALLOCATE(SPINRHO(NGX,NGY,NGZ))
     READ(11,*) (((CHGRHO(I,J,K),I=1,NGX),J=1,NGY),K=1,NGZ)
! READ SPIN DENSITY
     PROGRESS='Reading Spin Density From '//TRIM(ADJUSTL(INFILE))//' File...'
     CALL READPRT
     READ(11,*)
     READ(11,*) (((SPINRHO(I,J,K),I=1,NGX),J=1,NGY),K=1,NGZ)
     CLOSE(11)
! READ POTENTIAL FORM LOCPOT
  ELSEIF (TAG.EQ.42 ) THEN
     ALLOCATE(ELECTPOT(NGX,NGY,NGZ))
     PROGRESS='Reading Local Potential From '//TRIM(ADJUSTL(INFILE))//' File...'
     CALL READPRT
     READ(11,*) (((ELECTPOT(I,J,K),I=1,NGX),J=1,NGY),K=1,NGZ)
     CLOSE(11)
  END IF
  RETURN
END SUBROUTINE 