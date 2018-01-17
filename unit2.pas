unit Unit2;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
 StdCtrls;

type

 { TForm_Open }

 TForm_Open = class(TForm)
  Edit_Name_Bc: TEdit;
  Img_Top: TImage;
  Img_Left: TImage;
  Img_Bottom: TImage;
  Img_Right: TImage;
  Img_Btns: TImage;
  Img_Panel_Top: TImage;
  Label_Name_Tab: TLabel;
  Panel_Btns: TPanel;
  Memo_Open: TMemo;
  Panel_Top: TPanel;
  SB_Close: TImage;
  Timer_Position: TTimer;

  procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
  procedure FormCreate(Sender: TObject);
  procedure FormResize(Sender: TObject);
  procedure FormShow(Sender: TObject);
  procedure Img_BottomMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Img_BottomMouseMove(Sender: TObject; Shift: TShiftState; X,
   Y: Integer);
  procedure Img_BottomMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Img_BtnsDblClick(Sender: TObject);
  procedure Img_BtnsMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Img_BtnsMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
   );
  procedure Img_BtnsMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Img_LeftMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Img_LeftMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
   );
  procedure Img_LeftMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Img_Panel_TopDblClick(Sender: TObject);
  procedure Img_Panel_TopMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Img_Panel_TopMouseMove(Sender: TObject; Shift: TShiftState; X,
   Y: Integer);
  procedure Img_Panel_TopMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Img_RightMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Img_RightMouseMove(Sender: TObject; Shift: TShiftState; X,
   Y: Integer);
  procedure Img_RightMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Img_TopMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Img_TopMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
   );
  procedure Img_TopMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Label_Name_TabDblClick(Sender: TObject);
  procedure Label_Name_TabMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Label_Name_TabMouseMove(Sender: TObject; Shift: TShiftState; X,
   Y: Integer);
  procedure Label_Name_TabMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Panel_TopDblClick(Sender: TObject);
  procedure SB_CloseClick(Sender: TObject);
  procedure SB_CloseMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure SB_CloseMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Timer_PositionTimer(Sender: TObject);
 private
  { private declarations }

 public
  { public declarations }
   function FC_Modif_Bc_or_NO():Integer;
   function FC_WhoPsessResize(FC:TImage):Integer;
   function FC_Resize():Integer;
   function FC_ForDbClick():Integer;
   function FC_FormMovie():Integer;

 end;

var
 Form_Open: TForm_Open;
 Var_OpenBc,Var_OpenBc_OLD: String;
 old_pos_X, old_pos_Y, old_LEFT, old_TOP: integer;
 Form_Width_Old,Form_Height_Old:Integer;
 Form_Open_pressed,ResizeFO_pressed: boolean;
 pressed_L,pressed_R,pressed_T,pressed_B:Boolean;
 form_Movie:Boolean;
 for_DbLc_W,for_DbLc_H,for_DbLc_L,for_DbLc_T:Integer;


implementation
uses Unit1, Unit3;

{$R *.lfm}

{ TForm_Open }

procedure TForm_Open.Img_Panel_TopDblClick(Sender: TObject);
begin
  FC_ForDbClick;
end;

