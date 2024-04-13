from PIL import Image

def render_gba_mode3(in_data):
    # Image dimensions
    width, height = 240, 160
    # width, height = 8, 8
    
    # Create a new image with RGB mode
    image = Image.new("RGB", (width, height))
    pixels = image.load()
    idx = 0
    for y in range(height):
        for x in range(width):
            # Read two bytes per pixel
            data = in_data[idx:idx+2]
            idx += 2
            
            # Ensure we did not hit EOF
            if len(data) < 2:
                return image
            
            # Unpack the color values
            color = int.from_bytes(data, "little")
            red = (color & 0x1F) << 3
            green = ((color >> 5) & 0x1F) << 3
            blue = ((color >> 10) & 0x1F) << 3
            
            # Set the pixel color
            pixels[x, y] = (red, green, blue)
    return image