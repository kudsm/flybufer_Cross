unit Unit4;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
 StdCtrls;

type

 { TForm_Del }

 TForm_Del = class(TForm)
  Img_No: TImage;
  Img_Yes: TImage;
  No: TButton;
  Yes: TButton;
  Img_Polosa_Top: TImage;
  Label1: TLabel;
  procedure FormShow(Sender: TObject);
  procedure Img_NoMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Img_NoMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Img_YesMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Img_YesMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure NoClick(Sender: TObject);
  procedure YesClick(Sender: TObject);
 private
  { private declarations }
 public
  { public declarations }
 end;

var
 Form_Del: TForm_Del;
 bc_to_DEL: String;

implementation
uses Unit1;

{$R *.lfm}

{ TForm_Del }

procedure TForm_Del.FormShow(Sender: TObject);
begin
 //Координаты при появлении
 Form_Del.Left:=Mouse.CursorPos.x - (Form_Del.Width div 2);
 Form_Del.Top:=Mouse.CursorPos.y - (Form_Del.Height div 2);

 Label1.Caption:=Unit1.Del;
 Label1.Left:=(Form_Del.Width DIV 2) - (Label1.Width DIV 2);
 Form_Del.Caption:=Unit1.Del;
end;

procedure TForm_Del.Img_NoMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
  Img_No.Left:=Img_No.Left+1;
  Img_No.Top:=Img_No.Top+1;
end;

procedure TForm_Del.Img_NoMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
  Img_No.Left:=Img_No.Left-1;
  Img_No.Top:=Img_No.Top-1;
end;

procedure TForm_Del.Img_YesMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
  Img_Yes.Left:=Img_Yes.Left+1;
  Img_Yes.Top:=Img_Yes.Top+1;
end;

procedure TForm_Del.Img_YesMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
  Img_Yes.Left:=Img_Yes.Left-1;
  Img_Yes.Top:=Img_Yes.Top-1;
end;

procedure TForm_Del.NoClick(Sender: TObject);
begin
 Form_Del.Close;
end;

procedure TForm_Del.YesClick(Sender: TObject);
var
 i, i_del:integer;
 s:string;
 FC:TComponent;
begin
 //Удаляем блок
 Unit1.Form1.FC_ActVars();

 //Находим и удаляем строчку
 Form1.Memo_Din.Lines.LoadFromFile(folder_txt+Unit1.act_tab+'/index.ksm' );
 for i:=1 to Form1.Memo_Din.Lines.Count-1 do
 begin
   //Удаляем строчку
   if Form1.Memo_Din.Lines[i] = bc_to_DEL then
   begin
     //Если строчка равня удаляемому блоку, запоминаем ее
     i_del:=i;
   end;
 end;
 //Удаляем строчку
 Form1.Memo_Din.Lines.Delete(i_del);
 Form1.Memo_Din.Lines.SaveToFile(folder_txt+Unit1.act_tab+'/index.ksm' );

 //Удаляем сам блок
 DeleteFile(folder_txt+Unit1.act_tab+'/'+bc_to_DEL+'.sm');

 //Удаляем изображение и Label блока
 FC:=Form1.FindComponent('Imgbl'+bc_to_DEL);
 FreeAndNil(FC);
 FC:=Form1.FindComponent(bc_to_DEL);
 FreeAndNil(FC);
 FC:=Form1.FindComponent('ImgZam'+bc_to_DEL);
 FreeAndNil(FC);
 FC:=Form1.FindComponent('ImgCop'+bc_to_DEL);
 FreeAndNil(FC);

 //Строим форму
 Unit1.Form1.FC_FormStroy();

 //Закрываем окно
 Form_Del.Close;
end;

end.

