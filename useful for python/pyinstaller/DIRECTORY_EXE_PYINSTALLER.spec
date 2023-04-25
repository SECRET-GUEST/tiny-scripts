# -*- mode: python ; coding: utf-8 -*-

block_cipher = None

a = Analysis(['C:\\YOUR\\PATH\\HERE\\SCRIPT.py'],
             pathex=[],
             binaries=[],
             datas=[
                 ('C:\\YOUR\\PATH\\HERE\\ico\\YOUR_ICON_NAME.ico', 'ICON_FOLDER_NAME'),
                 ('C:\\YOUR\\PATH\\HERE\\ico\\close.png', 'ICON_FOLDER_NAME'),
                 ('C:\\YOUR\\PATH\\HERE\\style\\example.css', 'style'),
             ],
             hiddenimports=[],
             hookspath=[],
             hooksconfig={},
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher)

pyz = PYZ(a.pure, a.zipped_data, cipher=block_cipher)

exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          name='NAME OF THE APP HERE',
          debug=False,
          bootloader_ignore_signals=False,
          strip=False,
          upx=False,
          upx_exclude=[],
          runtime_tmpdir=None,
          console=False,
          disable_windowed_traceback=False,
          target_arch=None,
          codesign_identity=None,
          entitlements_file=None,
          icon='C:\\YOUR\\PATH\\HERE\\ico\\YOUR_ICON_NAME.ico')

coll = COLLECT(exe, a.binaries, a.zipfiles, a.datas, strip=False, upx=False, upx_exclude=[], name='NAME OF THE APP HERE')
