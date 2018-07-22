unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, Uni232C;

type
  TMainForm = class(TForm)
    Uni232C1: TUni232C;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { private êÈåæ }
  public
    { public êÈåæ }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}


const CRLF = UTF8String(#13#10);



const

 GsQr : array [0..9] of byte = ( $1D,$78,$4C,$06,BYTE('D'),BYTE('E'),BYTE('L'),BYTE('P'),BYTE('H'),BYTE('I') );

procedure TMainForm.Button1Click(Sender: TObject);
var
Str: UTF8String;
begin
  Uni232c1.BaudRate := 9600;

  if( not Uni232c1.Connect ) then
                                      Uni232c1.Open;

{$ifdef MSWINDOWS}
  Str := CRLF+CRLF+CRLF+CRLF;
  Uni232c1.Write(Length(Str),@str[1]);
  Str := 'HELLO DELPHI'+CRLF;
  Uni232c1.Write(Length(Str),@str[1]);
  Uni232c1.Write(sizeof(GsQr),@GsQr);
  Str := CRLF+CRLF+CRLF+CRLF;
  Uni232c1.Write(Length(Str),@str[1]);
{$else}
  Str := CRLF+CRLF+CRLF+CRLF;
  Uni232c1.Write(Length(Str),@str[0]);
  Str := 'HELLO DELPHI'+CRLF;
  Uni232c1.Write(Length(Str),@str[0]);
  Uni232c1.Write(sizeof(GsQr),@GsQr);
  Str := CRLF+CRLF+CRLF+CRLF;
  Uni232c1.Write(Length(Str),@str[0]);
{$endif}
end;



procedure TMainForm.FormDestroy(Sender: TObject);
begin
  if( Uni232c1.Connect ) then
                                      Uni232c1.Close;

end;

end.
