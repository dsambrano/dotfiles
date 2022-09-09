import json
import os

def update_vscode_font(filename, vs_font_setting, font):
    with open(filename, 'r', encoding='utf-8') as f:
        content = f.read()
        data = json.loads(content)
    with open(filename, 'w', encoding='utf-8') as f:
        font_family = data.get(vs_font_setting)
        if not font_family == font:
            data.update({vs_font_setting: font})
        json.dump(data, f, ensure_ascii=False, indent=4)

def main():
    FONT = 'MesloLGS NF'
    FILENAME = os.path.join(os.path.expanduser("~"),'Library','Application Support','Code','User', 'settings.json')
    VS_FONT_SETTING = 'terminal.integrated.fontFamily'

    update_vscode_font(FILENAME, VS_FONT_SETTING, FONT)

if __name__ == '__main__':
    main()
