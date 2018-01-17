unit Unit5;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
 StdCtrls, Types;

type

 { TForm_Tabs }

 TForm_Tabs = class(TForm)
  Edit_NewTab: TEdit;
  Label_Clear: TLabel;
  SB_No: TImage;
  SB_Yes: TImage;
  Label_del: TLabel;
  SB_add_tab: TImage;
  SB_Del: TImage;
  SB_Top: TImage;
  SB_Down: TImage;
  SB_clear: TImage;
  LabelObrazec: TLabel;
  Memo_DinTab: TMemo;
  SB_Close_TBS: TImage;
  Label_Caption: TLabel;
  Panel_Top: TPanel;
  Panel_Down: TPanel;
  Panel_all: TPanel;
  procedure But_DelClick(Sender: TObject);
  procedure Edit_NewTabChange(Sender: TObject);
  procedure Edit_NewTabKeyPress(Sender: TObject; var Key: char);
  procedure Edit_NewTabMouseEnter(Sender: TObject);
  procedure Edit_NewTabMouseLeave(Sender: TObject);
  procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
  procedure FormCreate(Sender: TObject);
  procedure FormShow(Sender: TObject);
  procedure Label_CaptionMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Label_CaptionMouseMove(Sender: TObject; Shift: TShiftState; X,
   Y: Integer);
  procedure Label_CaptionMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Panel_TopMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Panel_TopMouseMove(Sender: TObject; Shift: TShiftState; X,
   Y: Integer);
  procedure Panel_TopMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure SB_add_tabClick(Sender: TObject);
  procedure SB_clearClick(Sender: TObject);
  procedure SB_clearMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure SB_clearMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure SB_add_tabMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Panel_allMouseWheelDown(Sender: TObject; Shift: TShiftState;
   MousePos: TPoint; var Handled: Boolean);
  procedure Panel_allMouseWheelUp(Sender: TObject; Shift: TShiftState;
   MousePos: TPoint; var Handled: Boolean);
  procedure SB_add_tabMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure SB_Close_TBSClick(Sender: TObject);
  procedure SB_Close_TBSMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure SB_Close_TBSMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure SB_DelClick(Sender: TObject);
  procedure SB_DelMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure SB_DelMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure SB_DownClick(Sender: TObject);
  procedure SB_DownMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure SB_DownMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure SB_NoClick(Sender: TObject);
  procedure SB_NoMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure SB_NoMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure SB_TopMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure SB_TopMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure LabelTABS_Click(Sender: TObject);
  procedure LabelTABS_Leave(Sender: TObject);
  procedure LabelTABS_MM(Sender: TObject);
  procedure SB_YesClick(Sender: TObject);
  procedure SB_YesMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure SB_YesMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
 private
  { private declarations }
 public
  { public declarations }
  function FC_TABSStroy():Integer;
  function FC_ClearTab():Integer;
  function FC_DelTab():Integer;
  function FC_Hide_YesNo():Integer;
 end;

var
 Form_Tabs: TForm_Tabs;
 ImageTabs:TImage;
 LabelTABS:TLabel;
 Selected_tab:string;
 Form_Tabs_pressed:Boolean;
 old_pos_X,old_pos_Y,old_LEFT,old_TOP, TBS_Count, TBS_nom:integer;

implementation
uses Unit1, Unit7;

{$R *.lfm}

{ TForm_Tabs }

const
{$IFDEF UNIX}
   EndString = #$0A;
{$ENDIF}
{$IFDEF WINDOWs}
     EndString = #$0D#$0A;
{$ENDIF}


function TForm_Tabs.FC_TABSStroy: Integer;
var
 i,rast:integer;
 FC:TComponent;
