unit uObat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Grids, DBGrids, Buttons, MemDS, DBAccess, MyAccess;

type
  TfoObat = class(TForm)
    Label5: TLabel;
    bTambah: TSpeedButton;
    bSimpan: TSpeedButton;
    bBatal: TSpeedButton;
    bExit: TSpeedButton;
    bEdit: TSpeedButton;
    bHapus: TSpeedButton;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    eHrgBeli: TEdit;
    eHrgJual: TEdit;
    eStok: TEdit;
    GroupBox2: TGroupBox;
    eCari: TEdit;
    DBGrid1: TDBGrid;
    dsObat: TDataSource;
    cbJnsObat: TComboBox;
    Label10: TLabel;
    eNmobat: TEdit;
    cbSup: TComboBox;
    bCari: TSpeedButton;
    tbObat: TMyTable;
    procedure bExitClick(Sender: TObject);
    procedure bTambahClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bSimpanClick(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure bHapusClick(Sender: TObject);
    procedure bCariClick(Sender: TObject);
    procedure bBatalClick(Sender: TObject);
    procedure cbSupChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure aktif;
    procedure pasif;
    procedure bersih;
    procedure tampil;
  end;

var
  foObat: TfoObat;
  isi:Boolean;

implementation

uses uUtama, uSupplier;

{$R *.dfm}

procedure TfoObat.aktif;
begin
  eNmobat.Enabled:=true;
  cbJnsObat.Enabled:=True;
  cbSup.Enabled:=True;
  eHrgBeli.Enabled:=True;
  eHrgJual.Enabled:=true;
  eStok.Enabled:=true;
  bSimpan.Enabled:=true;
  bBatal.Enabled:=true;
  bEdit.Enabled:=true;
  bHapus.Enabled:=true;
end;

procedure TfoObat.bersih;
begin
  eNmobat.Clear;
  cbJnsObat.Clear;
  cbSup.Clear;
  eHrgBeli.Clear;
  eHrgJual.Clear;
  eStok.Clear;
end;

procedure TfoObat.bExitClick(Sender: TObject);
begin
  close;
end;

procedure TfoObat.pasif;
begin
  eNmobat.Enabled:=false;
  cbJnsObat.Enabled:=false;
  cbSup.Enabled:=false;
  eHrgBeli.Enabled:=false;
  eHrgJual.Enabled:=false;
  eStok.Enabled:=false;
  bSimpan.Enabled:=false;
  bBatal.Enabled:=False;
  bEdit.Enabled:=false;
  bHapus.Enabled:=false;
end;

procedure TfoObat.bTambahClick(Sender: TObject);
begin
  cbJnsObat.Clear;
  cbJnsObat.Items.Add('Tablet');
  cbJnsObat.Items.Add('Kapsul');
  cbJnsObat.Items.Add('Sirup');
  cbJnsObat.Items.Add('Cairan');
  cbJnsObat.Items.Add('Bubuk');

  cbSup.Clear;
  foSupplier.tbSupplier.Active:=true;
  foSupplier.tbSupplier.First;
  while not foSupplier.tbSupplier.Eof do
  begin
    cbSup.Items.Add(foSupplier.tbSupplier['nmSup']);
    foSupplier.tbSupplier.Next;
  end;
  
  aktif;
  eNmobat.SetFocus;
end;

procedure TfoObat.FormCreate(Sender: TObject);
begin
  bersih;
  pasif;
end;

procedure TfoObat.bSimpanClick(Sender: TObject);
begin
  if tbObat.Locate('nmObat',eNmobat.Text,[]) then
    begin
      ShowMessage('Data Obat suda ada!');
      exit;
    end
  else
    begin
      tbObat.Append;
      tbObat['nmObat']:=eNmobat.Text;
      tbObat['jenis']:=cbJnsObat.Text;
      tbObat['nmSup']:=cbSup.Text;
      tbObat['hrgBeli']:=StrToFloat(eHrgBeli.Text);
      tbObat['hrgJual']:=StrToFloat(eHrgJual.Text);
      tbObat['stok']:=eStok.Text;
      tbObat.Post;
      tbObat.Refresh;
      ShowMessage('Data Obat yang baru telah tersimpan');
      pasif;
      bersih;
    end;
end;

procedure TfoObat.bEditClick(Sender: TObject);
begin
  isi:=false;
  ShowMessage('Data akan diupdate');
    tbObat.Edit;
    tbObat['nmObat']:=eNmobat.Text;
    tbObat['jenis']:=cbJnsObat.Text;
    tbObat['nmSup']:=cbSup.Text;
    tbObat['hrgBeli']:=StrToFloat(eHrgBeli.Text);
    tbObat['hrgJual']:=StrToFloat(eHrgJual.Text);
    tbObat['stok']:=eStok.Text;
    tbObat.Post;
  pasif;
  bersih;
  bTambah.Enabled:=True;
end;

procedure TfoObat.bHapusClick(Sender: TObject);
begin
  if MessageDlg('Apa Anda yakin ingin menghapus data ini?', mtConfirmation, [mbYes]+[mbCancel],0) = mrYes
  then
    begin
      tbObat.Delete;
      pasif;
      bersih;
      tbObat.First;
    end;
  bTambah.Enabled:=true;
end;

procedure TfoObat.bCariClick(Sender: TObject);
begin
  tbObat.IndexFieldNames:='';
  if not tbObat.Locate('nmObat',eCari.Text,[]) then
    begin
      ShowMessage('Data Belum Ada');
      Exit;
      foObat.ActiveControl:=eCari;
    end
  else
    tampil;
    aktif;
    eCari.Clear;
    eCari.SetFocus;

  cbJnsObat.Items.Add('Tablet');
  cbJnsObat.Items.Add('Kapsul');
  cbJnsObat.Items.Add('Sirup');
  cbJnsObat.Items.Add('Cairan');
  cbJnsObat.Items.Add('Bubuk');

  foSupplier.tbSupplier.Active:=true;
  foSupplier.tbSupplier.First;
  while not foSupplier.tbSupplier.Eof do
  begin
    cbSup.Items.Add(foSupplier.tbSupplier['nmSup']);
    foSupplier.tbSupplier.Next;
  end;
  bTambah.Enabled:=false;
  bSimpan.Enabled:=false; 
end;

procedure TfoObat.bBatalClick(Sender: TObject);
begin
  bersih;
  pasif;
end;

procedure TfoObat.tampil;
begin
  eNmobat.Text:=tbObat['nmObat'];
  cbJnsObat.Text:=tbObat['jenis'];
  cbSup.Text:=tbObat['nmSup'];
  eHrgBeli.Text:=tbObat['hrgBeli'];
  eHrgJual.Text:=tbObat['hrgJual'];
  eStok.Text:=tbObat['stok'];
end;

procedure TfoObat.cbSupChange(Sender: TObject);
begin
  foSupplier.tbSupplier.Refresh;
  if foSupplier.tbSupplier.Locate('nmSup',cbSup.Text,[]) then
  begin
    eHrgBeli.SetFocus;
  end;
end;

end.
