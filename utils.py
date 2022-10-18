import json
import os
from pathlib import Path

def update_vscode_font(file, vs_font_setting, font):
    data = {}
    if file.exists():
        with file.open('r', encoding='utf-8') as f:
            try:
                content = f.read()
                data = json.loads(content)
            except:
                pass # If it doesnt load in properly there is probably a problem with the file so just delete it all together. Should probably at least give warning requiring user input

    with file.open('w', encoding='utf-8') as f:
        font_family = data.get(vs_font_setting)
        if not font_family == font:
            data.update({vs_font_setting: font})
        json.dump(data, f, ensure_ascii=False, indent=4)
        print('Just dumped')
    print(data)

def main():
    FONT = 'MesloLGS NF'
    FILENAME = os.path.join(os.path.expanduser("~"),'Library','Application Support','Code','User', 'settings.json')
    FILENAME = Path.home() / Path('Library/Application Support/Code/User/setting.json')
    VS_FONT_SETTING = 'terminal.integrated.fontFamily'

    update_vscode_font(FILENAME, VS_FONT_SETTING, FONT)

if __name__ == '__main__':
    main()
