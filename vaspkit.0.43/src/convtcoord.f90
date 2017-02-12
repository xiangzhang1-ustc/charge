SUBROUTINE CONVTCOORD
! THIS FILE IS PART OF THE VASPKIT PACKAGE.
! COPYRIGHT (C) 2014 V. WANG
! THIS FILE IS DISTRIBUTED UNDER THE TERMS OF THE GNU GENERAL PUBLIC LICENSE
  USE MODULE
  IMPLICIT NONE
  INTEGER :: I,J,K
  CHARACTER(LEN=2):: SUFFIX

  IF (FORMT .EQ. 2) THEN  
     SUFFIX='_D'
  ELSEIF (FORMT .EQ. 1) THEN
     SUFFIX='_C' 
  END IF
 
  OPEN(UNIT=16,FILE=TRIM(ADJUSTL(INFILE))//TRIM(SUFFIX))
  WRITE(16,*) TRIM(ADJUSTL(TITLE))
  WRITE(16,'(F8.3)') SCALING 
  WRITE(16,'(3F20.12)') ((REALVECTOR(I,J),J=1,3),I=1,3)

  IF (VASP5 .EQV. .TRUE. ) THEN
     WRITE(16,'(10A5)') (ATOMSYMBOL(I),I=1,ATOMTYPE) 
  END IF

  WRITE(16,'(20I5)') (NATOMS(I),I=1,ATOMTYPE)  

  IF (FORMT .EQ. 1) THEN
     WRITE(16,'(A9)') 'CARTESIAN'
     K=1
     DO I=1, ATOMTYPE
        DO J=1, NATOMS(I)  
           WRITE(16,'(3F16.9,A5)') ATOMPOS_CART(K,:), ATOMSYMBOL(I)
           K=K+1
        ENDDO
      ENDDO 
  ELSEIF (FORMT .EQ. 2) THEN
     WRITE(16,'(A6)') 'DIRECT'
     K=1
     DO I=1, ATOMTYPE
        DO J=1, NATOMS(I)  
           WRITE(16,'(3F16.9,A5)') ATOMPOS(K,:), ATOMSYMBOL(I)
           K=K+1
        ENDDO
      ENDDO 
  ENDIF

  PROGRESS='Written '//TRIM(ADJUSTL(INFILE))//SUFFIX//' File!'
  CALL READPRT
  CLOSE(16)
RETURN
END SUBROUTINE
