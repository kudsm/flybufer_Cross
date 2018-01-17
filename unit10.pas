unit Unit10;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
 StdCtrls, IniFiles;

type

 { TFormSettings }

 TFormSettings = class(TForm)
  ChBx_Autoload: TImage;
  ComboBox1: TComboBox;
  ComboBox2: TComboBox;
  Image1: TImage;
  LabelPos: TLabel;
  LabelFontSize: TLabel;
  LabelLNG: TLabel;
  SB_Close: TImage;
  Label1: TLabel;
  LabelAutostart: TLabel;
  Panel1: TPanel;
  procedure ChBx_AutoloadClick(Sender: TObject);
  procedure ComboBox1Change(Sender: TObject);
  procedure ComboBox2Change(Sender: TObject);
  procedure FormCreate(Sender: TObject);
  procedure FormShow(Sender: TObject);
  procedure Image1Click(Sender: TObject);
  procedure Label1MouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Label1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  procedure Label1MouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  procedure Panel1MouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure SB_CloseClick(Sender: TObject);
  procedure SB_CloseMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure SB_CloseMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
 private
  function FC_FormMovie():Integer;
  { private declarations }
 public
  { public declarations }
 end;

var
 FormSettings: TFormSettings;
 old_pos_X, old_pos_Y, old_LEFT, old_TOP,razn_X,razn_Y: integer;
 Form_Settings_pressed,form_Movie:Boolean;

implementation
 uses Unit1, Unit2;
{$R *.lfm}

{ TFormSettings }

procedure TFormSettings.ChBx_AutoloadClick(Sender: TObject);
var
 Ini: TIniFile;
begin
 //Автозагрузка (если не включена)
 Ini := TIniFile.Create(folder_txt+'settings.ini');
 if Unit1.autoload <> 1 then
 begin
   //Включаем
   ChBx_Autoload.Picture := Form1.Img_True.Picture;
   Unit1.autoload := 1;
   Ini.WriteString('System', 'autoload', '1'); //Автозагрузка
   Unit1.Form1.FC_StartWithOS();
 end
 else
 begin
   //Выключаем
   ChBx_Autoload.Picture := Form1.Img_False.Picture;
   Unit1.autoload := 0;
   Ini.WriteString('System', 'autoload', '0'); //Автозагрузка
   Unit1.Form1.FC_NoStartWithOS();
 end;

// Unit1.Form1.LabelObrazec.Font.Size:=18;
 Unit1.Form1.FC_FormStroy();
end;