begin
 //Показываем Диспетчер вкладок
 Panel_Top.Show;
 Panel_Down.Show;
 //_Грузим список вкладок
 Memo_DinTab.Lines.LoadFromFile(folder_txt+'tabs.ksm');
 rast := 1;

 //Строим
 for i:=1 to (Memo_DinTab.Lines.Count-1) do
 begin
  //----------------------------------Строим Блоки (img)----------------------//
    FC:=Panel_all.FindComponent('ImgTAB'+Memo_DinTab.Lines[i]);
    FreeAndNil(FC);

  ImageTabs := TImage.Create(Panel_all);
  ImageTabs.Parent := Panel_all;
  ImageTabs.Left := 1;
  ImageTabs.Height := LabelObrazec.Height+2;
  ImageTabs.Top := rast+(i-1)*(ImageTabs.Height+rast);//5+i*30+i*2;
  ImageTabs.Constraints.MinWidth := 278-61;
  //ImageTabs.Constraints.MinHeight:=30;
  ImageTabs.Constraints.MaxWidth := 278-61;
 // ImageTabs.Constraints.MaxHeight:=30;

  ImageTabs.Name:= 'ImgTAB'+Memo_DinTab.Lines[i];
  //Showmessage('ImgTAB'+Memo_DinTab.Lines[i]);
  //Если вкладка не выделена
  Unit1.Form1.FC_ActVars();
  Selected_tab := Unit1.act_tab;
  if Unit1.act_tab <> Memo_DinTab.Lines[i] then
  begin
    ImageTabs.Picture:=Unit1.Form1.zapas_tab1.Picture;//.Bitmap.LoadFromFile('img/skin1/tab-1.bmp');
  end
  else
  begin
    ImageTabs.Picture:=Unit1.Form1.zapas_tab3.Picture;//.Bitmap.LoadFromFile('img/skin1/blok-sel-1.bmp');
    TBS_nom:=i;
  end;

  ImageTabs.Stretch:=True;
  ImageTabs.Transparent:=True;
  ImageTabs.BringToFront;

  //----------------------------------Строим вкладки (label)--------------------//
  FC:=Panel_all.FindComponent(Memo_DinTab.Lines[i]);
  FreeAndNil(FC);
    LabelTABS:=TLabel.Create(Panel_all);
    LabelTABS.Parent:=Panel_all;
    LabelTABS.Left:=ImageTabs.Left+4;
    LabelTABS.Top:=ImageTabs.Top;//BlokTop;//35+VisVklCount*30+VisVklCount*2-30+1;

    LabelTABS.Constraints.MinWidth:=ImageTabs.Width-4;
    LabelTABS.Font.Size:=LabelObrazec.Font.Size;

    LabelTABS.Font.Style:=LabelObrazec.Font.Style;

    //Запишем номер строки в тэг
    LabelTABS.Tag:=i;
    TBS_Count := i;

    //Если вкладка не выделена

    if Unit1.act_tab <> Memo_DinTab.Lines[i] then
    begin
      LabelTABS.Font.Color:=LabelObrazec.Font.Color;
    end
    else
    begin
      //LabelTABS.Font.Color:=$00FCFCFC; //Белый
      //LabelTABS.Font.Style:=[fsBold];
    end;

    LabelTABS.Name:= Memo_DinTab.Lines[i];
    Unit1.Form1.Memo_E.Lines.LoadFromFile(folder_txt+Memo_DinTab.Lines[i]+'/index.ksm');
    LabelTABS.Caption := Form1.Memo_E.Lines[0];

    LabelTABS.Transparent:=True;
    LabelTABS.Constraints.MaxHeight:=LabelObrazec.Height;
    LabelTABS.Constraints.MaxWidth:=ImageTabs.Width-4;
    LabelTABS.Constraints.MinHeight:=LabelObrazec.Height+4;
    LabelTABS.WordWrap:=True;

    Panel_all.Height:=LabelTABS.Top+LabelTABS.Height;


    //События по Label
    LabelTABS.OnMouseLeave:=@LabelTABS_Leave;
    LabelTABS.OnMouseEnter:=@LabelTABS_MM;
    LabelTABS.OnClick:=@LabelTABS_Click;
    //LabelTABS.Font.Style:=[fsbold];
    //LabelTABS.OnDblClick:=@LabelTABS_DbClick;
    //
 end;
 Form_Tabs.Height:=Panel_Top.Height+Panel_all.Height+Panel_Down.Height;//+rast;
 Panel_all.Top:=Panel_Top.Height;

 //Положение кнопок перемещения вкладки ВНИЗ
 if TBS_nom < TBS_Count then
 begin
   SB_Down.Picture:=Unit1.Form1.zapas_down2.Picture;
   SB_Down.Enabled:=True;
 end
 else
 begin
   SB_Down.Picture:=Unit1.Form1.zapaz_down1.Picture;
   SB_Down.Enabled:=False;
 end;
 //Положение кнопок перемещения вкладки ВВЕРХ
 if TBS_nom > 1 then
 begin
   SB_Top.Picture:=Unit1.Form1.zapas_top2.Picture;
   SB_Top.Enabled:=True;
 end
 else
 begin
   SB_Top.Picture:=Unit1.Form1.zapas_top1.Picture;
   SB_Top.Enabled:=False;
 end;

 //Убрать кнопки подтверждения удаления/очистки вкладки
  FC_Hide_YesNo;
 //Label_Caption.Caption:=IntToStr(TBS_nom) + '__' + IntToStr(TBS_Count);
