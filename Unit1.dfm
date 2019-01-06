object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 393
  ClientWidth = 652
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 652
    Height = 85
    Align = alTop
    TabOrder = 0
    object Button1: TButton
      Left = 24
      Top = 8
      Width = 75
      Height = 25
      Caption = #26032#35215#35352#20107
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 199
      Top = 39
      Width = 75
      Height = 25
      Caption = #12501#12457#12525#12540#35352#20107
      TabOrder = 1
      OnClick = DBGrid1DblClick
    end
    object Button4: TButton
      Left = 105
      Top = 8
      Width = 89
      Height = 25
      Caption = #35352#20107#12434#12501#12457#12525#12540
      TabOrder = 2
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 82
      Top = 39
      Width = 112
      Height = 25
      Caption = #12398#12501#12457#12525#12540#35352#20107#12434#34920#31034
      TabOrder = 3
      OnClick = Button5Click
    end
    object SpinEdit1: TSpinEdit
      Left = 24
      Top = 39
      Width = 49
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 4
      Value = 0
    end
    object Button6: TButton
      Left = 199
      Top = 8
      Width = 75
      Height = 25
      Caption = #20840#20214#34920#31034
      TabOrder = 5
      OnClick = Button6Click
    end
    object Edit1: TEdit
      Left = 281
      Top = 39
      Width = 168
      Height = 21
      TabOrder = 6
    end
    object CheckBox1: TCheckBox
      Left = 280
      Top = 16
      Width = 97
      Height = 17
      Caption = #12479#12452#12488#12523#12391#26908#32034
      TabOrder = 7
    end
    object CheckBox2: TCheckBox
      Left = 369
      Top = 16
      Width = 97
      Height = 17
      Caption = #20869#23481#12391#26908#32034
      TabOrder = 8
    end
    object Button7: TButton
      Left = 455
      Top = 39
      Width = 75
      Height = 25
      Caption = #12391#26908#32034
      TabOrder = 9
      OnClick = Button7Click
    end
    object CheckBox3: TCheckBox
      Left = 455
      Top = 16
      Width = 122
      Height = 17
      Caption = #28155#20184#12501#12449#12452#12523#21517#12391#26908#32034
      TabOrder = 10
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 85
    Width = 652
    Height = 308
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    ExplicitLeft = 240
    ExplicitTop = 200
    ExplicitWidth = 185
    ExplicitHeight = 41
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 391
      Height = 306
      Align = alClient
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = Button5Click
      Columns = <
        item
          Expanded = False
          FieldName = 'no'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'title'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'follow'
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 392
      Top = 1
      Width = 259
      Height = 306
      Align = alRight
      Caption = 'Panel3'
      TabOrder = 1
      object DBMemo1: TDBMemo
        Left = 1
        Top = 90
        Width = 257
        Height = 215
        Align = alClient
        DataField = 'contents'
        DataSource = DataSource1
        ScrollBars = ssBoth
        TabOrder = 0
        ExplicitTop = 88
        ExplicitWidth = 265
        ExplicitHeight = 261
      end
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 257
        Height = 48
        Align = alTop
        TabOrder = 1
        ExplicitWidth = 265
        object DBText2: TDBText
          Left = 5
          Top = 26
          Width = 65
          Height = 17
          DataField = 'title'
          DataSource = DataSource1
        end
        object DBText1: TDBText
          Left = 5
          Top = 4
          Width = 65
          Height = 17
          DataField = 'no'
          DataSource = DataSource1
        end
        object DBText3: TDBText
          Left = 76
          Top = 4
          Width = 65
          Height = 17
          DataField = 'follow'
          DataSource = DataSource1
        end
      end
      object Panel5: TPanel
        Left = 1
        Top = 49
        Width = 257
        Height = 41
        Align = alTop
        TabOrder = 2
        ExplicitLeft = 104
        ExplicitTop = 72
        ExplicitWidth = 185
        object Button3: TButton
          Left = 5
          Top = 10
          Width = 244
          Height = 25
          Caption = #28155#20184#12501#12449#12452#12523#12434#38283#12367
          TabOrder = 0
          OnClick = Button3Click
        end
      end
    end
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=m0jpw10p;Persist Security Info=True;' +
      'User ID=yuhi;Data Source=mysql53'
    Left = 208
    Top = 120
  end
  object ADOQuery1: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM yuhi.bbs;')
    Left = 302
    Top = 120
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 206
    Top = 208
  end
  object ADOQuery2: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT max(no) - 1 as no FROM yuhi.bbs;')
    Left = 302
    Top = 176
  end
  object ADOQuery3: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'NO1'
        Size = -1
        Value = Null
      end
      item
        Name = 'NO2'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT TITLE , CONTENTS , FOLLOW FROM YUHI.BBS '
      'WHERE (NO=:NO1) OR (FOLLOW =:NO2)'
      'ORDER BY NO;')
    Left = 302
    Top = 240
  end
end
