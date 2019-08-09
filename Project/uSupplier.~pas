unit uSupplier;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, MemDS, DBAccess, MyAccess,
  dxGDIPlusClasses, ExtCtrls;

type
  TfoSupplier = class(TForm)
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    bAdd: TSpeedButton;
    bSave: TSpeedButton;
    eNmsup: TEdit;
    eTelp: TEdit;
    Label5: TLabel;
    eAlamat: TMemo;
    bEdit: TSpeedButton;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    eCari: TEdit;
    dsSupplier: TDataSource;
    bExit: TSpeedButton;
    bHapus: TSpeedButton;
    tbSupplier: TMyTable;
    bCari: TSpeedButton;
    bBatal: TSpeedButton;
    procedure bExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bAddClick(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure bHapusClick(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure bCariClick(Sender: TObject);
    procedure bBatalClick(Sender: TObject);
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
  foSupplier: TfoSupplier;
  idSup:String;
  isi:Boolean;

implementation

uses uUtama;

{$R *.dfm}

procedure TfoSupplier.aktif;
begin
  eNmsup.Enabled:=true;
  eTelp.Enabled:=true;
  eAlamat.Enabled:=True;
  bSave.Enabled:=true;
  bEdit.Enabled:=true;
  bHapus.Enabled:=true;
  bBatal.Enabled:=True;
end;

procedure TfoSupplier.bersih;
begin
  eNmsup.Clear;
  eTelp.Clear;
  eAlamat.Clear;
end;

procedure TfoSupplier.bExitClick(Sender: TObject);
begin
  close;
end;

procedure TfoSupplier.pasif;
begin
  eNmsup.Enabled:=false;
  eTelp.Enabled:=false;
  eAlamat.Enabled:=false;
  bSave.Enabled:=false;
  bEdit.Enabled:=false;
  bHapus.Enabled:=False;
  bBatal.Enabled:=False;
end;

procedure TfoSupplier.FormCreate(Sender: TObject);
begin
  bersih;
  pasif;
end;

procedure TfoSupplier.bAddClick(Sender: TObject);
begin
  aktif;
  eNmsup.SetFocus;
end;

procedure TfoSupplier.bSaveClick(Sender: TObject);
begin
  if tbSupplier.Locate('nmSup',eNmsup.Text,[]) then
    begin
      ShowMessage('Data Supplier suda ada!');
      exit;
    end
  else
    begin
      tbSupplier.Append;
      tbSupplier['nmSup']:=eNmsup.Text;
      tbSupplier['telp']:=eTelp.Text;
      tbSupplier['alamat']:=eAlamat.Text;
      tbSupplier.Post;
      tbSupplier.Refresh;
      ShowMessage('Data Supplier yang baru telah tersimpan');
      pasif;
      bersih;
    end;
end;

procedure TfoSupplier.bHapusClick(Sender: TObject);
begin
  if MessageDlg('Apa Anda yakin ingin menghapus data ini?', mtConfirmation, [mbYes]+[mbCancel],0) = mrYes
  then
    begin
      tbSupplier.Delete;
      pasif;
      bersih;
      tbSupplier.First;
    end;
  bAdd.Enabled:=true;
end;

procedure TfoSupplier.bEditClick(Sender: TObject);
begin
  isi:=false;
  ShowMessage('Data akan diupdate');
    tbSupplier.Edit;
    tbSupplier['nmSup']:=eNmsup.Text;
    tbSupplier['telp']:=eTelp.Text;
    tbSupplier['alamat']:=eAlamat.Text;
    tbSupplier.Post;
  pasif;
  bersih;
  bAdd.Enabled:=True;
end;

procedure TfoSupplier.tampil;
begin
  eNmsup.Text:=tbSupplier['nmSup'];
  eTelp.Text:=tbSupplier['telp'];
  ealamat.Text:=tbSupplier['alamat'];
end;

procedure TfoSupplier.bCariClick(Sender: TObject);
begin
  tbSupplier.IndexFieldNames:='';
  if not tbSupplier.Locate('nmSup',eCari.Text,[]) then
    begin
      ShowMessage('Data Belum Ada');
      Exit;
      foSupplier.ActiveControl:=eCari;
    end
  else
    tampil;
    aktif;
    eCari.Clear;
    eCari.SetFocus;
  bAdd.Enabled:=False;
  bSave.Enabled:=False;
end;

procedure TfoSupplier.bBatalClick(Sender: TObject);
begin
  bersih;
  pasif;
end;

end.