end;

function TForm_Tabs.FC_ClearTab: Integer;
var
   i:integer;
   del_ok:boolean;
   FC:TComponent;
begin
  //Очистка вкладки---------------------------------------------------
  Unit1.Form1.FC_ActVars();

  Memo_DinTab.Lines.LoadFromFile(folder_txt+'' + Unit1.act_tab + '/index.ksm');
  //Удаляем все блоки вкладки
  for i:=1 to Memo_DinTab.Lines.Count-1 do
  begin
     //Удаляем блоки в программе
     FC:=Form1.FindComponent('Imgbl'+Memo_DinTab.Lines[i]);
     FreeAndNil(FC);
     FC:=Form1.FindComponent(Memo_DinTab.Lines[i]);
     FreeAndNil(FC);
     FC:=Form1.FindComponent('ImgZam'+Memo_DinTab.Lines[i]);
     FreeAndNil(FC);
     FC:=Form1.FindComponent('ImgCop'+Memo_DinTab.Lines[i]);
     FreeAndNil(FC);
     //Удаляем файл блока
    DeleteFile(folder_txt+'' + Unit1.act_tab + '/' + Memo_DinTab.Lines[i] + '.sm');
  end;
  Memo_DinTab.Text:=Memo_DinTab.Lines[0];
  Memo_DinTab.Lines.SaveToFile(folder_txt+'' + Unit1.act_tab + '/' + 'index.ksm');
  //Строим форму заново
  Unit1.Form1.FC_FormStroy();
  FC_TABSStroy;
end;

function TForm_Tabs.FC_DelTab: Integer;
var
   i:integer;
   del_ok:boolean;
   FC:Tcomponent;
begin
 //Удаление вкладки вкладки
 Label_del.Visible := False;
 Panel_Down.Height := Panel_Down.Height - 30;
 Form_Tabs.Height := Form_Tabs.Height - 30;
 ///LabelTABS
 Unit1.Form1.FC_ActVars();

 Memo_DinTab.Lines.LoadFromFile(folder_txt+'' + Unit1.act_tab + '/index.ksm');
 //Удаляем все блоки вкладки
 for i:=1 to Memo_DinTab.Lines.Count-1 do
 begin
    //Showmessage(folder_txt+'' + Unit1.act_tab + '/' + Memo_DinTab.Lines[i]);
   DeleteFile(folder_txt+'' + Unit1.act_tab + '/' + Memo_DinTab.Lines[i] + '.sm');
   FC:=Form1.FindComponent('Imgbl'+Memo_DinTab.Lines[i]);
   FreeAndNil(FC);
   FC:=Form1.FindComponent(Memo_DinTab.Lines[i]);
   FreeAndNil(FC);
   FC:=Form1.FindComponent('ImgZam'+Memo_DinTab.Lines[i]);
   FreeAndNil(FC);
   FC:=Form1.FindComponent('ImgCop'+Memo_DinTab.Lines[i]);
   FreeAndNil(FC);
 end;
 DeleteFile(folder_txt+'' + Unit1.act_tab + '/' + 'index.ksm');

 //Удаляем из списака вкладок
 //Если удаляемая вкладка - не первая в списке
 Memo_DinTab.Lines.LoadFromFile(folder_txt+'tabs.ksm');
 FC := Panel_all.FindComponent(Selected_tab);
 //Если удаляемая вкладка не первая
 if ((FC as TLabel).Tag > 1) then
 begin
  ////Делаем предыдущую главный
  Memo_DinTab.Lines[0] := Memo_DinTab.Lines[(FC as TLabel).Tag-1];
 end
 else
 begin
   //Если первая
   //_Если их больше, чем одна
   if (Memo_DinTab.Lines.Count-1 > 2) then
   begin
     ////Делаем слудующую главный
     Memo_DinTab.Lines[0] := Memo_DinTab.Lines[(FC as TLabel).Tag+1];
   end
   else
   begin
     //Удаляем все
     Memo_DinTab.Clear;
     Memo_DinTab.Lines.SaveToFile(folder_txt+'tabs.ksm');
   end;
 end;

 //Если удалили НЕ последнюю вкладку
 if Memo_DinTab.Lines.Count > 1 then
 begin
   //Удаляем вкладку в списке
   Memo_DinTab.Lines.Delete((FC as TLabel).Tag);
 end;

  //Удаляем вкалдки в проге
    FC:=Panel_all.FindComponent('ImgTAB'+Unit1.act_tab);
    FreeAndNil(FC);
    FC:=Panel_all.FindComponent(Unit1.act_tab);
    FreeAndNil(FC);
  //Сохраняем список кладок
  Memo_DinTab.Lines.SaveToFile(folder_txt+'tabs.ksm');


 Unit1.Form1.FC_FormStroy();
 FC_TABSStroy;
