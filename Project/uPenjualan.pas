unit uPenjualan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, DB, MemDS, DBAccess, MyAccess,
  ExtCtrls, frxExportRTF, frxClass, frxExportPDF, frxDBSet;

type
  TfoPenjualan = class(TForm)
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    bBeli: TSpeedButton;
    bExit: TSpeedButton;
    bSimpan: TSpeedButton;
    bTambah: TSpeedButton;
    DBGrid1: TDBGrid;
    eNotrans: TEdit;
    eTgl: TEdit;
    eHarga: TEdit;
    eNmobat: TEdit;
    eJumbel: TEdit;
    eSubtot: TEdit;
    eTotal: TEdit;
    GroupBox1: TGroupBox;
    DBGrid2: TDBGrid;
    eCari: TEdit;
    Label3: TLabel;
    eBayar: TEdit;
    Label4: TLabel;
    eKembali: TEdit;
    dsSementara: TDataSource;
    tbPenjualan: TMyTable;
    tbDetJual: TMyTable;
    tbSementara: TMyTable;
    Timer1: TTimer;
    bCari: TSpeedButton;
    bBeliLagi: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure bTambahClick(Sender: TObject);
    procedure bExitClick(Sender: TObject);
    procedure bCariClick(Sender: TObject);
    procedure eJumbelKeyPress(Sender: TObject; var Key: Char);
    procedure bBeliClick(Sender: TObject);
    procedure bSimpanClick(Sender: TObject);
    procedure eBayarKeyPress(Sender: TObject; var Key: Char);
    procedure bBeliLagiClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure pasif;
    procedure aktif;
    procedure bersih;
    procedure gridbersih;
    procedure no_otomatis;
    procedure hitung;
    procedure tampil;
  end;

var
  foPenjualan: TfoPenjualan;
  mtotal:real;

implementation

uses uUtama, uObat;

{$R *.dfm}

{ TfoPenjualan }

procedure TfoPenjualan.aktif;
begin
  eCari.Enabled:=true;
  eNotrans.Enabled:=true;
  eTgl.Enabled:=true;
  eHarga.Enabled:=true;
  eNmobat.Enabled:=true;
  eJumbel.Enabled:=true;
  eSubtot.Enabled:=true;
  eTotal.Enabled:=true;
  eBayar.Enabled:=true;
  eKembali.Enabled:=true;
  bBeli.Enabled:=true;
  bSimpan.Enabled:=true;
  bBeliLagi.Enabled:=true;
end;

procedure TfoPenjualan.bersih;
begin
  eNotrans.Clear;
  eHarga.Clear;
  eNmobat.Clear;
  eJumbel.Text:='0';
  eSubtot.Text:='0';
  eTotal.Text:='0';
  eBayar.Text:='0';
  eKembali.Text:='0';
end;

procedure TfoPenjualan.pasif;
begin
  eCari.Enabled:=false;
  eNotrans.Enabled:=false;
  eTgl.Enabled:=false;
  eHarga.Enabled:=false;
  eNmobat.Enabled:=false;
  eJumbel.Enabled:=false;
  eSubtot.Enabled:=false;
  eTotal.Enabled:=false;
  eBayar.Enabled:=false;
  eKembali.Enabled:=false;
  bBeli.Enabled:=false;
  bSimpan.Enabled:=false;
  bBeliLagi.Enabled:=false;
end;

procedure TfoPenjualan.FormCreate(Sender: TObject);
begin
  gridbersih;
  bersih;
  pasif;
end;

procedure TfoPenjualan.gridbersih;
begin
  If tbSementara.RecordCount <> 0 then
  begin
    tbSementara.First;
    while not tbSementara.Eof do
    begin
      tbSementara.Delete;
      tbSementara.Next;
      tbSementara.Refresh;
    end;
  end;
end;

procedure TfoPenjualan.no_otomatis;
var no : integer;
    tgl, bln : string;
begin
  tgl:=copy(eTgl.Text,1,2);
  bln:=copy(eTgl.Text,4,2);
  tbPenjualan.Refresh;
  if tbPenjualan.RecordCount = 0 then
  begin
    eNotrans.Text:='TR'+tgl+bln+'-'+'01';
  end
  else
  begin
    tbPenjualan.Last;
    no:=StrToInt(copy(tbPenjualan['noTrans'],8,4));
    inc(no);
    if (no < 1000) and (no > 100) then
      eNotrans.Text:='TR'+tgl+bln+'-'+IntToStr(no)
    else if (no < 100) and (no > 10) then
      eNotrans.Text:='TR'+tgl+bln+'-'+'0'+IntToStr(no)
    else if (no < 10) and (no > 0) then
      eNotrans.Text:='TR'+tgl+bln+'-'+'0'+IntToStr(no)
    else
      eNotrans.Text:='TR'+tgl+bln+'-'+IntToStr(no);
    eNotrans.Enabled:=False;
  end;