procedure TFormSettings.ComboBox1Change(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(Unit1.folder_txt+'settings.ini');


  if ComboBox1.Caption = 'Ru' then
  begin
    Unit1.language := 'Ru';
  end
  else
  if ComboBox1.Caption = 'En' then
  begin
    Unit1.language := 'En';
  end;

  Ini.WriteString('System', 'language', Unit1.language);
  Unit1.Form1.FC_Language();
  Unit1.Form1.FormShow(Sender);
  Unit10.FormSettings.FormShow(Sender);
end;

procedure TFormSettings.ComboBox2Change(Sender: TObject);
var
  Ini: TIniFile;
begin
 Ini := TIniFile.Create(Unit1.folder_txt+'settings.ini');
 //Размер шрифта открытого окна
 Form_Open.Memo_Open.Font.Size:=StrToInt(ComboBox2.Caption);
 Unit1.label_size := StrToInt(ComboBox2.Caption);
 Ini.WriteString('System', 'label_size', ComboBox2.Caption); //Размер шрифта
end;

procedure TFormSettings.FormCreate(Sender: TObject);
begin
 //SB_Close.Picture:=FormSettings.SB_Close.Picture;
 SB_Close.Left:=FormSettings.Width-SB_Close.Width-4;
end;

procedure TFormSettings.FormShow(Sender: TObject);
var
 Ini: TIniFile;
begin
  Ini := TIniFile.Create(Unit1.folder_txt+'settings.ini');




  //Автозагрузка------------------------------------------------
  if Unit1.autoload = 1 then
  begin
    ChBx_Autoload.Picture := Unit1.Form1.Img_True.Picture;
  end
  else
  begin
    ChBx_Autoload.Picture := Unit1.Form1.Img_False.Picture;
  end;
  //Язык--------------------------------------------------------
  if Unit1.language = 'Ru' then
  begin
    ComboBox1.Caption:='Ru';
  end;
  if Unit1.language = 'En' then
  begin
    //ComboBox1.ItemIndex:=1;
    ComboBox1.Caption:='En';
  end;

  //Размер шрифта----------------------------------------------------
  ComboBox2.Caption:=IntToStr(Unit1.label_size);

  //Положение--------------------------------------------------------
  if position_show = 'top' then
  begin
    Image1.Picture := Unit1.Form1.ImgPos1.Picture;
  end;
  if position_show = 'bottom' then
  begin
    Image1.Picture := Unit1.Form1.ImgPos2.Picture;
  end;

  FormSettings.Caption:=Unit1.Settings;
  Label1.Caption:=Unit1.Settings;
  LabelAutostart.Caption:=Unit1.autostart;

  LabelLNG.Caption:=Unit1.lng_lng;
  LabelFontSize.Caption:=Unit1.fontSize_l;
  LabelPos.Caption:=Unit1.position_l;


end;

procedure TFormSettings.Image1Click(Sender: TObject);
var
 Ini: TIniFile;
begin
  Ini := TIniFile.Create(Unit1.folder_txt+'settings.ini');
  //Положение
 if Unit1.position_show = 'top' then
 begin
   Unit1.position_show:='bottom';
   Image1.Picture:=Unit1.Form1.ImgPos2.Picture;
 end
 else
 begin
   Unit1.position_show:='top';
   Image1.Picture:=Unit1.Form1.ImgPos1.Picture;
 end;
 Ini.WriteString('System', 'position_show', Unit1.position_show); //Положение
end;

procedure TFormSettings.Label1MouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
   case Button of
  mbLeft:
  begin
   //Позиция формы
   Form_Settings_pressed:=True;
   //Получаем позицию курсора
   old_pos_X := Mouse.CursorPos.x;
   old_pos_Y := Mouse.CursorPos.y;
   //Получаем позицию формы
   old_LEFT := FormSettings.Left;
   old_TOP := FormSettings.Top;
   //////////////////////////////////////
     if(FormSettings.Width<>Screen.Width) OR (FormSettings.Height<>Screen.Height)
     OR (FormSettings.Left<>0) OR (FormSettings.Top<>0) then
     begin
       form_Movie:=True;
     end;
  end;
 end;
end;

procedure TFormSettings.Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
 Y: Integer);
begin
 FC_FormMovie;
end;

procedure TFormSettings.Label1MouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 Form_Settings_pressed:=False;
end;

procedure TFormSettings.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
  case Button of
  mbLeft:
  begin
   //Позиция формы
   Form_Settings_pressed:=True;
   //Получаем позицию курсора
   old_pos_X := Mouse.CursorPos.x;
   old_pos_Y := Mouse.CursorPos.y;
   //Получаем позицию формы
   old_LEFT := FormSettings.Left;
   old_TOP := FormSettings.Top;
   //////////////////////////////////////
     if(FormSettings.Width<>Screen.Width) OR (FormSettings.Height<>Screen.Height)
     OR (FormSettings.Left<>0) OR (FormSettings.Top<>0) then
     begin
       form_Movie:=True;
     end;
  end;
 end;
end;

procedure TFormSettings.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
 Y: Integer);
begin
 FC_FormMovie;
end;

procedure TFormSettings.Panel1MouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 Form_Settings_pressed:=False;
end;

procedure TFormSettings.SB_CloseClick(Sender: TObject);
begin
 FormSettings.Close;
end;

procedure TFormSettings.SB_CloseMouseDown(Sender: TObject;
 Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 SB_Close.Top:=SB_Close.Top+1;
 SB_Close.Height:=SB_Close.Height+1;
end;

procedure TFormSettings.SB_CloseMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 SB_Close.Top:=SB_Close.Top-1;
 SB_Close.Height:=SB_Close.Height-1;
end;

function TFormSettings.FC_FormMovie: Integer;
var
 razn_X,razn_Y,i:integer;
begin
 //Перетаскивание окна по Label
 if (Form_Settings_pressed = Enabled) AND (form_Movie=True)
 AND ((FormSettings.Width<>Screen.Width) OR (FormSettings.Height<>Screen.Height)
 OR (FormSettings.Left<>0) OR (FormSettings.Top<>0))
 then
 begin
 razn_X := Mouse.CursorPos.x - old_pos_X;
 razn_Y := Mouse.CursorPos.y - old_pos_Y;
 FormSettings.Left := old_LEFT + razn_X;
 FormSettings.Top := old_TOP + razn_Y;
 end;


end;

end.

