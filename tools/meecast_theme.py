"""Minimal connection screen for the receiver's existing MeeCast service.

The firmware already owns discovery, phone commands and media hand-off.  This
module only restyles its real setup window and adds translated instructions;
it does not draw a QR code or claim that the service works without a device
test.
"""
from pathlib import Path
import xml.etree.ElementTree as ET


PREFIX = 'dvb/theme/'
WINDOW = PREFIX + 'widget/wnd_meecastqr.xml'
LANGUAGES = {
    'English': PREFIX + 'language/English.xml',
    'Russian': PREFIX + 'language/Russian.xml',
    'Ukrainian': PREFIX + 'language/Ukrainian.xml',
}

TITLE = 'Phone control with MeeCast'
STEP_WIFI = '1. Install MeeCast. Connect phone and receiver to the same home network.'
STEP_RECEIVER = '2. In MeeCast choose this receiver:'
STEP_SERVICE = '3. Use MeeCast for remote control or sending video. OK: Rename.'

TRANSLATIONS = {
    'English': {
        TITLE: TITLE,
        STEP_WIFI: STEP_WIFI,
        STEP_RECEIVER: STEP_RECEIVER,
        STEP_SERVICE: STEP_SERVICE,
    },
    'Russian': {
        TITLE: 'Управление с телефона через MeeCast',
        STEP_WIFI: '1. Установите MeeCast. Подключите телефон и приставку к одной домашней сети.',
        STEP_RECEIVER: '2. В MeeCast выберите эту приставку:',
        STEP_SERVICE: '3. В MeeCast откройте пульт или отправьте видео. OK: переименовать.',
    },
    'Ukrainian': {
        TITLE: 'Керування з телефона через MeeCast',
        STEP_WIFI: '1. Установіть MeeCast. Підключіть телефон і приставку до однієї домашньої мережі.',
        STEP_RECEIVER: '2. У MeeCast виберіть цю приставку:',
        STEP_SERVICE: '3. У MeeCast відкрийте пульт або надішліть відео. OK: перейменувати.',
    },
}


def _property(widget, name, value):
    parent = widget.find('property')
    if parent is None:
        parent = ET.SubElement(widget, 'property')
    node = parent.find(name)
    if node is None:
        node = ET.SubElement(parent, name)
    node.text = value


def _rect(widget, values):
    _property(widget, 'rect', '[' + ','.join(map(str, values)) + ']')


def _flat(widget, color):
    """Use the image widget as a plain card without adding an image asset."""
    prop = widget.find('property')
    _property(widget, 'mode', 'single')
    _property(widget, 'img', '')
    _property(widget, 'backcolor', f'[{color},{color},{color}]')
    for node in list(prop):
        if node.tag in ('lt_img', 'rt_img', 'lb_img', 'rb_img',
                        'l_img', 'r_img', 't_img', 'b_img'):
            prop.remove(node)


def _read(inputs, existing, path):
    if existing and path in existing:
        return existing[path]
    return (Path(inputs) / 'extracted/cramfs' / path).read_bytes()


def _merge_language(data, language):
    root = ET.fromstring(data)
    if root.get('name') != language:
        raise ValueError(f'Language file mismatch: expected {language!r}')
    for identifier, value in TRANSLATIONS[language].items():
        matches = [node for node in root.findall('tran')
                   if node.get('id') == identifier]
        if matches:
            for node in matches:
                node.text = value
        else:
            node = ET.SubElement(root, 'tran', {'id': identifier})
            node.text = value
            node.tail = '\n    '
    return ET.tostring(root, encoding='utf-8', xml_declaration=True)