end;

procedure TfoPenjualan.Timer1Timer(Sender: TObject);
begin
  eTgl.Text:=FormatDateTime('dd-mm-yyyy',now);
end;

procedure TfoPenjualan.bTambahClick(Sender: TObject);
begin
  if bTambah.Caption='&Tambah' then
  begin
    bTambah.Caption:='B&atal';
    aktif;
    bersih;
    no_otomatis;
    eCari.SetFocus;
  end
  else
  begin
    bTambah.Caption:='&Tambah';
    pasif;
    gridbersih;
  end;
end;

procedure TfoPenjualan.bExitClick(Sender: TObject);
begin
  close;
end;

procedure TfoPenjualan.hitung;
begin
  mtotal:=0;
  if tbSementara.RecordCount <> 0 then
  begin
    tbSementara.First;
    while not tbSementara.Eof do
    begin
      mtotal:=mtotal+tbSementara['subtotal'];
      tbSementara.Next;
    end;
  end
  else
  begin
    mtotal:=0;
  end;
  eTotal.Text:=FloatToStr(mtotal);
end;

procedure TfoPenjualan.bCariClick(Sender: TObject);
begin
  foObat.tbObat.IndexFieldNames:='';
  if not foObat.tbObat.Locate('nmObat',eCari.Text,[]) then
    begin
      ShowMessage('Data Belum Ada');
      Exit;
      foObat.ActiveControl:=eCari;
    end
  else
    tampil;
    aktif;
    eCari.Clear;
    eJumbel.SetFocus;
end;

procedure TfoPenjualan.tampil;
begin
  eNmobat.Text:=foObat.tbObat['nmObat'];
  eHarga.Text:=foObat.tbObat['hrgJual'];
end;

procedure TfoPenjualan.eJumbelKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
  begin
    eSubtot.Text:=IntToStr(StrToInt(eJumbel.Text)*StrToInt(eHarga.Text));
  end;
end;

procedure TfoPenjualan.bBeliClick(Sender: TObject);
begin
  if tbSementara.Locate('nmObat',eNmobat.Text,[]) then
  begin
    tbSementara.Edit;
    tbSementara['qty']:=tbSementara['qty']+StrToInt(eJumbel.Text);
    tbSementara['subtotal']:=tbSementara['subtotal']+StrToFloat(eSubtot.Text);
    tbSementara.Post;
  end
  else
  begin
    tbSementara.Append;
    tbSementara['nmObat']:=eNmobat.Text;
    tbSementara['harga']:=StrToFloat(eHarga.Text);
    tbSementara['qty']:=StrToInt(eJumbel.Text);
    tbSementara['subtotal']:=StrToFloat(eSubtot.Text);
    tbSementara.Post;
  end;
  hitung;
  eNmobat.Clear;
  eHarga.Text:='0';
  eJumbel.Text:='0';
  eSubtot.Text:='0';
  eBayar.SetFocus;

end;

procedure TfoPenjualan.bSimpanClick(Sender: TObject);
begin
  tbSementara.First;
  while not tbSementara.Eof do
  begin
    tbDetJual.Append;
    tbDetJual['noTrans']:=eNotrans.Text;
    tbDetJual['nmObat']:=tbSementara['nmObat'];
    tbDetJual['qty']:=tbSementara['qty'];
    if foObat.tbObat.Locate('nmObat',tbDetJual['nmObat'],[]) then
    begin
      foObat.tbObat.Edit;
      foObat.tbObat['stok']:=foObat.tbObat['stok']-tbDetJual['qty'];
    end;
    tbDetJual['subtotal']:=tbSementara['subtotal'];
    tbDetJual.Post;
    tbSementara.Next;
  end;

  tbPenjualan.Append;
  tbPenjualan['noTrans']:=eNotrans.Text;
  tbPenjualan['tglTrans']:=eTgl.Text;
  tbPenjualan['nmSup']:=foObat.tbObat['nmSup'];
  tbPenjualan['total']:=StrToFloat(eTotal.Text);
  tbPenjualan.Post;
  ShowMessage('Data telah tersimpan');
  bersih;
  pasif;
  gridbersih;

  if bTambah.Caption='B&atal' then
  begin
    bTambah.Caption:='&Tambah';
  end;
end;

procedure TfoPenjualan.eBayarKeyPress(Sender: TObject; var Key: Char);
var kembali, bayar, total : real;
begin
  if key=chr(13) then
  begin
    bayar:=StrToFloat(eBayar.Text);
    total:=StrToFloat(eTotal.Text);
    eBayar.Text:=FormatFloat('#,0',bayar);
    kembali:=bayar-total;
    eKembali.Text:=FormatFloat('#,0',kembali);
  end;
end;

procedure TfoPenjualan.bBeliLagiClick(Sender: TObject);
begin
  eCari.SetFocus;
end;

end.
