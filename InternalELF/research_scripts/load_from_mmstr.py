def hex_dump(data, bytes_per_line=16):
    """
    Print a bytestring as a hex dump.
    
    :param data: The binary data to print.
    :param bytes_per_line: How many bytes to print per line.
    """
    # Iterate over the data, stepping by the number of bytes per line
    for i in range(0, len(data), bytes_per_line):
        # Slice the data for this line
        line_data = data[i:i+bytes_per_line]
        # Generate the hex part of the line
        hex_part = ' '.join(f'{byte:02x}' for byte in line_data)
        # Generate the ASCII part of the line
        ascii_part = ''.join(chr(byte) if 32 <= byte <= 126 else '.' for byte in line_data)
        # Print the line number, hex part, and ASCII part
        print(f'{i:08x}  {hex_part:<{bytes_per_line*3}}  {ascii_part}')

def sub_800652A_to_bytestring(input_string):
    # Convert input string to bytes for manipulation
    input_bytes = input_string.encode('utf-8')
    
    # Initialize an empty byte array for the result
    result = bytearray()
    
    # Mapping for special characters with their byte values
    special_char_mapping = {
        ord(b' '): -1, ord(b'\n'): -2, ord(b'.'): 63, ord(b','): 64, ord(b':'): 65, ord(b';'): 66,
        ord(b'!'): 67, ord(b'?'): 68, ord(b'&'): 69, ord(b'('): 70, ord(b')'): 71, ord(b'\''): 72,
        ord(b'\x92'): 72, ord(b'`'): 72, ord(b'-'): 73, ord(b'/'): 74, ord(b'+'): 75, ord(b'\xA9'): 76,
        ord(b'\x99'): 77, ord(b'_'): 78, ord(b'$'): 79, ord(b'"'): 80, ord(b'\x93'): 80, ord(b'\x94'): 80,
        ord(b'<'): 81, ord(b'>'): 82, ord(b'*'): 83, ord(b'='): 84, ord(b'\xAE'): 85, ord(b'#'): 86,
        ord(b'@'): 87, ord(b'%'): 88, ord(b'\\'): 89, ord(b'~'): 90, ord(b'['): 91, ord(b']'): 92,
    }

    for byte in input_bytes:
        if byte in special_char_mapping:
            mapped_value = special_char_mapping[byte]
            # For negative values, adjust to fit in byte range (0-255)
            if mapped_value < 0:
                result.append(256 + mapped_value)
            else:
                result.append(mapped_value)
        elif 48 <= byte <= 57:  # Digits
            result.append(byte - 47)
        elif 65 <= byte <= 90:  # Uppercase letters
            result.append(byte - 28)
        elif 97 <= byte <= 122:  # Lowercase letters
            result.append(byte - 86)
        else:
            # Directly append other bytes
            result.append(byte)

    return bytes(result)

def decode_from_bytestring(encoded_bytes):
    # Reverse mapping for special characters, from encoded byte values back to characters
    reverse_special_char_mapping = {
        -1: ' ', -2: '\n', 63: '.', 64: ',', 65: ':', 66: ';',
        67: '!', 68: '?', 69: '&', 70: '(', 71: ')', 72: '\'',
        73: '-', 74: '/', 75: '+', 76: '\xA9', 77: '\x99',
        78: '_', 79: '$', 80: '"', 81: '<', 82: '>', 83: '*',
        84: '=', 85: '\xAE', 86: '#', 87: '@', 88: '%', 89: '\\',
        90: '~', 91: '[', 92: ']',
    }

    # Convert negative keys to their correct byte representation in Python (0-255 range)
    reverse_special_char_mapping = {key & 0xFF: value for key, value in reverse_special_char_mapping.items()}

    # Initialize an empty string for the result
    result = ""

    for byte in encoded_bytes:
        if byte in reverse_special_char_mapping:
            result += reverse_special_char_mapping[byte]
        elif 1 <= byte <= 10:  # Encoded Digits
            result += chr(byte + 47)
        elif 11 <= byte <= 36:  # Encoded Lowercase letters
            result += chr(byte + 86)
        elif 37 <= byte <= 62:  # Encoded Uppercase letters
            result += chr(byte + 28)
        else:
            # Directly append other characters (this may not be necessary unless there are byte values not covered above)
            result += chr(byte)

    return result

