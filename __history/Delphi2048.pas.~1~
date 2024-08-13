unit Delphi2048;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ComCtrls, Vcl.Menus, About2048, Winapi.ShellAPI,
  Vcl.ExtCtrls, Vcl.StdCtrls, Math;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    Options1: TMenuItem;
    About1: TMenuItem;
    Help1: TMenuItem;
    NewGame1: TMenuItem;
    Rules1: TMenuItem;
    SaveGame1: TMenuItem;
    LoadGame1: TMenuItem;
    Keybinds1: TMenuItem;
    ProgramInfo1: TMenuItem;
    DeveloperContact1: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel8: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Label1: TLabel;
    Label5: TLabel;
    procedure ProgramInfo1Click(Sender: TObject);
    procedure DeveloperContact1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure shiftTiles(direction: integer);
    procedure updateBoard();
    procedure spawnBlock();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  blocks: array[1..16] of integer;
  canMove: array[1..16] of boolean;
  var blockValue: array[1..16] of integer;

implementation

{$R *.dfm}

procedure TForm1.shiftTiles(direction: integer);
var
  i: Integer;
begin
  for i := 1 to 16 do
  canMove[i] := True; // initialize array with all trues

  for i := 1 to 16 do
  begin
  case direction of
  -1:
  begin
    if (i mod 4 <> 1) then
    begin
      var currentPos := i;
      while (blockValue[currentPos] <> 0) and (currentPos mod 4 <> 1) and (blockValue[currentPos - 1] = 0) do
      begin
        blockValue[currentPos - 1] := blockValue[currentPos];
        blockValue[currentPos] := 0;
        currentPos := currentPos - 1; // Move the block left and update currentPos
      end;

      if (currentPos mod 4 <> 1) and (blockValue[currentPos] = blockValue[currentPos - 1]) then
      begin
        blockValue[currentPos - 1] := blockValue[currentPos] * 2;
        blockValue[currentPos] := 0;
      end;
    end;
  end;   

  1:
  begin
    if (i mod 4 <> 0) then
    begin
      var currentPos := i; 
      while (currentPos mod 4 <> 0) and (blockValue[currentPos] <> 0) and (blockValue[currentPos + 1] = 0) do
      begin
        blockValue[currentPos + 1] := blockValue[currentPos];
        blockValue[currentPos] := 0;
        currentPos := currentPos + 1;
      end;

      if (currentPos mod 4 <> 0) and (blockValue[currentPos] = blockValue[currentPos + 1]) then
      begin
        blockValue[currentPos + 1] := blockValue[currentPos] * 2;
        blockValue[currentPos] := 0;
      end;
    end;
  end;

  4:
  begin
    if (i <> 1) or (i / 4 <> 0) then
    begin
      var currentPos := i; // when i learn how to refactor this code i'll make this better i swear
      while (currentPos <> 1) or (currentPos / 4 <> 0) do
      
    end;
    
  end;
  end;
  
end;


  spawnBlock();
  updateBoard();
end;

procedure TForm1.updateBoard();
var
  i: Integer;
  Panel: TPanel;
begin
  for i := 1 to 16 do
  begin
    Panel := FindComponent('Panel' + IntToStr(i)) as TPanel;
    if Assigned(Panel) then
    begin
      case blockValue[i] of
        0:
        begin
          Panel.Caption := '';
          Panel.Color := TColor($00FFFFFF); // 0 is white. no val
        end;
        2: Panel.Color := TColor($00007BFF);
        4: Panel.Color := TColor($000088FF);
        8: Panel.Color := TColor($000095FF);
        16: Panel.Color := TColor($0000A2FF);
        32: Panel.Color := TColor($0000AAFF);
        64: Panel.Color := TColor($0000B7FF);
        128: Panel.Color := TColor($0000C3FF);
        256: Panel.Color := TColor($0000D0FF);
        512: Panel.Color := TColor($0000DDFF);
        1024: Panel.Color := TColor($0000EAFF);
        2048: Panel.Color := TColor($0037AFD4);
      else
        Panel.Color := TColor($0037AFD4);
      end;

      if blockValue[i] <> 0 then
        Panel.Caption := IntToStr(blockValue[i]);
    end;
  end;
end;

procedure TForm1.spawnBlock();
var
  emptySpaces: array[1..16] of Integer;
  count, i, randomIndex: Integer;
begin
  count := 0;
  for i := 1 to 16 do
  begin
    if blockValue[i] = 0 then
    begin
      Inc(count);
      emptySpaces[count] := i;
    end;
  end;

  if count > 0 then
  begin
    randomize;
    randomIndex := emptySpaces[random(Count) + 1];
    blockValue[randomIndex] := IfThen(random(10) = 0, 4, 2); // 90% chance of 2, 10% of 4
  end;
end;

procedure TForm1.DeveloperContact1Click(Sender: TObject);
begin
    ShellExecute(self.WindowHandle,'open','mailto:tylerjcarrothers@gmail.com',nil,nil, SW_SHOWNORMAL);
end;


procedure TForm1.ProgramInfo1Click(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    case Key of
    VK_UP, Ord('W'): shiftTiles(-4);
    VK_DOWN, Ord('S'): shiftTiles(4);
    VK_LEFT, Ord('A'): shiftTiles(-1);
    VK_RIGHT, Ord('D'): shiftTiles(1);
    end;
end;

end.
