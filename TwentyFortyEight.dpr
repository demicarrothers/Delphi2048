program TwentyFortyEight;

uses
  Vcl.Forms,
  Delphi2048 in 'Delphi2048.pas' {Form1},
  About2048 in 'About2048.pas' {Form2},
  Rules2048 in 'Rules2048.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
