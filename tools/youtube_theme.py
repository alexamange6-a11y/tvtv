"""Minimal TV search/list layout for the native shared netvideo renderer.

Keep all four real result slots and callback names. A 2D grid would require
changing native navigation; this layout keeps its existing four-row behaviour.
"""
import io
import xml.etree.ElementTree as ET
from PIL import Image, ImageDraw, ImageFont
from theme import rgb565

PREFIX = 'dvb/theme/'
BROWSE = PREFIX+'widget/wnd_apps_netvideo.xml'
PLAYER = PREFIX+'widget/wnd_apps_netvideo_play.xml'
REGISTRY = PREFIX+'image/image.xml'
FOCUS_ID = 'yt_tv_result_focus.bmp'
GROUP_ID = 'yt_tv_group_focus.bmp'


def prop(widget, name, value):
    parent = widget.find('property')
    if parent is None: parent = ET.SubElement(widget,'property')
    node = parent.find(name)
    if node is None: node = ET.SubElement(parent,name)
    node.text = value


def rect(widget, values): prop(widget,'rect','['+','.join(map(str,values))+']')


def flat(widget, color):
    prop(widget,'mode','single')
    prop(widget,'img','')
    prop(widget,'backcolor',f'[{color},{color},{color}]')
    for node in list(widget.find('property')):
        if node.tag in ('lt_img','rt_img','lb_img','rb_img','l_img','r_img','t_img','b_img'):
            widget.find('property').remove(node)


def create_youtube_theme(inputs, existing=None):
    resources = {}
    original = inputs/'extracted/cramfs'
    tree = ET.parse(original/BROWSE)
    widgets = {w.get('name'):w for w in tree.iter('widget')}
    root = tree.getroot()
    prop(root,'back_ground','null')
    prop(root,'backcolor','[#0F0F0F,#0F0F0F,#0F0F0F]')
    for name in ('img_netvideo_bg','img_netvideo_bg_bottom','img_netvideo_listview_bg'):
        flat(widgets[name],'#0F0F0F')
    rect(widgets['img_netvideo_bg'],(0,0,1024,576))
    rect(widgets['img_netvideo_bg_bottom'],(24,524,976,40))
    rect(widgets['img_netvideo_listview_bg'],(24,96,216,408))
    rect(widgets['text_netvideo_title'],(32,24,650,48))
    prop(widgets['text_netvideo_title'],'forecolor','[#F1F1F1,#F1F1F1,#F1F1F1]')
    # Runtime title remains YouTube or MEGOGO, according to the active client.
    for name in ('img_netvideo_date','text_netvideo_date','img_netvideo_time','text_netvideo_time',
                 'img_netvideo_line1','img_netvideo_line2','img_netvideo_line3'):
        prop(widgets[name],'state','hide')
    group = widgets['list_netvideo_group']
    rect(group,(32,104,202,366))
    prop(group,'item_rect','[0,0,194,37]')
    prop(group,'focus_img',GROUP_ID)
    prop(group,'font','font_20')
    prop(group,'item_fore_color','[#AAAAAA,#FFFFFF,#AAAAAA]')
    prop(group,'item_back_color','[#0F0F0F,#292929,#0F0F0F]')
    prop(group,'alignment','left|vcentre')
    rect(widgets['header_netvideo_feeds'],(0,0,194,0))
    rect(widgets['headertext_netvideo_feeds'],(8,0,178,0))
    rect(widgets['scrollbar_netvideo_feeds'],(194,0,8,366))
    for i in range(1,5):
        y = 98+(i-1)*102
        focus = widgets[f'img_netvideo_item_focus{i}']
        rect(focus,(264,y-3,166,96)); prop(focus,'img',FOCUS_ID)
        rect(widgets[f'img_netvideo_item_unfocus{i}'],(267,y,160,90))
        title = widgets[f'text_netvideo_item_title{i}']
        rect(title,(448,y+2,536,30)); prop(title,'font','font_mid')
        prop(title,'forecolor','[#F1F1F1,#FFFFFF,#F1F1F1]')
        for name,values in ((f'text_netvideo_item_author{i}',(448,y+37,536,24)),
                            (f'text_netvideo_item_duration{i}',(448,y+65,98,22)),
                            (f'text_netvideo_viewcount{i}',(552,y+65,432,22))):
            rect(widgets[name],values)
            prop(widgets[name],'font','font_18')
            prop(widgets[name],'forecolor','[#AAAAAA,#AAAAAA,#AAAAAA]')
            prop(widgets[name],'backcolor','[gui_trans,gui_trans,gui_trans]')
    rect(widgets['text_netvideo_page'],(804,36,180,24))
    rect(widgets['img_netvideo_page_up'],(608,74,35,20))
    rect(widgets['img_netvideo_page_down'],(608,501,35,20))
    rect(widgets['img_netvideo_gif'],(960,28,32,32))
    # Retain all remote-button hints and their dynamic labels, without new fake controls.
    for name,w in widgets.items():
        if name.startswith('text_netvideo_') and name.rsplit('_',1)[-1] in ('red','menu','move','ok','exit','blue'):
            prop(w,'font','font_18')
            prop(w,'forecolor','[#AAAAAA,#FFFFFF,#AAAAAA]')
    resources[BROWSE] = ET.tostring(root,encoding='utf-8',xml_declaration=True)
    player = ET.parse(original/PLAYER)
    pw = {w.get('name'):w for w in player.iter('widget')}
    # Transparent video plane, seek behaviour, modal errors and busy states stay native.
    flat(pw['img_netvideo_play_barback'],'#181818')
    rect(pw['img_netvideo_play_barback'],(32,420,960,140))
    rect(pw['text_netvideo_play_title'],(56,436,912,34))
    prop(pw['text_netvideo_play_title'],'font','font_mid')
    prop(pw['text_netvideo_play_title'],'forecolor','[#F1F1F1,#FFFFFF,#F1F1F1]')
    resources[PLAYER] = ET.tostring(player.getroot(),encoding='utf-8',xml_declaration=True)
    registry = ET.fromstring((existing or {}).get(REGISTRY,(original/REGISTRY).read_bytes()))
    for name in (FOCUS_ID,GROUP_ID):
        if any(e.get('id')==name for e in registry.findall('image')):
            raise ValueError('Duplicate image registration')
        ET.SubElement(registry,'image',{'id':name}).text = name
    resources[REGISTRY] = ET.tostring(registry,encoding='ISO-8859-1',xml_declaration=True)
    focus = Image.new('RGB',(166,96),'#FF00FF')
    ImageDraw.Draw(focus).rectangle((0,0,165,95),outline='#FF3030',width=3)
    resources[PREFIX+'image/'+FOCUS_ID] = rgb565(focus)
    group_image = Image.new('RGB',(194,37),'#292929')
    ImageDraw.Draw(group_image).rectangle((0,0,3,36),fill='#FF3030')
    resources[PREFIX+'image/'+GROUP_ID] = rgb565(group_image)
    return resources


