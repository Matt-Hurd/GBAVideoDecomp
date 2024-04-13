def sub_800652A_to_bytestring(input_string):
    # Convert input string to bytes for manipulation
    input_bytes = input_string.encode('utf-8')
    
    # Initialize an empty byte array for the result
    result = bytearray()
    
    # Mapping for special characters with their byte values
    special_char_mapping = {
        b' ': -1, b'\n': -2, b'.': 63, b',': 64, b':': 65, b';': 66,
        b'!': 67, b'?': 68, b'&': 69, b'(': 70, b')': 71, b'\'': 72,
        b'\x92': 72, b'`': 72, b'-': 73, b'/': 74, b'+': 75, b'\xA9': 76,
        b'\x99': 77, b'_': 78, b'$': 79, b'"': 80, b'\x93': 80, b'\x94': 80,
        b'<': 81, b'>': 82, b'*': 83, b'=': 84, b'\xAE': 85, b'#': 86,
        b'@': 87, b'%': 88, b'\\': 89, b'~': 90, b'[': 91, b']': 92,
    }

    for byte in input_bytes:
        if byte in special_char_mapping:
            mapped_value = special_char_mapping[bytes([byte])]
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

# Example usage
input_str = "background_instructions"
encoded_bytes = sub_800652A_to_bytestring(input_str)
print(f"Encoded Bytestring: {encoded_bytes}")