end;

function TForm_Tabs.FC_Hide_YesNo: Integer;
begin
  if Label_Clear.Visible then
 begin
   Label_Clear.Visible:=False;
   Panel_Down.Height := 30;
   Form_Tabs.Height := Form_Tabs.Height - 30;
 end;
  if Label_del.Visible then
 begin
   Label_del.Visible:=False;
   Panel_Down.Height := 30;
   Form_Tabs.Height := Form_Tabs.Height - 30;
 end;
end;

procedure TForm_Tabs.SB_Close_TBSClick(Sender: TObject);
begin
 Form_Tabs.Close;
end;

procedure TForm_Tabs.Edit_NewTabMouseEnter(Sender: TObject);
begin
 //Мышка над Edit_NewTab
 if Trim(Edit_NewTab.Text) = Unit1.NewTab then
 begin
   Edit_NewTab.Text := '';
   Edit_NewTab.Font.Color:=$000;
 end;
end;

procedure TForm_Tabs.But_DelClick(Sender: TObject);
begin
 Panel_all.Top:=Panel_all.Top-1;
end;

procedure TForm_Tabs.Edit_NewTabChange(Sender: TObject);
begin
 if Trim(Edit_NewTab.Text) <> Unit1.NewTab then
 begin
   //Если имя вкладки не равно 'Новая вкладка
   Edit_NewTab.Font.Color:=$000;
 end;

 if Trim(Edit_NewTab.Text) = '' then
 begin
   //Если имя вкладки пустое
   //Edit_NewTab.Text:='Новая вкладка';
   //Edit_NewTab.Font.Color:=$00CAB399;
 end;
end;

procedure TForm_Tabs.Edit_NewTabKeyPress(Sender: TObject; var Key: char);
begin
 //Нажали клавишу в имени вкладки
 if Trim(Edit_NewTab.Text) = Unit1.NewTab then
 begin
   Edit_NewTab.Clear;
 end;
end;

procedure TForm_Tabs.Edit_NewTabMouseLeave(Sender: TObject);
begin
 //Убрали мышку с Edit_NewTab
 if Trim(Edit_NewTab.Text) = '' then
 begin
   Edit_NewTab.Text := Unit1.NewTab;
   Edit_NewTab.Font.Color:=$00CAB399;
 end;
end;

procedure TForm_Tabs.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  //Если это не попап
 if Panel_Down.Visible = True then
 begin

   //Кнопка стоп
   //Unit1.Form1.SB_Stop.Tag:=0;
   //Unit1.Form1.SB_Stop.Picture:=Unit1.Form1.Zapas_Sb_Stop1.Picture;
 end;
end;

procedure TForm_Tabs.FormCreate(Sender: TObject);
begin
 Form_Tabs.Constraints.MaxHeight:=Screen.Height;
end;

procedure TForm_Tabs.FormShow(Sender: TObject);
begin
  Form_Tabs.Caption:=Unit1.TabsManager;
  Label_Caption.Caption:=Unit1.TabsManager;
  Label_del.Caption:=Unit1.Del;
  Label_Clear.Caption:=Unit1.Clear;
  Edit_NewTab.Caption:=Unit1.NewTab;

end;

