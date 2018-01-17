unit Unit3;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
 StdCtrls;

type

 { TForm_Save }

 TForm_Save = class(TForm)
  Btn_Save: TButton;
  Btn_WithoutSave: TButton;
  Btn_Cancel: TButton;
  Image1: TImage;
  Label_Save: TLabel;
  procedure Btn_CancelClick(Sender: TObject);
  procedure Btn_WithoutSaveClick(Sender: TObject);
  procedure FormShow(Sender: TObject);
  procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
 private
  { private declarations }
 public
  function FC_SaveEditBc():Integer;
  { public declarations }
 end;

var
 Form_Save: TForm_Save;
 not_Save_NameBc, not_Save_TXTBc: string;

implementation
uses Unit1,Unit2;

{$R *.lfm}

{ TForm_Save }

procedure TForm_Save.Btn_CancelClick(Sender: TObject);
begin
 Form_Save.Close;
 Form_Open.Show;
end;

procedure TForm_Save.Btn_WithoutSaveClick(Sender: TObject);
begin
 Form_Save.Close;
 Form_Open.Visible := False;
end;

procedure TForm_Save.FormShow(Sender: TObject);
begin
 //Выровнять, если вышла за границу экрана
 if Form_Save.Left > (Screen.Width - Form_Save.Width) then
 begin
   Form_Save.Left := Screen.Width - Form_Save.Width-100;
   //Form_Open.Left:=Form_Open.Left-100;
   //Form_Open.Top:=-100;
 end;
 if Form_Save.Top < 0 then
 begin
   Form_Save.Top := 100;
   //Form_Open.Left:=Form_Open.Left-100;
   //Form_Open.Top:=-100;
 end;
end;

procedure TForm_Save.Image1MouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 //Form_Save_pressed:=False;
end;

function TForm_Save.FC_SaveEditBc: Integer;
begin
  //Сохраняем открытый блок
 //  FC_ActVars;
 //Проверим, изменен ли был блок. Если что спросим сохранять?


 Form1.Memo_Din.Lines.Clear;
 if length(not_Save_NameBc) > 0 then
 begin
   Form1.Memo_Din.Text := not_Save_NameBc
 end
 else
 begin
   Form1.Memo_Din.Text := '31071990ksm';
 end;
 Form1.Memo_Din.Lines.Add(not_Save_TXTBc);
 Form1.Memo_Din.Lines.SaveToFile(folder_txt+Unit1.act_tab+'/'+Unit2.Var_OpenBc_OLD+'.sm');

 Form_Save.Close;
 //Строим форму
 Unit1.Form1.Button_FormStroy.Click;
end;

end.

