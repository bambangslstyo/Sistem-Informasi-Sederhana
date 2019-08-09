object foSupplier: TfoSupplier
  Left = 330
  Top = 171
  Align = alClient
  BorderStyle = bsNone
  Caption = 'foSupplier'
  ClientHeight = 434
  ClientWidth = 916
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
  object Label5: TLabel
    Left = 376
    Top = 16
    Width = 120
    Height = 32
    Caption = 'SUPPLIER'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Consolas'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object bExit: TSpeedButton
    Left = 816
    Top = 104
    Width = 81
    Height = 33
    Caption = 'E&xit'
    OnClick = bExitClick
  end
  object bBatal: TSpeedButton
    Left = 720
    Top = 104
    Width = 81
    Height = 33
    Caption = '&Batal'
    OnClick = bBatalClick
  end
  object DBGrid1: TDBGrid
    Left = 432
    Top = 168
    Width = 465
    Height = 177
    DataSource = dsSupplier
    FixedColor = clWhite
    ParentShowHint = False
    ReadOnly = True
    ShowHint = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'idSup'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'nmSup'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'telp'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'alamat'
        Visible = True
      end>
  end
  object GroupBox2: TGroupBox
    Left = 432
    Top = 96
    Width = 249
    Height = 57
    Caption = 'Pencarian'
    TabOrder = 2
    object bCari: TSpeedButton
      Left = 176
      Top = 16
      Width = 57
      Height = 33
      Caption = '&Cari'
      OnClick = bCariClick
    end
    object eCari: TEdit
      Left = 16
      Top = 24
      Width = 145
      Height = 21
      TabOrder = 0
    end
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 96
    Width = 401
    Height = 249
    TabOrder = 0
    object Label2: TLabel
      Left = 16
      Top = 32
      Width = 69
      Height = 13
      Caption = 'Nama Supplier'
    end
    object Label3: TLabel
      Left = 16
      Top = 80
      Width = 60
      Height = 13
      Caption = 'No. Telp/Hp'
    end
    object Label4: TLabel
      Left = 16
      Top = 128
      Width = 32
      Height = 13
      Caption = 'Alamat'
    end
    object bAdd: TSpeedButton
      Left = 16
      Top = 200
      Width = 81
      Height = 33
      Caption = '&Tambah'
      OnClick = bAddClick
    end
    object bSave: TSpeedButton
      Left = 112
      Top = 200
      Width = 81
      Height = 33
      Caption = '&Simpan'
      OnClick = bSaveClick
    end
    object bEdit: TSpeedButton
      Left = 208
      Top = 200
      Width = 81
      Height = 33
      Caption = '&Perbarui'
      OnClick = bEditClick
    end
    object bHapus: TSpeedButton
      Left = 304
      Top = 200
      Width = 81
      Height = 33
      Caption = '&Hapus'
      OnClick = bHapusClick
    end
    object eNmsup: TEdit
      Left = 96
      Top = 32
      Width = 185
      Height = 21
      TabOrder = 0
    end
    object eTelp: TEdit
      Left = 96
      Top = 80
      Width = 153
      Height = 21
      TabOrder = 1
    end
    object eAlamat: TMemo
      Left = 96
      Top = 128
      Width = 217
      Height = 49
      Lines.Strings = (
        'eAlamat')
      TabOrder = 2
    end
  end
  object dsSupplier: TDataSource
    DataSet = tbSupplier
    Left = 80
    Top = 24
  end
  object tbSupplier: TMyTable
    TableName = 'tbsupplier'
    Connection = Form1.MyConnection1
    Active = True
    Left = 48
    Top = 24
  end
end
