#! /usr/bin/env python3

from .. import utils
import os
FONT = 'MesloLGS NF'
FILENAME = os.path.join('~','Library','Application Support','Code','User', 'settings.json')
VS_FONT_SETTING = 'terminal.integrated.fontFamily'

utils.update_vscode_font(FILENAME, VS_FONT_SETTING, FONT)
