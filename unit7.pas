unit Unit7;

{$mode objfpc}{$H+}

interface

uses
 Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
 StdCtrls, Types;

type

 { TForm_Add }

 TForm_Add = class(TForm)
  Edit_Name_Dc_Add: TEdit;
  Image1: TImage;
  Img_Right: TImage;
  Img_Top: TImage;
  Img_Left: TImage;
  Img_Bottom: TImage;
  Label_Name_Tab: TLabel;
  Panel1: TPanel;
  Memo_Bc_Add: TMemo;
  Panel2: TPanel;
  SB_Close: TImage;
  SB_NewBc_Save: TImage;
  procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
  procedure FormCreate(Sender: TObject);
  procedure FormResize(Sender: TObject);
  procedure FormShow(Sender: TObject);
  procedure Image1DblClick(Sender: TObject);
  procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Img_BottomMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Img_BottomMouseMove(Sender: TObject; Shift: TShiftState; X,
   Y: Integer);
  procedure Img_BottomMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Img_LeftMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Img_LeftMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
   );
  procedure Img_LeftMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Img_RightMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Img_RightMouseMove(Sender: TObject; Shift: TShiftState; X,
   Y: Integer);
  procedure Img_RightMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Img_TopDblClick(Sender: TObject);
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
  procedure Panel2DblClick(Sender: TObject);
  procedure Panel2MouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure Panel2MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  procedure Panel2MouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure SB_CloseClick(Sender: TObject);
  procedure SB_CloseMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure SB_CloseMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure SB_NewBc_SaveClick(Sender: TObject);
  procedure SB_NewBc_SaveMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
  procedure SB_NewBc_SaveMouseUp(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: Integer);
 private
  { private declarations }
 public
  function FC_WhoPsessResize(FC:TImage):Integer;
  function FC_ForDbClick():Integer;
  function FC_Risize():Integer;
  function FC_FormMovie():Integer;
  { public declarations }
 end;

var
 Form_Add: TForm_Add;
 Form_Add_pressed:Boolean;
 old_pos_X,old_pos_Y,old_LEFT,old_TOP:integer;
 for_DbLc_L,for_DbLc_T,for_DbLc_H,for_DbLc_W:Integer;

 Form_Width_Old,Form_Height_Old:Integer;
 Form_Open_pressed,ResizeFO_pressed: boolean;
 pressed_L,pressed_R,pressed_T,pressed_B:Boolean;
 form_Movie:Boolean;

implementation
uses Unit1;






{$R *.lfm}

{ TForm_Add }

const
{$IFDEF UNIX}
   EndString = #$0A;
{$ENDIF}
{$IFDEF WINDOWs}
     EndString = #$0D#$0A;
{$ENDIF}


procedure TForm_Add.SB_CloseClick(Sender: TObject);
begin
  Form_Add.Close;
  Unit1.Form1.Visible := True;
end;

