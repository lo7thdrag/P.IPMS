unit ufrmMimicKey;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, StrUtils;

type
  TfrmMimicKey = class(TForm)
    edtKey: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    btn7: TButton;
    btn8: TButton;
    btn9: TButton;
    btn0: TButton;
    btnBackSp: TButton;
    btnOK: TButton;
    btnCancel: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OnKeyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMimicKey: TfrmMimicKey;

implementation

{$R *.dfm}

procedure TfrmMimicKey.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMimicKey.FormCreate(Sender: TObject);
begin
  // aplicable to app events
  Tag := 290;
end;

procedure TfrmMimicKey.OnKeyClick(Sender: TObject);
begin
  case TButton(Sender).Tag of
    0..9:
    begin
      if Length(edtKey.Text) < 4 then
        edtKey.Text := edtKey.Text + IntToStr(TButton(Sender).Tag);
    end;
    10:
    begin
      if Length(edtKey.Text) > 0 then
        edtKey.Text := MidStr(edtKey.Text,0,Length(edtKey.Text)-1);
    end;
  end;
end;

end.
