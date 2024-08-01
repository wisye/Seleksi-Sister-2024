
void FUN_004010c0(void)

{
  int iVar1;
  int *unaff_RBX;
  int *piVar2;
  long unaff_R13;
  
  if ((*(byte *)(unaff_R13 + 1) & 0x80) == 0) {
    piVar2 = *(int **)(unaff_R13 + 0x88);
    iVar1 = piVar2[1];
    if (DAT_004c6098 == '\0') goto LAB_004010f1;
    if (iVar1 != 0) goto LAB_00401109;
    *(undefined8 *)(piVar2 + 2) = 0;
    *piVar2 = 0;
  }
  do {
    while( true ) {
      piVar2 = unaff_RBX;
      iVar1 = FUN_00492c20();
LAB_004010f1:
      if (iVar1 != 0) break;
      *(undefined8 *)(piVar2 + 2) = 0;
      LOCK();
      iVar1 = *piVar2;
      *piVar2 = 0;
      UNLOCK();
      if (1 < iVar1) {
        FUN_00419e20();
      }
    }
LAB_00401109:
    piVar2[1] = iVar1 + -1;
  } while( true );
}