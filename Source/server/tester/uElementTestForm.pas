unit uElementTestForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,uElement, uDataType;

type
  TfrmElementTest = class(TForm)
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  protected
    FElement : TElement;

    procedure ApplyElement;virtual;
    procedure ElementPropertyChange(Sender : TObject;PropsID : E_PropsID;Value : Byte);overload;virtual;
    procedure ElementPropertyChange(Sender : TObject;PropsID : E_PropsID;Value : Double);overload;virtual;

  public
    { Public declarations }
    procedure SetElement(Element : TElement);
  end;

var
  frmElementTest: TfrmElementTest;

implementation

uses uListener;

{$R *.dfm}

{ TfrmElementTest }

procedure TfrmElementTest.ApplyElement;
begin
  // call in subclass
end;

procedure TfrmElementTest.ElementPropertyChange(Sender: TObject;
  PropsID: E_PropsID; Value: Byte);
begin
  // call in subclass
end;

procedure TfrmElementTest.ElementPropertyChange(Sender: TObject;
  PropsID: E_PropsID; Value: Double);
begin
  // call in subclass
end;

procedure TfrmElementTest.FormDestroy(Sender: TObject);
begin
  FElement.Listeners.Remove('TesterForm');
end;

procedure TfrmElementTest.SetElement(Element: TElement);
begin
  FElement := Element;

  with FElement.Listeners.Add('TesterForm') as TPropertyEventListener do begin
    OnPropertyByteChange := ElementPropertyChange;
    OnPropertyDblChange  := ElementPropertyChange;
  end;

  ApplyElement;
end;

end.