def extract_null_terminated_bytestring(data, start=0):
    """
    Extracts a null-terminated bytestring from a block of data starting from a given index.

    :param data: The binary data as a bytearray or bytes object.
    :param start: The starting index from which to begin the search for the null-terminated string.
    :return: The extracted bytestring and the index immediately after the null terminator.
    """
    end = data.find(b'\x00', start)  # Find the index of the first null byte after 'start'
    if end != -1:  # Ensure a null terminator was found
        return data[start:end]
    raise ValueError("Null-terminated string not found")

def maybe_load_from_mmstr(mmstr_data, a2, a3, internal_file_name=None):
    def decode_file_name(name):
        # This should mirror the logic from `sub_800652A_to_bytestring`
        # Adjust this function based on actual encoding/decoding logic used by mmstr format
        return sub_800652A_to_bytestring(name)
    
    # Assume the first byte after the header indicates the number of sections
    section_count = mmstr_data[4] - 1
    offset = 8  # Starting point after reading the header and section count
    
    found_data = None
    
    if internal_file_name:
        encoded_name = decode_file_name(internal_file_name.lower())
    
    for i in range(section_count):
        # Simulate safeMemcpy to get section type and length (example values used)
        section_info = int.from_bytes(mmstr_data[offset:offset+4], 'little')
        section_length = section_info * 16
        # Step 2: Convert to unsigned by applying 32-bit mask
        section_length &= 0xFFFFFFFF
        # Step 3: Right shift by 2 (equivalent to dividing by 4 in this context)
        section_length >>= 2
        # Step 4: Add 4 to the result, still ensuring it stays within 32-bit bounds
        section_length = (section_length + 4) & 0xFFFFFFFF
        section_type = section_info >> 28
        
        if section_type == a2:
            if internal_file_name:
                name_offset = offset + 8
                encoded = extract_null_terminated_bytestring(mmstr_data, name_offset)
                print(decode_from_bytestring(encoded))
                if encoded_name in mmstr_data[name_offset:name_offset+len(encoded_name)]:
                    print(f"Found section with name: {internal_file_name}")
                    found_data = mmstr_data[offset + len(encoded):offset + len(encoded) + section_length]
                    # break
            else:
                if a3 == -1:
                    found_data = mmstr_data[offset:offset+section_length]
                    break  # Found the required unnamed section
                else:
                    a3 -= 1  # Decrement counter and keep searching
        
        offset += section_length  # Move to the next section
    
    return found_data

def get_mmstr_table(mmstr_data, filenames: bool):
    section_count = mmstr_data[4]
    offset = 8

    sections = []

    for i in range(section_count):
        section_info = int.from_bytes(mmstr_data[offset:offset+4], 'little')
        section_length = section_info * 16
        section_length &= 0xFFFFFFFF
        section_length >>= 2
        section_length = (section_length + 4) & 0xFFFFFFFF
        section_type = section_info >> 28
        
        if filenames:
            name_offset = offset + 8
            encoded = extract_null_terminated_bytestring(mmstr_data, name_offset)
            sections.append((decode_from_bytestring(encoded), section_type, mmstr_data[offset:offset + section_length]))
        else:
            sections.append((i, section_type, mmstr_data[offset:offset+section_length]))
        
        offset += section_length
    
    return sections

import os

def extract_mmstr_archive(archive_path, read_filenames=True):
    # Determine the directory name based on the archive name (without extension)
    directory_name = os.path.splitext(os.path.basename(archive_path))[0]
    
    # Ensure the directory exists
    os.makedirs(directory_name, exist_ok=True)
    
    # Read the archive data
    with open(archive_path, 'rb') as file:
        mmstr_data = file.read()
    
    # Extract sections using your helper function
    sections = get_mmstr_table(mmstr_data, read_filenames)
    
    for i, (file_name_or_index, section_type, content) in enumerate(sections):
        # If filenames are not being read, use the index as the file name
        if not read_filenames:
            file_name = f"file_{file_name_or_index:04d}.bin"  # Assuming .bin as generic extension
        else:
            # Use the decoded filename directly
            file_name = file_name_or_index
        
        # Determine the path to which the content should be written
        output_path = os.path.join(directory_name, file_name)
        
        # Write the content to the file
        with open(output_path, 'wb') as out_file:
            out_file.write(content)

        print(f"Extracted: {file_name} (Type: {section_type})")
        
    print(f"Extraction completed. Files are located in '{directory_name}'.")

extract_mmstr_archive("menuresources.mmstr", True)

# in_file = open("jingle.mmstr", "rb")
# data = in_file.read()
# mmstr_files = get_mmstr_table(data, False)
# for f in mmstr_files:
#     print(f[0], f[1])