procedure TForm_Open.Img_Panel_TopMouseDown(Sender: TObject;
 Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 case Button of
  mbLeft:
  begin
   //Позиция формы
   Form_Open_pressed:=True;
   //Получаем позицию курсора
   old_pos_X := Mouse.CursorPos.x;
   old_pos_Y := Mouse.CursorPos.y;
   //Получаем позицию формы
   old_LEFT := Form_Open.Left;
   old_TOP := Form_Open.Top;
   //////////////////////////////////////
     if(Form_Open.Width<>Screen.Width) OR (Form_Open.Height<>Screen.Height)
     OR (Form_Open.Left<>0) OR (Form_Open.Top<>0) then
     begin
       form_Movie:=True;
     end;
  end;
 end;

end;

procedure TForm_Open.Img_Panel_TopMouseMove(Sender: TObject;
 Shift: TShiftState; X, Y: Integer);
begin
 FC_FormMovie;
end;

procedure TForm_Open.Img_Panel_TopMouseUp(Sender: TObject;
 Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 Form_Open_pressed := False;
end;

procedure TForm_Open.Img_RightMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 ResizeFO_pressed:=True;
 //Получаем позицию курсора
 old_pos_X := Mouse.CursorPos.x;
 old_pos_Y := Mouse.CursorPos.y;
 Form_Height_Old := Form_Open.Height;
 Form_Width_Old := Form_Open.Width;
end;

procedure TForm_Open.Img_RightMouseMove(Sender: TObject; Shift: TShiftState; X,
 Y: Integer);
begin
 FC_WhoPsessResize(Sender as TImage);
end;

procedure TForm_Open.Img_RightMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 ResizeFO_pressed:=False;
end;

procedure TForm_Open.Img_TopMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 ResizeFO_pressed:=True;
 //Получаем позицию курсора
 old_pos_X := Mouse.CursorPos.x;
 old_pos_Y := Mouse.CursorPos.y;
 Form_Height_Old := Form_Open.Height;
 Form_Width_Old := Form_Open.Width;
end;

procedure TForm_Open.Img_TopMouseMove(Sender: TObject; Shift: TShiftState; X,
 Y: Integer);
begin
 FC_WhoPsessResize(Sender as TImage);
end;

procedure TForm_Open.Img_TopMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 ResizeFO_pressed:=False;
end;

procedure TForm_Open.Label_Name_TabDblClick(Sender: TObject);
begin
  FC_ForDbClick;
end;

procedure TForm_Open.Label_Name_TabMouseDown(Sender: TObject;
 Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 case Button of
  mbLeft:
  begin
   //Позиция формы
   Form_Open_pressed:=True;
   //Получаем позицию курсора
   old_pos_X := Mouse.CursorPos.x;
   old_pos_Y := Mouse.CursorPos.y;
   //Получаем позицию формы
   old_LEFT := Form_Open.Left;
   old_TOP := Form_Open.Top;
   //////////////////////////////////////
     if(Form_Open.Width<>Screen.Width) OR (Form_Open.Height<>Screen.Height)
     OR (Form_Open.Left<>0) OR (Form_Open.Top<>0) then
     begin
       form_Movie:=True;
     end;
  end;
 end;

end;

procedure TForm_Open.Label_Name_TabMouseMove(Sender: TObject;
 Shift: TShiftState; X, Y: Integer);
begin
 FC_FormMovie;
end;

procedure TForm_Open.Label_Name_TabMouseUp(Sender: TObject;
 Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 Form_Open_pressed:=False;
end;

procedure TForm_Open.Panel_TopDblClick(Sender: TObject);
begin
 FC_ForDbClick;
end;

procedure TForm_Open.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
 //Был ли изменен блок (показать "сохранить/отмена")
 FC_Modif_Bc_or_NO;

end;

procedure TForm_Open.FormCreate(Sender: TObject);
begin
 //Положение кнопок
  FC_Resize;
  //Разрешение перетаскивания
  form_Movie := True;

  Panel_Btns.Width:=(Panel_Top.Width DIV 2)+10;
  Edit_Name_Bc.Width:=Panel_Btns.Width - (Panel_Btns.Width -SB_Close.Left+8);
  Edit_Name_Bc.Left := SB_Close.Left-Edit_Name_Bc.Width-4;
end;

procedure TForm_Open.FormResize(Sender: TObject);
begin
  //Ресйзинг окна
  FC_Resize;
end;

procedure TForm_Open.FormShow(Sender: TObject);
begin
 Memo_Open.Font.Size:=Unit1.label_size;
   Panel_Btns.Width:=(Panel_Top.Width DIV 2)+10;
  Edit_Name_Bc.Width:=Panel_Btns.Width - (Panel_Btns.Width -SB_Close.Left+8);
  Edit_Name_Bc.Left := SB_Close.Left-Edit_Name_Bc.Width-4;
  Form_Open.Caption:=Unit1.FormOpen;
end;

procedure TForm_Open.Img_BottomMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 ResizeFO_pressed:=True;
 //Получаем позицию курсора
 old_pos_X := Mouse.CursorPos.x;
 old_pos_Y := Mouse.CursorPos.y;
 Form_Height_Old := Form_Open.Height;
 Form_Width_Old := Form_Open.Width;
end;

procedure TForm_Open.Img_BottomMouseMove(Sender: TObject; Shift: TShiftState;
 X, Y: Integer);
begin
 FC_WhoPsessResize(Sender as TImage);
end;

procedure TForm_Open.Img_BottomMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 ResizeFO_pressed:=False;
 Img_Bottom.Cursor:= crSizeE;
end;

procedure TForm_Open.Img_BtnsDblClick(Sender: TObject);
begin
 FC_ForDbClick;
end;

procedure TForm_Open.Img_BtnsMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 case Button of
  mbLeft:
  begin
   //Позиция формы
   Form_Open_pressed:=True;
   //Получаем позицию курсора
   old_pos_X := Mouse.CursorPos.x;
   old_pos_Y := Mouse.CursorPos.y;
   //Получаем позицию формы
   old_LEFT := Form_Open.Left;
   old_TOP := Form_Open.Top;
   //////////////////////////////////////
     if(Form_Open.Width<>Screen.Width) OR (Form_Open.Height<>Screen.Height)
     OR (Form_Open.Left<>0) OR (Form_Open.Top<>0) then
     begin
       form_Movie:=True;
     end;
  end;
 end;

end;

procedure TForm_Open.Img_BtnsMouseMove(Sender: TObject; Shift: TShiftState; X,
 Y: Integer);
begin
 FC_FormMovie;
end;

procedure TForm_Open.Img_BtnsMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 Form_Open_pressed := False;
end;

procedure TForm_Open.Img_LeftMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 ResizeFO_pressed:=True;
 //Получаем позицию курсора
 old_pos_X := Mouse.CursorPos.x;
 old_pos_Y := Mouse.CursorPos.y;
 Form_Height_Old := Form_Open.Height;
 Form_Width_Old := Form_Open.Width;
end;

procedure TForm_Open.Img_LeftMouseMove(Sender: TObject; Shift: TShiftState; X,
 Y: Integer);
begin
 FC_WhoPsessResize(Sender as TImage);
end;

procedure TForm_Open.Img_LeftMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 ResizeFO_pressed:=False;
end;

procedure TForm_Open.SB_CloseClick(Sender: TObject);
begin
  Form_Open.Close;
  Unit1.Form1.Visible := True;
end;

procedure TForm_Open.SB_CloseMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
  SB_Close.Top := SB_Close.Top+1;
   SB_Close.Left := SB_Close.Left+1;
end;

procedure TForm_Open.SB_CloseMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
   SB_Close.Top := SB_Close.Top-1;
   SB_Close.Left := SB_Close.Left-1;
end;

procedure TForm_Open.Timer_PositionTimer(Sender: TObject);
var
 razn_X, razn_Y:integer;
 Xm,Ym:integer;
 l,r,t,b:boolean;
begin
 //Изменение размера окна
 Xm := Mouse.CursorPos.x;
 Ym := Mouse.CursorPos.y;
 L:=False;R:=False;T:=False;B:=False;
 //Слева________
 if (Xm < (Form_Open.Left+5)) AND ( Xm > Form_Open.Left)  then
 begin
   L := True;
 end
 else
 begin
   L:=False;
 end;
 //Справа_______
 if (Xm > (Form_Open.Left+Form_Open.Width-22))
 AND ( Xm < Form_Open.Left+Form_Open.Width)  then
 begin
   R := True;
 end
 else
 begin
   R:=False;
 end;
 //Снизу_______
 if (Ym > (Form_Open.Top+Form_Open.Height-22))
 AND ( Ym < Form_Open.Top+Form_Open.Height)  then
 begin
   //Form_Open.Memo_Open.Cursor:=crSizeN;
   B := True;
 end
 else
 begin
   B:=False;
 end;

 ////Делаем курсов
 //if L OR R then
 //begin
 //  Form_Open.Memo_Open.Cursor:=crSizeE;
 //end;
 //if T OR B then
 //begin
 //  Form_Open.Cursor:=crSizeN;
 //end;
 //Простой курсор вернуть
 if L  OR R OR T OR B then
 begin
 end
 else
 begin
   Form_Open.Memo_Open.Cursor:=crDefault;
 end;

end;

function TForm_Open.FC_Modif_Bc_or_NO: Integer;
begin
 //ПРОВЕРКА БЫЛ ЛИ ИЗМЕНЕН БЛОК
 //Несохраненный текст (нужны при подтверждении сохранения)
 Unit3.not_Save_NameBc := Edit_Name_Bc.Text;
 Unit3.not_Save_TXTBc :=  Memo_Open.Text;
 Var_OpenBc_OLD := Var_OpenBc;
 //Переменные для сохранения при закрытии
 if (txt_bc_OLD <> Memo_Open.Text)
 or (name_bc_OLD <> Edit_Name_Bc.Text) then
 begin

   //Положение формы сохранения
   Form_Save.Left:=Mouse.CursorPos.x - (Form_Save.Width div 2);
   Form_Save.Top:=Mouse.CursorPos.y - (Form_Save.Height div 2);
   //Form_Save.Show;
   Unit3.Form_Save.FC_SaveEditBc;
   Form_Save.Close;
 end;
end;

function TForm_Open.FC_WhoPsessResize(FC:TImage): Integer;
var
 Xnow,Ynow,razn_X,razn_Y:integer;
begin

  pressed_L:=false;
  pressed_R:=false;
  pressed_T:=false;
  pressed_B:=false;
  //Координаты мыши сейчас
  Xnow:=Mouse.CursorPos.x;
  Ynow:=Mouse.CursorPos.y;
  //Разница координат
  razn_X := Mouse.CursorPos.x - old_pos_X;
  razn_Y := Mouse.CursorPos.y - old_pos_Y;

  //Смежные++++++++++++++++++++++++++++++++++++++++++++++++++++++
  //Если курсор в углу (Снизу Слева)
  if (Xnow<(Form_Open.Left+Memo_Open.Left+6)) AND (FC.Name = 'Img_Bottom')
  OR ((Ynow > (Form_Open.Top+Form_Open.Height-6)) AND (FC.Name = 'Img_Left')) then
  begin
    FC.Cursor:= crSizeNE;
  end;
  //Если курсор в углу (Снизу СПРАВА)
  if ((Xnow > (Form_Open.Left+Form_Open.Width-6)) AND (FC.Name = 'Img_Bottom'))
  OR ((Ynow > (Form_Open.Top+Form_Open.Height-6)) AND (FC.Name = 'Img_Right'))
  then
  begin
    FC.Cursor:= crSizeNW;
  end;
  //Если курсор в углу (Сверху Слева)
  if (Xnow<(Form_Open.Left+6)) AND (FC.Name = 'Img_Top')
  OR ((Ynow < (Form_Open.Top+6)) AND (FC.Name = 'Img_Left')) then
  begin
    FC.Cursor:= crSizeNW;
  end;
  //Если курсор в углу (Сверху СПРАВА)
  if (Xnow > (Form_Open.Left+Form_Open.Width-6)) AND (FC.Name = 'Img_Top')
  OR ((Ynow < (Form_Open.Top+6)) AND (FC.Name = 'Img_Right')) then
  begin
    FC.Cursor:= crSizeNE;
  end;


  //Если клавиша нажата (делаем ресайзинг)
  if ResizeFO_pressed=True then
  begin
    //Если курсор СНИЗУ СЛЕВА
    if (FC.Cursor  =  crSizeNE)
    AND ((FC.Name = 'Img_Bottom') OR (FC.Name = 'Img_Left')) then
    begin
      Form_Open.Width:=Form_Width_Old-razn_X;
      Form_Open.Left:=old_pos_X+razn_X;
      Form_Open.Height:=Form_Height_Old+razn_Y;
    end;
    //Если курсор СНИЗУ СПРАВА
    if (FC.Cursor  =  crSizeNW)
    AND ((FC.Name = 'Img_Bottom') OR (FC.Name = 'Img_Right'))
     then
    begin
      Form_Open.Height:=Form_Height_Old+razn_Y;
      Form_Open.Width:=old_pos_X-Form_Open.Left+razn_X;
    end;
    //Если курсор Сверху Слева
    if (FC.Cursor  =  crSizeNW)
    AND ((FC.Name = 'Img_Top') OR (FC.Name = 'Img_Left'))
     then
    begin
      Form_Open.Top:=old_pos_Y+razn_Y;
      Form_Open.Height:=Form_Height_Old-razn_Y;
      Form_Open.Width:=Form_Width_Old-razn_X;
      Form_Open.Left:=old_pos_X+razn_X;
    end;
    //Если курсор Сверху СПРАВА
    if (FC.Cursor  =  crSizeNE)
    AND ((FC.Name = 'Img_Top') OR (FC.Name = 'Img_Right'))
     then
    begin
      Form_Open.Top:=old_pos_Y+razn_Y;
      Form_Open.Height:=Form_Height_Old-razn_Y;
      Form_Open.Width:=old_pos_X-Form_Open.Left+razn_X;
    end;
  end
  else
  begin
     //Вернуть правильные курсоры
     if (Xnow > (Form_Open.Left+Memo_Open.Left+6))
     AND (Xnow < (Form_Open.Left+Form_Open.Width-6)) then
     begin
         Img_Bottom.Cursor:= crSizeN;
         Img_Top.Cursor:= crSizeN;
     end;
     if (Ynow > (Form_Open.Top+6))
     AND (Ynow < (Form_Open.Top+Form_Open.Height-6)) then
     begin
         Img_Left.Cursor:= crSizeE;
         Img_Right.Cursor:= crSizeE;
     end;
  end;

  //Какой курсор нажат (раздвигаем с четырех СТОРОН)____________________________
  if ResizeFO_pressed=True then
  begin
    //СПРАВА
    if (FC.Cursor  =  crSizeE) AND (FC.Name = 'Img_Right') then
    begin
       Form_Open.Width:=old_pos_X-Form_Open.Left+razn_X;
    end;
    //СЛЕВА
    if  (FC.Cursor  =  crSizeE) AND (FC.Name = 'Img_Left') then
    begin
       Form_Open.Width:=Form_Width_Old-razn_X;
       if (Form_Open.Width>Form_Open.Constraints.MinWidth) then
       begin
          Form_Open.Left:=old_pos_X+razn_X;
       end;

    end;
    //СНИЗУ
    if  (FC.Cursor  =  crSizeN) AND (FC.Name = 'Img_Bottom') then
    begin
       Form_Open.Height:=Form_Height_Old+razn_Y;
    end;
     //СВЕРХУ
    if  (FC.Cursor  =  crSizeN) AND (FC.Name = 'Img_Top') then
    begin
       Form_Open.Top:=old_pos_Y+razn_Y;
       Form_Open.Height:=Form_Height_Old-razn_Y;
    end;
  end;
  //____________________________________________________________________________

end;

function TForm_Open.FC_Resize: Integer;
begin
   //Ресйзинг окна
   if Form_Open.Width < 450 then
   begin
       Panel_Btns.Width:=(Panel_Top.Width DIV 2)+10;
       Edit_Name_Bc.Width:=Panel_Btns.Width - (Panel_Btns.Width -SB_Close.Left+8);
       Edit_Name_Bc.Left := SB_Close.Left-Edit_Name_Bc.Width-4;
   end
   else
   begin
       Panel_Btns.Width:=240;
       Edit_Name_Bc.Width:=186;
       Edit_Name_Bc.Left := SB_Close.Left-Edit_Name_Bc.Width-4;
   end;
   //Положение кнопок
   Label_Name_Tab.Constraints.MaxWidth:=Panel_Top.Width - Panel_Btns.Width-8;
   SB_Close.Left:=Panel_Btns.Width-SB_Close.Width-2;
end;

function TForm_Open.FC_ForDbClick: Integer;
begin
  //Если окно развернуто
 if (Form_Open.Width=Screen.Width) AND (Form_Open.Height=Screen.Height)
 AND (Form_Open.Left=0) AND (Form_Open.Top=0) then
 begin
   //Сделать окно тем, какое было
   Form_Open.Width := for_DbLc_W;
   Form_Open.Height := for_DbLc_H;
   Form_Open.Left := for_DbLc_L;
   Form_Open.Top := for_DbLc_T;

 end
 else
 begin
   form_Movie:=False;
   Form_Open_pressed:=False;
   //Записать данные
   for_DbLc_W := Form_Open.Width;
   for_DbLc_L := Form_Open.Left;
   for_DbLc_H := Form_Open.Height;
   for_DbLc_T := Form_Open.Top;
   //Развернуть
   Form_Open.Top := 0;
   Form_Open.Left := 0;
   Form_Open.Width := Screen.Width;
   Form_Open.Height := Screen.Height;
 end;
end;

function TForm_Open.FC_FormMovie: Integer;
var
 razn_X,razn_Y,i:integer;
begin
 //Перетаскивание окна по Label
 if (Form_Open_pressed = Enabled) AND (form_Movie=True)
 AND ((Form_Open.Width<>Screen.Width) OR (Form_Open.Height<>Screen.Height)
 OR (Form_Open.Left<>0) OR (Form_Open.Top<>0))
 then
 begin
 razn_X := Mouse.CursorPos.x - old_pos_X;
 razn_Y := Mouse.CursorPos.y - old_pos_Y;
 Form_Open.Left := old_LEFT + razn_X;
 Form_Open.Top := old_TOP + razn_Y;
 end;

end;



end.