procedure TForm_Add.Label_Name_TabMouseDown(Sender: TObject;
 Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   case Button of
    mbLeft:
    begin
     //Позиция формы
     Form_Add_pressed:=True;
     //Получаем позицию курсора
     old_pos_X := Mouse.CursorPos.x;
     old_pos_Y := Mouse.CursorPos.y;
     //Получаем позицию формы
     old_LEFT := Form_Add.Left;
     old_TOP := Form_Add.Top;
     //////////////////////////////////////
       if(Form_Add.Width<>Screen.Width) OR (Form_Add.Height<>Screen.Height)
       OR (Form_Add.Left<>0) OR (Form_Add.Top<>0) then
       begin
         form_Movie:=True;
       end;
    end;
   end;

end;

procedure TForm_Add.Label_Name_TabMouseMove(Sender: TObject;
 Shift: TShiftState; X, Y: Integer);
begin
 FC_FormMovie;
end;

procedure TForm_Add.Label_Name_TabMouseUp(Sender: TObject;
 Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 Form_Add_pressed:=False;
end;

procedure TForm_Add.Panel2DblClick(Sender: TObject);
begin
 FC_ForDbClick;
end;

procedure TForm_Add.Panel2MouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
    case Button of
  mbLeft:
  begin
   //Позиция формы
   Form_Add_pressed:=True;
   //Получаем позицию курсора
   old_pos_X := Mouse.CursorPos.x;
   old_pos_Y := Mouse.CursorPos.y;
   //Получаем позицию формы
   old_LEFT := Form_Add.Left;
   old_TOP := Form_Add.Top;
   //Следим за позицией и перемещаем
   //Timer_Position.Enabled:=True;
   Form_Add.AlphaBlend:=True;
  end;
  end;
end;

procedure TForm_Add.Panel2MouseMove(Sender: TObject; Shift: TShiftState; X,
 Y: Integer);
begin
 FC_FormMovie;
end;

procedure TForm_Add.Panel2MouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 Form_Add_pressed:=False;
end;

procedure TForm_Add.Image1MouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
   case Button of
  mbLeft:
  begin
   //Позиция формы
   Form_Add_pressed:=True;
   //Получаем позицию курсора
   old_pos_X := Mouse.CursorPos.x;
   old_pos_Y := Mouse.CursorPos.y;
   //Получаем позицию формы
   old_LEFT := Form_Add.Left;
   old_TOP := Form_Add.Top;
   //////////////////////////////////////
     if(Form_Add.Width<>Screen.Width) OR (Form_Add.Height<>Screen.Height)
     OR (Form_Add.Left<>0) OR (Form_Add.Top<>0) then
     begin
       form_Movie:=True;
     end;
  end;
  end;


end;

procedure TForm_Add.Image1DblClick(Sender: TObject);
begin
 FC_ForDbClick;
end;

procedure TForm_Add.FormResize(Sender: TObject);
begin
 //Ресйзинг окна
 FC_Risize;
end;

procedure TForm_Add.FormShow(Sender: TObject);
begin
   Form_Add.Caption:=Unit1.NewTab;
end;

procedure TForm_Add.FormCreate(Sender: TObject);
begin
  //Положение кнопок при создании формы
  FC_Risize;
  //Разрешение перетаскивания
  form_Movie := True;
end;

procedure TForm_Add.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  if (Length(Trim(Edit_Name_Dc_Add.Text)) > 0)
  or (Length(Trim(Memo_Bc_Add.Text)) > 0) then
  begin
     SB_NewBc_SaveClick(Sender);
  end;
end;

procedure TForm_Add.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
 Y: Integer);
begin
 FC_FormMovie;
end;

procedure TForm_Add.Image1MouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 Form_Add_pressed:=False;
end;

procedure TForm_Add.Img_BottomMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
  ResizeFO_pressed:=True;
 //Получаем позицию курсора
 old_pos_X := Mouse.CursorPos.x;
 old_pos_Y := Mouse.CursorPos.y;
 Form_Height_Old := Form_Add.Height;
 Form_Width_Old := Form_Add.Width;
end;

procedure TForm_Add.Img_BottomMouseMove(Sender: TObject; Shift: TShiftState; X,
 Y: Integer);
begin
 FC_WhoPsessResize(Sender as TImage);
end;

procedure TForm_Add.Img_BottomMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 ResizeFO_pressed:=False;
end;

procedure TForm_Add.Img_LeftMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 ResizeFO_pressed:=True;
 //Получаем позицию курсора
 old_pos_X := Mouse.CursorPos.x;
 old_pos_Y := Mouse.CursorPos.y;
 Form_Height_Old := Form_Add.Height;
 Form_Width_Old := Form_Add.Width;
end;

procedure TForm_Add.Img_LeftMouseMove(Sender: TObject; Shift: TShiftState; X,
 Y: Integer);
begin
 //if Form_Add.Width < Form_Add.Constraints.MinWidth then
 //begin
 //
 //end
 //else
 //begin
    FC_WhoPsessResize(Sender as TImage);
 //end;

end;

procedure TForm_Add.Img_LeftMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 ResizeFO_pressed:=False;
end;

procedure TForm_Add.Img_RightMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
  ResizeFO_pressed:=True;
 //Получаем позицию курсора
 old_pos_X := Mouse.CursorPos.x;
 old_pos_Y := Mouse.CursorPos.y;
 Form_Height_Old := Form_Add.Height;
 Form_Width_Old := Form_Add.Width;
end;

procedure TForm_Add.Img_RightMouseMove(Sender: TObject; Shift: TShiftState; X,
 Y: Integer);
begin
 FC_WhoPsessResize(Sender as TImage);
end;

procedure TForm_Add.Img_RightMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 ResizeFO_pressed:=False;
end;

procedure TForm_Add.Img_TopDblClick(Sender: TObject);
begin
 FC_ForDbClick;
end;

procedure TForm_Add.Img_TopMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
   ResizeFO_pressed:=True;
 //Получаем позицию курсора
 old_pos_X := Mouse.CursorPos.x;
 old_pos_Y := Mouse.CursorPos.y;
 Form_Height_Old := Form_Add.Height;
 Form_Width_Old := Form_Add.Width;
end;

procedure TForm_Add.Img_TopMouseMove(Sender: TObject; Shift: TShiftState; X,
 Y: Integer);
begin
 FC_WhoPsessResize(Sender as TImage);
end;

procedure TForm_Add.Img_TopMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 ResizeFO_pressed:=False;
end;

procedure TForm_Add.Label_Name_TabDblClick(Sender: TObject);
begin
 FC_ForDbClick;
end;

procedure TForm_Add.SB_CloseMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
   SB_Close.Top := SB_Close.Top+1;
   SB_Close.Left := SB_Close.Left+1;
end;

procedure TForm_Add.SB_CloseMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
   SB_Close.Top := SB_Close.Top-1;
   SB_Close.Left := SB_Close.Left-1;
end;

procedure TForm_Add.SB_NewBc_SaveClick(Sender: TObject);
var
 name_Bc:string;
 i, pos_vhoda:integer;
 save_ok:Boolean;
begin
 //Добавляем новый блок
 Unit1.Form1.FC_ActVars();

 //_Имя блока
 If length(Form_Add.Edit_Name_Dc_Add.Text) > 0 then
 begin
   name_Bc := Form_Add.Edit_Name_Dc_Add.Text;
 end
 else
 begin
   name_Bc := '31071990ksm';
 end;

 //_Сохраняем сам блок с именем
 Form1.Memo_Din.Lines.LoadFromFile(folder_txt+'' + act_tab + '/index.ksm');
 save_ok := False;
 i:=1;
 while save_ok = False do
 begin
   //Если такой блок уже есть
   if Pos('bc' + IntToStr(i) + EndString,Form1.Memo_Din.Lines.Text) > 1 then
   begin
     i := i + 1;
   end
   else
   begin
     save_ok := True;
     //Сохраняем список блоков
     Form1.Memo_Din.Lines.Add('bc'+IntToStr(i));
     Form1.Memo_Din.Lines.SaveToFile(folder_txt+'' + act_tab + '/index.ksm');
     //Сохраняем сам блок
     Form1.Memo_Din.Clear;
     Form1.Memo_Din.Lines.Add(name_Bc);
     Form1.Memo_Din.Lines.Add(Memo_Bc_Add.Text);
     Form1.Memo_Din.Lines.SaveToFile(folder_txt+'' + act_tab + '/bc'+IntToStr(i)+'.sm');
   end;
 end;
 Memo_Bc_Add.Clear;
 Edit_Name_Dc_Add.Clear;
 Unit1.Form1.FC_FormStroy();
end;

procedure TForm_Add.SB_NewBc_SaveMouseDown(Sender: TObject;
 Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   SB_NewBc_Save.Top := SB_NewBc_Save.Top+1;
   SB_NewBc_Save.Left := SB_NewBc_Save.Left+1;
end;

procedure TForm_Add.SB_NewBc_SaveMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
   SB_NewBc_Save.Top := SB_NewBc_Save.Top-1;
   SB_NewBc_Save.Left := SB_NewBc_Save.Left-1;
end;

function TForm_Add.FC_WhoPsessResize(FC: TImage): Integer;
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
  if (Xnow<(Form_Add.Left+Memo_Bc_Add.Left+6)) AND (FC.Name = 'Img_Bottom')
  OR ((Ynow > (Form_Add.Top+Form_Add.Height-6)) AND (FC.Name = 'Img_Left')) then
  begin
    FC.Cursor:= crSizeNE;
  end;
  //Если курсор в углу (Снизу СПРАВА)
  if ((Xnow > (Form_Add.Left+Form_Add.Width-6)) AND (FC.Name = 'Img_Bottom'))
  OR ((Ynow > (Form_Add.Top+Form_Add.Height-6)) AND (FC.Name = 'Img_Right'))
  then
  begin
    FC.Cursor:= crSizeNW;
  end;
  //Если курсор в углу (Сверху Слева)
  if (Xnow<(Form_Add.Left+6)) AND (FC.Name = 'Img_Top')
  OR ((Ynow < (Form_Add.Top+6)) AND (FC.Name = 'Img_Left')) then
  begin
    FC.Cursor:= crSizeNW;
  end;
  //Если курсор в углу (Сверху СПРАВА)
  if (Xnow > (Form_Add.Left+Form_Add.Width-6)) AND (FC.Name = 'Img_Top')
  OR ((Ynow < (Form_Add.Top+6)) AND (FC.Name = 'Img_Right')) then
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
      Form_Add.Width:=Form_Width_Old-razn_X;
      //if (Form_Add.Width>Form_Add.Constraints.MinWidth) then
      //begin
        Form_Add.Left:=old_pos_X+razn_X;
      //end;
      Form_Add.Height:=Form_Height_Old+razn_Y;
    end;
    //Если курсор СНИЗУ СПРАВА
    if (FC.Cursor  =  crSizeNW)
    AND ((FC.Name = 'Img_Bottom') OR (FC.Name = 'Img_Right'))
     then
    begin
      Form_Add.Height:=Form_Height_Old+razn_Y;
      Form_Add.Width:=old_pos_X-Form_Add.Left+razn_X;
    end;
    //Если курсор Сверху Слева
    if (FC.Cursor  =  crSizeNW)
    AND ((FC.Name = 'Img_Top') OR (FC.Name = 'Img_Left'))
     then
    begin
      Form_Add.Top:=old_pos_Y+razn_Y;
      Form_Add.Height:=Form_Height_Old-razn_Y;
      Form_Add.Width:=Form_Width_Old-razn_X;
      Form_Add.Left:=old_pos_X+razn_X;
    end;
    //Если курсор Сверху СПРАВА
    if (FC.Cursor  =  crSizeNE)
    AND ((FC.Name = 'Img_Top') OR (FC.Name = 'Img_Right'))
     then
    begin
      Form_Add.Top:=old_pos_Y+razn_Y;
      Form_Add.Height:=Form_Height_Old-razn_Y;
      Form_Add.Width:=old_pos_X-Form_Add.Left+razn_X;
    end;
  end
  else
  begin
     //Вернуть правильные курсоры
     if (Xnow > (Form_Add.Left+Memo_Bc_Add.Left+6))
     AND (Xnow < (Form_Add.Left+Form_Add.Width-6)) then
     begin
         Img_Bottom.Cursor:= crSizeN;
         Img_Top.Cursor:= crSizeN;
     end;
     if (Ynow > (Form_Add.Top+6))
     AND (Ynow < (Form_Add.Top+Form_Add.Height-6)) then
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
       Form_Add.Width:=old_pos_X-Form_Add.Left+razn_X;
    end;
    //СЛЕВА
    if  (FC.Cursor  =  crSizeE) AND (FC.Name = 'Img_Left') then
    begin
       Form_Add.Width:=Form_Width_Old-razn_X;
       if (Form_Add.Width>Form_Add.Constraints.MinWidth) then
       begin
         Form_Add.Left:=old_pos_X+razn_X;
       end;

    end;
    //СНИЗУ
    if  (FC.Cursor  =  crSizeN) AND (FC.Name = 'Img_Bottom') then
    begin
       Form_Add.Height:=Form_Height_Old+razn_Y;
    end;
     //СВЕРХУ
    if  (FC.Cursor  =  crSizeN) AND (FC.Name = 'Img_Top') then
    begin
       Form_Add.Top:=old_pos_Y+razn_Y;
       Form_Add.Height:=Form_Height_Old-razn_Y;
    end;
  end;
  //____________________________________________________________________________


end;

function TForm_Add.FC_ForDbClick: Integer;
begin
 //Если окно развернуто
 if (Form_Add.Width=Screen.Width) AND (Form_Add.Height=Screen.Height)
 AND (Form_Add.Left=0) AND (Form_Add.Top=0) then
 begin
   //Сделать окно тем, какое было
   Form_Add.Width := for_DbLc_W;
   Form_Add.Height := for_DbLc_H;
   Form_Add.Left := for_DbLc_L;
   Form_Add.Top := for_DbLc_T;

 end
 else
 begin
   form_Movie:=False;
   Form_Add_pressed:=False;
   //Записать данные
   for_DbLc_W := Form_Add.Width;
   for_DbLc_L := Form_Add.Left;
   for_DbLc_H := Form_Add.Height;
   for_DbLc_T := Form_Add.Top; //showmessage(IntToStr(for_DbLc_L)+'_'+IntToStr(for_DbLc_T));
   //Развернуть
   Form_Add.Top := 0;
   Form_Add.Left := 0;
   Form_Add.Width := Screen.Width;
   Form_Add.Height := Screen.Height;
 end;


end;

function TForm_Add.FC_Risize: Integer;
begin
 //Ресйзинг окна
  if Form_Add.Width < 450 then
  begin
      Panel2.Width:=(Panel1.Width DIV 2)+10;
      Edit_Name_Dc_Add.Width:=Panel2.Width - (Panel2.Width -SB_NewBc_Save.Left+8);
      Edit_Name_Dc_Add.Left := SB_NewBc_Save.Left-Edit_Name_Dc_Add.Width-4;
  end
  else
  begin
      Panel2.Width:=240;
      Edit_Name_Dc_Add.Left := SB_NewBc_Save.Left-Edit_Name_Dc_Add.Width-4;
      Edit_Name_Dc_Add.Width:=186;
  end;
  //Положение кнопок
  Label_Name_Tab.Constraints.MaxWidth:=Panel1.Width - Panel2.Width-8;
  SB_Close.Left:=Panel2.Width-SB_Close.Width-2;
  SB_NewBc_Save.Left:=SB_Close.Left-SB_NewBc_Save.Width-2;
end;

function TForm_Add.FC_FormMovie: Integer;
var
 razn_X,razn_Y,i:integer;
begin
 //Перетаскивание окна по Label
 if (Form_Add_pressed = Enabled) AND (form_Movie=True)
 AND ((Form_Add.Width<>Screen.Width) OR (Form_Add.Height<>Screen.Height)
 OR (Form_Add.Left<>0) OR (Form_Add.Top<>0))
 then
 begin
 razn_X := Mouse.CursorPos.x - old_pos_X;
 razn_Y := Mouse.CursorPos.y - old_pos_Y;
 Form_Add.Left := old_LEFT + razn_X;
 Form_Add.Top := old_TOP + razn_Y;
 end;

end;

end.

