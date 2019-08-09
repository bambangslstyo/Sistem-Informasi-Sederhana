program Apotek;

uses
  Forms,
  uUtama in 'uUtama.pas' {Form1},
  uSupplier in 'uSupplier.pas' {foSupplier},
  uObat in 'uObat.pas' {foObat},
  uPenjualan in 'uPenjualan.pas' {foPenjualan};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfoSupplier, foSupplier);
  Application.CreateForm(TfoObat, foObat);
  Application.CreateForm(TfoPenjualan, foPenjualan);
  Application.Run;
end.
