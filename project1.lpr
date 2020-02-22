program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms,  Unit1, Unit2, Unit3, Unit4, Unit5, Unit6, Unit7,
  Unit8, Unit9, Unit10
  { you can add units after this };

{$R *.res}

begin
 // Application.Scaled:=True;
  Application.Title:='FlyBufer 3.0 Cross';
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
 Application.CreateForm(TForm_Open, Form_Open);
 Application.CreateForm(TForm_Save, Form_Save);
 Application.CreateForm(TForm_Del, Form_Del);
 Application.CreateForm(TForm_Tabs, Form_Tabs);
 Application.CreateForm(TForm_Add, Form_Add);
 Application.CreateForm(TFormOnOff, FormOnOff);
  Application.CreateForm(TFormAbout, FormAbout);
 Application.CreateForm(TFormSettings, FormSettings);
  Application.Run;
end.

