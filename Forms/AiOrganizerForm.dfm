object fmOrganizer: TfmOrganizer
  Left = 0
  Top = 0
  Caption = 'Organizer'
  ClientHeight = 543
  ClientWidth = 832
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 209
    Top = 26
    Height = 387
  end
  object Splitter2: TSplitter
    Left = 676
    Top = 26
    Height = 387
    Align = alRight
  end
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 0
    Width = 832
    Height = 26
    ActionManager = ActionManager1
    Caption = 'ActionToolBar1'
    ColorMap.HighlightColor = 14410210
    ColorMap.BtnSelectedColor = clBtnFace
    ColorMap.UnusedColor = 14410210
    Spacing = 0
  end
  object tcObjects: TTabControl
    Left = 0
    Top = 26
    Width = 209
    Height = 387
    Align = alLeft
    TabOrder = 1
    Tabs.Strings = (
      'Tasks'
      'Notes'
      'Reminder')
    TabIndex = 0
    OnChange = tcObjectsChange
    object tvObjects: TTreeView
      Left = 4
      Top = 24
      Width = 201
      Height = 359
      Align = alClient
      Indent = 19
      TabOrder = 0
    end
  end
  object PageControl1: TPageControl
    Left = 212
    Top = 26
    Width = 464
    Height = 387
    Align = alClient
    TabOrder = 2
  end
  object pnTool: TPanel
    Left = 679
    Top = 26
    Width = 153
    Height = 387
    Align = alRight
    TabOrder = 3
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 524
    Width = 832
    Height = 19
    Panels = <>
  end
  object Panel2: TPanel
    Left = 0
    Top = 413
    Width = 832
    Height = 111
    Align = alBottom
    TabOrder = 5
    object Splitter3: TSplitter
      Left = 1
      Top = 74
      Width = 830
      Height = 3
      Cursor = crVSplit
      Align = alBottom
    end
    object reOut: TRichEdit
      Left = 1
      Top = 1
      Width = 830
      Height = 73
      Align = alClient
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object Panel3: TPanel
      Left = 1
      Top = 77
      Width = 830
      Height = 33
      Align = alBottom
      TabOrder = 1
      object btSend: TButton
        Left = 775
        Top = 1
        Width = 54
        Height = 31
        Caption = 'Send'
        TabOrder = 0
        OnClick = btSendClick
      end
      object memInput: TMemo
        Left = 1
        Top = 1
        Width = 828
        Height = 31
        Align = alClient
        TabOrder = 1
        OnKeyDown = memInputKeyDown
        OnKeyPress = memInputKeyPress
        OnKeyUp = memInputKeyUp
      end
    end
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
      end
      item
        Items = <
          item
            Action = actNewEntity
            Caption = '&New Entity'
            ImageIndex = 1
          end
          item
            Action = actNewClass
            Caption = 'N&ew Class'
            ImageIndex = 2
          end
          item
            Action = actNewIndividual
            Caption = 'Ne&w Individual'
            ImageIndex = 3
          end
          item
            Action = actNewOntology
            Caption = 'New &Ontology'
            ImageIndex = 4
          end>
        ActionBar = ActionToolBar1
      end>
    Images = ImageList1
    Left = 408
    Top = 72
    StyleName = 'XP Style'
    object actNewEntity: TAction
      Caption = 'New Entity'
      ImageIndex = 1
      OnExecute = actNewEntityExecute
    end
    object actNewClass: TAction
      Caption = 'New Class'
      ImageIndex = 2
      OnExecute = actNewClassExecute
    end
    object actNewIndividual: TAction
      Caption = 'New Individual'
      ImageIndex = 3
      OnExecute = actNewIndividualExecute
    end
    object actNewOntology: TAction
      Caption = 'New Ontology'
      ImageIndex = 4
      OnExecute = actNewOntologyExecute
    end
    object Action5: TAction
      Caption = 'Action5'
      ImageIndex = 5
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 376
    Top = 104
    object Exit1: TMenuItem
      Caption = 'Exit'
    end
  end
  object ImageList1: TImageList
    Left = 408
    Top = 104
    Bitmap = {
      494C01010B000D00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000A9CCE0012A0D00033B1
      DA0099D7F000E6F4FA00EDF7FB00F7FCFE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000D6C5B900A78364009B653D0091614000876A5C00ABA6A3000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000024A7D500A5E2F6005BCC
      ED0040B8E00024A9D80030AEDA007FCDE900CDEBF600D1EBF500E0F2F900F7FC
      FE0000000000000000000000000000000000000000000000000000000000F3E7
      DB00D09B7500C0673B00BB644200C6624000C4614600BF5F44009E5941008F75
      6B00CBCBCA000000000000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000015A0D2008BD5F30098E6
      FF007DE2FF007EE0FF0070D7FB0054C8ED0039B8E1002DB1DC0057BFE10097D4
      EC00D3EDF600FBFEFF0000000000000000000000000000000000F7E8D700CC85
      4B00B04A1000A844160085542A0099491C00A9451700B3512600C15A3B00B453
      32008D625000CAC8C60000000000000000000000000000000000000000000000
      FF000000FF000000FF00000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000099DD00072CAE800B6F0
      FE0080EAFF0086EBFF0086EBFF0086EBFF0087EAFF007DE4FE0067D6F3004BBE
      E60074C9E600EBF7FB0000000000000000000000000000000000D69B6500A13A
      00009D3C0400AC3F010069580C00455D0A0098430200A03D02009F400900B350
      2400A85331008F75680000000000000000000000000000000000000000000000
      00000000FF00000000000000000000000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000B9DD10065C4E700ADEC
      FB008DF2FF008AF0FF008BF0FF008CF0FF008CF1FF008DF2FF008BF0FF0079DE
      FE0078D5F000CCECF500000000000000000000000000F1CFA900B1540F00A840
      0100B9500300C75801005E6904000578050050670500BA4F0200B04200009F43
      0E00905F3D0086563B00C1B7B300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000013A2D30061C7EE0097E3
      F400ABFFFF008FFBFF0092FBFF0095FBFF0095FBFF0096FCFF0095F9FF0085E7
      FF0079DCF500A4DFF000F7FBFD000000000000000000DB944B00B14B0200C25A
      0200D6640100CD6E010033800400048006005E770600CD680200B05B00007656
      0700516424007C58300098817400000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000018A5D6005EC8F40086D5
      ED00C0FEFF00ADFFFF00AEFFFF00A3FFFF009CFFFF009EFFFF0098FCFF008BE7
      FE00A0E9FB0096E0F000DDF2F9000000000000000000C76B1B00C45C0200DA6E
      0200CB7B0300978B0600559408008B8E0600E57F0300D17705003E7404000D74
      03001F6F0B005F5A2200936F5900000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000027ACDB0066CFF9006BCC
      ED00A5E2F200B3EAF500ABE8F600B9F6FC00BDFFFF00B6FFFF00AAFAFF0091E7
      FE00C1F5FF00A3E4F200CFEDF7000000000000000000C6660F00D56A0100A883
      06003A9B110045A017009CA01900F69B1100FE930400E98803005F8006000476
      04001F71080042620A008D744F00000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002EAFDC007BDEFE0070DA
      F80069CEEC0061C6E7005AC3E70094D9EF00D5F7FD00DCFFFF00D5FDFF00ADED
      FF00D1F6FE00E0F6FB00B6E4F2000000000000000000E28D3A00D5740200569F
      1E0010B83B001EBE460076BE4C00EABF4F00FFB23400FE960A00AE8A03001585
      0600147506002F68010099896A00000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002DB0DB008BEFFF008DF0
      FF0083EDFB007CEAF9007CEAF80079DEF20098DEF300B1E5F400AEE3F20094DD
      F500A4E1F300BBE7F4007ACEE7000000000000000000F5C79100B5870F0035B3
      3A002CC95B0052D372004DD77900AFDF8C00FFCF7000FFA92700C7900100368B
      060001780200366F0400C8B9A400000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002FB3DB0096FCFE009AFD
      FF009AFFFF00A1FFFF00A5FFFF0097FCFF007EE9F80076DBF00072D9EE005FC9
      E60087D2EA00A3DEF0009CDBEE0000000000000000000000000087C15F0013BE
      450054D77800B0E59D00B2EAAC00D1F1BC00C1D88700D3B33C00CC930A009584
      0200187500008690470000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000033B3DB00A9FDFF009AFF
      FF009EFFFF00ADFAFC00A5ECF600A6EDF900B4FAFF00BBFDFF00A2F5FB006DD1
      E900C2E4F300F3FAFD00F4FBFE00000000000000000000000000CDF0CC0066C8
      620067D27300BDE8A400D8F3BD00D8EDB20052D4750056B74200C88F0B00DD78
      00009A8C2700D6D0B40000000000000000000000000000000000000000000000
      00000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000039B1DB00D4F6FC00CAFF
      FF00CCFFFF00A7E7F10070D0EA0074D5F10069CCEB0061C6E40057C3E3005AC0
      E200D2EDF700000000000000000000000000000000000000000000000000E0EE
      CB00A6D98B00A4DA8600A6E397007FDC85002CCD640021B53500C18E0500F69C
      3D00F4D5B2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C5E8F40060BFE20058C2
      E60057C2E60086D2EB00D4F1F900E0F7FD00D6F0F900D3EDF700D3EDF700DCF1
      F900F8FCFE000000000000000000000000000000000000000000000000000000
      000000000000DAEEC600BBE39E00A6D27A009DC6610095CA7200E9D499000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F8FAFF00547CF900ECF0FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000CD9A9900CE9D
      9900DBBBB400EBD8D80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F8FAFF00678AFB000B3DFA00557CF90000000000000000000000
      0000000000000000000000000000000000000000000000000000CD9A9A00D3A1
      9800EBBA9800E7B59700DFB19A00DFBAAE00E2C3C100E8D4D400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFDFF0086A2FC000D3FFC000031FB00436CFA0000000000000000000000
      0000000000000000000000000000000000000000000000000000D6A69A00DFB3
      9800E7BB9F00FBDAAC00FFD6A400F9CA9D00F1C09600E8B69500E0B09C00DEB2
      A400E1C5BE00ECD9D80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008DA8FC00113EFB002E56F8001B4BF8001E4CFC00CEDAFE00000000000000
      0000000000000000000000000000000000000000000000000000D7AB9D00F5DA
      AE00DEB7A000EED5B500FDEEC100FFEDBC00FEE5B300FFDEAC00FFD5A400FACE
      9D00EEBE9800D19E930000000000000000000000000000000000000000000000
      0000000000007777FF005555FF005555FF006B6BFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BBBB7700AAAA5500AAAA5500B6B66B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007A99
      FC001140FC002850F900BBC9F7007C9AF4001746FA0088A5FC00000000000000
      0000000000000000000000000000000000000000000000000000D9AFA200FBF2
      C600F8EABF00DFBDAC00F2E6C800FFFFD400FFFBCD00FFF4C500FFF2C000FCE7
      B900E4BBA100D0A39C0000000000000000000000000000000000000000000000
      00008F8FFF007171FF007171FF007171FF006060FF007777FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C8C88F00B8B87100B8B87100B8B87100B0B06000BBBB7700000000000000
      000000000000000000000000000000000000000000000000000000000000B7C8
      FE00365FF700AFBEF60000000000E9EEFD000738FB006585FD00000000000000
      0000000000000000000000000000000000000000000000000000D8AFA600F9F3
      CE00FFFFD700EDDBBB00E2C9B800F5ECD800FFFFE500FFFFDC00FBF6D100E8D0
      B400E0B89F00EFC7A00000000000000000000000000000000000000000000000
      00009393FF00A6A6FF00A6A6FF00A6A6FF008383FF007474FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C9C99300D2D2A600D2D2A600D2D2A600C1C18300BABA7400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EDF1FE00FEFEFF0000000000000000002051F8005677FD00FEFEFF000000
      0000000000000000000000000000000000000000000000000000D7AFA900FAF5
      D900FFFCDD00E7D6BF00CFACA600DDBEBA00F5E7DD00F8F0E300EBD4C700DFBF
      AC00F9ECC100F4E0B80000000000000000000000000000000000000000000000
      0000B1B1FF00CACAFF00DBDBFF00CACAFF00A6A6FF008383FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D8D8B100E4E4CA00EDEDDB00E4E4CA00D2D2A600C1C18300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000899EF3000B3EFB00A6BBFC000000
      0000000000000000000000000000000000000000000000000000D7B0AD00EEDB
      CD00DBBDB300D6C6C400DBE7E800D0DBDB00C8BFC300C5B6BB00C7B2B300DFC1
      B300FFFBD500F4E7C30000000000000000000000000000000000000000000000
      0000C1C1FF00DBDBFF0000000000DBDBFF00A6A6FF009B9BFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E0E0C100EDEDDB0000000000EDEDDB00D2D2A600CDCD9B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000DCE3FF000E3FFB00728FFD00F5F7
      FF00000000000000000000000000000000000000000000000000CD999800CAA1
      A200DAD6DC00F8FAFB00FEFFFF00F2FFFF00E6FDFE00E0FCFD00DBF0F300D0C7
      CA00DFC1B100F3E3C90000000000000000000000000000000000000000000000
      000000000000DADAFF00E0E0FF00D1D1FF00C1C1FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000ECECDA00F0F0E000E8E8D100E0E0C10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0F4FF005E81FD000E40FA00CED9
      FE00000000000000000000000000000000000000000000000000E4C6C100C2A4
      A900D6E3ED00FAFEFF00FFFFFE00F8FCFE00EEFAFF00E7F6FB00D9EFF400B8D7
      E400ABACB900D7AEA80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B5C5FD000A3CFA007F9A
      FB0000000000000000000000000000000000000000000000000000000000E2D2
      D700BEC2E200BCE3FB00B0E5FC009DDAF60093CDF40093BCE2009FACCB00AC9F
      C400B4A4BC00C997990000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000EAEFFE005274FC003763
      F900000000000000000000000000000000000000000000000000000000000000
      0000E3D3DB00AAC6D0008EE0F30094E7FF0098DDFA0092D7F6008ED2F70094C1
      EB00B5A5C300E0BFBE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D4DCFD00CFDA
      FD00000000000000000000000000000000000000000000000000000000000000
      000000000000ECD4D100B8D0CF0097E9F10094F0FF0096DEFA009DC3DD00C2B6
      BE00EFDAD8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EAD9D700C0C3C600A9C4CF00B6BDC800DAC4C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A87C
      7700AF848100B2847F00B2847E00B2847E00B2847F00B2847E00B2847F00B486
      81009E706D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BA8E
      8400E9CFC600FDD9CF00FBD8CE00FBD8CE00FBD8CE00FBD8CE00FBD9CF00FFDE
      D200C1948B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BD8E
      8200ECDDD000F8F5EE00F7F2EA00F7F2EA00F7F1EA00F7F2EA00F6F3EB00FFF6
      E500C29A8A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C197
      8D00EEDED200FDE8D500FDE4C900FDE2C500FDE0C300FDDFBF00FCDEBC00FFF1
      DB00C29A8B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C29B
      9300EBE0D800FDE0C200FED8B200FED9B300FED8B300FFD7B000FDD8B100FFF0
      DA00C49C8C000000000000000000000000000000000000000000000000000000
      0000000000007777770055555500555555006B6B6B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F0BA7800ECA95700ECA95700EFB46C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000BABABA00A9A9A900A9A9A900B5B5B50000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C9A0
      9200EFE1DA00FBE7D000FCE1C500FCE2C700FCE3C700FCE2C400F7E1C500FFF0
      DD00C8A190000000000000000000000000000000000000000000000000000000
      00008F8F8F007171710071717100717171006060600077777700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F3C79100EFB77300EFB77300EFB77300EDAF6200F0BA7800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C7C7C700B8B8B800B8B8B800B8B8B800AFAFAF00BABABA00000000000000
      000000000000000000000000000000000000000000000000000000000000D1A6
      9200F2E6DB00FDDEBD00FED5AA00FED6AD00FED6AD00FCD5AC00F8D5AC00FFEE
      D800C9A292000000000000000000000000000000000000000000000000000000
      000093939300A6A6A600A6A6A600A6A6A6008383830074747400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F3C89400F5D2A700F5D2A700F5D2A700F1C08400F0B97600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C9C9C900D2D2D200D2D2D200D2D2D200C1C1C100B9B9B900000000000000
      000000000000000000000000000000000000000000000000000000000000D6AB
      9400F3EAE000FAE8D300FAE3C900FAE3CB00FAE3CB00FBE3CA00FAE4CD00FFF0
      DD00CDA795000000000000000000000000000000000000000000000000000000
      0000B1B1B100CACACA00DFDFDF00CACACA00A6A6A60083838300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F7D8B200F9E4CA00FBEDDB00F9E4CA00F5D2A700F1C08500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D8D8D800E4E4E400EDEDED00E4E4E400D2D2D200C1C1C100000000000000
      000000000000000000000000000000000000000000000000000000000000DEB3
      9600F5ECE500FEE2C600FED9B200FEDAB600FEDAB600FEDAB500FDDBB800FFF0
      DA00CFAA99000000000000000000000000000000000000000000000000000000
      0000C1C1C100DBDBDB00FBFBFB00DFDFDF00A6A6A6009B9B9B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F8E0C100FBEDDB0000000000FBEDDB00F5D2A700F4CD9D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000E0E0E000EDEDED00FEFEFE00F0F0F000D2D2D200CDCDCD00000000000000
      000000000000000000000000000000000000000000000000000000000000E2B6
      9800F9F1EA00FFEDDB00FFE6CE00FFE6CD00FFE4C800FFE1C400FFE4C600FFF1
      DD00CFA899000000000000000000000000000000000000000000000000000000
      000000000000DADADA00E0E0E000D1D1D100C1C1C10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FBECDA00FCF0E000FAE8D100F8E0C10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000ECECEC00F0F0F000E8E8E800E0E0E00000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E5BA
      9C00FBF4EE00FFFFFE00FFFEFD00FFFDFA00FFF9F200FFF9EE00FAE9D800F2C2
      BB00CE928A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EBBF
      9E00FBF6EF00000000000000000000000000FFFDFA00FFFFFC00DBC0B300C790
      7900C38F82000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F2C7
      A200FFFAF30000000000FEFFFF00FDFEFF00FBFCFC00FEFFFF00D4B6AE00DAA8
      8200E2C7B8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EDBE
      9600E6C1A700E6C3AB00E6C2AB00E5C1AA00E3C0AA00E6C3AB00CA9E8D00DEC2
      B300FBF8F5000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF000080FFF81FFFFF0000
      800FE007F7DF00008003C003E38F00008003C003F707000080038001FFDF0000
      80018001F7DF000080018001F7DF000080018001E3DF000080018001E3DF0000
      80018001E3DF00008001C003E3DF00008001C003F7FF00008007E007FFFF0000
      8007F81FFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFC7FC3FF
      FFFFFFFFF87FC03FFFFFFFFFF07FC003FFFFFFFFF03FC003F87FF87FE03FC003
      F03FF03FE23FC003F03FF03FF31FC003F03FF03FFF1FC003F23FF23FFF0FC003
      F87FF87FFF0FC003FFFFFFFFFF8FE003FFFFFFFFFF8FF003FFFFFFFFFFCFF807
      FFFFFFFFFFFFFC1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE007FFFFFFFFFFFF
      E007FFFFFFFFFFFFE007FFFFFFFFFFFFE007FFFFFFFFFFFFE007F87FF87FF87F
      E007F03FF03FF03FE007F03FF03FF03FE007F03FF03FF03FE007F03FF23FF03F
      E007F87FF87FF87FE007FFFFFFFFFFFFE707FFFFFFFFFFFFE407FFFFFFFFFFFF
      E007FFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
end