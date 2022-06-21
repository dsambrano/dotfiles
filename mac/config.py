#! /usr/bin/env python

import json
FONT = 'MesloLGS NF'
FILENAME = 'settings.json'
VS_FONT_SETTING = 'terminal.integrated.fontFamily' VS_FONT_SETTING

with open(FILENAME, 'r') as f:
    content = f.read()
data = json.loads(content)
font_family = data.get(VS_FONT_SETTING)
if not font_family == FONT:
    data.update({VS_FONT_SETTING: FONT})

with open(FILENAME, 'w', encoding='utf-8') as f:
    json.dump(data, f, ensure_ascii=False, indent=4)
