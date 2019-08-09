object foObat: TfoObat
  Left = 262
  Top = 205
  Align = alClient
  BorderStyle = bsNone
  Caption = 'foObat'
  ClientHeight = 434
  ClientWidth = 920
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
    Width = 135
    Height = 32
    Caption = 'DATA OBAT'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Consolas'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object bTambah: TSpeedButton
    Left = 360
    Top = 160
    Width = 65
    Height = 33
    Caption = '&Tambah'
    OnClick = bTambahClick
  end
  object bSimpan: TSpeedButton
    Left = 440
    Top = 160
    Width = 65
    Height = 33
    Caption = '&Simpan'
    OnClick = bSimpanClick
  end
  object bBatal: TSpeedButton
    Left = 680
    Top = 160
    Width = 65
    Height = 33
    Caption = '&Batal'
    OnClick = bBatalClick
  end
  object bExit: TSpeedButton
    Left = 832
    Top = 160
    Width = 65
    Height = 33
    Caption = 'E&xit'
    OnClick = bExitClick
  end
  object bEdit: TSpeedButton
    Left = 520
    Top = 160
    Width = 65
    Height = 33
    Caption = '&Perbarui'
    OnClick = bEditClick
  end
  object bHapus: TSpeedButton
    Left = 600
    Top = 160
    Width = 65
    Height = 33
    Caption = '&Hapus'
    OnClick = bHapusClick
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 72
    Width = 329
    Height = 321
    TabOrder = 0
    object Label3: TLabel
      Left = 16
      Top = 80
      Width = 50
      Height = 13
      Caption = 'Jenis Obat'
    end
    object Label4: TLabel
      Left = 16
      Top = 128
      Width = 69
      Height = 13
      Caption = 'Nama Supplier'
    end
    object Label6: TLabel
      Left = 16
      Top = 176
      Width = 49
      Height = 13
      Caption = 'Harga Beli'
    end
    object Label7: TLabel
      Left = 16
      Top = 224
      Width = 51
      Height = 13
      Caption = 'Harga Jual'
    end
    object Label8: TLabel
      Left = 16
      Top = 272
      Width = 22
      Height = 13
      Caption = 'Stok'
    end
    object Label10: TLabel
      Left = 16
      Top = 32
      Width = 54
      Height = 13
      Caption = 'Nama Obat'
    end
    object eHrgBeli: TEdit
      Left = 96
      Top = 176
      Width = 137
      Height = 21
      TabOrder = 0
    end
    object eHrgJual: TEdit
      Left = 96
      Top = 224
      Width = 137
      Height = 21
      TabOrder = 1
    end
    object eStok: TEdit
      Left = 96
      Top = 272
      Width = 57
      Height = 21
      TabOrder = 2
    end
    object cbJnsObat: TComboBox
      Left = 96
      Top = 80
      Width = 137
      Height = 21
      ItemHeight = 13
      TabOrder = 3
    end
    object eNmobat: TEdit
      Left = 96
      Top = 32
      Width = 185
      Height = 21
      TabOrder = 4
    end
    object cbSup: TComboBox
      Left = 96
      Top = 128
      Width = 185
      Height = 21
      ItemHeight = 13
      TabOrder = 5
      OnChange = cbSupChange
    end
  end
  object GroupBox2: TGroupBox
    Left = 352
    Top = 72
    Width = 257
    Height = 65
    Caption = 'Pencarian'
    TabOrder = 1
    object bCari: TSpeedButton
      Left = 176
      Top = 16
      Width = 65
      Height = 33
      Caption = '&Cari'
      OnClick = bCariClick
    end
    object eCari: TEdit
      Left = 8
      Top = 24
      Width = 161
      Height = 21
      TabOrder = 0
    end
  end
  object DBGrid1: TDBGrid
    Left = 352
    Top = 216
    Width = 553
    Height = 177
    DataSource = dsObat
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'idObat'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'nmObat'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'jenis'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nmSup'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'hrgBeli'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'hrgJual'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'stok'
        Visible = True
      end>
  end
  object dsObat: TDataSource
    DataSet = tbObat
    Left = 208
    Top = 8
  end
  object tbObat: TMyTable
    TableName = 'tbobat'
    Connection = Form1.MyConnection1
    Active = True
    Left = 248
    Top = 8
  end
end
