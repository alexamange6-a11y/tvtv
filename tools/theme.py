"""Six native image widgets, using packaged RGB565 resources and real labels.

This resource set REQUIRES the matching experimental list callback. Never apply
it to the unmodified firmware: the manufacturer's category actions differ.
"""
from pathlib import Path
import io
import struct
import xml.etree.ElementTree as ET
from PIL import Image, ImageDraw, ImageFont

TILES = ('ТВ', 'YouTube', 'MEGOGO', 'IPTV', 'Медиаплеер', 'Настройки')
SLOTS = ('program', 'pic', 'search', 'time', 'option', 'system')
WIDGETS = ('program', 'picture', 'search', 'time', 'option', 'system')


def rgb565(image):
    image = image.convert('RGB')
    w,h = image.size
    stride = (w*2+3)&~3
    pixels = bytearray(stride*h)
    for y in range(h):
        for x in range(w):
            r,g,b = image.getpixel((x,h-1-y))
            struct.pack_into('<H',pixels,y*stride+x*2,(r>>3)<<11 | (g>>2)<<5 | b>>3)
    header = struct.pack('<2sIHHI',b'BM',66+len(pixels),0,0,66)
    header += struct.pack('<IiiHHIIiiII',40,w,h,1,16,3,len(pixels),2835,2835,0,0)
    return header+struct.pack('<III',0xf800,0x07e0,0x001f)+pixels


def create_theme(inputs):
    source = inputs/'patch_sources/romsat_appletv_six_tiles_v2/dvb/theme'
    root = ET.parse(source/'widget/win_t2_main_menu.xml')
    children = root.getroot().find('children')
    # Keep names, ordering and original callback registration. The binary hook
    # replaces list_t2_main_menu_keypress in place; it doesn't invent XML actions.
    for widget in children.findall('widget'):
        name = widget.get('name')
        prop = widget.find('property')
        if name in ['win_t2_main_menu_title_'+w for w in WIDGETS]:
            i = WIDGETS.index(name.removeprefix('win_t2_main_menu_title_'))
            prop.find('rect').text = f'[{47+i*155},310,112,137]'
        elif name == 'win_t2_main_menu_list':
            # Keep the list focused for event delivery but place its paint area
            # off the visible six-tile band. Zero-area list delivery is a device
            # integration question, explicitly NOT marked hardware verified.
            prop.find('rect').text = '[0,0,0,0]'
        elif name in ('win_t2_main_menu_background','win_t2_main_menu_exit_btn',
                      'win_t2_main_menu_return_txt','win_t2_main_menu_ok_btn',
                      'win_t2_main_menu_ok_txt'):
            pass
        else:
            state = prop.find('state')
            if state is None: state = ET.SubElement(prop,'state')
            state.text = 'hide'
            if name == 'win_t2_main_menu_title_usb':
                prop.find('rect').text = '[0,0,0,0]'
    overlay = {}
    relative = 'dvb/theme/'
    overlay[relative+'widget/win_t2_main_menu.xml'] = ET.tostring(root.getroot(),encoding='utf-8',xml_declaration=True)
    # Reuse the existing background registry entry; no unsupported image IDs.
    registry = ET.parse(source/'image/image.xml')
    for entry in registry.getroot().findall('image'):
        if entry.get('id') == 'T2_appletv_home_background.bmp':
            # Stock image.xml already supports JPEG (bg.jpg/audioback.jpg).
            # Keep the registered image ID but point to a distinct JPEG asset.
            entry.text = 'liquid_home.jpg'
    overlay[relative+'image/image.xml'] = ET.tostring(registry.getroot(),encoding='ISO-8859-1',xml_declaration=True)
    overlay[relative+'color/color.xml'] = (source/'color/color.xml').read_bytes()
    # Packaged background has a decorative submenu band. Remove that band and
    # old baked labels, retaining its existing hero and ambient top imagery.
    background = Image.open(source/'image/image_T2/mainmenu/T2_appletv_home_background.bmp').convert('RGB')
    draw = ImageDraw.Draw(background)
    draw.rectangle((0,245,1023,575),fill=(13,22,40))
    font = ImageFont.truetype(str(inputs/'extracted/cramfs/dvb/theme/font/arial.ttf'),19)
    draw.text((47,265),'Выберите приложение',font=font,fill=(220,231,250))
    draw.text((47,490),'← →  Выбор     OK  Открыть     EXIT / BACK  Назад',font=font,fill=(190,205,232))
    draw.text((47,523),'0  Телефон · MeeCast',font=font,fill=(190,205,232))
    image_path = relative+'image/image_T2/mainmenu/'
    encoded = io.BytesIO()
    background.save(encoded,format='JPEG',quality=35,optimize=True,subsampling=2)
    overlay[relative+'image/liquid_home.jpg'] = encoded.getvalue()
    reference = Image.open(inputs/'reference/desired_menu.png').convert('RGB')
    # User-supplied app artwork, used as raster icons; labels are rendered anew
    # so no stale "Кино" or "Недавно открыто" text enters the resource set.
    artwork = {1:(151,577,229,635),2:(422,577,489,635),3:(685,576,747,636),
               4:(1208,576,1272,636)}
    for i,slot in enumerate(SLOTS):
        template_slot = ('program','pic','search','time','usb','system')[i]
        for state in ('focus','unfocus'):
            path = source/'image/image_T2/mainmenu'/f'T2_icon_{template_slot}_{state}.bmp'
            tile = Image.open(path).convert('RGB')
            draw = ImageDraw.Draw(tile)
            if i in artwork:
                icon = reference.crop(artwork[i]); icon.thumbnail((60,56),Image.Resampling.LANCZOS)
                draw.rectangle((28,42,85,88),fill=tile.getpixel((20,80)))
                tile.paste(icon,((112-icon.width)//2,42))
            draw.rectangle((7,96,104,120),fill=tile.getpixel((20,93)))
            label_font = ImageFont.truetype(str(inputs/'extracted/cramfs/dvb/theme/font/arial.ttf'),
                                           14 if len(TILES[i])>9 else 16)
            box = draw.textbbox((0,0),TILES[i],font=label_font)
            draw.text(((112-(box[2]-box[0]))/2,99),TILES[i],font=label_font,fill=(240,246,255))
            # Limit raster palette before RGB565 encoding to fit the fixed
            # 768 KiB ROOT partition; no dithering noise in compressed blocks.
            tile = tile.quantize(colors=16,dither=Image.Dither.NONE).convert('RGB')
            overlay[image_path+f'T2_icon_{slot}_{state}.bmp'] = rgb565(tile)
    return overlay


def verify_theme(overlay):
    menu = ET.fromstring(overlay['dvb/theme/widget/win_t2_main_menu.xml'])
    slots = [w for w in menu.findall('./children/widget')
             if w.get('name') in ['win_t2_main_menu_title_'+s for s in WIDGETS]]
    assert len(slots) == 6
    assert len({w.find('./property/rect').text.split(',')[1] for w in slots}) == 1
    for data in overlay.values():
        if data.startswith(b'BM'):
            assert struct.unpack_from('<H',data,28)[0] == 16
            assert struct.unpack_from('<I',data,30)[0] == 3
            with Image.open(io.BytesIO(data)) as image: image.load()
    assert menu.find('./children/widget/signal') is not None
