from PIL import Image, ImageDraw, ImageFont

def dodraw(s):
    out = Image.new("RGB", (256, 64), (0, 0, 0))

    fnt = ImageFont.truetype("K:/FreeUniversal-Regular.ttf", 50)
    d = ImageDraw.Draw(out)
    offset = 2+(20*7-len(s)*20)
    for x in range(7):
        for y in range(7):
            d.multiline_text((offset+x, y), s, font=fnt, fill=(120, 20, 20))
    d.multiline_text((offset+3, 3), s, font=fnt, fill=(255, 180, 40))

    out = out.transpose(method=Image.Transpose.FLIP_LEFT_RIGHT)
    out = out.transpose(method=Image.Transpose.FLIP_TOP_BOTTOM)
    out.save("K:/Jupiter Hell/mods/sound_visualizer/svis_textures/"+s.lower()+"_diffuse.png","PNG")


words = [
    "blerh",
    "snarl",
    "growl",
    "bellow",
    "grumble",
    "howl",
    "roar",
    "blip",
    "warble",
    "trill",
    
    "clank",
    "kachunk",
    "chirp",
    
    "chunk",
    "open",
    "close",
    "ding",
    "buzz",
    "buzzar",
    "chatter",
    "whirr",
    "hiss",
    "skitter",
    
    "boom",
    "crash",
    
    "ching",
    "death",
]

for w in words:
    dodraw(w.upper())
    
    print ("""register_gfx_blueprint "svfx_"""+w+""""{
        blueprint = "svfx_base",
        particle = {
            material       = "svis_textures/""" + w + """",
            group_id       = "pgroup_test",
        },}""")
    
print("")
print("")
    
for w in words:
    print("""register_blueprint "svfx_"""+w+""""{blueprint = "svfx_base",}""")