def render_preview(inputs, resources, destination):
    """Layout inspection only; sample content does not ship in firmware resources."""
    menu = ET.fromstring(resources[BROWSE])
    widgets = {w.get('name'):w for w in menu.iter('widget')}
    fontpath = str(inputs/'extracted/cramfs/dvb/theme/font/arial.ttf')
    canvas = Image.new('RGB',(1024,576),'#0F0F0F'); draw = ImageDraw.Draw(canvas)
    font = lambda size:ImageFont.truetype(fontpath,size)
    draw.text((32,24),'YouTube',font=font(32),fill='#F1F1F1')
    for i,label in enumerate(('Главная','Поиск','Популярное','Настройки')):
        y=104+i*46
        if i==0:
            draw.rectangle((32,y,226,y+37),fill='#292929')
            draw.rectangle((32,y,35,y+37),fill='#FF3030')
        draw.text((44,y+7),label,font=font(20),fill='#FFFFFF' if i==0 else '#AAAAAA')
    for i in range(1,5):
        def position(name):
            text=widgets[name].find('./property/rect').text
            return tuple(map(int,text.strip('[]').split(',')))
        x,y,w,h=position(f'img_netvideo_item_unfocus{i}')
        draw.rectangle((x,y,x+w-1,y+h-1),fill='#272727')
        if i==1:draw.rectangle((x-3,y-3,x+w+2,y+h+2),outline='#FF3030',width=3)
        draw.polygon(((x+72,y+32),(x+72,y+58),(x+94,y+45)),fill='#737373')
        x,y,_,_=position(f'text_netvideo_item_title{i}')
        draw.text((x,y),f'Название видеоролика {i}',font=font(25),fill='#F1F1F1')
        x,y,_,_=position(f'text_netvideo_item_author{i}')
        draw.text((x,y),'Канал · пример размещения',font=font(18),fill='#AAAAAA')
        x,y,_,_=position(f'text_netvideo_item_duration{i}')
        draw.text((x,y),'12:34',font=font(18),fill='#AAAAAA')
    draw.text((32,540),'EXIT  Назад     MENU  Настройки     OK  Смотреть',font=font(18),fill='#AAAAAA')
    canvas.save(destination)
