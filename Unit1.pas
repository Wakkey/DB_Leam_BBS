unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Data.Win.ADODB, Vcl.Samples.Spin;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    DBMemo1: TDBMemo;
    Panel4: TPanel;
    DBText2: TDBText;
    DBText1: TDBText;
    DBText3: TDBText;
    Button1: TButton;
    Button2: TButton;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    Panel5: TPanel;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    SpinEdit1: TSpinEdit;
    Button6: TButton;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Button7: TButton;
    CheckBox3: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
  private
    { Private 宣言 }
    function EncodeFile(fName:string):string;
    procedure DecodeFile(Fname,Data:ansistring);
  public
    { Public 宣言 }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2, Unit3,
     EncdDecd,Jpeg,ShellAPI;

procedure TForm1.Button3Click(Sender: TObject);
begin
  DecodeFile(
    ADOQuery1.FieldByName('PICNAME').AsString,
    ExtractFilePath( ParamSTR(0) ) +
    ADOQuery1.FieldByName('PIC').AsString
  );

   ShellExecute(Handle, 'OPEN', 'explorer.exe',
                PChar('"'+
                  ExtractFilePath( ParamSTR(0) ) +
                  ADOQuery1.FieldByName('PICNAME').AsString
                +'"'),
                PChar('"'+ ExtractFilePath( ParamSTR(0) )+'"'),
                 SW_NORMAL);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  Frm:TForm2;
  no,follow:integer;
  st:Tstringlist;
begin

  tryStrToInt(ADOQuery1.FieldByName('NO').AsString,follow);

  Frm := TForm2.Create(self);
  Frm.Caption := ADOQuery1.FieldByName('TITLE').AsString + 'の記事をフォローする';
  if Frm.ShowModal = mrOK then begin
    ADOQuery1.Open;
    tryStrToInt(ADOQuery1.RecordCount.ToString,no);
    ADOQuery1.Close;

    if not FileExists(ExtractFilePath( ParamStr( 0 ))+ 'tmp.txt') then begin
      ADOQuery1.SQL.Text :=
        'insert into bbs( no,title,contents,follow ) values( '+ Chr(13) +
        no.ToString + ' , "' +
        Frm.Edit1.Text + '" , "' +
        Frm.Memo1.Text + '" , ' +
        follow.ToString + Chr(13) +
        ' );';
      //showmessage(ADOQuery1.SQL.Text);
      ADOQuery1.ExecSQL;

    end else begin

      st := Tstringlist.Create;
      st.LoadFromFile(ExtractFilePath( ParamStr( 0 ))+ 'tmp.txt');

      if not FileExists(ExtractFilePath( ParamStr( 0 ))+ st[0]) then begin
        showmessage('添付ファイルを取り込めませんでした。');
        exit;
      end;



      ADOQuery1.SQL.Text :=
        'insert into bbs( no,title,contents,pic,picname,follow ) values( '+ Chr(13) +
        no.ToString + ' , "' +
        Frm.Edit1.Text + '" , "' +
        Frm.Memo1.Text + '" , "' +
        EncodeFile(ExtractFilePath( ParamStr( 0 ))+ st[0])   + '" , "' +
        st[0]   + '" , ' +
        follow.ToString + Chr(13) +
        ' );';
      //showmessage(ADOQuery1.SQL.Text);
      ADOQuery1.ExecSQL;
      //if not DeleteFile(ExtractFilePath( ParamStr( 0 ))+ 'tmp.txt') then
        showmessage('一時ファイルの削除に失敗しました');
      //if not DeleteFile(ExtractFilePath( ParamStr( 0 ))+ st[0]) then
        showmessage('一時ファイルの削除に失敗しました');
    end;
  end;
  ADOQuery1.Close;
  ADOQuery1.SQL.Text := 'SELECT * FROM yuhi.bbs;';
  ADOQuery1.Open;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Text := 'SELECT * FROM YUHI.BBS WHERE FOLLOW= "' +
    SpinEdit1.Text + '" OR NO= "' + SpinEdit1.Text + '" ;';
  ADOQuery1.Open;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Text := 'SELECT * FROM yuhi.bbs;';
  ADOQuery1.Open;
end;

