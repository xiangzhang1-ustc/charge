SUBROUTINE FREEMEMORY
! COPYRIGHT (C) 2014 V. WANG
! THIS FILE IS DISTRIBUTED UNDER THE TERMS OF THE GNU GENERAL PUBLIC LICENSE.
! SEE THE FILE COPYING FOR LICENSE DETAILS.
USE MODULE
  IMPLICIT NONE
  IF (ALLOCATED(NATOMS)) DEALLOCATE(NATOMS)
  IF (ALLOCATED(ATOMPOS)) DEALLOCATE(ATOMPOS)
  IF (ALLOCATED(ATOMNUM)) DEALLOCATE(ATOMNUM)
  IF (ALLOCATED(ATOMPOS_CART)) DEALLOCATE(ATOMPOS_CART)
  IF (ALLOCATED(ATOMSYMBOL)) DEALLOCATE(ATOMSYMBOL)
  IF (ALLOCATED(CHGRHO)) DEALLOCATE(CHGRHO)
  IF (ALLOCATED(SPINRHO)) DEALLOCATE(SPINRHO)
  IF (ALLOCATED(ELECTPOT)) DEALLOCATE(ELECTPOT)
  IF (ALLOCATED(PLANARAVG)) DEALLOCATE(PLANARAVG)
  IF (ALLOCATED(ALLDOS)) DEALLOCATE(ALLDOS)
  IF (ALLOCATED(INTDOS)) DEALLOCATE(INTDOS)
  if(allocated(level))deallocate(level)
  if(allocated(kmesh))deallocate(kmesh)
  if(allocated(kstep))deallocate(kstep)
  if(allocated(band_weight))deallocate(band_weight)
  RETURN
END SUBROUTINE