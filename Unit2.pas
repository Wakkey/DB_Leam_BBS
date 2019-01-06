unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Memo1: TMemo;
    Button3: TButton;
    OpenDialog1: TOpenDialog;
    procedure Button3Click(Sender: TObject);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button3Click(Sender: TObject);
var
  st:TStringlist;
begin
  if not OpenDialog1.Execute then
    exit;
  if not copyfile(
    pchar(OpenDialog1.FileName),
    pchar(ExtractFilePath( ParamStr( 0 ))+  ExtractFileName( OpenDialog1.FileName )),
    true
  ) then
    showmessage('ファイルのコピーに失敗しました');
  st := TStringlist.Create;
  st.Text := ExtractFileName( OpenDialog1.FileName );
  st.SaveToFile(ExtractFilePath( ParamStr( 0 ))+ 'tmp.txt');
  st.Free;
end;

end.
