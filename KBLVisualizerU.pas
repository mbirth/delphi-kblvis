unit KBLEditU;

interface

uses
  Windows, Forms, Graphics, SysUtils, StrUtils, Spin, ExtCtrls, Dialogs,
  StdCtrls, Controls, Classes;

type
  TKBLEditForm = class(TForm)
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Px00Screen: TImage;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Stat: TListBox;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KBLEditForm: TKBLEditForm;
  Screenshot: TBitmap;

implementation

{$R *.dfm}

type
  TArray = array of string;
  TKey = record
           typ: char;
           value: string;
           width: integer;
           keycap: TColor;
           ink: TColor;
           legend: string;
         end;
  TRow = array of TKey;
  TMap = record
           landscape: boolean;
           fullscreen: boolean;
           top, left, bottom, right: integer;
           rows, cols: integer;
           otop, oleft, obottom, oright: integer;
           keycap: TColor;
           ink: TColor;
           highlight: TColor;
           background: TColor;
           Data: array of TRow;
         end;

procedure ClearScreen;
begin
  KBLEditForm.Px00Screen.Picture.LoadFromFile(ChangeFileExt(Application.ExeName,'.bmp'));
end;

function GetMap(x: integer): TArray;
var i,j: integer;
    t: string;
    r: TArray;
begin
  i := 0;
  SetLength(r, 200);
  for j:=0 to KBLEditForm.Memo1.Lines.Count do begin
    t := KBLEditForm.Memo1.Lines.Strings[j];
    if (Length(t)>0) then begin
      if (UpCase(t[1])='M') AND (x>0) then Dec(x)
      else if (UpCase(t[1])='M') AND (x<=0) then Break;
    end;
    if (x=0) then begin
      r[i] := t;
      Inc(i);
    end;
  end;
  SetLength(r, i);
  Result := r;
end;

function Split(x: string): TArray;
var i,p,o: integer;
    r: TArray;
begin
  i := 0;
  o := 1;
  SetLength(r, 50);
  p := PosEx(',',x,o);
  while (p>0) do begin
    r[i] := Copy(x,o,p-o);
    Inc(i);
    o := p+1;
    p := PosEx(',',x,o);
  end;
  r[i] := Copy(x,o,Length(x)-o+1);
  Inc(i);
  SetLength(r, i);
  Result := r;
end;

function Hex2Col(h: string): TColor;
const Hexmap = '0123456789ABCDEF';
var r,g,b: integer;
begin
  h := UpperCase(h);
  r := (Pos(h[1],hexmap)-1)*16 + (Pos(h[2],hexmap)-1);
  g := (Pos(h[3],hexmap)-1)*16 + (Pos(h[4],hexmap)-1);
  b := (Pos(h[5],hexmap)-1)*16 + (Pos(h[6],hexmap)-1);
//  KBLEditForm.Stat.Items.Add('In:'+h+' --- Out r:'+IntToStr(r)+' g:'+IntToStr(g)+' b:'+IntToStr(b));
  Result := rgb(r, g, b);
end;

function Hex2Str(h: string): string;
const Hexmap = '0123456789ABCDEF';
var c: integer;
    t: string;
begin
  h := UpperCase(h);
  c := (Pos(h[3],hexmap)-1)*16 + (Pos(h[4],hexmap)-1);
  t := Chr(c);
  Result := t;
end;

function ParseMap(m: TArray): TMap;
var i, rows, keys: integer;
    l: TArray;
    r: TMap;