def create_meecast_theme(inputs, existing=None):
    """Return a compact cramfs overlay for the native MeeCast setup window."""
    resources = {}
    root = ET.fromstring(_read(inputs, existing, WINDOW))
    widgets = {widget.get('name'): widget for widget in root.iter('widget')}
    required = {
        'img_meecast_qr_bak', 'txt_t2_meecast_input',
        'img_meecastqr_qr_android', 'txt_meecastqr_info_android',
        'txt_meecastqr_net', 'button_meecast_name', 'txt_meecast_name',
        'txt_t2_meecast_exit', 'img_meecast_exit', 'img_meecast_rename',
        'img_meecastqr_qr_ios', 'txt_meecastqr_info_ios',
        'txt_meecastqr_title',
    }
    missing = required.difference(widgets)
    if missing:
        raise ValueError('MeeCast widget contract changed: ' + ', '.join(sorted(missing)))

    _property(root, 'back_ground', 'null')
    _property(root, 'backcolor', '[#0F0F0F,#0F0F0F,#0F0F0F]')
    card = widgets['img_meecast_qr_bak']
    _rect(card, (48, 32, 928, 512))
    _flat(card, '#181818')

    title = widgets['txt_meecastqr_title']
    _rect(title, (80, 58, 864, 48))
    _property(title, 'string', TITLE)
    _property(title, 'font', 'font_mid')
    _property(title, 'alignment', 'left|vcentre')
    _property(title, 'forecolor', '[#F1F1F1,#FFFFFF,#F1F1F1]')
    _property(title, 'backcolor', '[gui_trans,gui_trans,gui_trans]')

    wifi = widgets['txt_meecastqr_net']
    _rect(wifi, (80, 124, 864, 36))
    _property(wifi, 'string', STEP_WIFI)
    _property(wifi, 'font', 'font_20')
    _property(wifi, 'alignment', 'left|vcentre')
    _property(wifi, 'forecolor', '[#C8C8C8,#FFFFFF,#C8C8C8]')
    _property(wifi, 'backcolor', '[gui_trans,gui_trans,gui_trans]')

    receiver = widgets['txt_meecast_name']
    _rect(receiver, (80, 185, 360, 42))
    _property(receiver, 'string', STEP_RECEIVER)
    _property(receiver, 'font', 'font_20')
    _property(receiver, 'alignment', 'left|vcentre')
    _property(receiver, 'forecolor', '[#C8C8C8,#FFFFFF,#C8C8C8]')
    _property(receiver, 'backcolor', '[gui_trans,gui_trans,gui_trans]')

    # The create callback fills this button with the real receiver name and
    # makes it visible.  Keep the original hidden initial state and key signal.
    name_button = widgets['button_meecast_name']
    _rect(name_button, (444, 185, 472, 42))
    _property(name_button, 'forecolor', '[#FFFFFF,#FFFFFF,#FFFFFF]')
    _property(name_button, 'backcolor', '[#292929,#3A3A3A,#292929]')
    _property(name_button, 'alignment', 'left|vcentre')

    # These strings are populated by app_t2_meecast_qr_create.  Only their
    # geometry and colours change; empty source strings remain empty.
    for icon_name, text_name, y in (
            ('img_meecastqr_qr_android', 'txt_meecastqr_info_android', 274),
            ('img_meecastqr_qr_ios', 'txt_meecastqr_info_ios', 342)):
        _rect(widgets[icon_name], (80, y, 40, 40))
        text = widgets[text_name]
        _rect(text, (140, y, 776, 40))
        _property(text, 'font', 'font_20')
        _property(text, 'alignment', 'left|vcentre')
        _property(text, 'forecolor', '[#AAAAAA,#FFFFFF,#AAAAAA]')
        _property(text, 'backcolor', '[gui_trans,gui_trans,gui_trans]')

    service = widgets['txt_t2_meecast_input']
    _rect(service, (132, 458, 784, 44))
    _property(service, 'string', STEP_SERVICE)
    _property(service, 'font', 'font_18')
    _property(service, 'alignment', 'left|vcentre')
    _property(service, 'forecolor', '[#AAAAAA,#FFFFFF,#AAAAAA]')
    _property(service, 'backcolor', '[gui_trans,gui_trans,gui_trans]')
    _rect(widgets['img_meecast_rename'], (80, 468, 40, 24))

    # Native code owns whether these exit widgets are shown.  Repositioning is
    # safe while their initial hidden states and image IDs stay unchanged.
    _rect(widgets['img_meecast_exit'], (824, 510, 40, 24))
    _rect(widgets['txt_t2_meecast_exit'], (872, 506, 72, 32))

    resources[WINDOW] = ET.tostring(root, encoding='utf-8', xml_declaration=True)
    for language, path in LANGUAGES.items():
        resources[path] = _merge_language(_read(inputs, existing, path), language)
    return resources


def render_preview(inputs, resources, destination, language='Russian'):
    """Render a layout illustration; it is not a device screenshot."""
    from PIL import Image, ImageDraw, ImageFont

    if language not in TRANSLATIONS:
        raise ValueError('Unsupported preview language')
    tr = TRANSLATIONS[language]
    font_path = str(Path(inputs) / 'extracted/cramfs/dvb/theme/font/arial.ttf')
    canvas = Image.new('RGB', (1024, 576), '#0F0F0F')
    draw = ImageDraw.Draw(canvas)
    draw.rectangle((48, 32, 975, 543), fill='#181818')
    font = lambda size: ImageFont.truetype(font_path, size)
    draw.text((80, 65), tr[TITLE], font=font(25), fill='#F1F1F1')
    draw.text((80, 131), tr[STEP_WIFI], font=font(20), fill='#C8C8C8')
    draw.text((80, 194), tr[STEP_RECEIVER], font=font(20), fill='#C8C8C8')
    draw.rectangle((444, 185, 915, 226), fill='#292929')
    draw.text((462, 194), 'Romsat T8020HD', font=font(20), fill='#FFFFFF')
    for y, label in ((274, 'Android 5.0+'), (342, 'iOS 9.0+')):
        draw.rounded_rectangle((80, y, 120, y + 40), radius=8, fill='#292929')
        draw.text((140, y + 8), label, font=font(20), fill='#AAAAAA')
    draw.text((132, 468), tr[STEP_SERVICE], font=font(18), fill='#AAAAAA')
    Path(destination).parent.mkdir(parents=True, exist_ok=True)
    canvas.save(destination)

