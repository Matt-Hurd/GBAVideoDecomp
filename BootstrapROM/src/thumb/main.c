#include "gba/gba.h"

extern void SoftReset( u32 ResetFlags);
extern void safe_memcpy(char *a1, int a2, int a3);
extern int sub_8000540(char *a1, char *a2);
extern char *sub_8000520(char *a1, char *a2);
extern int sub_800043E(char *a1, int a2);
extern void sub_800033A(char *a1);

extern struct Unknown03007FE0 gUnknown03007FE0;

struct Unknown03007FE0 {
    char unused[0x18];
    uint16_t someField;
};

extern struct Unknown03007FF0 gUnknown03007FF0;

struct Unknown03007FF0 {
    char unused[0xa];
    char someField;
};

void sub_8000560()
{
  gUnknown03007FE0.someField = 1;
}

struct DMA3 {
    uint32_t source;
    uint32_t destination;
    uint32_t rest;
};

extern volatile struct DMA3 REG_DMA3;

int main()
{
  char *v0;
  unsigned int v1;
  int v4;
  char v3[4];

  int ret;

  REG_WAITCNT = 0x4014;
  v4 = -1;
  REG_DMA3.source = (uint32_t)&v4;
  REG_DMA3.destination = 0x6000000;
  REG_DMA3.rest = 0x85004B00;
  REG_DMA3.rest;
  sub_800033A(v3);
  v0 = sub_8000520(v3, "main.bin");
  v1 = sub_8000540(v3, "main.bin");
  safe_memcpy(v0, v1, 0x2000000);
  gUnknown03007FF0.someField = 1;
  SoftReset(226);
  ret = 0;
  sub_800043E(v3, 0);
  return ret;
}