begin
  SetLength(r.Data, 100);
  SetLength(l, 100);
  rows := 0;
  keys := 0;
  for i:=0 to Length(m)-1 do begin
    if (Length(m[i])>0) then begin
      l := Split(m[i]);
      if Length(l)>0 then begin
        if (l[0]='M') then begin
          if (Length(l)=17) then begin
            if (l[1]='0') then r.landscape := false else r.landscape := true;
            if (l[2]='0') then r.fullscreen := false else r.fullscreen := true;
            r.top := StrToInt(l[3]);
            r.left := StrToInt(l[4]);
            r.bottom := StrToInt(l[5]);
            r.right := StrToInt(l[6]);
            r.rows := StrToInt(l[7]);
            r.cols := StrToInt(l[8]);
            r.otop := StrToInt(l[9]);
            r.oleft := StrToInt(l[10]);
            r.obottom := StrToInt(l[11]);
            r.oright := StrToInt(l[12]);
            r.keycap := Hex2Col(l[13]);
            r.ink := Hex2Col(l[14]);
            r.highlight := Hex2Col(l[15]);
            r.background := Hex2Col(l[16]);
          end;
        end else if (l[0]='R') then begin
          if (rows>0) then SetLength(r.Data[rows-1], keys);
          Inc(rows);
          SetLength(r.Data[rows-1], 100);
          keys := 0;
        end else if (l[0]='L') OR (l[0]='K') OR (l[0]='S') then begin
          with r.Data[rows-1][keys] do begin
            typ := l[0][1];
            value := l[1];
            if (Length(l)>2) then width := StrToInt(l[2]) else width := 1;
            if (Length(l)>3) then keycap := Hex2Col(l[3]) else keycap := r.keycap;
            if (Length(l)>4) then ink := Hex2Col(l[4]) else ink := r.ink;
            if (Length(l)>5) then legend := l[5] else legend := Hex2Str(l[1]);
          end;
          Inc(keys);
        end;
      end;
    end;
  end;
  if (rows>0) then begin
    SetLength(r.Data[rows-1], keys);
    SetLength(r.Data, rows);
  end;
  Result := r;
end;

procedure KeyRect(map: TMap; i,j,ki: integer; lbl: string);
const space = 3;
var top, left, bottom, right: integer;
    kw, kh: integer;
    hc, vc: integer;
    key: TKey;
begin
  key := map.Data[i][j];
  hc := map.left + Round((map.right-map.left)/(map.cols+1)) * ki;
  vc := map.top + Round((map.bottom-map.top)/(map.rows+1)) * (i+1);
  kw := Round(( map.right - map.left ) / (map.cols+1)) - space;
  kh := Round(( map.bottom - map.top ) / (map.rows+1)) - space;
  left := hc - Round(kw/2);
  right := hc + Round(kw/2) + (key.width-1)*(kw+space);
  top := vc - Round(kh/2);
  bottom := vc + Round(kh/2);
  with KBLEditForm.Px00Screen.Canvas do begin
    Brush.Color := map.Data[i][j].keycap;
    Font.Color := map.Data[i][j].ink;
    Rectangle(left, top, right+1, bottom+1);
    TextRect(Rect(left,top,right+1,bottom+1),hc-2,vc-Round(kh/2),key.legend);
  end;
end;

procedure VisMap(x: integer);
var m: TArray;
    map: TMap;
    i, j: integer;
    keyindex: integer;
begin
  SetLength(m, 200);
  SetLength(map.Data, 200);
  m := GetMap(x);
  map := ParseMap(m);
  with KBLEditForm.Px00Screen.Canvas do begin
    Brush.Style := bsSolid;
    Brush.Color := map.background;
    Pen.Color := clBlack;
    Font.Name := 'Arial';
    Font.Color := clBlack;
    Font.Size := 8;
    Rectangle(Rect(map.oleft, map.otop, map.oright+1, map.obottom+1));
    FillRect(Rect(map.left, map.top, map.right+1, map.bottom+1));
    for i:=0 to Length(map.Data)-1 do begin
      keyindex := 1;
      for j:=0 to Length(map.Data[i])-1 do begin
        Keyrect(map, i, j, keyindex, map.Data[i][j].legend);
        Inc(keyindex, map.Data[i][j].width);
      end;
    end;
  end;
end;

procedure TKBLEditForm.Button4Click(Sender: TObject);
begin
  ClearScreen;
  VisMap(SpinEdit1.Value);
end;

procedure TKBLEditForm.Button1Click(Sender: TObject);
begin
  if (OpenDialog1.Execute) then begin
    Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
    Button2.Enabled := true;
  end;
end;

procedure TKBLEditForm.Button3Click(Sender: TObject);
begin
  if (SaveDialog1.Execute) then begin
    Memo1.Lines.SaveToFile(SaveDialog1.FileName);
  end;
end;

procedure TKBLEditForm.FormCreate(Sender: TObject);
begin
  ClearScreen;
end;

procedure TKBLEditForm.Button2Click(Sender: TObject);
begin
  Memo1.Lines.SaveToFile(OpenDialog1.FileName);
end;

end.
