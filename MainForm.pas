unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ShellAPI, ExtCtrls, Menus, ActnList;

type
  TMainForm = class(TForm)
    BtnPlay: TSpeedButton;
    BtnNext: TSpeedButton;
    BtnPrev: TSpeedButton;
    TrayIcon1: TTrayIcon;
    PopupMenu1: TPopupMenu;
    Close1: TMenuItem;
    HotKeyActions: TActionList;
    PlayPauseAction: TAction;
    SkipFwdAction: TAction;
    SkipRevAction: TAction;
    procedure FormCreate(Sender: TObject);
    procedure WMHotKey(var Msg: TWMHotKey); message WM_HOTKEY;
    procedure FormDestroy(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure PlayPauseActionExecute(Sender: TObject);
    procedure SkipRevActionExecute(Sender: TObject);
    procedure SkipFwdActionExecute(Sender: TObject);
  private
    { Private declarations }
    procedure SendKeyToItunes(Key: SmallInt);
  public
    { Public declarations }
  end;

var
  Form1: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := False;
  Application.Minimize;
  Self.Hide;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  { Register some global hotkeys so that we
    can control itunes from any app focus }
  RegisterHotKey(Handle, 7471, 0, VK_MEDIA_PREV_TRACK);
  RegisterHotKey(Handle, 7472, 0, VK_MEDIA_PLAY_PAUSE);
  RegisterHotKey(Handle, 7473, 0, VK_MEDIA_NEXT_TRACK);
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  { Unregister because that smells like the right thing to
    do }
  UnregisterHotKey(Handle, 7471);
  UnregisterHotKey(Handle, 7472);
  UnregisterHotKey(Handle, 7473);
end;

procedure TMainForm.SendKeyToItunes(Key: SmallInt);
var hwndiTunes : THandle;
begin
  hwndiTunes := FindWindow('iTunes', nil);
  SendMessage(hwndiTunes, WM_KEYDOWN, Key, 0);
  SendMessage(hwndiTunes, WM_CHAR, Key, 0);
  SendMessage(hwndiTunes, WM_KEYUP, Key, 0);
end;

procedure TMainForm.SkipFwdActionExecute(Sender: TObject);
begin
  SendKeyToItunes(VK_RIGHT);
end;

procedure TMainForm.SkipRevActionExecute(Sender: TObject);
begin
  SendKeyToItunes(VK_LEFT);
end;

procedure TMainForm.TrayIcon1Click(Sender: TObject);
begin
  Application.Restore;
  Application.BringToFront;
  Self.Show;
end;

procedure TMainForm.PlayPauseActionExecute(Sender: TObject);
begin
  SendKeyToiTunes(VK_SPACE);
end;

procedure TMainForm.Close1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMainForm.WMHotKey(var Msg: TWMHotKey);
begin
  case Msg.HotKey of
    7471 : Self.SkipRevActionExecute(nil);
    7472 : Self.PlayPauseActionExecute(nil);
    7473 : Self.SkipFwdActionExecute(nil);
  end;
end;

end.
