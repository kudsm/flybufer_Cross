unit Unit9;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TFormAbout }

  TFormAbout = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    Timer1: TTimer;
    procedure FormClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label1MouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
    procedure Label2Click(Sender: TObject);
    procedure Label2MouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
    procedure Label3Click(Sender: TObject);
    procedure Label3MouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
    procedure Label3MouseLeave(Sender: TObject);
    procedure Label3MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure Panel1Click(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  FormAbout: TFormAbout;

implementation
uses Unit1;
{$R *.lfm}

{ TFormAbout }

procedure TFormAbout.Label3MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  //Label3.Font.Style:= [fsUnderline];
end;

procedure TFormAbout.Panel1Click(Sender: TObject);
begin
  FormAbout.Close;
end;

procedure TFormAbout.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 FormAbout.Close;
end;

procedure TFormAbout.Timer1Timer(Sender: TObject);
begin
  FormAbout.Close;
  Timer1.Enabled:=False;
end;

procedure TFormAbout.Label3MouseLeave(Sender: TObject);
begin
   //Label3.Font.Style:= [];
end;

procedure TFormAbout.Label3Click(Sender: TObject);
begin
  FormAbout.Close;
end;

procedure TFormAbout.Label3MouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 FormAbout.Close;
end;

procedure TFormAbout.FormShow(Sender: TObject);
begin
 FormAbout.Caption:=Unit1.About;
 Label1.Caption:=Unit1.About;

  Timer1.Enabled:=True;
  Label1.Left:=(FormAbout.Width div 2) - (Label1.Width div 2);
  Label2.Left:=(FormAbout.Width div 2) - (Label2.Width + 2);
  Label5.Left:=(FormAbout.Width div 2) - (Label5.Width + 2);
  Label7.Left:=(FormAbout.Width div 2) - (Label7.Width div 2);
  Label4.Left:=(FormAbout.Width div 2) + 2;
  Label6.Left:=(FormAbout.Width div 2) + 2;
  Label3.Left:=(FormAbout.Width div 2) - (Label3.Width div 2);
  FormAbout.Width:=Label2.Width+Label4.Width+(Label2.Left*2);
end;

procedure TFormAbout.Label1Click(Sender: TObject);
begin
  FormAbout.Close;
end;

procedure TFormAbout.Label1MouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 FormAbout.Close;
end;

procedure TFormAbout.Label2Click(Sender: TObject);
begin
  FormAbout.Close;
end;

procedure TFormAbout.Label2MouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 FormAbout.Close;
end;

procedure TFormAbout.FormCreate(Sender: TObject);
begin
   FormAbout.Left:=(Screen.Width div 2) - (FormAbout.Width div 2);
   FormAbout.Top:=(Screen.Height div 2) - (FormAbout.Height div 2);
end;

procedure TFormAbout.FormMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 FormAbout.Close;
end;

procedure TFormAbout.FormClick(Sender: TObject);
begin
  FormAbout.Close;
end;

procedure TFormAbout.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
 Timer1.Enabled:=False;
end;

end.

