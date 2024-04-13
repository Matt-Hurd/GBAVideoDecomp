# struct __attribute__((packed)) __attribute__((aligned(2))) struct_result
# {
#   _BYTE gap0[8];
#   _DWORD dword8;
#   _DWORD maybeParsedBytes;
#   _BYTE gap10[12];
#   _DWORD maybeRemainingBytes;
#   unsigned __int16 *punsigned___int1620;
#   _BYTE gap24[4];
#   unsigned __int8 *data;
#   _BYTE gap2C[4];
#   _DWORD dword30;
#   _DWORD dword34;
#   _DWORD dword38;
#   int int3C[3];
#   _BYTE gap48[12];
#   _DWORD dword54;
#   _BYTE byte58;
#   unsigned __int8 unsigned___int859;
# };

import struct
import numpy as np

class ByteStream:
    def __init__(self, array):
        self.bytes = array

    def get_unsigned_short(self, index):
        return struct.unpack_from('<H', self.bytes, index)[0]

    def get_signed_short(self, index):
        return struct.unpack_from('<h', self.bytes, index)[0]

    def get_unsigned_int(self, index):
        return struct.unpack_from('<I', self.bytes, index)[0]

    def get_signed_int(self, index):
        return struct.unpack_from('<i', self.bytes, index)[0]

    def set_unsigned_short(self, index, value):
        # if (index == 64):
        #     breakpoint()
        struct.pack_into('<H', self.bytes, index, value)

    def set_signed_short(self, index, value):
        struct.pack_into('<h', self.bytes, index, value)

    def set_unsigned_int(self, index, value):
        struct.pack_into('<I', self.bytes, index, value)

    def set_signed_int(self, index, value):
        struct.pack_into('<i', self.bytes, index, value)


