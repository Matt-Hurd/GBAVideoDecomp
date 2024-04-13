from decompress_image import mmstrImage
from mmstr_utils import decode_from_bytestring, extract_null_terminated_bytestring
from render_bmp import render_gba_mode3

class mmstrEntry():
    def __init__(self, data):
        self.info = int.from_bytes(data[:4], 'little')
        length = self.info * 16
        length &= 0xFFFFFFFF
        length >>= 2
        self.length = (length + 4) & 0xFFFFFFFF
        self.type = self.info >> 28
        self.encoded_name = extract_null_terminated_bytestring(data, 8)
        self.decoded_name = decode_from_bytestring(self.encoded_name)
        name_end_offset = 8 + len(self.encoded_name) + 1
        data_start_offset = 4 * round(name_end_offset/4) # align to 4 bytes
        self.data = data[data_start_offset:data_start_offset+self.length]
        if self.type == 4:
            self.image_data_size = int.from_bytes(self.data[:4], 'little')
            self.maybe_output_size = int.from_bytes(self.data[4:8], 'little')
            self.dword34 = int.from_bytes(self.data[9:13], 'big')
            self.data = self.data[13:]
            print(hex(self.image_data_size), hex(self.maybe_output_size), hex(self.dword34))

# Baseline
with open("test_archives/commonresources/gbaplayer_notcompatible", "rb") as f:
    data = f.read()
    mmstr = mmstrEntry(data)
    image = mmstrImage(mmstr.data, mmstr.image_data_size, mmstr.dword34)
    image.decompress(0x04000000)
    with open("decompressed_images/commonresources/gbaplayer_notcompatible", "rb") as f:
        expected = f.read()
        assert image.dword8 == list(expected)