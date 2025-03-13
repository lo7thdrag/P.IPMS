unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unit6, StdCtrls;

type
  TForm1 = class(TForm)
    ygtskmpn1: TYogaTesKomponen;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.FormCreate(Sender: TObject);
begin
  ygtskmpn1.ZeroPosition := 216;
end;

end.