procedure TForm1.Button7Click(Sender: TObject);
var
  s:string;
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Text := 'SELECT * FROM YUHI.BBS WHERE ';
  if CheckBox1.Checked then begin
    s := 'TITLE LIKE "%' + Edit1.Text + '%"';
  end;
  if CheckBox2.Checked then begin
    if s <> '' then
      s := s + ' or ';
    s := s + 'CONTENTS LIKE "%' + Edit1.Text + '%"';
  end;
  if CheckBox3.Checked then begin
    if s <> '' then
      s := s + ' or ';
    s := s + 'PICNAME LIKE "%' + Edit1.Text + '%"';
  end;
  ADOQuery1.SQL.Text := ADOQuery1.SQL.Text + s + ';';
  ADOQuery1.Open;
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
var
  no:integer;
  txt:string;
  Frm:TForm3;
begin
  tryStrToInt(ADOQuery1.FieldByName('NO').ToString,no);
  ADOQuery3.Parameters[0].Value := no;
  ADOQuery3.Parameters[1].Value := no;
  ADOQuery3.Open;
  if not ADOQuery3.Eof then begin
    txt := '============='#13#10 +
    ADOQuery3.FieldByName('TITLE').AsString + #13#10 +
    '============='#13#10 +
    ADOQuery3.FieldByName('CONTENTS').AsString + #13#10;
    ADOQuery3.Next;
  end;
  while not ADOQuery3.Eof do begin
    txt := txt + '==フォロー記事=='#13#10 +
    ADOQuery3.FieldByName('TITLE').AsString + #13#10 +
    '============='#13#10 +
    ADOQuery3.FieldByName('CONTENTS').AsString + #13#10;
    ADOQuery3.Next;
  end;
  ADOQuery3.Close;

  Frm := TForm3.Create(Self);
  Frm.Memo1.Lines.Text := txt;
  Frm.ShowModal;
  Frm.Free;
end;

function Tform1.EncodeFile(fName:string):string;
var
  Stream: TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  Stream.LoadFromFile(fName);
  EncodeFile := EncodeBase64(Stream.Memory, stream.Size);
  Stream.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Text := 'SELECT * FROM yuhi.bbs;';
  ADOQuery1.Open;
end;

procedure TForm1.DecodeFile(Fname,Data:ansistring);
var
  Stream: TFileStream;
  B: TBytes;
begin
  Stream := TFileStream.Create(Fname, fmCreate);
  B := DecodeBase64(Data);
  Stream.Write(B[0], Length(B));
  Stream.Free;
end;


procedure TForm1.Button1Click(Sender: TObject);
var
  Frm:TForm2;
  no:integer;
  st:Tstringlist;
begin
  Frm := TForm2.Create(self);
  if Frm.ShowModal = mrOK then begin
    ADOQuery1.Open;
    tryStrToInt(ADOQuery1.RecordCount.ToString,no);
    ADOQuery1.Close;

    if not FileExists(ExtractFilePath( ParamStr( 0 ))+ 'tmp.txt') then begin
      ADOQuery1.SQL.Text :=
        'insert into bbs( no,title,contents,follow ) values( '+ Chr(13) +
        no.ToString + ' , "' +
        Frm.Edit1.Text + '" , "' +
        Frm.Memo1.Text + '" , ' +
          ' -1 ' + Chr(13) +
        ' );';
      //showmessage(ADOQuery1.SQL.Text);
      ADOQuery1.ExecSQL;

    end else begin

      st := Tstringlist.Create;
      st.LoadFromFile(ExtractFilePath( ParamStr( 0 ))+ 'tmp.txt');

      if not FileExists(ExtractFilePath( ParamStr( 0 ))+ st[0]) then begin
        showmessage('添付ファイルを取り込めませんでした。');
        exit;
      end;



      ADOQuery1.SQL.Text :=
        'insert into bbs( no,title,contents,pic,picname,follow ) values( '+ Chr(13) +
        no.ToString + ' , "' +
        Frm.Edit1.Text + '" , "' +
        Frm.Memo1.Text + '" , "' +
        EncodeFile(ExtractFilePath( ParamStr( 0 ))+ st[0])   + '" , "' +
        st[0]   + '" , ' +
        ' -1 ' + Chr(13) +
        ' );';
      //showmessage(ADOQuery1.SQL.Text);
      ADOQuery1.ExecSQL;
      if not DeleteFile(ExtractFilePath( ParamStr( 0 ))+ 'tmp.txt') then
        showmessage('一時ファイルの削除に失敗しました');
      if not DeleteFile(ExtractFilePath( ParamStr( 0 ))+ st[0]) then
        showmessage('一時ファイルの削除に失敗しました');
    end;
  end;
  ADOQuery1.Close;
  ADOQuery1.SQL.Text := 'SELECT * FROM yuhi.bbs;';
  ADOQuery1.Open;
end;

end.
