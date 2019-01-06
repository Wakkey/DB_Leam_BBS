object Form2: TForm2
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = #35352#20107#12398#20837#21147
  ClientHeight = 307
  ClientWidth = 412
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 47
    Width = 412
    Height = 219
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 49
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 412
      Height = 219
      ActivePage = TabSheet2
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #12486#12461#12473#12488
        ExplicitWidth = 281
        ExplicitHeight = 165
        object Memo1: TMemo
          Left = 0
          Top = 0
          Width = 404
          Height = 191
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 412
          ExplicitHeight = 226
        end
      end
      object TabSheet2: TTabSheet
        Caption = #28155#20184#12501#12449#12452#12523
        ImageIndex = 1
        object Button3: TButton
          Left = 128
          Top = 88
          Width = 129
          Height = 25
          Caption = #12501#12449#12452#12523#12434#28155#20184#12377#12427
          TabOrder = 0
          OnClick = Button3Click
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 412
    Height = 47
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 1
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 412
      Height = 13
      Align = alTop
      Caption = #12479#12452#12488#12523
      ExplicitLeft = 24
      ExplicitTop = 8
      ExplicitWidth = 35
    end
    object Label2: TLabel
      Left = 0
      Top = 34
      Width = 412
      Height = 13
      Align = alBottom
      Caption = #20869#23481
      ExplicitLeft = 24
      ExplicitTop = 51
      ExplicitWidth = 24
    end
    object Edit1: TEdit
      Left = 0
      Top = 13
      Width = 412
      Height = 21
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 24
      ExplicitTop = 24
      ExplicitWidth = 377
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 266
    Width = 412
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitLeft = 24
    ExplicitTop = 225
    ExplicitWidth = 185
    object Button1: TButton
      Left = 326
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      ModalResult = 1
      TabOrder = 0
    end
    object Button2: TButton
      Left = 230
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 192
    Top = 152
  end
end
