import json

def update_vscode_font(filename, vs_font_setting, font):
    with open(filename, 'w', encoding='utf-8') as f:
        content = f.read()
        data = json.loads(content)
        font_family = data.get(vs_font_setting)
        if not font_family == font:
            data.update({vs_font_setting: font})
        json.dump(data, f, ensure_ascii=False, indent=4)
