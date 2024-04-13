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