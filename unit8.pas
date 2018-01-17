unit Unit8;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

 { TFormOnOff }

 TFormOnOff = class(TForm)
  Timer1: TTimer;
  procedure FormClick(Sender: TObject);
  procedure FormCreate(Sender: TObject);
  procedure Timer1Timer(Sender: TObject);
 private
  { private declarations }
 public
  { public declarations }
 end;

var
 FormOnOff: TFormOnOff;

implementation
uses Unit1, Unit5;

{$R *.lfm}

{ TFormOnOff }

procedure TFormOnOff.Timer1Timer(Sender: TObject);
begin
  //Показываем форму 2-х пиксельную________________________
   if (Mouse.CursorPos.x > FormOnOff.Left)
   AND(Mouse.CursorPos.x < FormOnOff.Left + FormOnOff.Width)
   AND(Mouse.CursorPos.y < 2)
   AND(Mouse.CursorPos.y > -1)
   AND (Form1.Visible = False)
   then
   begin
     //Показать форму синюю
     FormOnOff.Show;
     FormOnOff.Visible:=True;
     FormOnOff.Top:=0;
   end
   else
   begin
     //Убрать форму синюю
     FormOnOff.Hide;
   end;

   //Убираем форму ОСНОВНУЮ________________________
   //Если мышь за ее пределами
    if ((Mouse.CursorPos.x < Form1.Left)
    OR(Mouse.CursorPos.x > Form1.Left + Form1.Width)
    OR(Mouse.CursorPos.y > Form1.Height))
    AND (Form1.Visible = True)
    AND (Form1.SB_Stop.Tag = 0)
    AND (Form_Tabs.Visible = False)
    AND (NoHdeOneSecond = False)
    then
    begin
      //Убрать форму
      Form1.Hide;
    end;
end;

procedure TFormOnOff.FormClick(Sender: TObject);
begin
  //Показать главную форму
   Form1.Show;
   Form1.Top:=0;
end;

procedure TFormOnOff.FormCreate(Sender: TObject);
begin
 FormOnOff.Left:=Form1.Left;
 FormOnOff.Width:=Form1.Width;
 FormOnOff.Top:=0;
end;

end.

