object fmAssistant: TfmAssistant
  Left = 262
  Top = 73
  Caption = 'Assistant'
  ClientHeight = 500
  ClientWidth = 783
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Visible = True
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object tcWindows: TTabControl
    Left = 0
    Top = 456
    Width = 783
    Height = 25
    Align = alBottom
    Style = tsButtons
    TabOrder = 0
    Tabs.Strings = (
      'aaa'
      'bbb'
      'ccc'
      'ddd'
      'eee')
    TabIndex = 0
    TabWidth = 85
    OnMouseUp = tcWindowsMouseUp
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 783
    Height = 33
    Align = alTop
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 640
      Top = 8
      Width = 17
      Height = 17
      Caption = '_'
    end
    object SpeedButton2: TSpeedButton
      Left = 664
      Top = 8
      Width = 17
      Height = 17
    end
    object SpeedButton3: TSpeedButton
      Left = 688
      Top = 8
      Width = 17
      Height = 17
      Caption = 'X'
      OnClick = SpeedButton3Click
    end
    object sbRunCommand: TSpeedButton
      Left = 528
      Top = 4
      Width = 21
      Height = 21
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FF0000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00000000FF0000FF00000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FF0000
        FF0000FF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00000000FF0000FF0000FF0000FF00000000FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FF0000
        FF0000FF0000FF0000FF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00000000FF0000FF0000FF0000FF0000FF0000FF000000
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FF0000
        FF0000FF0000FF0000FF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00000000FF0000FF0000FF0000FF00000000FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FF0000
        FF0000FF00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF00000000FF0000FF00000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FF0000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      OnClick = btRunClick
    end
    object cbCommand: TComboBox
      Left = 8
      Top = 4
      Width = 489
      Height = 21
      TabOrder = 0
      OnKeyDown = cbCommandKeyDown
      OnKeyUp = cbCommandKeyUp
    end
    object btCommand: TButton
      Left = 501
      Top = 4
      Width = 21
      Height = 21
      Caption = '...'
      TabOrder = 1
      OnClick = btCommandClick
    end
  end
  object sbMain: TStatusBar
    Left = 0
    Top = 481
    Width = 783
    Height = 19
    Panels = <
      item
        Text = #1055#1088#1086#1075#1088#1072#1084#1084#1072' AIAssistant'
        Width = 200
      end>
  end
end
