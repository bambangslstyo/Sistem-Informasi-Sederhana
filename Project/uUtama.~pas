unit uUtama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus, sSkinManager, DB, MemDS, DBAccess, MyAccess,
  frxExportRTF, frxClass, frxExportPDF, frxDBSet, dxGDIPlusClasses;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    S1: TMenuItem;
    O1: TMenuItem;
    P1: TMenuItem;
    L1: TMenuItem;
    L2: TMenuItem;
    L3: TMenuItem;
    L4: TMenuItem;
    K1: TMenuItem;
    Panel1: TPanel;
    sSkinManager1: TsSkinManager;
    MyConnection1: TMyConnection;
    dbSupplier: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    dbObat: TfrxDBDataset;
    dbPenjualan: TfrxDBDataset;
    lpPenjualan: TfrxReport;
    lpObat: TfrxReport;
    lpSupplier: TfrxReport;
    Image1: TImage;
    procedure S1Click(Sender: TObject);
    procedure K1Click(Sender: TObject);
    procedure O1Click(Sender: TObject);
    procedure P1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure L2Click(Sender: TObject);
    procedure L3Click(Sender: TObject);
    procedure L4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses uSupplier, uObat, uPenjualan;

{$R *.dfm}

procedure TForm1.S1Click(Sender: TObject);
begin
  foObat.Close;
  foPenjualan.Close;
  foSupplier.Parent:=Form1.Panel1;
  foSupplier.Show;
end;

procedure TForm1.K1Click(Sender: TObject);
begin
  if Application.MessageBox('Yakin akan keluar?','Informasi',MB_OKCANCEL)=idok then
  begin
    ShowMessage('Aplikasi akan ditutup');
    close;
  end
  else
  begin
    ShowMessage('Aplikasi tidak ditutup');
    exit;
  end;
end;

procedure TForm1.O1Click(Sender: TObject);
begin
  foSupplier.Close;
  foPenjualan.Close;
  foObat.Parent:=Form1.Panel1;
  foObat.Show;
end;

procedure TForm1.P1Click(Sender: TObject);
begin
  foObat.Close;
  foSupplier.Close;
  foPenjualan.Parent:=Form1.Panel1;
  foPenjualan.Show;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  foSupplier.Close;
  foObat.Close;
  foPenjualan.Close;
end;

procedure TForm1.L2Click(Sender: TObject);
begin
  lpSupplier.ShowReport();
end;

procedure TForm1.L3Click(Sender: TObject);
begin
  lpObat.ShowReport();
end;

procedure TForm1.L4Click(Sender: TObject);
begin
  lpPenjualan.ShowReport();
end;

end.
