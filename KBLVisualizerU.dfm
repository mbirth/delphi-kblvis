object KBLEditForm: TKBLEditForm
  Left = 190
  Top = 107
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'KBL-Visualizer'
  ClientHeight = 504
  ClientWidth = 670
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelUnicodeTable: TLabel
    Left = 0
    Top = 368
    Width = 417
    Height = 13
    Caption = 
      'Unicode table:  (insert with double-click; special codes at bott' +
      'om - click list and press '#39' - '#39')'
  end
  object Px00Screen: TImage
    Left = 457
    Top = 35
    Width = 208
    Height = 320
  end
  object LabelByMarkusBirth: TLabel
    Left = 473
    Top = 19
    Width = 192
    Height = 13
    Caption = 'by Markus Birth <mbirth@webwriters.de>'
    Enabled = False
  end
  object LabelR: TLabel
    Left = 568
    Top = 392
    Width = 8
    Height = 13
    Caption = 'R'
  end
  object LabelG: TLabel
    Left = 568
    Top = 408
    Width = 8
    Height = 13
    Caption = 'G'
  end
  object LabelB: TLabel
    Left = 569
    Top = 424
    Width = 7
    Height = 13
    Caption = 'B'
  end
  object LabelColorEditor: TLabel
    Left = 584
    Top = 489
    Width = 67
    Height = 13
    Caption = 'Color Editor'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelFile: TLabel
    Left = 328
    Top = 8
    Width = 337
    Height = 13
    AutoSize = False
    Caption = 'Filename goes here.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelSyntax: TLabel
    Left = 0
    Top = 32
    Width = 449
    Height = 13
    AutoSize = False
    Caption = 'Syntax goes here.'
  end
  object ButtonOpen: TButton
    Left = 81
    Top = 3
    Width = 75
    Height = 25
    Caption = 'Open...'
    TabOrder = 1
    OnClick = ButtonOpenClick
  end
  object ButtonSave: TButton
    Left = 161
    Top = 3
    Width = 75
    Height = 25
    Caption = 'Save'
    Enabled = False
    TabOrder = 2
    OnClick = ButtonSaveClick
  end
  object ButtonSaveAs: TButton
    Left = 241
    Top = 3
    Width = 75
    Height = 25
    Caption = 'Save As...'
    TabOrder = 3
    OnClick = ButtonSaveAsClick
  end
  object ButtonVisualize: TButton
    Left = 505
    Top = 355
    Width = 161
    Height = 25
    Caption = 'Visualize!'
    TabOrder = 4
    OnClick = ButtonVisualizeClick
  end
  object SpinEdit1: TSpinEdit
    Left = 457
    Top = 355
    Width = 41
    Height = 22
    MaxValue = 255
    MinValue = 1
    TabOrder = 6
    Value = 1
  end
  object Unicodes: TStringGrid
    Left = 0
    Top = 384
    Width = 561
    Height = 120
    ColCount = 2
    DefaultRowHeight = 16
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSizing, goColSizing, goRowSelect]
    ScrollBars = ssVertical
    TabOrder = 7
    OnDblClick = UnicodesDblClick
    OnKeyPress = UnicodesKeyPress
    ColWidths = (
      468
      64)
  end
  object ButtonNew: TButton
    Left = 2
    Top = 3
    Width = 75
    Height = 25
    Caption = 'New'
    TabOrder = 8
    OnClick = ButtonNewClick
  end
  object TrackR: TTrackBar
    Left = 584
    Top = 392
    Width = 81
    Height = 25
    Max = 255
    PageSize = 16
    Frequency = 16
    TabOrder = 9
    ThumbLength = 10
    OnChange = TrackRChange
  end
  object TrackG: TTrackBar
    Left = 584
    Top = 408
    Width = 81
    Height = 25
    Max = 255
    PageSize = 16
    Frequency = 16
    TabOrder = 10
    ThumbLength = 10
    OnChange = TrackGChange
  end
  object TrackB: TTrackBar
    Left = 584
    Top = 424
    Width = 81
    Height = 25
    Max = 255
    PageSize = 16
    Frequency = 16
    TabOrder = 11
    ThumbLength = 10
    OnChange = TrackBChange
  end
  object ButtonColorGet: TButton
    Left = 568
    Top = 468
    Width = 33
    Height = 17
    Caption = 'Get'
    TabOrder = 13
    OnClick = ButtonColorGetClick
  end
  object ButtonColorInsert: TButton
    Left = 632
    Top = 468
    Width = 33
    Height = 17
    Caption = 'Insert'
    TabOrder = 12
    OnClick = ButtonColorInsertClick
  end
  object ColorPanel: TPanel
    Left = 568
    Top = 448
    Width = 97
    Height = 17
    Caption = '000000'
    Color = clBlack
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
  end
  object Memo1: TMemo
    Left = 1
    Top = 48
    Width = 448
    Height = 313
    HideSelection = False
    Lines.Strings = (
      'T,Fitaly (int.)'
      ''
      '! created by:'
      '! Markus Birth'
      '! <mbirth@webwriters.de>'
      ''
      '! Fitaly by Textware Solutions http://www.fitaly.com'
      ''
      '! Maps overview:'
      '! 1 - Lowercase'
      '! 2 - Uppercase SHIFTED'
      '! 3 - Uppercase CAPS'
      '! 4 - Uppercase SHIFTED/CAPS'
      '! 5 - Numeric'
      '! 6 - Numeric SHIFTED'
      '! 7 - Lowercase acute'
      '! 8 - Lowercase grave'
      '! 9 - Lowercase uml'
      '!10 - Lowercase circ'
      '!11 - Uppercase acute'
      '!12 - Uppercase grave'
      '!13 - Uppercase uml'
      '!14 - Uppercase circ'
      ''
      '! MAP 1 Lowercase FITALY'
      ''
      
        'M,0,0,210,0,300,207,5,13,195,0,209,207,ffffff,000000,333333,dddd' +
        'ff'
      'R'
      'K,001b,2,c0c0c0,000000,Esc'
      'K,007a'
      'K,0076'
      'K,0063'
      'K,0068'
      'K,0077'
      'K,006b'
      'K,0031,1,ffc040'
      'K,0032,1,ffc040'
      'K,0008,2,c0c0c0,000000,<---'
      'K,f7ff,1,000040,ffffff,M'
      'R'
      'K,0009,2,c0c0c0,000000,Tab'
      'K,0066'
      'K,0069'
      'K,0074'
      'K,0061'
      'K,006c'
      'K,0079'
      'K,0033,1,ffc040'
      'K,0034,1,ffc040'
      'K,000d,2,c0c0c0,000000,RET'
      'K,f6dd,1,404080,ffffff,P'
      'R'
      'S,2,2,c0c0c0,000000,Shift'
      'K,0020,2'
      'K,006e'
      'K,0065'
      'K,0020,2'
      'K,0035,1,ffc040'
      'K,0036,1,ffc040'
      'S,2,2,c0c0c0,000000,Shift'
      'K,f6dc,1,404080,ffffff,N'
      'R'
      'L,3,2,c0c0c0,000000,Cap'
      'K,0067'
      'K,0064'
      'K,006f'
      'K,0072'
      'K,0073'
      'K,0062'
      'K,0037,1,ffc040'
      'K,0038,1,ffc040'
      'S,7,1,c0ffff,000000,'#180
      'S,8,1,c0ffff,000000,`'
      'K,f807,1,408040,ffffff,<'
      'R'
      'L,5,2,c0c0c0,000000,123'
      'K,0071'
      'K,006a'
      'K,0075'
      'K,006d'
      'K,0070'
      'K,0078'
      'K,0039,1,ffc040'
      'K,0030,1,ffc040'
      'S,9,1,c0ffff,000000,'#168
      'S,10,1,c0ffff,000000,^'
      'K,f808,1,408040,ffffff,>'
      ''
      '! MAP 2 Uppercase shifted FITALY'
      ''
      
        'M,0,0,210,0,300,207,5,13,195,0,209,207,ffffff,000000,333333,dddd' +
        'ff'
      'R'
      'K,001b,2,c0c0c0,000000,Esc'
      'K,005a'
      'K,0056'
      'K,0043'
      'K,0048'
      'K,0057'
      'K,004b'
      'K,002d,1,ffc040'
      'K,0021,1,ffc040'
      'K,0008,2,c0c0c0,000000,<---'
      'K,f7ff,1,000040,ffffff,M'
      'R'
      'K,0009,2,c0c0c0,000000,Tab'
      'K,0046'
      'K,0049'
      'K,0054'
      'K,0041'
      'K,004c'
      'K,0059'
      'K,002c,1,ffc040'
      'K,003f,1,ffc040'
      'K,000d,2,c0c0c0,000000,RET'
      'K,f6dd,1,404080,ffffff,P'
      'R'
      'L,1,2,000000,c0c0c0,Shift'
      'K,0020,2'
      'K,004e'
      'K,0045'
      'K,0020,2'
      'K,002e,1,ffc040'
      'K,003a,1,ffc040'
      'L,1,2,000000,c0c0c0,Shift'
      'K,f6dc,1,404080,ffffff,N'
      'R'
      'L,3,2,c0c0c0,000000,Cap'
      'K,0047'
      'K,0044'
      'K,004f'
      'K,0052'
      'K,0053'
      'K,0042'
      'K,0027,1,ffc040'
      'K,0028,1,ffc040'
      'S,11,1,c0ffff,000000,'#180
      'S,12,1,c0ffff,000000,`'
      'K,f807,1,408040,ffffff,<'
      'R'
      'L,5,2,c0c0c0,000000,123'
      'K,0051'
      'K,004a'
      'K,0055'
      'K,004d'
      'K,0050'
      'K,0058'
      'K,002f,1,ffc040'
      'K,0029,1,ffc040'
      'S,13,1,c0ffff,000000,'#168
      'S,14,1,c0ffff,000000,^'
      'K,f808,1,408040,ffffff,>'
      ''
      '! MAP 3 Uppercase CAPSed FITALY'
      ''
      
        'M,0,0,210,0,300,207,5,13,195,0,209,207,ffffff,000000,333333,dddd' +
        'ff'
      'R'
      'K,001b,2,c0c0c0,000000,Esc'
      'K,005a'
      'K,0056'
      'K,0043'
      'K,0048'
      'K,0057'
      'K,004b'
      'K,0031,1,ffc040'
      'K,0032,1,ffc040'
      'K,0008,2,c0c0c0,000000,<---'
      'K,f7ff,1,000040,ffffff,M'
      'R'
      'K,0009,2,c0c0c0,000000,Tab'
      'K,0046'
      'K,0049'
      'K,0054'
      'K,0041'
      'K,004c'
      'K,0059'
      'K,0033,1,ffc040'
      'K,0034,1,ffc040'
      'K,000d,2,c0c0c0,000000,RET'
      'K,f6dd,1,404080,ffffff,P'
      'R'
      'S,4,2,c0c0c0,000000,Shift'
      'K,0020,2'
      'K,004e'
      'K,0045'
      'K,0020,2'
      'K,0035,1,ffc040'
      'K,0036,1,ffc040'
      'S,4,2,c0c0c0,000000,Shift'
      'K,f6dc,1,404080,ffffff,N'
      'R'
      'L,1,2,000000,c0c0c0,Cap'
      'K,0047'
      'K,0044'
      'K,004f'
      'K,0052'
      'K,0053'
      'K,0042'
      'K,0037,1,ffc040'
      'K,0038,1,ffc040'
      'S,11,1,c0ffff,000000,'#180
      'S,12,1,c0ffff,000000,`'
      'K,f807,1,408040,ffffff,<'
      'R'
      'L,5,2,c0c0c0,000000,123'
      'K,0051'
      'K,004a'
      'K,0055'
      'K,004d'
      'K,0050'
      'K,0058'
      'K,0039,1,ffc040'
      'K,0030,1,ffc040'
      'S,13,1,c0ffff,000000,'#168
      'S,14,1,c0ffff,000000,^'
      'K,f808,1,408040,ffffff,>'
      ''
      '! MAP 4 Uppercase shifted/CAPSed FITALY'
      ''
      
        'M,0,0,210,0,300,207,5,13,195,0,209,207,ffffff,000000,333333,dddd' +
        'ff'
      'R'
      'K,001b,2,c0c0c0,000000,Esc'
      'K,007a'
      'K,0076'
      'K,0063'
      'K,0068'
      'K,0077'
      'K,006b'
      'K,002d,1,ffc040'
      'K,0021,1,ffc040'
      'K,0008,2,c0c0c0,000000,<---'
      'K,f7ff,1,000040,ffffff,M'
      'R'
      'K,0009,2,c0c0c0,000000,Tab'
      'K,0066'
      'K,0069'
      'K,0074'
      'K,0061'
      'K,006c'
      'K,0079'
      'K,002c,1,ffc040'
      'K,003f,1,ffc040'
      'K,000d,2,c0c0c0,000000,RET'
      'K,f6dd,1,404080,ffffff,P'
      'R'
      'L,3,2,000000,c0c0c0,Shift'
      'K,0020,2'
      'K,006e'
      'K,0065'
      'K,0020,2'
      'K,002e,1,ffc040'
      'K,003a,1,ffc040'
      'L,3,2,000000,c0c0c0,Shift'
      'K,f6dc,1,404080,ffffff,N'
      'R'
      'L,1,2,000000,c0c0c0,Cap'
      'K,0067'
      'K,0064'
      'K,006f'
      'K,0072'
      'K,0073'
      'K,0062'
      'K,0027,1,ffc040'
      'K,0028,1,ffc040'
      'S,11,1,c0ffff,000000,'#180
      'S,12,1,c0ffff,000000,`'
      'K,f807,1,408040,ffffff,<'
      'R'
      'L,5,2,c0c0c0,000000,123'
      'K,0071'
      'K,006a'
      'K,0075'
      'K,006d'
      'K,0070'
      'K,0078'
      'K,002f,1,ffc040'
      'K,0029,1,ffc040'
      'S,13,1,c0ffff,000000,'#168
      'S,14,1,c0ffff,000000,^'
      'K,f808,1,408040,ffffff,>'
      ''
      '! MAP 5 Numeric FITALY'
      ''
      
        'M,0,0,210,0,300,207,5,13,195,0,209,207,ffffff,000000,333333,dddd' +
        'ff'
      'R'
      'K,001b,2,c0c0c0,000000,Esc'
      'K,003c'
      'K,003e'
      'K,003d'
      'K,00d7'
      'K,00f7'
      'K,002b'
      'K,002d,1,ffc040'
      'K,0021,1,ffc040'
      'K,0008,2,c0c0c0,000000,<---'
      'K,f7ff,1,000040,ffffff,M'
      'R'
      'K,0009,2,c0c0c0,000000,Tab'
      'K,00a4'
      'K,00b0'
      'K,0040'
      'K,0031'
      'K,0032'
      'K,0033'
      'K,002c,1,ffc040'
      'K,003f,1,ffc040'
      'K,000d,2,c0c0c0,000000,RET'
      'K,f6dd,1,404080,ffffff,P'
      'R'
      'S,6,2,c0c0c0,000000,Shift'
      'K,0020,2'
      'K,0026'
      'K,0034'
      'K,0035'
      'K,0036'
      'K,002e,1,ffc040'
      'K,003a,1,ffc040'
      'S,6,2,c0c0c0,000000,Shift'
      'K,f6dc,1,404080,ffffff,N'
      'R'
      'L,6,2,c0c0c0,000000,Cap'
      'K,00a5'
      'K,00a2'
      'K,0025'
      'K,0037'
      'K,0038'
      'K,0039'
      'K,0027,1,ffc040'
      'K,0028,1,ffc040'
      'K,f809,1,c0ffff,000000,^'
      'K,f80a,1,c0ffff,000000,v'
      'K,f802,1,408040,ffffff,H'
      'R'
      'L,1,2,c0c0c0,000000,abc'
      'K,20ac'
      'K,00a3'
      'K,0024'
      'K,002a'
      'K,0030'
      'K,0023'
      'K,002f,1,ffc040'
      'K,0029,1,ffc040'
      'K,f807,1,c0ffff,000000,<'
      'K,f808,1,c0ffff,000000,>'
      'K,f803,1,408040,ffffff,E'
      ''
      '! MAP 6 Symbols (Numeric shifted)'
      ''
      
        'M,0,0,210,0,300,207,5,13,195,0,209,207,ffffff,000000,333333,dddd' +
        'ff'
      'R'
      'K,001b,2,c0c0c0,000000,Esc'
      'K,2020'
      'K,2021'
      'K,00aa'
      'K,00ac'
      'K,00ba'
      'K,00b1'
      'K,005f,1,ffc040'
      'K,00a1,1,ffc040'
      'K,0008,2,c0c0c0,000000,<---'
      'K,f7ff,1,000040,ffffff,M'
      'R'
      'K,0009,2,c0c0c0,000000,Tab'
      'K,2021'
      'K,2021'
      'K,007c'
      'K,00b9'
      'K,00b2'
      'K,00b3'
      'K,2018,1,ffc040'
      'K,00bf,1,ffc040'
      'K,000d,2,c0c0c0,000000,RET'
      'K,f6dd,1,404080,ffffff,P'
      'R'
      'L,5,2,000000,c0c0c0,Shift'
      'K,00a0,2,ffffff,000000,n.b.'
      'K,00a6'
      'K,00bc'
      'K,00bd'
      'K,00be'
      'K,2019,1,ffc040'
      'K,003b,1,ffc040'
      'L,5,2,000000,c0c0c0,Shift'
      'K,f6dc,1,404080,ffffff,N'
      'R'
      'L,5,2,c0c0c0,000000,Cap'
      'K,00e3'
      'K,00f5'
      'K,2030'
      'K,201a'
      'K,00af'
      'K,00b7'
      'K,0022,1,ffc040'
      'K,201c,1,ffc040'
      'K,f809,1,c0ffff,000000,^'
      'K,f80a,1,c0ffff,000000,v'
      'K,f802,1,408040,ffffff,H'
      'R'
      'L,1,2,c0c0c0,000000,abc'
      'K,00c3'
      'K,00d5'
      'K,0192'
      'K,201e'
      'K,00ad'
      'K,2026'
      'K,005c,1,ffc040'
      'K,201d,1,ffc040'
      'K,f807,1,c0ffff,000000,<'
      'K,f808,1,c0ffff,000000,>'
      'K,f803,1,408040,ffffff,E'
      ''
      '! MAP 7 Lowercase acute'
      ''
      
        'M,0,0,210,0,300,207,5,13,195,0,209,207,ffffff,000000,333333,dddd' +
        'ff'
      'R'
      'K,001b,2,c0c0c0,000000,Esc'
      'K,007a'
      'K,0076'
      'K,00e7'
      'K,0068'
      'K,0077'
      'K,006b'
      'K,00a2,1,ffc040'
      'K,00a9,1,ffc040'
      'K,0008,2,c0c0c0,000000,<---'
      'K,f7ff,1,000040,ffffff,M'
      'R'
      'K,0009,2,c0c0c0,000000,Tab'
      'K,0066'
      'K,00ed'
      'K,0074'
      'K,00e1'
      'K,006c'
      'K,00fd'
      'K,00a3,1,ffc040'
      'K,00ae,1,ffc040'
      'K,000d,2,c0c0c0,000000,RET'
      'K,f6dd,1,404080,ffffff,P'
      'R'
      'S,11,2,c0c0c0,000000,Shift'
      'K,00b4,2'
      'K,006e'
      'K,00e9'
      'K,00b0,2'
      'K,0024,1,ffc040'
      'K,2122,1,ffc040'
      'S,11,2,c0c0c0,000000,Shift'
      'K,f6dc,1,404080,ffffff,N'
      'R'
      'L,3,2,c0c0c0,000000,Cap'
      'K,0067'
      'K,0064'
      'K,00f3'
      'K,0072'
      'K,0073'
      'K,0062'
      'K,00a5,1,ffc040'
      'K,00b6,1,ffc040'
      'L,1,1,000000,c0ffff,'#180
      'S,8,1,c0ffff,000000,`'
      'K,f807,1,408040,ffffff,<'
      'R'
      'L,5,2,c0c0c0,000000,123'
      'K,0071'
      'K,006a'
      'K,00fa'
      'K,006d'
      'K,0070'
      'K,0078'
      'K,20ac,1,ffc040'
      'K,00a7,1,ffc040'
      'S,9,1,c0ffff,000000,'#168
      'S,10,1,c0ffff,000000,^'
      'K,f808,1,408040,ffffff,>'
      ''
      '! MAP 8 Lowercase grave'
      ''
      
        'M,0,0,210,0,300,207,5,13,195,0,209,207,ffffff,000000,333333,dddd' +
        'ff'
      'R'
      'K,001b,2,c0c0c0,000000,Esc'
      'K,007a'
      'K,0076'
      'K,0063'
      'K,0068'
      'K,0077'
      'K,006b'
      'K,00e5,1,ffc040'
      'K,00c5,1,ffc040'
      'K,0008,2,c0c0c0,000000,<---'
      'K,f7ff,1,000040,ffffff,M'
      'R'
      'K,0009,2,c0c0c0,000000,Tab'
      'K,0066'
      'K,00ec'
      'K,00fe'
      'K,00e0'
      'K,006c'
      'K,0079'
      'K,00e6,1,ffc040'
      'K,00c6,1,ffc040'
      'K,000d,2,c0c0c0,000000,RET'
      'K,f6dd,1,404080,ffffff,P'
      'R'
      'S,12,2,c0c0c0,000000,Shift'
      'K,0060,2'
      'K,006e'
      'K,00e8'
      'K,0060,2'
      'K,00f8,1,ffc040'
      'K,00d8,1,ffc040'
      'S,12,2,c0c0c0,000000,Shift'
      'K,f6dc,1,404080,ffffff,N'
      'R'
      'L,3,2,c0c0c0,000000,Cap'
      'K,0067'
      'K,00f0'
      'K,00f2'
      'K,0072'
      'K,0073'
      'K,0062'
      'K,0153,1,ffc040'
      'K,0152,1,ffc040'
      'S,7,1,c0ffff,000000,'#180
      'L,1,1,000000,c0ffff,`'
      'K,f807,1,408040,ffffff,<'
      'R'
      'L,5,2,c0c0c0,000000,123'
      'K,0071'
      'K,006a'
      'K,00f9'
      'K,006d'
      'K,0070'
      'K,0078'
      'K,2013,1,ffc040'
      'K,2014,1,ffc040'
      'S,9,1,c0ffff,000000,'#168
      'S,10,1,c0ffff,000000,^'
      'K,f808,1,408040,ffffff,>'
      ''
      '! MAP 9 Lowercase umlaut'
      ''
      
        'M,0,0,210,0,300,207,5,13,195,0,209,207,ffffff,000000,333333,dddd' +
        'ff'
      'R'
      'K,001b,2,c0c0c0,000000,Esc'
      'K,007a'
      'K,0076'
      'K,0063'
      'K,0068'
      'K,0077'
      'K,006b'
      'K,003d,1,ffc040'
      'K,0023,1,ffc040'
      'K,0008,2,c0c0c0,000000,<---'
      'K,f7ff,1,000040,ffffff,M'
      'R'
      'K,0009,2,c0c0c0,000000,Tab'
      'K,0066'
      'K,00ef'
      'K,0074'
      'K,00e4'
      'K,006c'
      'K,00ff'
      'K,002a,1,ffc040'
      'K,0040,1,ffc040'
      'K,000d,2,c0c0c0,000000,RET'
      'K,f6dd,1,404080,ffffff,P'
      'R'
      'S,13,2,c0c0c0,000000,Shift'
      'K,007e,2'
      'K,00f1'
      'K,00eb'
      'K,00a8,2'
      'K,2022,1,ffc040'
      'K,0026,1,ffc040'
      'S,13,2,c0c0c0,000000,Shift'
      'K,f6dc,1,404080,ffffff,N'
      'R'
      'L,3,2,c0c0c0,000000,Cap'
      'K,0067'
      'K,0064'
      'K,00f6'
      'K,0072'
      'K,00df'
      'K,0062'
      'K,002b,1,ffc040'
      'K,0025,1,ffc040'
      'S,7,1,c0ffff,000000,'#180
      'S,8,1,c0ffff,000000,`'
      'K,f807,1,408040,ffffff,<'
      'R'
      'L,5,2,c0c0c0,000000,123'
      'K,0071'
      'K,006a'
      'K,00fc'
      'K,00b5'
      'K,0070'
      'K,0078'
      'K,007c,1,ffc040'
      'K,00a6,1,ffc040'
      'L,1,1,000000,c0ffff,'#168
      'S,10,1,c0ffff,000000,^'
      'K,f808,1,408040,ffffff,>'
      ''
      '! MAP 10 Lowercase circumflex'
      ''
      
        'M,0,0,210,0,300,207,5,13,195,0,209,207,ffffff,000000,333333,dddd' +
        'ff'
      'R'
      'K,001b,2,c0c0c0,000000,Esc'
      'K,017e'
      'K,0076'
      'K,0063'
      'K,0068'
      'K,0077'
      'K,006b'
      'K,2039,1,ffc040'
      'K,203a,1,ffc040'
      'K,0008,2,c0c0c0,000000,<---'
      'K,f7ff,1,000040,ffffff,M'
      'R'
      'K,0009,2,c0c0c0,000000,Tab'
      'K,0066'
      'K,00ee'
      'K,0074'
      'K,00e2'
      'K,006c'
      'K,0079'
      'K,003c,1,ffc040'
      'K,003e,1,ffc040'
      'K,000d,2,c0c0c0,000000,RET'
      'K,f6dd,1,404080,ffffff,P'
      'R'
      'S,14,2,c0c0c0,000000,Shift'
      'K,005e,2'
      'K,006e'
      'K,00ea'
      'K,005e,2'
      'K,00ab,1,ffc040'
      'K,00bb,1,ffc040'
      'S,14,2,c0c0c0,000000,Shift'
      'K,f6dc,1,404080,ffffff,N'
      'R'
      'L,3,2,c0c0c0,000000,Cap'
      'K,0067'
      'K,0064'
      'K,00f4'
      'K,0072'
      'K,0161'
      'K,0062'
      'K,007b,1,ffc040'
      'K,007d,1,ffc040'
      'S,7,1,c0ffff,000000,'#180
      'S,8,1,c0ffff,000000,`'
      'K,f807,1,408040,ffffff,<'
      'R'
      'L,5,2,c0c0c0,000000,123'
      'K,0071'
      'K,006a'
      'K,00fb'
      'K,006d'
      'K,0070'
      'K,0078'
      'K,005b,1,ffc040'
      'K,005d,1,ffc040'
      'S,9,1,c0ffff,000000,'#168
      'L,1,1,000000,c0ffff,^'
      'K,f808,1,408040,ffffff,>'
      ''
      '! MAP 11 Uppercase acute'
      ''
      
        'M,0,0,210,0,300,207,5,13,195,0,209,207,ffffff,000000,333333,dddd' +
        'ff'
      'R'
      'K,001b,2,c0c0c0,000000,Esc'
      'K,005a'
      'K,0056'
      'K,00c7'
      'K,0048'
      'K,0057'
      'K,004b'
      'K,00a2,1,ffc040'
      'K,00a9,1,ffc040'
      'K,0008,2,c0c0c0,000000,<---'
      'K,f7ff,1,000040,ffffff,M'
      'R'
      'K,0009,2,c0c0c0,000000,Tab'
      'K,0046'
      'K,00cd'
      'K,0054'
      'K,00c1'
      'K,004c'
      'K,00dd'
      'K,00a3,1,ffc040'
      'K,00ae,1,ffc040'
      'K,000d,2,c0c0c0,000000,RET'
      'K,f6dd,1,404080,ffffff,P'
      'R'
      'S,7,2,000000,c0c0c0,Shift'
      'K,0301,2'
      'K,004e'
      'K,00c9'
      'K,00b8,2'
      'K,0024,1,ffc040'
      'K,2122,1,ffc040'
      'S,7,2,000000,c0c0c0,Shift'
      'K,f6dc,1,404080,ffffff,N'
      'R'
      'L,3,2,c0c0c0,000000,Cap'
      'K,0047'
      'K,0044'
      'K,00d3'
      'K,0052'
      'K,0053'
      'K,0042'
      'K,00a5,1,ffc040'
      'K,00b6,1,ffc040'
      'L,1,1,000000,c0ffff,'#180
      'S,8,1,c0ffff,000000,`'
      'K,f807,1,408040,ffffff,<'
      'R'
      'L,5,2,c0c0c0,000000,123'
      'K,0051'
      'K,004a'
      'K,00da'
      'K,004d'
      'K,0050'
      'K,0058'
      'K,20ac,1,ffc040'
      'K,00a7,1,ffc040'
      'S,9,1,c0ffff,000000,'#168
      'S,10,1,c0ffff,000000,^'
      'K,f808,1,408040,ffffff,>'
      ''
      '! MAP 12 Uppercase grave'
      ''
      
        'M,0,0,210,0,300,207,5,13,195,0,209,207,ffffff,000000,333333,dddd' +
        'ff'
      'R'
      'K,001b,2,c0c0c0,000000,Esc'
      'K,005a'
      'K,0056'
      'K,0043'
      'K,0048'
      'K,0057'
      'K,004b'
      'K,00e5,1,ffc040'
      'K,00c5,1,ffc040'
      'K,0008,2,c0c0c0,000000,<---'
      'K,f7ff,1,000040,ffffff,M'
      'R'
      'K,0009,2,c0c0c0,000000,Tab'
      'K,0046'
      'K,00cc'
      'K,00de'
      'K,00c0'
      'K,004c'
      'K,0059'
      'K,00e6,1,ffc040'
      'K,00c6,1,ffc040'
      'K,000d,2,c0c0c0,000000,RET'
      'K,f6dd,1,404080,ffffff,P'
      'R'
      'S,8,2,000000,c0c0c0,Shift'
      'K,0060,2'
      'K,004e'
      'K,00c8'
      'K,0060,2'
      'K,00f8,1,ffc040'
      'K,00d8,1,ffc040'
      'S,8,2,000000,c0c0c0,Shift'
      'K,f6dc,1,404080,ffffff,N'
      'R'
      'L,3,2,c0c0c0,000000,Cap'
      'K,0047'
      'K,00d0'
      'K,00d2'
      'K,0052'
      'K,0053'
      'K,0042'
      'K,0153,1,ffc040'
      'K,0152,1,ffc040'
      'S,7,1,c0ffff,000000,'#180
      'L,1,1,000000,c0ffff,`'
      'K,f807,1,408040,ffffff,<'
      'R'
      'L,5,2,c0c0c0,000000,123'
      'K,0051'
      'K,004a'
      'K,00d9'
      'K,004d'
      'K,0050'
      'K,0058'
      'K,2013,1,ffc040'
      'K,2014,1,ffc040'
      'S,9,1,c0ffff,000000,'#168
      'S,10,1,c0ffff,000000,^'
      'K,f808,1,408040,ffffff,>'
      ''
      '! MAP 13 Uppercase umlaut'
      ''
      
        'M,0,0,210,0,300,207,5,13,195,0,209,207,ffffff,000000,333333,dddd' +
        'ff'
      'R'
      'K,001b,2,c0c0c0,000000,Esc'
      'K,005a'
      'K,0056'
      'K,0043'
      'K,0048'
      'K,0057'
      'K,004b'
      'K,003d,1,ffc040'
      'K,0023,1,ffc040'
      'K,0008,2,c0c0c0,000000,<---'
      'K,f7ff,1,000040,ffffff,M'
      'R'
      'K,0009,2,c0c0c0,000000,Tab'
      'K,0046'
      'K,00cf'
      'K,0054'
      'K,00c4'
      'K,004c'
      'K,0178'
      'K,002a,1,ffc040'
      'K,0040,1,ffc040'
      'K,000d,2,c0c0c0,000000,RET'
      'K,f6dd,1,404080,ffffff,P'
      'R'
      'S,9,2,000000,c0c0c0,Shift'
      'K,0303,2'
      'K,00d1'
      'K,00cb'
      'K,00a8,2'
      'K,2022,1,ffc040'
      'K,0026,1,ffc040'
      'S,9,2,000000,c0c0c0,Shift'
      'K,f6dc,1,404080,ffffff,N'
      'R'
      'L,3,2,c0c0c0,000000,Cap'
      'K,0047'
      'K,0044'
      'K,00d6'
      'K,0052'
      'K,00df'
      'K,0042'
      'K,002b,1,ffc040'
      'K,0025,1,ffc040'
      'S,7,1,c0ffff,000000,'#180
      'S,8,1,c0ffff,000000,`'
      'K,f807,1,408040,ffffff,<'
      'R'
      'L,5,2,c0c0c0,000000,123'
      'K,0051'
      'K,004a'
      'K,00dc'
      'K,004d'
      'K,0050'
      'K,0058'
      'K,007c,1,ffc040'
      'K,00a6,1,ffc040'
      'L,1,1,000000,c0ffff,'#168
      'S,10,1,c0ffff,000000,^'
      'K,f808,1,408040,ffffff,>'
      ''
      '! MAP 14 Uppercase circumflex'
      ''
      
        'M,0,0,210,0,300,207,5,13,195,0,209,207,ffffff,000000,333333,dddd' +
        'ff'
      'R'
      'K,001b,2,c0c0c0,000000,Esc'
      'K,017d'
      'K,0056'
      'K,0043'
      'K,0048'
      'K,0057'
      'K,004b'
      'K,2039,1,ffc040'
      'K,203a,1,ffc040'
      'K,0008,2,c0c0c0,000000,<---'
      'K,f7ff,1,000040,ffffff,M'
      'R'
      'K,0009,2,c0c0c0,000000,Tab'
      'K,0046'
      'K,00ce'
      'K,0054'
      'K,00c2'
      'K,004c'
      'K,0059'
      'K,003c,1,ffc040'
      'K,003e,1,ffc040'
      'K,000d,2,c0c0c0,000000,RET'
      'K,f6dd,1,404080,ffffff,P'
      'R'
      'S,10,2,000000,c0c0c0,Shift'
      'K,02c6,2'
      'K,004e'
      'K,00ca'
      'K,02c6,2'
      'K,00ab,1,ffc040'
      'K,00bb,1,ffc040'
      'S,10,2,000000,c0c0c0,Shift'
      'K,f6dc,1,404080,ffffff,N'
      'R'
      'L,3,2,c0c0c0,000000,Cap'
      'K,0047'
      'K,0044'
      'K,00d4'
      'K,0052'
      'K,0160'
      'K,0042'
      'K,007b,1,ffc040'
      'K,007d,1,ffc040'
      'S,7,1,c0ffff,000000,'#180
      'S,8,1,c0ffff,000000,`'
      'K,f807,1,408040,ffffff,<'
      'R'
      'L,5,2,c0c0c0,000000,123'
      'K,0051'
      'K,004a'
      'K,00db'
      'K,004d'
      'K,0050'
      'K,0058'
      'K,005b,1,ffc040'
      'K,005d,1,ffc040'
      'S,9,1,c0ffff,000000,'#168
      'L,1,1,000000,c0ffff,^'
      'K,f808,1,408040,ffffff,>')
    ScrollBars = ssBoth
    TabOrder = 0
    WantTabs = True
    WordWrap = False
    OnChange = Memo1Change
    OnClick = Memo1Click
  end
  object Status: TListBox
    Left = 1
    Top = 331
    Width = 448
    Height = 54
    ItemHeight = 13
    TabOrder = 5
    Visible = False
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'kbl'
    Filter = 'PopOnTob Keyboard Layouts (*.kbl)|*.kbl|All Files (*.*)|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing, ofDontAddToRecent]
    Left = 385
    Top = 11
  end
  object SaveDialog1: TSaveDialog
    Filter = 'PopOnTop Keyboard Layout (*.kbl)|*.kbl|All Files (*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing, ofDontAddToRecent]
    Left = 417
    Top = 11
  end
  object TimerScroll: TTimer
    Enabled = False
    Interval = 250
    OnTimer = TimerScrollTimer
    Left = 448
    Top = 8
  end
end