class mmstrImage():
    maybeParsedBytes = 0
    dword30 = 0xFFFFFFFF
    dword38 = 1
    int3C = [1, 1, 1]
    dword54 = 0
    byte58 = False
    unsigned___int859 = 0

    v203 = 0

    data_idx = 0
    skip_init = False
    skip_outer_init = False

    def __init__(self, data, length, dword34):
        self.data = ByteStream(data)
        self.maybeRemainingBytes = length
        self.dword34 = dword34
        self.dword8 = [0] * length
        self.destination = ByteStream(bytearray([0x00, 0x4] * length))

    def _loc_8053C70(self):
        self.maybeParsedBytes = self.v5 >> 15
        self.maybeRemainingBytes = ((self.v11 << 13) & 0xFFFFFFFF) >> 13
        self.byte58 = (self.v5 & 0x1000) != 0
        self.dword54 = self.v11 >> 28
        self.unsigned___int859 = (self.v11 & 0xFF00000) >> 20
        return self
    
    def maybe_increment_idx(self):
        if (self.dword30 < 0x1000000):
            self.dword30 = self.dword30 << 8 & 0xFFFFFFFF
            self.dword34 = self.data.bytes[self.data_idx] + (self.dword34 << 8) & 0xFFFFFFFF
            self.data_idx += 1

    def maybe_increment_idx2(self, a):
        if (a < 0x1000000):
            a = a << 8 & 0xFFFFFFFF
            self.dword34 = self.data.bytes[self.data_idx] + (self.dword34 << 8) & 0xFFFFFFFF
            self.data_idx += 1
        return a

    def do_something1(self, a, byte_offset):
        v14 = self.destination.get_unsigned_short(byte_offset)
        v15 = (v14 * (a >> 11)) & 0xFFFFFFFF
        if (self.dword34 >= v15):
            self.dword30 = a - v15
            self.dword34 -= v15
            self.destination.set_unsigned_short(byte_offset, v14 - (v14 >> 5))
            self.maybe_increment_idx()
            return True
        else:
            self.dword30 = v14 * (a >> 11) & 0xFFFFFFFF
            self.destination.set_unsigned_short(byte_offset, v14 + ((2048 - v14) >> 5))
            self.maybe_increment_idx()
            return False
        
    def do_something2(self, a, byte_offset):
        v14 = self.destination.get_unsigned_short(byte_offset)
        v15 = (v14 * (a >> 11)) & 0xFFFFFFFF
        if (self.dword34 >= v15):
            holder = a - v15
            self.dword34 -= v15
            self.destination.set_unsigned_short(byte_offset, v14 - (v14 >> 5))
            holder = self.maybe_increment_idx2(holder)
            return (holder, True)
        else:
            holder = np.uint32(v14 * (a >> 11))
            self.destination.set_unsigned_short(byte_offset, v14 + ((2048 - v14) >> 5))
            holder = self.maybe_increment_idx2(holder)
            return (holder, False)
    
    def middle_loop(self, a2):
        if not self.skip_init:
            while True:
                if (self.data_idx >= a2):
                    return True, self._loc_8053C70()
                byte_offset = 32 * (self.v11 >> 28) + ((self.v5 & 0x18000) >> 14)
                if (self.do_something1(self.dword30, byte_offset)):
                    break
                self.v19 = 3692
                if (self.v11 >= 0x40000000):
                    if (self.v11 >= 0xA0000000):
                        self.v20 = self.v11 - 0x60000000
                    else:
                        self.v20 = self.v11 - 0x30000000
                else:
                    self.v20 = self.v11 & 0xFFFFFFFF
                v22 = 0
                if (self.v5 & 0x1000):
                    v21 = self.dword8[(self.v5 - (self.dword38 << 15)) >> 15]
                    v22 = 1
                    skip_next_while = False
                    while True:
                        v23 = (v21 & 0x80) + 128
                        v24 = 2 * v22 + 4 * v23
                        v21 = (2 * v21) & 0x7FFFFFFF | (v23 << 23) & 0xFFFFFFFF
                        byte_offset = self.v19 + v24
                        v28 = 1 if self.do_something1(self.dword30, byte_offset) else 0
                        v22 = v28 + (v24 & 0xFFFFF9FF) & 0xFFFFFFFF
                        if ( ((v22 ^ (v21 >> 31)) & 1) != 0 ):
                            break
                        if (v22 >= 0x100):
                            skip_next_while = True
                            break
                    if not skip_next_while:
                        while (v22 < 0x100):
                            v22 = 2 * v22 & 0xFFFFFFFF
                            v28 = 1 if self.do_something1(self.dword30, self.v19 + v22) else 0
                            v22 += v28
                    else:
                        skip_next_while = False
                    v22 = v22 & 0xFF
                    self.v5 &= 0xFFFFEFFF # ~0x1000
                else:
                    v41 = 0
                    i = 1
                    while (i < 0x100):
                        i *= 2
                        v41 = 1 if self.do_something1(self.dword30, self.v19 + i) else 0
                        i += v41
                    v22 = i & 0xFFFFFEFF
                v43 = self.v20 & 0xF00FFFFF | (v22 << 20) & 0xFFFFFFFF
                self.dword8[self.v5 >> 15] = v22
                self.v5 += 0x8000
                v202 = v43 == 0
                self.v11 = v43 - 1
                if ((self.v11 & 0x40000) != v202 or (self.v11 << 13 & 0xFFFFFFFF) == 0):
                    return True, self._loc_8053C70()
            self.v5 |= 0x1000
            self.v44 = np.uint32(2 * (self.v11 >> 28))
            v45 = self.v44 + 192 * 2
            self.v48, v50 = self.do_something2(self.dword30, v45)
            if (v50):
                return False, True
            v123 = self.int3C[0]
            v124 = self.int3C[1]
            self.int3C[0] = self.dword38
            self.int3C[1] = v123
            self.int3C[2] = v124
            v17 = self.v11 >= 0x70000000
            v125 = self.v11 & 0xFFFFFFF
            if (v17):
                self.v122 = (v125 - 0x60000000) & 0xFFFFFFFF
            else:
                self.v122 = (v125 + 0x70000000) & 0xFFFFFFFF
            byte_offset = 1636
            v130 = self.do_something1(self.v48, byte_offset)
            if (v130):
                byte_offset = 819 * 2
                v143 = self.do_something1(self.dword30, byte_offset)
                if (v143):
                    j = 1
                    while (j < 0x100):
                        v155 = 2 * j
                        v159 = 1 if self.do_something1(self.dword30, 2152 + v155) else 0
                        j = v155 + v159
                    self.v99 = (j & 0xFFFFFEFF) + 16
                else:
                    v145 = 1636 + (16 * ((self.v5 & 0x18000) >> 15)) + 260
                    k = 1
                    while (k < 8):
                        v147 = 2 * k
                        v151 = 1 if self.do_something1(self.dword30, v145 + v147) else 0
                        k = v147 + v151
                    self.v99 = (k & 0xFFFFFFF7) + 8
            else:
                v132 = 1636 + (16 * ((self.v5 & 0x18000) >> 15)) + 4
                m = 1
                while (m < 8):
                    v134 = 2 * m
                    v138 = 1 if self.do_something1(self.dword30, v132 + v134) else 0
                    m = v134 + v138
                self.v99 = m & 0xFFFFFFF7 
            if (self.v99 >= 4):
                self.v161 = 1248
            else:
                self.v161 = 128 * self.v99 + 864
            n = 1
            while (n < 0x40):
                v163 = 2 * n
                v167 = 1 if self.do_something1(self.dword30, self.v161 + v163) else 0
                n = v163 + v167
            v169 = n & 0xFFFFFFBF
            if (v169 < 4):
                self.dword38 = v169 + 1
            else:
                v170 = self.v5 + self.v99
                v171 = ((v169 >> 1) - 1) & 0xFFFFFFFF
                v172 = ((((v169 & 1) + 2) << v171) + 1) & 0xFFFFFFFF
                if (v169 >= 0xE):
                    v185 = ((v169 >> 1) - 5) & 0xFFFFFFFF
                    v186 = 1
                    while True:
                        self.dword30 >>= 1
                        v186 = (v186 * 2) & 0xFFFFFFFF
                        if (self.dword34 >= self.dword30):
                            self.dword34 = (self.dword34 - self.dword30) & 0xFFFFFFFF
                            v186 |= 1
                        if (self.dword30 < 0x1000000):
                            self.dword30 <<= 8
                            v187 = self.data.bytes[self.data_idx]
                            self.data_idx += 1
                            self.dword34  = (v187 + (self.dword34 << 8)) & 0xFFFFFFFF
                        if not ((v186 < 1 << v185) & 0xFFFFFFFF):
                            break
                    v188 = v172 + 16 * (v186 & ~(1 << v185))
                    v190 = 1
                    v191 = 0
                    while True:
                        v192 = 2 * v190
                        v196 = 1 if self.do_something1(self.dword30, 1604 + v192) else 0
                        v190 = v196 + v192
                        v191 = (v191 >> 1) | (v196 << 31)
                        if not (v190 < 0x10):
                            break
                    self.dword38 = v188 + (v191 >> 28)
                    # destination = v189 - 1604;
                    self.v99 = v170 & 0x1FF
                    self.v5 = v170 >> 11 << 11
                else:
                    v173 = (((v169 & 1) + 2) << v171) + 689 - v169 - 2
                    v174 = (v172 + (v173 << 19)) & 0xFFFFFFFF
                    v175 = 2 * v173
                    v176 = 1
                    v177 = 0
                    while True:
                        v178 = 2 * v176
                        v182 = 1 if self.do_something1(self.dword30, v175 + v178) else 0
                        v176 = v182 + v178
                        v177 = ((v177 >> 1) | (v182 << 31)) & 0xFFFFFFFF
                        if not ((v176 < 1 << v171) & 0xFFFFFFFF):
                            break
                    v184 = v174 + (v177 >> (32 - v171))
                    # destination = &v175[-(v184 >> 18)];
                    self.dword38 = v184 & 0x3FFFF
                    self.v99 = v170 & 0x1FF
                    self.v5 = v170 >> 11 << 11
        #_loc_8053C38
        self.skip_init = False
        v198 = self.v99 + 2
        v199 = self.v122 - v198
        v200 = (self.v5 - (self.dword38 << 15 & 0xFFFFFFFF)) & 0xFFFFFFFF
        while True:
            v201 = np.uint8(self.dword8[v200 >> 15])
            self.dword8[self.v5 >> 15] = v201
            self.v5 += 0x8000
            v200 += 0x8000
            v202 = v198 == 0
            v198 -= 1
            if not (v198):
                break
        self.v11 = v199 & 0xF00FFFFF | (v201 << 20)
        if ((self.v11 & 0x40000) != 0) != v202 or (self.v11 << 13 & 0xFFFFFFFF == 0):
            return True, self._loc_8053C70()
        return False, False

    def decompress(self, a2):
        if (self.maybeRemainingBytes):
            v3 = self.maybeRemainingBytes & 0x7FFFF | 0x80000
            self.v5 = self.maybeParsedBytes << 15 & 0xFFFFFFFF | 0x2000
            if (self.byte58):
                self.v5 = self.maybeParsedBytes << 15 & 0xFFFFFFFF | 0x3000
            self.v11 = v3 + (self.unsigned___int859 << 20) & 0xFFFFFFFF | + (self.dword54 << 28) & 0xFFFFFFFF
            # v204 = &self.data[a2]
            while True: # mimic goto
                while True:
                    while True:
                        needs_return, value = self.middle_loop(a2)
                        if needs_return:
                            return value
                        elif value:
                            break
                    v52 = self.v44 + 204 * 2
                    self.v55, v57 = self.do_something2(self.v48, v52)
                    if (v57):
                        break
                    v59 = 32 * (self.v11 >> 28) + 480 + ((self.v5 & 0x18000) >> 14)
                    v63 = self.do_something1(self.v55, v59)
                    if (v63):
                        #goto _loc_8053450;
                        self.skip_outer_init = True
                        break
                    v17 = self.v11 >= 0x70000000
                    v65 = self.v11 & 0xFFFFFFF
                    if (v17):
                        v66 = v65 - 0x50000000
                    else:
                        v66 = v65 - 0x70000000
                    print(f"{self.v5:x} {self.dword38:x}")
                    v67 = self.dword8[((self.v5 - (self.dword38 << 15)) >> 15)]
                    v68 = v66 & 0xF00FFFFF | (v67 << 20);
                    self.dword8[self.v5 >> 15] = v67
                    self.v5 += 0x8000
                    v202 = v68 == 0
                    self.v11 = v68 - 1
                    if ((self.v11 & 0x40000) != v202 | (self.v11 << 13 & 0xFFFFFFFF == 0) ):
                        return self._loc_8053C70()
                if (not self.skip_outer_init):
                    v69 = self.v44 + 216 * 2
                    v73 = self.do_something1(self.v55, v69)
                    if (v73):
                        v76 = self.v44 + 228 * 2
                        v80 = self.do_something1(self.dword30, v76)
                        v82 = self.int3C[0]
                        v83 = self.int3C[1]
                        if (v80):
                            v84 = self.int3C[2]
                            self.int3C[0] = self.dword38
                            self.int3C[1] = v82
                            self.int3C[2] = v83
                            self.dword38 = v84
                        else:
                            self.int3C[0] = self.dword38
                            self.int3C[1] = v82
                            self.dword38 = v83
                    else:
                        v75 = self.int3C[0]
                        self.int3C[0] = self.dword38
                        self.dword38 = v75
                #_loc_8053450:
                self.skip_outer_init = False
                v89 = self.do_something1(self.dword30, 2664)
                if (v89):
                    v103 = self.do_something1(self.dword30, 2666)
                    if (v103):
                        v113 = 3180
                        ii = 1
                        while (ii < 0x100):
                            v115 = 2 * ii
                            v119 = 1 if self.do_something1(self.dword30, v113 + v115) else 0
                            ii = v119 + v115
                        self.v99 = (ii & 0xFFFFFEFF) + 16
                    else:
                        v105 = 2664 + (16 * ((self.v5 & 0x18000) >> 15)) + 260
                        jj = 1
                        while (jj < 8):
                            v107 = 2 * jj
                            v111 = 1 if self.do_something1(self.dword30, v105 + v107) else 0
                            jj = v107 + v111
                        self.v99 = (jj & 0xFFFFFFF7) + 8
                else:
                    v91 = 2664 + (16 * ((self.v5 & 0x18000) >> 15)) + 4
                    kk = 1
                    while (kk < 8):
                        v93 = 2 * kk
                        v97 = 1 if self.do_something1(self.dword30, v91 + v93) else 0
                        kk = v93 + v97
                    self.v99 = kk & 0xFFFFFFF7
                v17 = self.v11 >= 0x70000000
                v121 = self.v11 & 0xFFFFFFF
                if (v17):
                    self.v122 = (v121 - 0x50000000) & 0xFFFFFFFF
                else:
                    self.v122 = (v121 + 0x80000000) & 0xFFFFFFFF
                self.skip_init = True
        return self

# test = mmstrImage()

# import hunter
# # hunter.trace(stdlib=False, action=hunter.CallPrinter(force_colors=False))
# test.decompress(0x04000000)
# print(test.destination.bytes[:1000])