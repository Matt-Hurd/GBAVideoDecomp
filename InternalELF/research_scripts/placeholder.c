struct_result *__fastcall sub_9001CA4(struct_result *result, int a2)
{
  int maybeRemainingBytes; // lr
  int v3; // lr
  int dword8; // r6
  unsigned int v5; // r7
  unsigned __int8 *data; // r10
  unsigned int dword30; // r11
  unsigned int dword34; // r12
  int *v9; // r9
  int dword38; // r5
  unsigned int v11; // lr
  unsigned __int8 *destination; // r8
  unsigned __int8 *v13; // r0
  int v14; // r3
  unsigned int v15; // r2
  int v16; // t1
  bool v17; // cf
  int v18; // t1
  unsigned __int8 *v19; // r0
  int v20; // lr
  unsigned int v21; // r4
  unsigned int v22; // r1
  int v23; // r3
  int v24; // r1
  int v25; // r3
  unsigned int v26; // r2
  int v27; // t1
  char v28; // cf
  int v29; // t1
  int v30; // r1
  int v31; // r3
  unsigned int v32; // r2
  int v33; // t1
  char v34; // cf
  int v35; // t1
  unsigned int i; // r1
  int v37; // r1
  int v38; // r3
  unsigned int v39; // r2
  int v40; // t1
  char v41; // cf
  int v42; // t1
  unsigned int v43; // lr
  unsigned __int16 *v44; // r0
  _WORD *v45; // r1
  int v46; // r3
  unsigned int v47; // r2
  unsigned int v48; // r11
  int v49; // t1
  char v50; // cf
  int v51; // t1
  _WORD *v52; // r1
  int v53; // r3
  unsigned int v54; // r2
  unsigned int v55; // r11
  int v56; // t1
  char v57; // cf
  int v58; // t1
  unsigned __int8 *v59; // r0
  int v60; // r3
  unsigned int v61; // r2
  int v62; // t1
  char v63; // cf
  int v64; // t1
  int v65; // lr
  int v66; // lr
  int v67; // r0
  unsigned int v68; // lr
  _WORD *v69; // r1
  int v70; // r3
  unsigned int v71; // r2
  int v72; // t1
  char v73; // cf
  int v74; // t1
  int v75; // r0
  _WORD *v76; // r1
  int v77; // r3
  unsigned int v78; // r2
  int v79; // t1
  char v80; // cf
  int v81; // t1
  int v82; // r1
  int v83; // r2
  int v84; // r3
  unsigned __int8 *v85; // r0
  int v86; // r3
  unsigned int v87; // r2
  int v88; // t1
  char v89; // cf
  int v90; // t1
  unsigned int v91; // r0
  unsigned int kk; // r1
  int v93; // r1
  int v94; // r3
  unsigned int v95; // r2
  int v96; // t1
  char v97; // cf
  int v98; // t1
  unsigned int v99; // r1
  int v100; // r3
  unsigned int v101; // r2
  int v102; // t1
  char v103; // cf
  int v104; // t1
  unsigned int v105; // r0
  unsigned int jj; // r1
  int v107; // r1
  int v108; // r3
  unsigned int v109; // r2
  int v110; // t1
  char v111; // cf
  int v112; // t1
  unsigned __int8 *v113; // r0
  unsigned int ii; // r1
  int v115; // r1
  int v116; // r3
  unsigned int v117; // r2
  int v118; // t1
  char v119; // cf
  int v120; // t1
  int v121; // lr
  int v122; // lr
  int v123; // r1
  int v124; // r2
  int v125; // lr
  unsigned __int8 *v126; // r0
  int v127; // r3
  unsigned int v128; // r2
  int v129; // t1
  char v130; // cf
  int v131; // t1
  unsigned int v132; // r0
  unsigned int m; // r1
  int v134; // r1
  int v135; // r3
  unsigned int v136; // r2
  int v137; // t1
  char v138; // cf
  int v139; // t1
  int v140; // r3
  unsigned int v141; // r2
  int v142; // t1
  char v143; // cf
  int v144; // t1
  unsigned int v145; // r0
  unsigned int k; // r1
  int v147; // r1
  int v148; // r3
  unsigned int v149; // r2
  int v150; // t1
  char v151; // cf
  int v152; // t1
  unsigned __int8 *v153; // r0
  unsigned int j; // r1
  int v155; // r1
  int v156; // r3
  unsigned int v157; // r2
  int v158; // t1
  char v159; // cf
  int v160; // t1
  unsigned __int8 *v161; // r0
  unsigned int n; // r2
  int v163; // r2
  int v164; // r4
  unsigned int v165; // r3
  int v166; // t1
  char v167; // cf
  int v168; // t1
  unsigned int v169; // r2
  unsigned int v170; // r7
  int v171; // r4
  int v172; // r5
  int v173; // r0
  int v174; // r5
  unsigned __int8 *v175; // r8
  unsigned int v176; // r0
  unsigned int v177; // r3
  int v178; // r0
  int v179; // r2
  unsigned int v180; // r1
  int v181; // t1
  char v182; // cf
  int v183; // t1
  unsigned int v184; // r5
  int v185; // r1
  unsigned int v186; // r3
  int v187; // t1
  unsigned int v188; // r5
  unsigned __int8 *v189; // r8
  unsigned int v190; // r0
  unsigned int v191; // r3
  int v192; // r0
  int v193; // r2
  unsigned int v194; // r1
  int v195; // t1
  char v196; // cf
  int v197; // t1
  unsigned int v198; // r1
  unsigned int v199; // lr
  unsigned int v200; // r3
  int v201; // r2
  bool v202; // vf
  struct_result *v203; // [sp+0h] [bp-30h]
  unsigned __int8 *v204; // [sp+4h] [bp-2Ch]

  v203 = result;
  maybeRemainingBytes = result->maybeRemainingBytes;
  if ( maybeRemainingBytes > 0 )
  {
    v3 = maybeRemainingBytes & 0x7FFFF | 0x80000;
    dword8 = result->dword8;
    v5 = (result->maybeParsedBytes << 15) | 0x2000;
    data = result->data;
    dword30 = result->dword30;
    dword34 = result->dword34;
    if ( result->byte58 )
      v5 = (result->maybeParsedBytes << 15) | 0x3000;
    v9 = result->int3C;
    dword38 = result->dword38;
    v11 = v3 + (result->unsigned___int859 << 20) + (result->dword54 << 28);
    destination = result->destination;
    v204 = &data[a2];
    while ( 1 )
    {
      while ( 1 )
      {
        while ( 1 )
        {
          if ( *(_DWORD *)off_9002ADC == 1 || data >= v204 )
          {
// _loc_8053C70:
            result = v203;
            v203->maybeParsedBytes = v5 >> 15;
            v203->data = data;
            v203->dword30 = dword30;
            v203->dword34 = dword34;
            v203->maybeRemainingBytes = (int)(v11 << 13) >> 13;
            v203->byte58 = (v5 & 0x1000) != 0;
            v203->dword54 = v11 >> 28;
            v203->dword38 = dword38;
            v203->unsigned___int859 = (v11 & 0xFF00000) >> 20;
            return result;
          }
          v13 = &destination[32 * (v11 >> 28) + ((v5 & 0x18000) >> 14)];
          v14 = *(unsigned __int16 *)v13;
          v15 = v14 * (dword30 >> 11);
          if ( dword34 >= v15 )
          {
            dword30 -= v15;
            dword34 -= v15;
            *(_WORD *)v13 -= *(_WORD *)v13 >> 5;
            if ( dword30 < 0x1000000 )
            {
              dword30 <<= 8;
              v18 = *data++;
              dword34 = v18 + (dword34 << 8);
            }
            v17 = 1;
          }
          else
          {
            dword30 = v14 * (dword30 >> 11);
            *(_WORD *)v13 = v14 + ((unsigned int)(2048 - v14) >> 5);
            if ( dword30 < 0x1000000 )
            {
              dword30 <<= 8;
              v16 = *data++;
              dword34 = v16 + (dword34 << 8);
            }
            v17 = 0;
          }
          if ( v17 )
            break;
          v19 = destination + 3692;
          if ( v11 >= 0x40000000 )
          {
            if ( v11 >= 0xA0000000 )
              v20 = v11 - 0x60000000;
            else
              v20 = v11 - 0x30000000;
          }
          else
          {
            v20 = v11 & 0xFFFFFFF;
          }
          if ( (v5 & 0x1000) != 0 )
          {
            v21 = *(unsigned __int8 *)(dword8 + ((v5 - (dword38 << 15)) >> 15));
            v22 = 1;
            while ( 1 )
            {
              v23 = (v21 & 0x80) + 128;
              v24 = 2 * v22 + 4 * v23;
              v21 = (2 * v21) & 0x7FFFFFFF | (v23 << 23);
              v25 = *(unsigned __int16 *)&v19[v24];
              v26 = v25 * (dword30 >> 11);
              if ( dword34 >= v26 )
              {
                dword30 -= v26;
                dword34 -= v26;
                *(_WORD *)&v19[v24] -= *(_WORD *)&v19[v24] >> 5;
                if ( dword30 < 0x1000000 )
                {
                  dword30 <<= 8;
                  v29 = *data++;
                  dword34 = v29 + (dword34 << 8);
                }
                v28 = 1;
              }
              else
              {
                dword30 = v25 * (dword30 >> 11);
                *(_WORD *)&v19[v24] = v25 + ((unsigned int)(2048 - v25) >> 5);
                if ( dword30 < 0x1000000 )
                {
                  dword30 <<= 8;
                  v27 = *data++;
                  dword34 = v27 + (dword34 << 8);
                }
                v28 = 0;
              }
              v22 = v28 + (v24 & 0xFFFFF9FF);
              if ( ((v22 ^ (v21 >> 31)) & 1) != 0 )
                break;
              if ( v22 >= 0x100 )
                goto _loc_80530EC;
            }
            while ( v22 < 0x100 )
            {
              v30 = 2 * v22;
              v31 = *(unsigned __int16 *)&v19[v30];
              v32 = v31 * (dword30 >> 11);
              if ( dword34 >= v32 )
              {
                dword30 -= v32;
                dword34 -= v32;
                *(_WORD *)&v19[v30] -= *(_WORD *)&v19[v30] >> 5;
                if ( dword30 < 0x1000000 )
                {
                  dword30 <<= 8;
                  v35 = *data++;
                  dword34 = v35 + (dword34 << 8);
                }
                v34 = 1;
              }
              else
              {
                dword30 = v31 * (dword30 >> 11);
                *(_WORD *)&v19[v30] = v31 + ((unsigned int)(2048 - v31) >> 5);
                if ( dword30 < 0x1000000 )
                {
                  dword30 <<= 8;
                  v33 = *data++;
                  dword34 = v33 + (dword34 << 8);
                }
                v34 = 0;
              }
              v22 = v34 + v30;
            }
// _loc_80530EC:
            v22 = (unsigned __int8)v22;
            v5 &= ~0x1000u;
          }
          else
          {
            for ( i = 1; i < 0x100; i = v41 + v37 )
            {
              v37 = 2 * i;
              v38 = *(unsigned __int16 *)&v19[v37];
              v39 = v38 * (dword30 >> 11);
              if ( dword34 >= v39 )
              {
                dword30 -= v39;
                dword34 -= v39;
                *(_WORD *)&v19[v37] -= *(_WORD *)&v19[v37] >> 5;
                if ( dword30 < 0x1000000 )
                {
                  dword30 <<= 8;
                  v42 = *data++;
                  dword34 = v42 + (dword34 << 8);
                }
                v41 = 1;
              }
              else
              {
                dword30 = v38 * (dword30 >> 11);
                *(_WORD *)&v19[v37] = v38 + ((unsigned int)(2048 - v38) >> 5);
                if ( dword30 < 0x1000000 )
                {
                  dword30 <<= 8;
                  v40 = *data++;
                  dword34 = v40 + (dword34 << 8);
                }
                v41 = 0;
              }
            }
            v22 = i & 0xFFFFFEFF;
          }
          v43 = v20 & 0xF00FFFFF | (v22 << 20);
          *(_BYTE *)(dword8 + (v5 >> 15)) = v22;
          v5 += 0x8000;
          v202 = __OFSUB__(v43, 1);
          v11 = v43 - 1;
          if ( ((v11 & 0x40000) != 0) ^ v202 | (v11 << 13 == 0) )
            goto _loc_8053C70;
        }
        v5 |= 0x1000u;
        v44 = (unsigned __int16 *)&destination[2 * (v11 >> 28)];
        v45 = v44 + 192;
        v46 = v44[192];
        v47 = v46 * (dword30 >> 11);
        if ( dword34 >= v47 )
        {
          v48 = dword30 - v47;
          dword34 -= v47;
          *v45 = v44[192] - (v44[192] >> 5);
          if ( v48 < 0x1000000 )
          {
            v48 <<= 8;
            v51 = *data++;
            dword34 = v51 + (dword34 << 8);
          }
          v50 = 1;
        }
        else
        {
          v48 = v46 * (dword30 >> 11);
          *v45 = v46 + ((unsigned int)(2048 - v46) >> 5);
          if ( v48 < 0x1000000 )
          {
            v48 <<= 8;
            v49 = *data++;
            dword34 = v49 + (dword34 << 8);
          }
          v50 = 0;
        }
        if ( v50 )
          break;
        v123 = *v9;
        v124 = v9[1];
        *v9 = dword38;
        v9[1] = v123;
        v9[2] = v124;
        v17 = v11 >= 0x70000000;
        v125 = v11 & 0xFFFFFFF;
        if ( v17 )
          v122 = v125 - 0x60000000;
        else
          v122 = v125 + 0x70000000;
        v126 = destination + 1636;
        v127 = *((unsigned __int16 *)destination + 818);
        v128 = v127 * (v48 >> 11);
        if ( dword34 >= v128 )
        {
          dword30 = v48 - v128;
          dword34 -= v128;
          *(_WORD *)v126 = *((_WORD *)destination + 818) - (*((_WORD *)destination + 818) >> 5);
          if ( dword30 < 0x1000000 )
          {
            dword30 <<= 8;
            v131 = *data++;
            dword34 = v131 + (dword34 << 8);
          }
          v130 = 1;
        }
        else
        {
          dword30 = v127 * (v48 >> 11);
          *(_WORD *)v126 = v127 + ((unsigned int)(2048 - v127) >> 5);
          if ( dword30 < 0x1000000 )
          {
            dword30 <<= 8;
            v129 = *data++;
            dword34 = v129 + (dword34 << 8);
          }
          v130 = 0;
        }
        if ( v130 )
        {
          v140 = *((unsigned __int16 *)destination + 819);
          v141 = v140 * (dword30 >> 11);
          if ( dword34 >= v141 )
          {
            dword30 -= v141;
            dword34 -= v141;
            *((_WORD *)destination + 819) -= *((_WORD *)destination + 819) >> 5;
            if ( dword30 < 0x1000000 )
            {
              dword30 <<= 8;
              v144 = *data++;
              dword34 = v144 + (dword34 << 8);
            }
            v143 = 1;
          }
          else
          {
            dword30 = v140 * (dword30 >> 11);
            *((_WORD *)destination + 819) = v140 + ((unsigned int)(2048 - v140) >> 5);
            if ( dword30 < 0x1000000 )
            {
              dword30 <<= 8;
              v142 = *data++;
              dword34 = v142 + (dword34 << 8);
            }
            v143 = 0;
          }
          if ( v143 )
          {
            v153 = destination + 2152;
            for ( j = 1; j < 0x100; j = v159 + v155 )
            {
              v155 = 2 * j;
              v156 = *(unsigned __int16 *)&v153[v155];
              v157 = v156 * (dword30 >> 11);
              if ( dword34 >= v157 )
              {
                dword30 -= v157;
                dword34 -= v157;
                *(_WORD *)&v153[v155] -= *(_WORD *)&v153[v155] >> 5;
                if ( dword30 < 0x1000000 )
                {
                  dword30 <<= 8;
                  v160 = *data++;
                  dword34 = v160 + (dword34 << 8);
                }
                v159 = 1;
              }
              else
              {
                dword30 = v156 * (dword30 >> 11);
                *(_WORD *)&v153[v155] = v156 + ((unsigned int)(2048 - v156) >> 5);
                if ( dword30 < 0x1000000 )
                {
                  dword30 <<= 8;
                  v158 = *data++;
                  dword34 = v158 + (dword34 << 8);
                }
                v159 = 0;
              }
            }
            v99 = (j & 0xFFFFFEFF) + 16;
          }
          else
          {
            v145 = (unsigned int)&v126[16 * ((v5 & 0x18000) >> 15) + 260];
            for ( k = 1; k < 8; k = v151 + v147 )
            {
              v147 = 2 * k;
              v148 = *(unsigned __int16 *)(v145 + v147);
              v149 = v148 * (dword30 >> 11);
              if ( dword34 >= v149 )
              {
                dword30 -= v149;
                dword34 -= v149;
                *(_WORD *)(v145 + v147) -= *(_WORD *)(v145 + v147) >> 5;
                if ( dword30 < 0x1000000 )
                {
                  dword30 <<= 8;
                  v152 = *data++;
                  dword34 = v152 + (dword34 << 8);
                }
                v151 = 1;
              }
              else
              {
                dword30 = v148 * (dword30 >> 11);
                *(_WORD *)(v145 + v147) = v148 + ((unsigned int)(0x800 - v148) >> 5);
                if ( dword30 < 0x1000000 )
                {
                  dword30 <<= 8;
                  v150 = *data++;
                  dword34 = v150 + (dword34 << 8);
                }
                v151 = 0;
              }
            }
            v99 = (k & 0xFFFFFFF7) + 8;
          }
        }
        else
        {
          v132 = (unsigned int)&v126[16 * ((v5 & 0x18000) >> 15) + 4];
          for ( m = 1; m < 8; m = v138 + v134 )
          {
            v134 = 2 * m;
            v135 = *(unsigned __int16 *)(v132 + v134);
            v136 = v135 * (dword30 >> 11);
            if ( dword34 >= v136 )
            {
              dword30 -= v136;
              dword34 -= v136;
              *(_WORD *)(v132 + v134) -= *(_WORD *)(v132 + v134) >> 5;
              if ( dword30 < 0x1000000 )
              {
                dword30 <<= 8;
                v139 = *data++;
                dword34 = v139 + (dword34 << 8);
              }
              v138 = 1;
            }
            else
            {
              dword30 = v135 * (dword30 >> 11);
              *(_WORD *)(v132 + v134) = v135 + ((unsigned int)(0x800 - v135) >> 5);
              if ( dword30 < 0x1000000 )
              {
                dword30 <<= 8;
                v137 = *data++;
                dword34 = v137 + (dword34 << 8);
              }
              v138 = 0;
            }
          }
          v99 = m & 0xFFFFFFF7;
        }
        if ( v99 >= 4 )
          v161 = destination + 1248;
        else
          v161 = &destination[128 * v99 + 864];
        for ( n = 1; n < 0x40; n = v167 + v163 )
        {
          v163 = 2 * n;
          v164 = *(unsigned __int16 *)&v161[v163];
          v165 = v164 * (dword30 >> 11);
          if ( dword34 >= v165 )
          {
            dword30 -= v165;
            dword34 -= v165;
            *(_WORD *)&v161[v163] -= *(_WORD *)&v161[v163] >> 5;
            if ( dword30 < 0x1000000 )
            {
              dword30 <<= 8;
              v168 = *data++;
              dword34 = v168 + (dword34 << 8);
            }
            v167 = 1;
          }
          else
          {
            dword30 = v164 * (dword30 >> 11);
            *(_WORD *)&v161[v163] = v164 + ((unsigned int)(0x800 - v164) >> 5);
            if ( dword30 < 0x1000000 )
            {
              dword30 <<= 8;
              v166 = *data++;
              dword34 = v166 + (dword34 << 8);
            }
            v167 = 0;
          }
        }
        v169 = n & 0xFFFFFFBF;
        if ( v169 < 4 )
        {
          dword38 = v169 + 1;
        }
        else
        {
          v170 = v5 + v99;
          v171 = (v169 >> 1) - 1;
          v172 = (((v169 & 1) + 2) << v171) + 1;
          if ( v169 >= 0xE )
          {
            v185 = (v169 >> 1) - 5;
            v186 = 1;
            do
            {
              dword30 >>= 1;
              v186 *= 2;
              if ( dword34 >= dword30 )
              {
                dword34 -= dword30;
                v186 |= 1u;
              }
              if ( dword30 < 0x1000000 )
              {
                dword30 <<= 8;
                v187 = *data++;
                dword34 = v187 + (dword34 << 8);
              }
            }
            while ( v186 < 1 << v185 );
            v188 = v172 + 16 * (v186 & ~(1 << v185));
            v189 = destination + 1604;
            v190 = 1;
            v191 = 0;
            do
            {
              v192 = 2 * v190;
              v193 = *(unsigned __int16 *)&v189[v192];
              v194 = v193 * (dword30 >> 11);
              if ( dword34 >= v194 )
              {
                dword30 -= v194;
                dword34 -= v194;
                *(_WORD *)&v189[v192] -= *(_WORD *)&v189[v192] >> 5;
                if ( dword30 < 0x1000000 )
                {
                  dword30 <<= 8;
                  v197 = *data++;
                  dword34 = v197 + (dword34 << 8);
                }
                v196 = 1;
              }
              else
              {
                dword30 = v193 * (dword30 >> 11);
                *(_WORD *)&v189[v192] = v193 + ((unsigned int)(2048 - v193) >> 5);
                if ( dword30 < 0x1000000 )
                {
                  dword30 <<= 8;
                  v195 = *data++;
                  dword34 = v195 + (dword34 << 8);
                }
                v196 = 0;
              }
              v190 = v196 + v192;
              v191 = (v191 >> 1) | (v196 << 31);
            }
            while ( v190 < 0x10 );
            dword38 = v188 + (v191 >> 28);
            destination = v189 - 1604;
            v99 = v170 & 0x1FF;
            v5 = v170 >> 11 << 11;
          }
          else
          {
            v173 = (((v169 & 1) + 2) << v171) + 689 - v169 - 2;
            v174 = v172 + (v173 << 19);
            v175 = &destination[2 * v173];
            v176 = 1;
            v177 = 0;
            do
            {
              v178 = 2 * v176;
              v179 = *(unsigned __int16 *)&v175[v178];
              v180 = v179 * (dword30 >> 11);
              if ( dword34 >= v180 )
              {
                dword30 -= v180;
                dword34 -= v180;
                *(_WORD *)&v175[v178] -= *(_WORD *)&v175[v178] >> 5;
                if ( dword30 < 0x1000000 )
                {
                  dword30 <<= 8;
                  v183 = *data++;
                  dword34 = v183 + (dword34 << 8);
                }
                v182 = 1;
              }
              else
              {
                dword30 = v179 * (dword30 >> 11);
                *(_WORD *)&v175[v178] = v179 + ((unsigned int)(2048 - v179) >> 5);
                if ( dword30 < 0x1000000 )
                {
                  dword30 <<= 8;
                  v181 = *data++;
                  dword34 = v181 + (dword34 << 8);
                }
                v182 = 0;
              }
              v176 = v182 + v178;
              v177 = (v177 >> 1) | (v182 << 31);
            }
            while ( v176 < 1 << v171 );
            v184 = v174 + (v177 >> (32 - v171));
            destination = &v175[-(v184 >> 18)];
            dword38 = v184 & 0x3FFFF;
            v99 = v170 & 0x1FF;
            v5 = v170 >> 11 << 11;
          }
        }
_loc_8053C38:
        v198 = v99 + 2;
        v199 = v122 - v198;
        v200 = v5 - (dword38 << 15);
        do
        {
          v201 = *(unsigned __int8 *)(dword8 + (v200 >> 15));
          *(_BYTE *)(dword8 + (v5 >> 15)) = v201;
          v5 += 0x8000;
          v200 += 0x8000;
          v202 = __OFSUB__(v198--, 1);
        }
        while ( v198 );
        v11 = v199 & 0xF00FFFFF | (v201 << 20);
        if ( ((v11 & 0x40000) != 0) ^ v202 | (v11 << 13 == 0) )
          goto _loc_8053C70;
      }
      v52 = v44 + 204;
      v53 = v44[204];
      v54 = v53 * (v48 >> 11);
      if ( dword34 >= v54 )
      {
        v55 = v48 - v54;
        dword34 -= v54;
        *v52 = v44[204] - (v44[204] >> 5);
        if ( v55 < 0x1000000 )
        {
          v55 <<= 8;
          v58 = *data++;
          dword34 = v58 + (dword34 << 8);
        }
        v57 = 1;
      }
      else
      {
        v55 = v53 * (v48 >> 11);
        *v52 = v53 + ((unsigned int)(2048 - v53) >> 5);
        if ( v55 < 0x1000000 )
        {
          v55 <<= 8;
          v56 = *data++;
          dword34 = v56 + (dword34 << 8);
        }
        v57 = 0;
      }
      if ( v57 )
        break;
      v59 = &destination[32 * (v11 >> 28) + 480 + ((v5 & 0x18000) >> 14)];
      v60 = *(unsigned __int16 *)v59;
      v61 = v60 * (v55 >> 11);
      if ( dword34 >= v61 )
      {
        dword30 = v55 - v61;
        dword34 -= v61;
        *(_WORD *)v59 -= *(_WORD *)v59 >> 5;
        if ( dword30 < 0x1000000 )
        {
          dword30 <<= 8;
          v64 = *data++;
          dword34 = v64 + (dword34 << 8);
        }
        v63 = 1;
      }
      else
      {
        dword30 = v60 * (v55 >> 11);
        *(_WORD *)v59 = v60 + ((unsigned int)(2048 - v60) >> 5);
        if ( dword30 < 0x1000000 )
        {
          dword30 <<= 8;
          v62 = *data++;
          dword34 = v62 + (dword34 << 8);
        }
        v63 = 0;
      }
      if ( v63 )
        goto _loc_8053450;
      v17 = v11 >= 0x70000000;
      v65 = v11 & 0xFFFFFFF;
      if ( v17 )
        v66 = v65 - 0x50000000;
      else
        v66 = v65 - 0x70000000;
      v67 = *(unsigned __int8 *)(dword8 + ((v5 - (dword38 << 15)) >> 15));
      v68 = v66 & 0xF00FFFFF | (v67 << 20);
      *(_BYTE *)(dword8 + (v5 >> 15)) = v67;
      v5 += 0x8000;
      v202 = __OFSUB__(v68, 1);
      v11 = v68 - 1;
      if ( ((v11 & 0x40000) != 0) ^ v202 | (v11 << 13 == 0) )
        goto _loc_8053C70;
    }
    v69 = v44 + 216;
    v70 = v44[216];
    v71 = v70 * (v55 >> 11);
    if ( dword34 >= v71 )
    {
      dword30 = v55 - v71;
      dword34 -= v71;
      *v69 = v44[216] - (v44[216] >> 5);
      if ( dword30 < 0x1000000 )
      {
        dword30 <<= 8;
        v74 = *data++;
        dword34 = v74 + (dword34 << 8);
      }
      v73 = 1;
    }
    else
    {
      dword30 = v70 * (v55 >> 11);
      *v69 = v70 + ((unsigned int)(2048 - v70) >> 5);
      if ( dword30 < 0x1000000 )
      {
        dword30 <<= 8;
        v72 = *data++;
        dword34 = v72 + (dword34 << 8);
      }
      v73 = 0;
    }
    if ( v73 )
    {
      v76 = v44 + 228;
      v77 = v44[228];
      v78 = v77 * (dword30 >> 11);
      if ( dword34 >= v78 )
      {
        dword30 -= v78;
        dword34 -= v78;
        *v76 = v44[228] - (v44[228] >> 5);
        if ( dword30 < 0x1000000 )
        {
          dword30 <<= 8;
          v81 = *data++;
          dword34 = v81 + (dword34 << 8);
        }
        v80 = 1;
      }
      else
      {
        dword30 = v77 * (dword30 >> 11);
        *v76 = v77 + ((unsigned int)(2048 - v77) >> 5);
        if ( dword30 < 0x1000000 )
        {
          dword30 <<= 8;
          v79 = *data++;
          dword34 = v79 + (dword34 << 8);
        }
        v80 = 0;
      }
      v82 = *v9;
      v83 = v9[1];
      if ( v80 )
      {
        v84 = v9[2];
        *v9 = dword38;
        v9[1] = v82;
        v9[2] = v83;
        dword38 = v84;
      }
      else
      {
        *v9 = dword38;
        v9[1] = v82;
        dword38 = v83;
      }
    }
    else
    {
      v75 = *v9;
      *v9 = dword38;
      dword38 = v75;
    }
_loc_8053450:
    v85 = destination + 2664;
    v86 = *((unsigned __int16 *)destination + 1332);
    v87 = v86 * (dword30 >> 11);
    if ( dword34 >= v87 )
    {
      dword30 -= v87;
      dword34 -= v87;
      *(_WORD *)v85 = *((_WORD *)destination + 1332) - (*((_WORD *)destination + 1332) >> 5);
      if ( dword30 < 0x1000000 )
      {
        dword30 <<= 8;
        v90 = *data++;
        dword34 = v90 + (dword34 << 8);
      }
      v89 = 1;
    }
    else
    {
      dword30 = v86 * (dword30 >> 11);
      *(_WORD *)v85 = v86 + ((unsigned int)(2048 - v86) >> 5);
      if ( dword30 < 0x1000000 )
      {
        dword30 <<= 8;
        v88 = *data++;
        dword34 = v88 + (dword34 << 8);
      }
      v89 = 0;
    }
    if ( v89 )
    {
      v100 = *((unsigned __int16 *)destination + 1333);
      v101 = v100 * (dword30 >> 11);
      if ( dword34 >= v101 )
      {
        dword30 -= v101;
        dword34 -= v101;
        *((_WORD *)destination + 1333) -= *((_WORD *)destination + 1333) >> 5;
        if ( dword30 < 0x1000000 )
        {
          dword30 <<= 8;
          v104 = *data++;
          dword34 = v104 + (dword34 << 8);
        }
        v103 = 1;
      }
      else
      {
        dword30 = v100 * (dword30 >> 11);
        *((_WORD *)destination + 1333) = v100 + ((unsigned int)(2048 - v100) >> 5);
        if ( dword30 < 0x1000000 )
        {
          dword30 <<= 8;
          v102 = *data++;
          dword34 = v102 + (dword34 << 8);
        }
        v103 = 0;
      }
      if ( v103 )
      {
        v113 = destination + 3180;
        for ( ii = 1; ii < 0x100; ii = v119 + v115 )
        {
          v115 = 2 * ii;
          v116 = *(unsigned __int16 *)&v113[v115];
          v117 = v116 * (dword30 >> 11);
          if ( dword34 >= v117 )
          {
            dword30 -= v117;
            dword34 -= v117;
            *(_WORD *)&v113[v115] -= *(_WORD *)&v113[v115] >> 5;
            if ( dword30 < 0x1000000 )
            {
              dword30 <<= 8;
              v120 = *data++;
              dword34 = v120 + (dword34 << 8);
            }
            v119 = 1;
          }
          else
          {
            dword30 = v116 * (dword30 >> 11);
            *(_WORD *)&v113[v115] = v116 + ((unsigned int)(2048 - v116) >> 5);
            if ( dword30 < 0x1000000 )
            {
              dword30 <<= 8;
              v118 = *data++;
              dword34 = v118 + (dword34 << 8);
            }
            v119 = 0;
          }
        }
        v99 = (ii & 0xFFFFFEFF) + 16;
      }
      else
      {
        v105 = (unsigned int)&v85[16 * ((v5 & 0x18000) >> 15) + 260];
        for ( jj = 1; jj < 8; jj = v111 + v107 )
        {
          v107 = 2 * jj;
          v108 = *(unsigned __int16 *)(v105 + v107);
          v109 = v108 * (dword30 >> 11);
          if ( dword34 >= v109 )
          {
            dword30 -= v109;
            dword34 -= v109;
            *(_WORD *)(v105 + v107) -= *(_WORD *)(v105 + v107) >> 5;
            if ( dword30 < 0x1000000 )
            {
              dword30 <<= 8;
              v112 = *data++;
              dword34 = v112 + (dword34 << 8);
            }
            v111 = 1;
          }
          else
          {
            dword30 = v108 * (dword30 >> 11);
            *(_WORD *)(v105 + v107) = v108 + ((unsigned int)(2048 - v108) >> 5);
            if ( dword30 < 0x1000000 )
            {
              dword30 <<= 8;
              v110 = *data++;
              dword34 = v110 + (dword34 << 8);
            }
            v111 = 0;
          }
        }
        v99 = (jj & 0xFFFFFFF7) + 8;
      }
    }
    else
    {
      v91 = (unsigned int)&v85[16 * ((v5 & 0x18000) >> 15) + 4];
      for ( kk = 1; kk < 8; kk = v97 + v93 )
      {
        v93 = 2 * kk;
        v94 = *(unsigned __int16 *)(v91 + v93);
        v95 = v94 * (dword30 >> 11);
        if ( dword34 >= v95 )
        {
          dword30 -= v95;
          dword34 -= v95;
          *(_WORD *)(v91 + v93) -= *(_WORD *)(v91 + v93) >> 5;
          if ( dword30 < 0x1000000 )
          {
            dword30 <<= 8;
            v98 = *data++;
            dword34 = v98 + (dword34 << 8);
          }
          v97 = 1;
        }
        else
        {
          dword30 = v94 * (dword30 >> 11);
          *(_WORD *)(v91 + v93) = v94 + ((unsigned int)(2048 - v94) >> 5);
          if ( dword30 < 0x1000000 )
          {
            dword30 <<= 8;
            v96 = *data++;
            dword34 = v96 + (dword34 << 8);
          }
          v97 = 0;
        }
      }
      v99 = kk & 0xFFFFFFF7;
    }
    v17 = v11 >= 0x70000000;
    v121 = v11 & 0xFFFFFFF;
    if ( v17 )
      v122 = v121 - 0x50000000;
    else
      v122 = v121 + 0x80000000;
    goto _loc_8053C38;
  }
  return result;
}