procedure TForm_Tabs.Label_CaptionMouseDown(Sender: TObject;
 Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   //Позиция формы
  Form_Tabs_pressed:=True;
 //Получаем позицию курсора
 old_pos_X := Mouse.CursorPos.x;
 old_pos_Y := Mouse.CursorPos.y;
 //Получаем позицию формы
 old_LEFT := Form_Tabs.Left;
 old_TOP := Form_Tabs.Top;
 //Следим за позицией и перемещаем
 //Timer_Position.Enabled:=True;
 Form_Tabs.AlphaBlend:=True;
end;

procedure TForm_Tabs.Label_CaptionMouseMove(Sender: TObject;
 Shift: TShiftState; X, Y: Integer);
var
 razn_X,razn_Y,i:integer;
begin
 //Перетаскивание окна по Label
 if Form_Tabs_pressed = Enabled then
 begin
  razn_X := Mouse.CursorPos.x - old_pos_X;
 razn_Y := Mouse.CursorPos.y - old_pos_Y;
 Form_Tabs.Left := old_LEFT + razn_X;
 Form_Tabs.Top := old_TOP + razn_Y;
 end;

end;

procedure TForm_Tabs.Label_CaptionMouseUp(Sender: TObject;
 Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 Form_Tabs_pressed:=False;
 Form_Tabs.AlphaBlend:=False;
end;

procedure TForm_Tabs.Panel_TopMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
  //Позиция формы
  Form_Tabs_pressed:=True;
 //Получаем позицию курсора
 old_pos_X := Mouse.CursorPos.x;
 old_pos_Y := Mouse.CursorPos.y;
 //Получаем позицию формы
 old_LEFT := Form_Tabs.Left;
 old_TOP := Form_Tabs.Top;
 //Следим за позицией и перемещаем
 Form_Tabs.AlphaBlend:=True;
end;

procedure TForm_Tabs.Panel_TopMouseMove(Sender: TObject; Shift: TShiftState; X,
 Y: Integer);
var
 razn_X,razn_Y,i:integer;
begin
 //Перетаскивание окна по Label
 if Form_Tabs_pressed = Enabled then
 begin
  razn_X := Mouse.CursorPos.x - old_pos_X;
 razn_Y := Mouse.CursorPos.y - old_pos_Y;
 Form_Tabs.Left := old_LEFT + razn_X;
 Form_Tabs.Top := old_TOP + razn_Y;
 end;


end;

procedure TForm_Tabs.Panel_TopMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 Form_Tabs_pressed:=False;
 Form_Tabs.AlphaBlend:=False;
end;

procedure TForm_Tabs.SB_add_tabClick(Sender: TObject);
var
 added:boolean;
 i:integer;
 FC:TComponent;
begin
 //Создание и добавление новой вкладки
  FC_Hide_YesNo;
 //Сначала удаляем блоки старой вкладки
 Form1.FC_ActVars();
 Memo_DinTab.Lines.LoadFromFile(folder_txt+'' + Unit1.act_tab + '/index.ksm');
 for i:=1 to Memo_DinTab.Lines.Count-1 do
 begin
    //-------------------------------------------------
    FC := Form1.FindComponent(Memo_DinTab.Lines[i]);
    FreeAndNil(FC);
    FC := Form1.FindComponent('Imgbl'+Memo_DinTab.Lines[i]);
    FreeAndNil(FC);
     FC := Form1.FindComponent('ImgZam'+Memo_DinTab.Lines[i]);
    FreeAndNil(FC);
     FC := Form1.FindComponent('ImgCop'+Memo_DinTab.Lines[i]);
    FreeAndNil(FC);
 end;

 Memo_DinTab.Lines.LoadFromFile(folder_txt+'tabs.ksm');
 Memo_DinTab.Lines.Delete(0);
 added := False;
 i := 1;
 while added <> true do
 begin
    //Если такой вкладки нет
    if Pos('tab' + IntToStr(i) + EndString,Memo_DinTab.Text) < 1 then
    begin
      //Добавляем и сохраняем новую вкладку
      Memo_DinTab.Lines.Add('tab' + IntToStr(i));
      Memo_DinTab.Lines.Insert(0,'tab' + IntToStr(i));
      Memo_DinTab.Lines.SaveToFile(folder_txt+'tabs.ksm');
      //Добавляем папку вкладки
      CreateDir(folder_txt+'tab' + IntToStr(i));
      //Добавлям файл index.ksm вкладки с её именем
      Memo_DinTab.Lines.Clear;
      Memo_DinTab.Lines.Add(Edit_NewTab.Text);
      Memo_DinTab.Lines.SaveToFile(folder_txt+'tab' + IntToStr(i) + '/index.ksm');
      //Выход из цикла
      added := True;
    end;
    i:=i+1;
 end;

 Edit_NewTab.Clear;
 Form1.FC_FormStroy();
 FC_TABSStroy;
end;

procedure TForm_Tabs.SB_clearClick(Sender: TObject);
begin
   //Перед ОЧИСТКОЙ вкладки щелчек
 if Label_del.Visible then
 begin
   SB_delClick(Sender);
 end;
 //
 if Label_Clear.Visible then
 begin
   Label_Clear.Visible:=False;
   Panel_Down.Height := 30;
   Form_Tabs.Height := Form_Tabs.Height - 30;
 end
 else
 begin
   Label_Clear.Visible:=True;
   Panel_Down.Height := 60;
   Form_Tabs.Height := Form_Tabs.Height + 30;
 end;
end;

procedure TForm_Tabs.SB_clearMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 SB_clear.Top := SB_clear.Top+1;
 SB_clear.Left := SB_clear.Left+1;
end;

procedure TForm_Tabs.SB_clearMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 SB_clear.Top := SB_clear.Top-1;
 SB_clear.Left := SB_clear.Left-1;
end;

procedure TForm_Tabs.SB_add_tabMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 SB_add_tab.Top := SB_add_tab.Top+1;
 SB_add_tab.Left := SB_add_tab.Left+1;
end;

procedure TForm_Tabs.Panel_allMouseWheelDown(Sender: TObject;
 Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  //Скролинг вкладок колесиком вниз
 if (Panel_All.Top+Panel_All.Height) > Panel_Down.Top then
 begin
   //Если низ основной панели ниже нижней панели
   if ((Panel_All.Top+Panel_All.Height) - Panel_Down.Top) > 10 then
   begin
     //Если разница больше 10
     Panel_All.Top := Panel_All.Top - 10;
   end
   else
   begin
      //Если разница меньше 10
      Panel_All.Top := Panel_All.Top - ((Panel_All.Top+Panel_All.Height) - Panel_Down.Top)
   end;
 end;
end;

procedure TForm_Tabs.Panel_allMouseWheelUp(Sender: TObject; Shift: TShiftState;
 MousePos: TPoint; var Handled: Boolean);
begin
 //Скролинг вкладок колесиком ВВЕРХ
 //
 //Если верх основной панели выше верхней панели
if Panel_All.Top < (Panel_Top.Top + Panel_Top.Height) then
begin
  //ShowMessage(IntToStr(Panel_All.Top));

   //ShowMessage(IntToStr(Panel_Top.Top + Panel_Top.Height));
  if ((Panel_Top.Top + Panel_Top.Height) - Panel_All.Top) > 10 then
  begin
    //Если разница больше 10
    Panel_All.Top := Panel_All.Top + 10;

  end
  else
  begin
     //Если разница меньше 10
     Panel_All.Top := Panel_Top.Top + Panel_Top.Height;
  end;
end;
end;

procedure TForm_Tabs.SB_add_tabMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 //Щелчек по кнопке
 SB_add_tab.Top := SB_add_tab.Top-1;
 SB_add_tab.Left := SB_add_tab.Left-1;
end;

procedure TForm_Tabs.SB_Close_TBSMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
//Щелчек по кнопке
 SB_Close_TBS.Top := SB_Close_TBS.Top+1;
 SB_Close_TBS.Left := SB_Close_TBS.Left+1;
end;

procedure TForm_Tabs.SB_Close_TBSMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
//Щелчек по кнопке
 SB_Close_TBS.Top := SB_Close_TBS.Top-1;
 SB_Close_TBS.Left := SB_Close_TBS.Left-1;
end;

procedure TForm_Tabs.SB_DelClick(Sender: TObject);
begin
  //Перед удалением вкладки щелчек

 if Label_Clear.Visible then
 begin
   SB_clearClick(Sender);
 end;
 //
 if Label_del.Visible then
 begin
   Label_del.Visible:=False;
   Panel_Down.Height := 30;
   Form_Tabs.Height := Form_Tabs.Height - 30;
 end
 else
 begin
   Label_del.Visible:=True;
   Panel_Down.Height := 60;
   Form_Tabs.Height := Form_Tabs.Height + 30;
 end;
end;

procedure TForm_Tabs.SB_DelMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
//Щелчек по кнопке
 SB_Del.Top := SB_Del.Top+1;
 SB_Del.Left := SB_Del.Left+1;
end;

procedure TForm_Tabs.SB_DelMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
//Щелчек по кнопке
 SB_Del.Top := SB_Del.Top-1;
 SB_Del.Left := SB_Del.Left-1;
end;

procedure TForm_Tabs.SB_DownClick(Sender: TObject);
begin
  //Перемещение вкладки вверх
   //Label_Caption.Caption:=IntToStr(TBS_nom) + '__' + IntToStr(TBS_Count);
   if TBS_nom < TBS_Count then
   begin
     Memo_DinTab.Lines.LoadFromFile(folder_txt+'tabs.ksm');
     Memo_DinTab.Lines.Move(TBS_nom,TBS_nom+1);
     Memo_DinTab.Lines.SaveToFile(folder_txt+'tabs.ksm');
     FC_TABSStroy;
   end;
end;

procedure TForm_Tabs.SB_DownMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
//Щелчек по кнопке
 SB_Down.Top := SB_Down.Top+1;
 SB_Down.Left := SB_Down.Left+1;
end;

procedure TForm_Tabs.SB_DownMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
//Щелчек по кнопке
 SB_Down.Top := SB_Down.Top-1;
 SB_Down.Left := SB_Down.Left-1;
end;

procedure TForm_Tabs.SB_NoClick(Sender: TObject);
begin
 //Отмена удаления вкладк
 Label_del.Visible := False;
 Label_Clear.Visible:=False;
 Panel_Down.Height := 30;
 Form_Tabs.Height := Form_Tabs.Height - 30;
end;

procedure TForm_Tabs.SB_NoMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 SB_No.Top := SB_No.Top+1;
 SB_No.Left := SB_No.Left+1;
end;

procedure TForm_Tabs.SB_NoMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 SB_No.Top := SB_No.Top-1;
 SB_No.Left := SB_No.Left-1;
end;

procedure TForm_Tabs.SB_TopMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
//Щелчек по кнопке
 SB_Top.Top := SB_Top.Top+1;
 SB_Top.Left := SB_Top.Left+1;

  //Перемещение вкладки вверх
   if TBS_nom > 1 then
   begin
     Memo_DinTab.Lines.LoadFromFile(folder_txt+'tabs.ksm');
     Memo_DinTab.Lines.Move(TBS_nom,TBS_nom-1);
     Memo_DinTab.Lines.SaveToFile(folder_txt+'tabs.ksm');
     FC_TABSStroy;
   end;
end;

procedure TForm_Tabs.SB_TopMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
//Щелчек по кнопке
 SB_Top.Top := SB_Top.Top-1;
 SB_Top.Left := SB_Top.Left-1;
end;

procedure TForm_Tabs.LabelTABS_Click(Sender: TObject);
var
FC:TComponent;
i:integer;
begin
  //Щелчек по вкладке_________________________________________________________
  //Появление формы добавления нового блока
 Form_NoClose := 5;
  Unit1.Form1.FC_HideForms; 
 Form_NoClose := 0;
 //Нес крывать главную форму секунду
 NoHdeOneSecond := True;
 Unit1.Form1.NoHide1Sec.Enabled:=True;
 //Скрываем на всякий случай кнопки ДаНет
  FC_Hide_YesNo;
  //Сначала удаляем блоки старой вкладки
  Form1.FC_ActVars();
  Memo_DinTab.Lines.LoadFromFile(folder_txt+'' + Unit1.act_tab + '/index.ksm');
  for i:=1 to Memo_DinTab.Lines.Count-1 do
  begin
     //-------------------------------------------------
     FC := Form1.FindComponent(Memo_DinTab.Lines[i]);
     FreeAndNil(FC);
     FC := Form1.FindComponent('Imgbl'+Memo_DinTab.Lines[i]);
     FreeAndNil(FC);
      FC := Form1.FindComponent('ImgZam'+Memo_DinTab.Lines[i]);
     FreeAndNil(FC);
      FC := Form1.FindComponent('ImgCop'+Memo_DinTab.Lines[i]);
     FreeAndNil(FC);
  end;

  //Красим форму
  Selected_tab := (Sender as TLabel).Name;
  TBS_nom:=(Sender as TLabel).Tag;
  FC := Panel_all.FindComponent('ImgTAB' + Selected_tab);
  (FC as TImage).Picture:=Unit1.Form1.zapas_tab3.Picture;//.Bitmap.LoadFromFile( 'img/skin1/blok-Sel-1.bmp');

  //Сохраняем новую активную вкладку
  Memo_DinTab.Lines.LoadFromFile(folder_txt+'tabs.ksm');
    //Убираем выделение
    FC := Panel_all.FindComponent('ImgTAB' + Memo_DinTab.Lines[0]);
    (FC as TImage).Picture:=Unit1.Form1.zapas_tab1.Picture;//.Bitmap.LoadFromFile( 'img/skin1/tab-1.bmp');
    FC := Panel_all.FindComponent(Memo_DinTab.Lines[0]);
    //(FC as TLabel).Font.Color:=$00454545;  //Белый
    //Выделяем новую
    FC := Panel_all.FindComponent('ImgTAB' + (Sender as TLabel).Name);
    (FC as TImage).Picture:=Unit1.Form1.zapas_tab3.Picture;//.Bitmap.LoadFromFile( 'img/skin1/blok-sel-1.bmp');
    //(Sender as TLabel).Font.Color:=$00FCFCFC;  //Белый
  Memo_DinTab.Lines[0]:=(Sender as TLabel).Name;
  Memo_DinTab.Lines.SaveToFile(folder_txt+'tabs.ksm');
  //Строим форму
  Unit1.Form1.FC_FormStroy();
  if Panel_Top.Visible = False then
  begin
    //Если диспетчер вкладок - ПОПАП
    Form_Tabs.Close;
  end;
end;

procedure TForm_Tabs.LabelTABS_Leave(Sender: TObject);
var
FC:TComponent;
begin
//Смена вида вкладки при наведении
 FC:=Panel_all.FindComponent('ImgTAB'+(Sender as TLabel).Name);
 //Если не активна
 if Selected_tab <> (Sender as TLabel).Name then
 begin
  (FC as TImage).Picture:=Unit1.Form1.zapas_tab1.Picture;//.Bitmap.LoadFromFile( 'img/skin1/tab-1.bmp');
  (Sender as TLabel).Font.Color:=$00454545; //Темный
 end
 else
 begin
    (FC as TImage).Picture:=Unit1.Form1.zapas_tab3.Picture;//.Bitmap.LoadFromFile( 'img/skin1/blok-sel-1.bmp');
    //(Sender as TLabel).Font.Color:=$00454545;  //Белый
 end;

end;

procedure TForm_Tabs.LabelTABS_MM(Sender: TObject);
var
FC:TComponent;
begin
//Смена вида вкладки при наведении
   FC:=Panel_all.FindComponent('ImgTAB'+(Sender as TLabel).Name);
   //Если не активна
   if Selected_tab <> (Sender as TLabel).Name then
   begin
  (FC as TImage).Picture:=Unit1.Form1.zapas_tab2.Picture;//.Bitmap.LoadFromFile( 'img/skin1/tab-2.bmp');
   end
   else
   begin
      //(FC as TImage).Picture.Bitmap.LoadFromFile( 'img/skin1/blok-sel-2.bmp');
   end;
   //          Memo_DinTab.Lines.LoadFromFile(folder_txt+'tabs.ksm');
   //Label_Caption.Caption:=IntToStr(TBS_nom) + '__' + IntToStr(TBS_Count);
end;

procedure TForm_Tabs.SB_YesClick(Sender: TObject);
begin
  //Удаляем вкладку
  if Label_del.Visible then
  begin
    FC_DelTab;
  end;
  //Очищаем вкладку
  if Label_Clear.Visible then
  begin
    FC_ClearTab;
  end;
  Panel_Down.Height:=30;
  Label_del.Visible := False;
  Label_Clear.Visible := False;
end;

procedure TForm_Tabs.SB_YesMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 //Щелчек по кнопке
 SB_Yes.Top := SB_Yes.Top+1;
 SB_Yes.Left := SB_Yes.Left+1;
end;

procedure TForm_Tabs.SB_YesMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 SB_Yes.Top := SB_Yes.Top-1;
 SB_Yes.Left := SB_Yes.Left-1;
end;

end.

