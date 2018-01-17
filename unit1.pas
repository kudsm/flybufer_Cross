unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Buttons, IniFiles, Types, LCLType , Clipbrd, Menus, Registry,  MouseAndKeyInput;

type

  { TForm1 }

  TForm1 = class(TForm)
   Button_FormStroy: TButton;
    Image1: TImage;
    ImgPos2: TImage;
    ImgPos1: TImage;
    SB_Settings: TImage;
    Img_False: TImage;
    Img_True: TImage;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    PopupMenu1: TPopupMenu;
    NoHide1Sec: TTimer;
    TimerCopyPaste: TTimer;
    TrayIcon1: TTrayIcon;
    zapas_down2: TImage;
    zapaz_down1: TImage;
    zapas_top2: TImage;
    zapas_top1: TImage;
    zapas_copyzam2: TImage;
    zapas_copyzam1: TImage;
    zapas_copy2: TImage;
    zapas_copy1: TImage;
    zapas_tab3: TImage;
    zapas_tab2: TImage;
    zapas_tab1: TImage;
    zapas_bc2: TImage;
    zapas_bc1: TImage;
    SB_StopTop: TImage;
    Label_Info_Down: TLabel;
    Label_NameTab: TLabel;
    zapas_fon3: TImage;
    Zapas_Sb_Stop1: TImage;
    Zapas_Sb_Stop2: TImage;
    SB_Stop: TImage;
    SB_Tabs: TImage;
    SB_SelAdd: TImage;
    SB_Paste: TImage;
    SB_Close: TImage;
    Img_Down: TImage;
    Img_Polosa_Top: TImage;
    SB_Add: TImage;
    Img_L: TImage;
    Img_L1: TImage;
    Img_R: TImage;
    Img_R1: TImage;
    LabelObrazec: TLabel;
    Label_no_bloks: TLabel;
    Memo_E: TMemo;
    Memo_Din: TMemo;
    Mmo_din: TMemo;
    Panel_Down: TPanel;
    Timer1: TTimer;
    Timer_Stroy: TTimer;
    zapaz_fon1: TImage;
    zapaz_fon2: TImage;
    procedure Button_FormStroyClick(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
    procedure SB_SettingsClick(Sender: TObject);
    procedure SB_SettingsMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
    procedure Img_Polosa_TopClick(Sender: TObject);
    procedure Img_Polosa_TopMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
    procedure Img_Polosa_TopMouseUp(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
    procedure Label_NameTabClick(Sender: TObject);
    procedure Label_no_bloksMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure NoHide1SecTimer(Sender: TObject);
    procedure SB_AddMouseLeave(Sender: TObject);
    procedure SB_AddMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
     );
    procedure SB_CloseMouseLeave(Sender: TObject);
    procedure SB_CloseMouseMove(Sender: TObject; Shift: TShiftState; X,
     Y: Integer);
    procedure SB_PasteClick(Sender: TObject);
    procedure SB_PasteMouseLeave(Sender: TObject);
    procedure SB_PasteMouseMove(Sender: TObject; Shift: TShiftState; X,
     Y: Integer);
    procedure SB_SelAddClick(Sender: TObject);
    procedure SB_SelAddMouseLeave(Sender: TObject);
    procedure SB_SelAddMouseMove(Sender: TObject; Shift: TShiftState; X,
     Y: Integer);
    procedure SB_SettingsMouseLeave(Sender: TObject);
    procedure SB_SettingsMouseMove(Sender: TObject; Shift: TShiftState; X,
     Y: Integer);
    procedure SB_SettingsMouseUp(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
    procedure SB_StopClick(Sender: TObject);
    procedure SB_StopMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
    procedure SB_StopMouseLeave(Sender: TObject);
    procedure SB_StopMouseMove(Sender: TObject; Shift: TShiftState; X,
     Y: Integer);
    procedure SB_StopMouseUp(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
    procedure SB_StopTopClick(Sender: TObject);
    procedure SB_TabsClick(Sender: TObject);
    procedure SB_TabsMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
    procedure SB_AddClick(Sender: TObject);
    procedure SB_PasteMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
    procedure SB_PasteMouseUp(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
    procedure SB_AddMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
    procedure SB_AddMouseUp(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
    procedure SB_CloseClick(Sender: TObject);
    procedure SB_CloseMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
    procedure SB_CloseMouseUp(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
    procedure SB_SelAddMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
    procedure SB_SelAddMouseUp(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
    procedure SB_TabsMouseLeave(Sender: TObject);
    procedure SB_TabsMouseMove(Sender: TObject; Shift: TShiftState; X,
     Y: Integer);
    procedure SB_TabsMouseUp(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure LabelBloki_Leave(Sender: TObject);
    procedure LabelBloki_MM(Sender: TObject);
    procedure FC_GoTop_Button(Sender: TObject);
    procedure FC_GoDown_Button(Sender: TObject);
    procedure ImageCop_OnClick(Sender: TObject);
    procedure ImageZam_OnClick(Sender: TObject);
    procedure ImageCop_OnMouseLeave(Sender: TObject);
    procedure ImageCop_OnMouseEnter(Sender: TObject);
    procedure ImageCopZam_OnMouseLeave(Sender: TObject);
    procedure ImageCopZam_OnMouseEnter(Sender: TObject);
    procedure LabelBloki_Click(Sender: TObject);
    procedure LabelBloki_DbClick(Sender: TObject);
    procedure LabelBloki_MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer2Timer(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TimerCopyPasteTimer(Sender: TObject);
    procedure Timer_StroyTimer(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);
    procedure TrayIcon1MouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Integer);







  private
    { private declarations }


  public
    function FC_FormStroy():Integer;
    function FC_ActVars():Integer;
    function FC_BC_Stroy():Integer;
    function FC_FormHide():Integer;
    function FC_MyPopapTabs():Integer;
    function FC_HideForms():Integer;
    function FC_DelFormShow(Sender: TObject):Integer;
    function FC_StartWithOS():Integer;
    function FC_NoStartWithOS():Integer;
    function FC_Settings():Integer;
    function FC_Language():Integer;
    { public declarations }
  end;

var
  Form1: TForm1;
   ImageBloki,ImageCop,ImageCopZam:TImage;
   LabelBloki: TLabel;
  c_Tabs, TopTop, count_bc: integer;
  act_tab, act_bc, act_tab_NAME, act_bc_NAME, data_bc: string;
  txt_bc_OLD, name_bc_OLD: string;
  Form_NoClose:integer;
  NoHdeOneSecond:Boolean;
  autoload, label_size:Integer;
  OS, folder_txt,language, position_show:String;

  //Для языка
  NoBlocs,Add,Paste,PasteInFb,PasteFromFb,Copy,Settings,Fix,CloseL:String;
  About,Del,TabsManager,Clear,FormOpen,FormAdd,NewTab:String;
  autostart,lng_lng,fontSize_l,position_l:string;
implementation
uses Unit2, Unit3, Unit4, Unit5, Unit6, Unit7, Unit8, Unit9, Unit10;
{$R *.lfm}

{ TForm1 }

const
{$IFDEF UNIX}
   EndString = #$0A;
{$ENDIF}
{$IFDEF WINDOWs}
     EndString = #$0D#$0A;
{$ENDIF}


//Таймер (показываем форму)
procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Unit1.Form1.FC_FormHide;
  Timer1.Enabled:=False;
end;

procedure TForm1.LabelBloki_Leave(Sender: TObject);
var
FC:TComponent;
begin
FC:=FindComponent('Imgbl'+(Sender as TLabel).Name);

  (FC as TImage).Picture:=zapas_bc1.Picture;//.Bitmap.LoadFromFile( 'img/skin1/blok-1.bmp');
end;

procedure TForm1.LabelBloki_MM(Sender: TObject);
var
FC:TComponent;
begin
FC:=FindComponent('Imgbl'+(Sender as TLabel).Name);

  (FC as TImage).Picture:=zapas_bc2.Picture;//.Bitmap.LoadFromFile( 'img/skin1/blok-2.bmp');

end;

procedure TForm1.FC_GoTop_Button(Sender: TObject);
var
FC:TComponent;
begin
 FC:=FindComponent((Sender as TImage).Name);
 (FC as TImage).Top:=(FC as TImage).Top-1;
 (FC as TImage).Left:=(FC as TImage).Left-1;
end;

procedure TForm1.FC_GoDown_Button(Sender: TObject);
var
FC:TComponent;
begin
 FC:=FindComponent((Sender as TImage).Name);
 (FC as TImage).Top:=(FC as TImage).Top+1;
 (FC as TImage).Left:=(FC as TImage).Left+1;
end;

procedure TForm1.ImageCop_OnClick(Sender: TObject);
begin
 ///Щелчек по кнопке копирования
 FC_Actvars;
 Memo_Din.Lines.LoadFromFile(folder_txt + Act_Tab + '/' + (sender as TImage).Hint + '.sm');
 Memo_Din.Lines.Delete(0);
 //Memo_Din.SelectAll;
 //Memo_Din.CopyToClipboard;
 //showmessage(Memo_Din.Text);
 //if Pos(EndString,Memo_Din.Text) < 1 then
 //begin
 //
 //end;
    //Memo_Din.SelStart:=0;
   //Memo_Din.SelLength:=length(Memo_Din.Text)-7;
 Clipboard.AsText:=trim(Memo_Din.Text);
end;

procedure TForm1.ImageZam_OnClick(Sender: TObject);
var
   T,S:string;
begin

 //Щелчек по кнопке копирования
 FC_Actvars;
 Memo_Din.Lines.LoadFromFile(folder_txt + Act_Tab + '/' + (sender as TImage).Hint + '.sm');
 Memo_Din.Lines.Delete(0);

       Memo_Din.SelStart:=0;
       Memo_Din.SelLength:=length(Memo_Din.Text)-1;

     Clipboard.AsText:= trim(Memo_Din.SelText);
     Form1.Hide;


       KeyInput.Apply([ssCtrl]);
       KeyInput.Press($56);   //Вставляем - ctrl+v
       KeyInput.Unapply([ssCtrl]);

end;

procedure TForm1.ImageCop_OnMouseLeave(Sender: TObject);
var
FC:TComponent;
begin
 //Мышка не над кнопкой ImageCop
 (Sender as TImage).Picture:=zapas_copy1.Picture;//.LoadFromFile('img\skin1\copy.bmp');
 FC:=FindComponent('Imgbl'+(Sender as TImage).Hint);
 (FC as TImage).Picture:=zapas_bc1.Picture;//.LoadFromFile('img\skin1\blok-1.bmp');
 Label_Info_Down.Caption:='FlyBufer 3.0 Cross';
end;

procedure TForm1.ImageCop_OnMouseEnter(Sender: TObject);
var
FC:TComponent;
begin
 //Мышка над кнопкой ImageCop
 (Sender as TImage).Picture:=zapas_copy2.Picture;//.LoadFromFile('img\skin1\copy2.bmp');
  FC:=FindComponent('Imgbl'+(Sender as TImage).Hint);
 (FC as TImage).Picture:=zapas_bc2.Picture;//.LoadFromFile('img\skin1\blok-2.bmp');
 Label_Info_Down.Caption:=Copy;
end;

procedure TForm1.ImageCopZam_OnMouseLeave(Sender: TObject);
var
FC:TComponent;
begin
 //Мышка не над кнопкой ImageCopZam
 (Sender as TImage).Picture:=zapas_copyzam1.Picture;//.LoadFromFile('img\skin1\CopZam.bmp');
 FC:=FindComponent('Imgbl'+(Sender as TImage).Hint);
 (FC as TImage).Picture:=zapas_bc1.Picture;//.LoadFromFile('img\skin1\blok-1.bmp');
 Label_Info_Down.Caption:='FlyBufer 3.0 Cross';
end;

procedure TForm1.ImageCopZam_OnMouseEnter(Sender: TObject);
var
FC:TComponent;
begin
 //Мышка над кнопкой ImageCopZam
 (Sender as TImage).Picture:=zapas_copyzam2.Picture;//.LoadFromFile('img\skin1\CopZam2.bmp');
  FC:=FindComponent('Imgbl'+(Sender as TImage).Hint);
 (FC as TImage).Picture:=zapas_bc2.Picture;//.LoadFromFile('img\skin1\blok-2.bmp');

 Label_Info_Down.Caption:=PasteFromFb;
end;

//Щелчек по блоку
procedure TForm1.LabelBloki_Click(Sender: TObject);
var
s:string;
begin

 //Закрываем другие формы
 Form_NoClose := 3;
 FC_HideForms;
 Form_NoClose := 0;

 if Form_Open.Visible = False then
 begin
    Form_Open.Width := 455;
    Form_Open.Left:=Form1.Left - Form_Open.Width-4;
    Form_Open.Height:=240;
    Form_Open.Top:=4;
 end;

 //Если блок открыт и равен имени открытого блока Var_OpenBc
 If Form_Open.Visible AND (Unit2.Var_OpenBc = (sender as TLabel).Name) then
 begin
   //Закрываем открытый блок
  Form_Open.Close;
 end
 else
 begin
   //Показывать ли диалог сохранения
   If Form_Open.Visible then
   begin
     Unit2.Form_Open.FC_Modif_Bc_or_NO();
   end;

  //Открываем блок_____________________
  FC_ActVars;

  //Грузим текст блока в мемо
  //Form_Open.Edit_Name_Bc.Left := 152;
  s:= folder_txt+act_tab+'/'+(sender as TLabel).Name+'.sm';
  Form_Open.Memo_Open.Lines.LoadFromFile(s);

  //Грузим имя блока в эдит, удалив из мемо
  if Form_Open.Memo_Open.Lines[0] = '31071990ksm' then
  begin
   Form_Open.Edit_Name_Bc.Text := '';
  end
  else
  begin
   Form_Open.Edit_Name_Bc.Text := Form_Open.Memo_Open.Lines[0];
  end;
  Form_Open.Memo_Open.Lines.Delete(0);

  //Переменные для сохранения при закрытии
   txt_bc_OLD := Form_Open.Memo_Open.Text;
   name_bc_OLD := Form_Open.Edit_Name_Bc.Text;

  Form_Open.Label_Name_Tab.Caption := act_tab_NAME;
  Form_Open.Show;

  //Пишем переменную открытого бока
  Unit2.Var_OpenBc := (sender as TLabel).Name;
  //showmessage(act_tab_NAME);

 end;

end;

procedure TForm1.LabelBloki_DbClick(Sender: TObject);
begin
  //FC_HideForms;
  //////////////////
  //Unit4.bc_to_DEL := (sender as TLabel).Name;
  //Form_Open.Visible:=False;
  //Form_Save.Visible:=False;
  //Form_Del.Show;
 FC_DelFormShow(sender);
end;

procedure TForm1.LabelBloki_MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);//; Button: TMouseButton);
begin
    //При нажатии на блок правой клавишей мышиСвой попап
    if (ssRight in Shift) then
    begin
      FC_MyPopapTabs;
    end;
    //При нажатии на блок ЛНВОЙ клавишей мышиСвой попап
    if (ssLeft in Shift) then
    begin
         Form_Tabs.Close;
    end;
    //При нажатии на блок СРЕДНЕЙ клавишей мышиСвой попап
    if (ssMiddle in Shift) then
    begin
      FC_DelFormShow(sender);
    end;
end;

procedure TForm1.Timer2Timer(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
   MouseClickCount:integer;
begin
  //if (ssCtrl in Shift) //and (Key = VK_CONTROL)
  //then
  //begin
   //               case Button of
   //   mbLeft:
   //  begin
   //     showmessage(IntToStr(Mouse.CursorPos.x)+'_'+IntToStr(Mouse.CursorPos.y));
   //  end;
   //end;

       if(ssLeft in Shift)then
         begin
            showmessage('jjjj');//IntToStr(Mouse.CursorPos.x)+'_'+IntToStr(Mouse.CursorPos.y));
         end;
                                  

     //If $37 in Shift  then
     //begin
     //       showmessage('jjjj');
     // end;

  //end;  // Конец условия нажатой CTRL





     if Shift =  [  ssLeft ] then
     //if (ssLeft in Shift) then
begin
   //
      showmessage('jjjj');
   end;
   // Label_Info_Down.Caption:= IntToStr(WindowFromPoint(Mouse.CursorPos));

   //if (Sender is TObject) then
   //  begin
   //     Label_Info_Down.Caption:='s';
   //  end
   //else
   //begin
   //    Label_Info_Down.Caption:='yaa';
   //end;

end;

procedure TForm1.TimerCopyPasteTimer(Sender: TObject);
begin

    if TimerCopyPaste.Tag = 4 then
   begin
       //Показываем форму
       Form1.Show;
       TimerCopyPaste.Tag := 0;
       TimerCopyPaste.Enabled:=False;
   end;

    if (TimerCopyPaste.Tag = 3) AND  (trim(Form_Add.Memo_Bc_Add.Text) = trim(Clipboard.AsText)) then
   begin
      //Сохраняем МЕМО в файл
      Form_Add.SB_NewBc_SaveClick(Sender);
      TimerCopyPaste.Tag:=4;
   end;


   if (TimerCopyPaste.Tag = 2) AND  (trim(Form_Add.Memo_Bc_Add.Text) <> trim(Clipboard.AsText)) then
   begin
      //Добавляем в МЕМО
      Form_Add.Memo_Bc_Add.Text:=Clipboard.AsText;
      TimerCopyPaste.Tag:=3;
   end;

   if (Form1.Visible = False) AND (TimerCopyPaste.Tag = 1) then
   begin
      //Копируем текст


      KeyInput.Apply([ssCtrl]);
      KeyInput.Press($43);   //Копируем - ctrl+c
      KeyInput.Unapply([ssCtrl]);

      if trim(Clipboard.AsText) <> trim('not_copy_ksm') then
      begin
        TimerCopyPaste.Tag:=2;
      end;
   end;




end;



procedure TForm1.Timer_StroyTimer(Sender: TObject);
begin
 FC_FormStroy;
 Timer_Stroy.Enabled:=False;
end;

procedure TForm1.TrayIcon1Click(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
          FormOnOff.Timer1.Enabled:=False;
       //Щелчек по кнопке замочка
       if SB_Stop.Tag = 0 then
       begin

         if Unit1.position_show = 'top' then
         begin
           Form1.Top:=0;
         end;

         if Unit1.position_show = 'bottom' then
         begin
           Form1.Top:=screen.Height-Form1.Height-50;
         end;



         Form1.Show;
         SB_Stop.Tag:=1;
         SB_Stop.Picture:=Zapas_Sb_Stop2.Picture;
         SB_StopTop.Visible:=True;
       end
       else
       begin
         SB_Stop.Tag:=0;
         SB_Stop.Picture:=Zapas_Sb_Stop1.Picture;
         SB_StopTop.Visible:=False;
       end;
       FormOnOff.Timer1.Enabled:=True;
end;

procedure TForm1.TrayIcon1MouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin

   //case Button of
   //   mbLeft:
   //  begin
   //
   //  end;
   //end;
end;

function TForm1.FC_FormStroy: Integer;
var
  sr: TSearchRec;
  Ini: TIniFile;
  i:integer;
begin
    //Проверка наличия файла tabs.ksm (если нет - создаем Notepead1)____________
   if FindFirst(folder_txt+'tabs.ksm', faAnyFile, sr) <> 0 then
   begin
     // Добавляем вкладку в скисок 'tabs.ksm'
     CreateDir(folder_txt);
      Memo_Din.Lines.Clear;
      Memo_Din.Lines.Add('tab1');
      Memo_Din.Lines.Add('tab1');
      Memo_Din.Lines.SaveToFile(folder_txt+'tabs.ksm');
     //Создаем саму вкладку
     CreateDir(folder_txt+'tab1');
      Memo_Din.Lines.Clear;
      Memo_Din.Lines.Add('Notepead1');
      Memo_din.Lines.SaveToFile(folder_txt+'tab1/index.ksm');
   end
   else
   begin
     //Showmessage('Вклада существует');
    //Если вкладка пуста
    Memo_din.Lines.LoadFromFile(folder_txt+'tabs.ksm');
    if length(trim(Memo_din.Text)) < 1 then
    begin
       //Создаем тоже
      Memo_Din.Lines.Clear;
      Memo_Din.Lines.Add('tab1');
      Memo_Din.Lines.Add('tab1');
      Memo_Din.Lines.SaveToFile(folder_txt+'tabs.ksm');
     //Создаем саму вкладку
     CreateDir(folder_txt+'tab1');
      Memo_Din.Lines.Clear;
      Memo_Din.Lines.Add('Notepead1');
      Memo_din.Lines.SaveToFile(folder_txt+'tab1/index.ksm');
    end;
   end;

   //Получаем имена и названия активных вкладки и блока_________________________
   FC_ActVars;
   //Имя вкладки в Label
   Label_NameTab.Caption:=act_tab_NAME;
   TopTop:=Img_Polosa_Top.Height;
   //Строим блоки
   //showmessage(inttostr(count_bc));
   If count_bc<1 then
   begin
     Label_no_bloks.Caption := NoBlocs;
     Label_no_bloks.Visible:=True;
     Label_no_bloks.Left:=(Form1.Width DIV 2) - (Label_no_bloks.Width DIV 2);
     Form1.Height:=Label_no_bloks.Height+Label_no_bloks.Top+Panel_Down.Height+4;
   end
   else
   begin
     for i:=1 to count_bc do
     begin
       //showmessage('o');
     end;
   end;

   //Строим блоки
   FC_BC_Stroy;

end;

function TForm1.FC_ActVars: Integer;
var
  i:integer;
begin
 //Активная вкладка act_tab
  Memo_Din.Lines.Clear;
  Memo_Din.Lines.LoadFromFile(folder_txt+'tabs.ksm');
  //Имя активной вкладки act_tab_NAME
  act_tab:=Memo_Din.Lines[0];
  Memo_Din.Lines.Clear;
  Memo_Din.Lines.LoadFromFile(folder_txt+act_tab+'/index.ksm');
  act_tab_NAME := Memo_Din.Lines[0];
  //Количество блоков
  count_bc:=Memo_Din.Lines.Count-1;
  //_если блоки есть
  if Memo_Din.Lines.Count>1 then
  begin
    //Активный блок act_bc
    act_bc := Memo_Din.Lines[1];
    //Имя активного блока act_bc_NAME
    Memo_Din.Lines.LoadFromFile(folder_txt+act_tab+'/index.ksm');
    Memo_Din.Lines.LoadFromFile(folder_txt+act_tab+'/'+act_bc+'.sm');

    //_Если имя блока присутствует
    if  trim(Memo_Din.Lines[0])  <> '31071990ksm' then
    begin
      act_bc_NAME := Memo_Din.Lines[0];
    end
    else
    begin
      act_bc_NAME := '';
    end;
  end
  else
  begin
    act_bc := '0';
  end;

  //Содержимое активного блока
  Memo_Din.Lines.Delete(0);
  data_bc:=Memo_Din.Text;
end;

function TForm1.FC_BC_Stroy: Integer;
var
   FC:TComponent;
   i,rast:integer;
begin
  //-------------------------------------строим блоки-------------------------//
  FC_ActVars;

  rast:=1; //Растояние между блоками
  for i:=1 to count_bc do
  begin
  //----------------------------------Строим Блоки (img)----------------------//
    Memo_Din.Lines.LoadFromFile(folder_txt+act_tab+'/index.ksm');
    FC:=FindComponent('Imgbl'+Memo_Din.Lines[i]);
    FreeAndNil(FC);
    //////////
    ImageBloki:=TImage.Create(Form1);
    ImageBloki.Parent:=Form1;
    ImageBloki.Left:=3;
    ImageBloki.Height:=LabelObrazec.Height;
    ImageBloki.Top:=(TopTop+rast)+(i-1)*(ImageBloki.Height+rast);//5+i*30+i*2;
    ImageBloki.Constraints.MinWidth:=278-32;
    //ImageBloki.Constraints.MinHeight:=30;
    ImageBloki.Constraints.MaxWidth:=278-16-16;
   // ImageBloki.Constraints.MaxHeight:=30;

    ImageBloki.Name:= 'Imgbl'+Memo_Din.Lines[i];
    ImageBloki.Picture:=zapas_bc1.Picture;//.Bitmap.LoadFromFile('img/skin1/blok-1.bmp');
    ImageBloki.Stretch:=True;
    ImageBloki.Transparent:=True;


  //----------------------------------Строим Блоки (label)--------------------//
  FC:=FindComponent(Memo_Din.Lines[i]);
  FreeAndNil(FC);
    LabelBloki:=TLabel.Create(Form1);
    LabelBloki.Parent:=Form1;
    LabelBloki.Left:=ImageBloki.Left+4;
    LabelBloki.Top:=ImageBloki.Top-2;//BlokTop;//35+VisVklCount*30+VisVklCount*2-30+1;

    LabelBloki.Constraints.MinWidth:=278-16-16;
    LabelBloki.Font.Size:=LabelObrazec.Font.Size;
    LabelBloki.Font.Color:=LabelObrazec.Font.Color;
    LabelBloki.Font.Style:=LabelObrazec.Font.Style;


    LabelBloki.Name:= Memo_Din.Lines[i];
    Memo_E.Lines.LoadFromFile(folder_txt+act_tab +'/'+Memo_Din.Lines[i]+'.sm');

    LabelBloki.Transparent:=True;
    LabelBloki.Constraints.MaxHeight:=LabelObrazec.Height;
    LabelBloki.Constraints.MaxWidth:=280-6-16-17;
    LabelBloki.Constraints.MinHeight:=LabelObrazec.Height+4;
    LabelBloki.WordWrap:=True;

    //Если есть название блока (первая строка в файле), то блок назвать ей
    if (Memo_E.Lines[0]<>'31071990ksm') then
    begin
     LabelBloki.Caption:=Memo_E.Lines[0];
     //LabelBloki.Constraints.MaxHeight:=LabelObrazec.Height;
     //LabelBloki.Font.Size:=LabelObrazec.Font.Size+1;
     LabelBloki.Font.Style:=LabelObrazec.Font.Style+[fsUnderline];
    end
    else
    begin
       Memo_E.Lines.Delete(0);

       LabelBloki.Caption:=Memo_E.Lines.Text;
       //LabelBloki.Constraints.MaxHeight:=LabelObrazec.Height;
    end;
    //События по Label

    LabelBloki.OnMouseDown:=@LabelBloki_MouseDown; //Попап
    LabelBloki.OnMouseLeave:=@LabelBloki_Leave;
    LabelBloki.OnMouseEnter:=@LabelBloki_MM;
    LabelBloki.OnClick:=@LabelBloki_Click;
    LabelBloki.OnDblClick:=@LabelBloki_DbClick;

         //showmessage(LabelBloki.Caption);




    //----------------------------------ImgCopyZam--------------------------------//
    FC:=FindComponent('ImgZam'+Memo_Din.Lines[i]);
    FreeAndNil(FC);
         ImageCopZam:=TImage.Create(Form1);
     ImageCopZam.Parent:=Form1;
     ImageCopZam.Left:=ImageBloki.Left+ImageBloki.Width+2;

     //FCT:=FindComponent('bl1');

     ImageCopZam.Constraints.MinWidth:=26;
     ImageCopZam.Constraints.MinHeight:=26;
     ImageCopZam.Constraints.MaxWidth:=26;
     ImageCopZam.Constraints.MaxHeight:=26;
     ImageCopZam.Top:=ImageBloki.Top+((ImageBloki.Height div 2) - (ImageCopZam.Height div 2));

     ImageCopZam.Name:= 'ImgZam'+(Memo_Din.Lines[i]);
     ImageCopZam.Hint:=Memo_Din.Lines[i];//StrToInt(delete(Memo_Din.Lines[i],1,2));//i;
     //showmessage(delete(Memo_Din.Lines[i],1,2));
     ImageCopZam.Picture:=zapas_copyzam1.Picture;//.Bitmap.LoadFromFile('img/skin1/CopZam.bmp');
     ImageCopZam.Stretch:=True;
     ImageCopZam.Transparent:=True;

     ImageCopZam.OnMouseDown:=@LabelBloki_MouseDown; //Попап
     ImageCopZam.OnClick:=@ImageZam_OnClick;
     ImageCopZam.OnMouseLeave:=@ImageCopZam_OnMouseLeave;
     ImageCopZam.OnMouseEnter:=@ImageCopZam_OnMouseEnter;

    //----------------------------------ImgCop--------------------------------//
    FC:=FindComponent('ImgCop'+Memo_Din.Lines[i]);
    FreeAndNil(FC);

    ImageCop:=TImage.Create(Form1);
    ImageCop.Parent:=Form1;
    ImageCop.Left:=ImageCopZam.Left+ImageCopZam.Width+2;

    //FCT:=FindComponent('bl1');

    ImageCop.Constraints.MinWidth:=16+10;
    ImageCop.Constraints.MinHeight:=16+10;
    ImageCop.Constraints.MaxWidth:=16+10;
    ImageCop.Constraints.MaxHeight:=16+10;
    ImageCop.Top:=ImageCopZam.Top;

    ImageCop.Name:= 'ImgCop'+(Memo_Din.Lines[i]);
    ImageCop.Hint:=Memo_Din.Lines[i];
    ImageCop.Picture:=zapas_copy1.Picture;//.Bitmap.LoadFromFile('img/skin1/copy.bmp');
    ImageCop.Stretch:=True;
    ImageCop.Transparent:=True;


    ImageCop.OnMouseDown:=@LabelBloki_MouseDown; //Попап
    ImageCop.OnClick:=@ImageCop_OnClick;
    ImageCop.OnMouseLeave:=@ImageCop_OnMouseLeave;
    ImageCop.OnMouseEnter:=@ImageCop_OnMouseEnter;


  end;
  if count_bc>0 then
  begin
    Form1.Width:=ImageCop.Left+ImageCop.Width+4;
    Form1.Height:=ImageBloki.Top+ImageBloki.Height+Panel_Down.Height+1;
  end;
end;

function TForm1.FC_FormHide: Integer;
begin
 Form1.Visible:= False;
end;

function TForm1.FC_MyPopapTabs(): Integer;
begin

   //Свой попап (вкладки)

    if Form_Tabs.Visible AND (Form_Tabs.Panel_Down.Visible = False) then
    begin
      Form_Tabs.Close;
    end
    else
    begin
      Form_Tabs.FC_TABSStroy();
      Form_Tabs.Panel_Top.Visible:=False;
      Form_Tabs.Panel_Down.Visible:=False;
      Form_Tabs.Panel_all.Top:=0;
      Form_Tabs.Height:=Form_Tabs.Panel_all.Height-1;
      //Позиция попапа
      Form_Tabs.Left:=Mouse.CursorPos.x - (Form_Tabs.Width);
      Form_Tabs.Top:=Mouse.CursorPos.y;
      //Цвет формы
      //Form_Tabs.Panel_all.Color := $00CAB399;
      //Попказать попап
      Form_Tabs.Show;

      //Стопорим
      if SB_Stop.Tag = 0 then
      begin
           //SB_StopClick(Sender);
      end;
    end;
end;

function TForm1.FC_HideForms: Integer;
begin
 //Скрываем формы
   if Form_NoClose <> 1 then
   begin
     Form_Add.Close;
   end;
    if Form_NoClose <> 2 then
   begin
     Form_Del.Close;
   end;
    if Form_NoClose <> 3 then
    begin
      Form_Open.Close;
    end;
    if Form_NoClose <> 4 then
    begin
      Form_Save.Close;
    end;
    if Form_NoClose <> 5 then
    begin
      Form_Tabs.Close;
    end;
    if Form_NoClose <> 6 then
    begin
      FormSettings.Close;
    end;

end;

function TForm1.FC_DelFormShow(Sender: TObject): Integer;
begin
   FC_HideForms;
  ////////////////
  Unit4.bc_to_DEL := (sender as TLabel).Name;
  Form_Open.Visible:=False;
  Form_Save.Visible:=False;
  Form_Del.Show;
end;

function TForm1.FC_StartWithOS: Integer;
  var
reg: TRegistry;
s:string;
begin
  //Автозагрузка WINDOWS
  if OS = 'WIN' then
  begin
    showmessage(OS);
   reg := TRegistry.Create;
   reg.RootKey := HKEY_CURRENT_USER;
   s:='\Software\Microsoft\Windows\CurrentVersion\Run';
   reg.OpenKey(s, true);
   reg.WriteString('Flybufer3',application.exename);
   reg.CloseKey;
  end;

  //Автозагрузка LINUX
  if OS = 'LIN' then
  begin
   Memo_Din.Clear;
   Memo_Din.Lines.Add('#!/usr/bin/env xdg-open');//+EndString);
   Memo_Din.Lines.Add('[Desktop Entry]');
   Memo_Din.Lines.Add('Type=Application');
   Memo_Din.Lines.Add('Exec="'+ExtractFilePath(application.exename)+'flybufer_3"');
   Memo_Din.Lines.Add('Hidden=false');
   Memo_Din.Lines.Add('X-GNOME-Autostart-enabled=true');
   Memo_Din.Lines.Add('Name[ru]=FlyBufer 3.0 Cross');
   Memo_Din.Lines.Add('Name=FlyBufer 3.0 Cross');
   Memo_Din.Lines.SaveToFile('/home/'+GetEnvironmentVariable('USER')+'/.config/autostart/'+'FlyBufer.desktop');
  end;
end;

function TForm1.FC_NoStartWithOS: Integer;
 var
 reg: TRegistry;
 begin
   //Отмена автозагрузки WINDOWS
   if OS = 'WIN' then
   begin
    reg := TRegistry.Create;
    reg.RootKey := HKEY_CURRENT_USER;
    reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Run', true);
    reg.deletevalue('Flybufer3');
    reg.CloseKey;
   end;

   //Отмена автозагрузки Linux
   if OS = 'LIN' then
   begin
      //Memo_Din.Clear;
      //Memo_Din.Lines.SaveToFile('/home/'+GetEnvironmentVariable('USER')+'/.config/autostart/'+'FlyBufer.desktop');
      DeleteFile('/home/'+GetEnvironmentVariable('USER')+'/.config/autostart/'+'FlyBufer.desktop');
   end;
end;

function TForm1.FC_Settings: Integer;
var
  Ini: TIniFile;
  sr: TSearchRec;
begin
  //НАСТРОЙКИ_________________________________
  //Проверка наличия файла settings.ini
  //Создаем файл settings.ini, если его нет
  Ini := TIniFile.Create(folder_txt+'settings.ini');
  //Если файла txt.ini нет
if FindFirst(folder_txt+'settings.ini', faAnyFile, sr) <> 0 then
begin
  //Пишем переменные
  Ini.WriteString('System', 'autoload', '1'); //Автозагрузка
end;
  //Читаем переменную autoload из settings.ini------------------------------
  autoload := StrToInt(Ini.ReadString('System', 'autoload', '1'));
  if autoload=1 then
  begin
    //showmessage('1');
    FC_StartWithOS;
  end
  else
  begin
    //showmessage('0');
    FC_NoStartWithOS;
  end;
  //Записываем переменную autoload в settings.ini
  Ini.WriteString('System', 'autoload', IntToStr(autoload)); //Автозагрузка

  //Читаем переменную label_size из settings.ini----------------------------
  label_size := StrToInt(Ini.ReadString('System', 'label_size', '9'));
  //Записываем переменную
  Ini.WriteString('System', 'label_size', IntToStr(label_size)); //Размер шрифта

  //Читаем переменную language из settings.ini----------------------------
  language := Ini.ReadString('System', 'language', 'En');
  //Записываем переменную
  Ini.WriteString('System', 'language', language); //Размер шрифта

  //Читаем переменную position_show из settings.ini----------------------------
  position_show := Ini.ReadString('System', 'position_show', 'top');
  //Записываем переменную
  Ini.WriteString('System', 'position_show', position_show); //сверху/снизу
end;

function TForm1.FC_Language: Integer;
begin
 if language = 'Ru' then
 begin
   NoBlocs := 'Вкладка пуста';
   NewTab := 'Новая вкладка';
   Add := 'Новая заметка';
   Paste := 'Вставить';
   PasteInFb := 'Вставить -> FlyBufer';
   PasteFromFb := 'FlyBufer -> вставить';
   Copy := 'Скопировать';
   Settings := 'Настройки';
   TabsManager := 'Диспетчер вкладок';
   Fix := 'Закрепить/Открепить';
   CloseL := 'Закрыть';
   About := 'О программе';
   Del := 'Удалить?';
   Clear := 'Очистить?';
   FormOpen := 'Редактировать блок';
   FormAdd := 'Новый блок';

   autostart := 'Автозарузка';
   lng_lng := 'Language(язык)';
   fontSize_l := 'Размер шрифта'+EndString+'открытой заметки';
   position_l := 'Положение';
 end;
 if language = 'En' then
 begin
   NoBlocs := 'Empty tab';
   NewTab := 'New tab';
   Add := 'New note';
   Paste := 'Paste';
   PasteInFb := 'Paste -> FlyBufer';
   PasteFromFb := 'FlyBufer -> paste';
   Copy := 'Copy';
   Settings := 'Settings';
   TabsManager := 'Tabs Manager';
   Fix := 'Fix/Unfix';
   CloseL := 'Close';
   About := 'About program';
   Del := 'Delete?';
   Clear := 'Clear?';
   FormOpen := 'Edit block';
   FormAdd := 'New block';

   autostart := 'Autostart';
   lng_lng := 'Language(язык)';
   fontSize_l := 'Font size'+EndString+'open note';
   position_l := 'Position';
 end;
end;



//Убираем форму по кнопке
procedure TForm1.Button_FormStroyClick(Sender: TObject);
begin
 FC_FormStroy;
end;

procedure TForm1.FormClick(Sender: TObject);

begin
 //Image1.Click();
 //Form1Click(TForm1.Image1);


end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
 TrayIcon1.Visible:=False;
end;

//Создание формы
procedure TForm1.FormCreate(Sender: TObject);
var
//   s:string;
  Ini: TIniFile;
  sr: TSearchRec;
begin
 //Положение формы
 Form1.Width := 309;
 Form1.Left:= Screen.Width - Form1.Width - 130;
 Form1.Top := 0-Form1.Height;
 FC_FormHide;


 SB_StopTop.Left:=Form1.Width-SB_StopTop.Width-2;
 NoHdeOneSecond := False;

   if EndString = #$0D#$0A then
   begin
     //Showmessage('Windows');
     OS := 'WIN';
     folder_txt := 'txt/';
   end;

   if EndString = #$0A then
   begin
     //Showmessage('Linux');
     OS := 'LIN';
     folder_txt := '/home/'+GetEnvironmentVariable('USER')+'/flybufer/';
   end;


 FC_FormStroy;


   FC_Settings;
   FC_Language;
 //Смещение кнопок img
 //SB_Close.OnMouseWheelDown := @FC_GoTop_Button;
 //SB_Close.OnMouseEnter := @FC_GoDown_Button;

end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
  );
var
   MouseClickCount:integer;
begin
  if (ssCtrl in Shift) and (Key = VK_CONTROL) then   begin

     if (Key = VK_LBUTTON)   then MouseClickCount:= MouseClickCount + 1;

      showmessage(IntToStr(MouseClickCount));



  end;  // Конец условия нажатой CTRL
end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      //При нажатии на блок правой клавишей мышиСвой попап
    if (ssRight in Shift) then
    begin
      FC_MyPopapTabs;
    end;
    //При нажатии на блок ЛНВОЙ клавишей мышиСвой попап
    if (ssLeft in Shift) then
    begin
         Form_Tabs.Close;
    end;
    //При нажатии на блок СРЕДНЕЙ клавишей мышиСвой попап
    if (ssMiddle in Shift) then
    begin
      FC_DelFormShow(sender);
    end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
 Label_no_bloks.Caption := NoBlocs;
 Label_no_bloks.Left:=(Form1.Width DIV 2) - (Label_no_bloks.Width DIV 2);
end;

procedure TForm1.Image1Click(Sender: TObject);

begin
  //SB_SelAddClick(Sender);
  //SB_SelAddClick(Sender);
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
  //Свой попап (вкладки)
  case Button of
  mbRight:
  begin
    //Если попап уже показан
    if Form_Tabs.Visible AND (Form_Tabs.Panel_Down.Visible = False) then
    begin
      Form_Tabs.Close;
    end
    else
    begin
      Form_Tabs.FC_TABSStroy();
      Form_Tabs.Panel_Top.Visible:=False;
      Form_Tabs.Panel_Down.Visible:=False;
      Form_Tabs.Panel_all.Top:=0;
      Form_Tabs.Height:=Form_Tabs.Panel_all.Height;
      //Позиция попапа
      Form_Tabs.Left:=Mouse.CursorPos.x - (Form_Tabs.Width);
      Form_Tabs.Top:=Mouse.CursorPos.y;
      //Цвет формы
      //Form_Tabs.Panel_all.Color := $00CAB399;
      //Попказать попап
      Form_Tabs.Show;

      //Стопорим
      if SB_Stop.Tag = 0 then
      begin
         SB_StopClick(Sender);
      end;
    end;
  end;
  mbLeft:
  begin
    Form_Tabs.Close;
  end;
  end;
end;

procedure TForm1.SB_SettingsClick(Sender: TObject);
begin
 Form_NoClose := 6;
 FC_HideForms;
 Form_NoClose := 0;
 //Настройки
 if FormSettings.Visible then
 begin
   FormSettings.Visible:=False;
 end
 else
 begin
   FormSettings.Visible:=True;
   FormSettings.Left:=Form1.Left - FormSettings.Width-4;
   FormSettings.Top:=4;
 end;

end;

procedure TForm1.SB_SettingsMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 SB_Settings.Top := SB_Settings.Top+1;
 SB_Settings.Left := SB_Settings.Left+1;
end;

procedure TForm1.Img_Polosa_TopClick(Sender: TObject);
begin
  //Имитация щелчка по кнопке замочка
 SB_StopClick(Sender);
end;

procedure TForm1.Img_Polosa_TopMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
  //Щелчек по верхней полосе
  Img_Polosa_Top.Picture:=Image1.Picture;
end;

procedure TForm1.Img_Polosa_TopMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
  //Щелчек по верхней полосе
 Img_Polosa_Top.Picture:=Img_Down.Picture;
end;

procedure TForm1.Label_NameTabClick(Sender: TObject);
begin
 //Щелчек по кнопке замочка
 SB_StopClick(Sender);
end;

procedure TForm1.Label_no_bloksMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
      //При нажатии на блок правой клавишей мышиСвой попап
    if (ssRight in Shift) then
    begin
      FC_MyPopapTabs;
    end;
    //При нажатии на блок ЛНВОЙ клавишей мышиСвой попап
    if (ssLeft in Shift) then
    begin
         Form_Tabs.Close;
    end;
    //При нажатии на блок СРЕДНЕЙ клавишей мышиСвой попап
    if (ssMiddle in Shift) then
    begin
      FC_DelFormShow(sender);
    end;
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
     FormAbout.Show;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.NoHide1SecTimer(Sender: TObject);
begin
  NoHdeOneSecond := False;
  NoHide1Sec.Enabled:=False;
end;

procedure TForm1.SB_AddMouseLeave(Sender: TObject);
begin
 Label_Info_Down.Caption:='FlyBufer 3.0 Cross';
end;

procedure TForm1.SB_AddMouseMove(Sender: TObject; Shift: TShiftState; X,
 Y: Integer);
begin
 Label_Info_Down.Caption:=Unit1.Add;
end;

procedure TForm1.SB_CloseMouseLeave(Sender: TObject);
begin
 Label_Info_Down.Caption:='FlyBufer 3.0 Cross';
end;

procedure TForm1.SB_CloseMouseMove(Sender: TObject; Shift: TShiftState; X,
 Y: Integer);
begin
 Label_Info_Down.Caption:=CloseL;
end;

procedure TForm1.SB_PasteClick(Sender: TObject);
begin
   Form_Add.Memo_Bc_Add.Text:=Clipboard.AsText;
   Form_Add.SB_NewBc_SaveClick(Sender);
end;

procedure TForm1.SB_PasteMouseLeave(Sender: TObject);
begin
 Label_Info_Down.Caption:='FlyBufer 3.0 Cross';
end;

procedure TForm1.SB_PasteMouseMove(Sender: TObject; Shift: TShiftState; X,
 Y: Integer);
begin
 Label_Info_Down.Caption:=Paste;
end;

procedure TForm1.SB_SelAddClick(Sender: TObject);
begin
    //Вставить выделенный текст в FlyBufer
   Form1.Hide;
   Clipboard.AsText := 'not_copy_ksm';
   TimerCopyPaste.Tag := 1;
   TimerCopyPaste.Enabled:=True;
end;

procedure TForm1.SB_SelAddMouseLeave(Sender: TObject);
begin
 Label_Info_Down.Caption:='FlyBufer 3.0 Cross';
end;

procedure TForm1.SB_SelAddMouseMove(Sender: TObject; Shift: TShiftState; X,
 Y: Integer);
begin
 Label_Info_Down.Caption:=PasteInFb;
end;

procedure TForm1.SB_SettingsMouseLeave(Sender: TObject);
begin
 Label_Info_Down.Caption:='FlyBufer 3.0 Cross';
end;

procedure TForm1.SB_SettingsMouseMove(Sender: TObject; Shift: TShiftState; X,
 Y: Integer);
begin
 Label_Info_Down.Caption:=Settings;
end;

procedure TForm1.SB_SettingsMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 SB_Settings.Top := SB_Settings.Top-1;
 SB_Settings.Left := SB_Settings.Left-1;
end;



procedure TForm1.SB_StopClick(Sender: TObject);
begin
 //Щелчек по кнопке замочка
 if SB_Stop.Tag = 0 then
 begin
   SB_Stop.Tag:=1;
   SB_Stop.Picture:=Zapas_Sb_Stop2.Picture;
   SB_StopTop.Visible:=True;
 end
 else
 begin
   SB_Stop.Tag:=0;
   SB_Stop.Picture:=Zapas_Sb_Stop1.Picture;
   SB_StopTop.Visible:=False;
 end;
end;

procedure TForm1.SB_StopMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 SB_Stop.Top := SB_Stop.Top+1;
 SB_Stop.Left := SB_Stop.Left+1;
end;

procedure TForm1.SB_StopMouseLeave(Sender: TObject);
begin
 Label_Info_Down.Caption:='FlyBufer 3.0 Cross';
end;

procedure TForm1.SB_StopMouseMove(Sender: TObject; Shift: TShiftState; X,
 Y: Integer);
begin
 Label_Info_Down.Caption:=Fix;
end;

procedure TForm1.SB_StopMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 SB_Stop.Top := SB_Stop.Top-1;
 SB_Stop.Left := SB_Stop.Left-1;
end;

procedure TForm1.SB_StopTopClick(Sender: TObject);
begin
 //Имитация щелчка по кнопке замочка
 SB_StopClick(Sender);
end;

procedure TForm1.SB_TabsClick(Sender: TObject);
begin
  //Показываем Диспетчер вкладок (щелчек по кнопке)
 Form_NoClose := 5;
 FC_HideForms;
 Form_NoClose := 0;

 If Form_Tabs.Visible then
 begin
   Form_Tabs.Close;
   //Кнопка стоп
   SB_Stop.Tag:=0;
   SB_Stop.Picture:=Zapas_Sb_Stop1.Picture;
   SB_StopTop.Visible:=False;
 end
 else
 begin
   Form_Tabs.FC_TABSStroy();
   //Поожение и цвет
   Form_Tabs.Left:=Form1.Left - Form_Tabs.Width-4;
   Form_Tabs.Top:=4;
   //Form_Tabs.Panel_all.Color:=$00ECE4DC;
   Form_Tabs.Show;
   //Кнопка стоп
   SB_Stop.Tag:=1;
   SB_Stop.Picture:=Zapas_Sb_Stop2.Picture;
   SB_StopTop.Visible:=True;
 end;
end;

procedure TForm1.SB_TabsMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 SB_Tabs.Top := SB_Tabs.Top+1;
 SB_Tabs.Left := SB_Tabs.Left+1;
end;

procedure TForm1.SB_AddClick(Sender: TObject);
begin
 //Появление формы добавления нового блока
 Form_NoClose := 1;
 FC_HideForms;
 Form_NoClose := 0;

 //Размеры и положение при появлении
 if Form_Add.Visible = False then
 begin
    Form_Add.Width := 455;
    Form_Add.Left:=Form1.Left - Form_Add.Width-4;
    Form_Add.Height:=240;
    Form_Add.Top:=4;
 end;

 Form_Add.Memo_Bc_Add.Clear;
 if Form_Add.Visible then
 begin
   Form_Add.Close;
 end
 else
 begin
   FC_ActVars();
   Form_Add.Label_Name_Tab.Caption:=act_tab_Name;
   Form_Add.Edit_Name_Dc_Add.Clear;
   Form_Add.Memo_Bc_Add.Clear;
   Form_Add.Show;
   //Form_Add.Left:=Form1.Left - Form_Add.Width-4;
   //Form_Add.Top:=4;
 end;
end;

procedure TForm1.SB_PasteMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 SB_Paste.Top := SB_Paste.Top+1;
 SB_Paste.Left := SB_Paste.Left+1;
end;

procedure TForm1.SB_PasteMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 SB_Paste.Top := SB_Paste.Top-1;
 SB_Paste.Left := SB_Paste.Left-1;
end;

procedure TForm1.SB_AddMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
  SB_Add.Top := SB_Add.Top+1;
 SB_Add.Left := SB_Add.Left+1;
end;

procedure TForm1.SB_AddMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 SB_Add.Top := SB_Add.Top-1;
 SB_Add.Left := SB_Add.Left-1;
end;

procedure TForm1.SB_CloseClick(Sender: TObject);
begin
 Form1.Close;
end;

procedure TForm1.SB_CloseMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 SB_Close.Top := SB_Close.Top+1;
 SB_Close.Left := SB_Close.Left+1;
end;

procedure TForm1.SB_CloseMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
  SB_Close.Top := SB_Close.Top-1;
 SB_Close.Left := SB_Close.Left-1;
end;

procedure TForm1.SB_SelAddMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 SB_SelAdd.Top := SB_SelAdd.Top+1;
 SB_SelAdd.Left := SB_SelAdd.Left+1;
end;

procedure TForm1.SB_SelAddMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 SB_SelAdd.Top := SB_SelAdd.Top-1;
 SB_SelAdd.Left := SB_SelAdd.Left-1;
end;

procedure TForm1.SB_TabsMouseLeave(Sender: TObject);
begin
 Label_Info_Down.Caption:='FlyBufer 3.0 Cross';
end;

procedure TForm1.SB_TabsMouseMove(Sender: TObject; Shift: TShiftState; X,
 Y: Integer);
begin
 Label_Info_Down.Caption:=TabsManager;
end;

procedure TForm1.SB_TabsMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: Integer);
begin
 SB_Tabs.Top := SB_Tabs.Top-1;
 SB_Tabs.Left := SB_Tabs.Left-1;
end;

end.

