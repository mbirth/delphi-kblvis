object KBLEditForm: TKBLEditForm
  Left = 192
  Top = 107
  BorderStyle = bsDialog
  Caption = 'KBL-Editor'
  ClientHeight = 389
  ClientWidth = 572
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Px00Screen: TImage
    Left = 360
    Top = 40
    Width = 208
    Height = 320
  end
  object Label1: TLabel
    Left = 376
    Top = 24
    Width = 192
    Height = 13
    Caption = 'by Markus Birth <mbirth@webwriters.de>'
    Enabled = False
  end
  object Memo1: TMemo
    Left = 8
    Top = 40
    Width = 345
    Height = 297
    HideSelection = False
    Lines.Strings = (
      'T,Fitaly (US)'
      ''
      '! Maps:'
      '! 1 - Lowercase (arrows)'
      '! 2 - Uppercase (arrows)'
      '! 3 - Numeric'
      '! 4 - Numeric shifted (Symbols)'
      ''
      '! MAP 1 Lowercase FITALY'
      ''
      
        'M,0,0,210,0,300,207,5,12,195,0,209,207,ffffff,000000,333333,dddd' +
        'ff'
      'R'
      'K,001b,2,c0c0c0,000000,Esc'
      'K,007a'
      'K,0076'
      'K,0063'
      'K,0068'
      'K,0077'
      'K,006b'
      'K,0031,1,ffffa0'
      'K,0032,1,ffffa0'
      'K,0008,2,c0c0c0,000000,BS'
      'R'
      'K,0009,2,c0c0c0,000000,TAB'
      'K,0066'
      'K,0069'
      'K,0074'
      'K,0061'
      'K,006c'
      'K,0079'
      'K,0033,1,ffffa0'
      'K,0034,1,ffffa0'
      'K,000d,2,c0c0c0,000000,RET'
      'R'
      'L,2,2,c0c0c0,000000,Cap'
      'K,0020,2'
      'K,006e'
      'K,0065'
      'K,0020,2'
      'K,0035,1,ffffa0'
      'K,0036,1,ffffa0'
      'S,2,2,c0c0c0,000000,Shift'
      'R'
      'S,1,2,c0c0c0,000000,Ctrl'
      'K,0067'
      'K,0064'
      'K,006f'
      'K,0072'
      'K,0073'
      'K,0062'
      'K,0037,1,ffffa0'
      'K,0038,1,ffffa0'
      'K,f807,1,c0ffff,000000,<'
      'K,f6dd,1,c0ffff,000000,<<'
      'R'
      'L,3,2,c0c0c0,000000,123'
      'K,0071'
      'K,006a'
      'K,0075'
      'K,006d'
      'K,0070'
      'K,0078'
      'K,0039,1,ffffa0'
      'K,0030,1,ffffa0'
      'K,f808,1,c0ffff,000000,>'
      'K,f6dc,1,c0ffff,000000,>>'
      ''
      '! MAP 2 Uppercase FITALY'
      ''
      
        'M,0,0,210,0,300,207,5,12,195,0,209,207,ffffff,000000,333333,dddd' +
        'ff'
      'R'
      'K,001b,2,c0c0c0,000000,Esc'
      'K,005a'
      'K,0056'
      'K,0043'
      'K,0048'
      'K,0057'
      'K,004b'
      'K,002d,1,ffffa0'
      'K,0021,1,ffffa0'
      'K,0008,2,c0c0c0,000000,BS'
      'R'
      'K,0009,2,c0c0c0,000000,TAB'
      'K,0046'
      'K,0049'
      'K,0054'
      'K,0041'
      'K,004c'
      'K,0059'
      'K,002c,1,ffffa0'
      'K,003f,1,ffffa0'
      'K,000d,2,c0c0c0,000000,RET'
      'R'
      'L,1,2,000000,c0c0c0,Cap'
      'K,0020,2'
      'K,004e'
      'K,0045'
      'K,0020,2'
      'K,002e,1,ffffa0'
      'K,003a,1,ffffa0'
      'S,1,2,c0c0c0,000000,Shift'
      'R'
      'S,1,2,c0c0c0,000000,Ctrl'
      'K,0047'
      'K,0044'
      'K,004f'
      'K,0052'
      'K,0053'
      'K,0042'
      'K,0027,1,ffffa0'
      'K,0028,1,ffffa0'
      'K,f807,1,c0ffff,000000,<'
      'K,f6dd,1,c0ffff,000000,<<'
      'R'
      'L,3,2,c0c0c0,000000,123'
      'K,0051'
      'K,004a'
      'K,0055'
      'K,004d'
      'K,0050'
      'K,0058'
      'K,002f,1,ffffa0'
      'K,0029,1,ffffa0'
      'K,f808,1,c0ffff,000000,>'
      'K,f6dc,1,c0ffff,000000,>>'
      ''
      '! MAP 3 Numeric FITALY'
      ''
      
        'M,0,0,210,0,300,207,5,12,195,0,209,207,ffffff,000000,333333,dddd' +
        'ff'
      'R'
      'K,001b,2,c0c0c0,000000,Esc'
      'K,003c'
      'K,003e'
      'K,003d'
      'K,00d7'
      'K,00f7'
      'K,002b'
      'K,002d,1,ffffa0'
      'K,0021,1,ffffa0'
      'K,0008,2,c0c0c0,000000,BS'
      'R'
      'K,0009,2,c0c0c0,000000,TAB'
      'K,00a4'
      'K,00b0'
      'K,0040'
      'K,0031'
      'K,0032'
      'K,0033'
      'K,002c,1,ffffa0'
      'K,003f,1,ffffa0'
      'K,000d,2,c0c0c0,000000,RET'
      'R'
      'L,4,2,c0c0c0,000000,Cap'
      'K,0020,2'
      'K,0026'
      'K,0034'
      'K,0035'
      'K,0036'
      'K,002e,1,ffffa0'
      'K,003a,1,ffffa0'
      'S,4,2,c0c0c0,000000,Shift'
      'R'
      'S,1,2,c0c0c0,000000,Ctrl'
      'K,00a5'
      'K,00a2'
      'K,0025'
      'K,0037'
      'K,0038'
      'K,0039'
      'K,0027,1,ffffa0'
      'K,0028,1,ffffa0'
      'K,f807,1,c0ffff,000000,<'
      'K,f6dd,1,c0ffff,000000,<<'
      'R'
      'L,1,2,c0c0c0,000000,abc'
      'K,20ac'
      'K,00a3'
      'K,0024'
      'K,002a'
      'K,0030'
      'K,0023'
      'K,002f,1,ffffa0'
      'K,0029,1,ffffa0'
      'K,f808,1,c0ffff,000000,>'
      'K,f6dc,1,c0ffff,000000,>>'
      ''
      '! MAP 4 Symbols (Numeric shifted)'
      ''
      
        'M,0,0,210,0,300,207,5,12,195,0,209,207,ffffff,000000,333333,dddd' +
        'ff'
      'R'
      'K,001b,2,c0c0c0,000000,Esc'
      'K,2020'
      'K,2021'
      'K,00aa'
      'K,00ac'
      'K,00ba'
      'K,00b1'
      'K,005f,1,ffffa0'
      'K,00a1,1,ffffa0'
      'K,0008,2,c0c0c0,000000,BS'
      'R'
      'K,0009,2,c0c0c0,000000,TAB'
      'K,2021'
      'K,2021'
      'K,007c'
      'K,00b9'
      'K,00b2'
      'K,00b3'
      'K,2018,1,ffffa0'
      'K,00bf,1,ffffa0'
      'K,000d,2,c0c0c0,000000,RET'
      'R'
      'L,3,2,c0c0c0,000000,Cap'
      'K,00a0,2,ffffff,000000,n.b.'
      'K,00a6'
      'K,00bc'
      'K,00bd'
      'K,00be'
      'K,2019,1,ffffa0'
      'K,003b,1,ffffa0'
      'S,3,2,c0c0c0,000000,Shift'
      'R'
      'S,1,2,c0c0c0,000000,Ctrl'
      'K,00e3'
      'K,00f5'
      'K,2030'
      'K,201a'
      'K,00af'
      'K,00b7'
      'K,0022,1,ffffa0'
      'K,201c,1,ffffa0'
      'K,f807,1,c0ffff,000000,<'
      'K,f6dd,1,c0ffff,000000,<<'
      'R'
      'L,1,2,c0c0c0,000000,abc'
      'K,00c3'
      'K,00d5'
      'K,0192'
      'K,201e'
      'K,00ad'
      'K,2026'
      'K,005c,1,ffffa0'
      'K,201d,1,ffffa0'
      'K,f808,1,c0ffff,000000,>'
      'K,f6dc,1,c0ffff,000000,>>')
    ScrollBars = ssVertical
    TabOrder = 0
    WordWrap = False
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Open...'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 88
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Save'
    Enabled = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 168
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Save As...'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 408
    Top = 360
    Width = 161
    Height = 25
    Caption = 'Visualize!'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Stat: TListBox
    Left = 8
    Top = 344
    Width = 345
    Height = 41
    ItemHeight = 13
    TabOrder = 5
  end
  object SpinEdit1: TSpinEdit
    Left = 360
    Top = 360
    Width = 41
    Height = 22
    MaxValue = 255
    MinValue = 1
    TabOrder = 6
    Value = 1
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'kbl'
    Filter = 'PopOnTob Keyboard Layouts (*.kbl)|*.kbl|All Files (*.*)|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing, ofDontAddToRecent]
    Left = 264
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    Filter = 'PopOnTop Keyboard Layout (*.kbl)|*.kbl|All Files (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing, ofDontAddToRecent]
    Left = 320
    Top = 8
  end
end
