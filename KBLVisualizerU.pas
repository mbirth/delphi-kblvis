unit KBLVisualizerU;

interface

uses
  Windows, Forms, Graphics, SysUtils, StrUtils, Spin, ExtCtrls, Dialogs,
  StdCtrls, Controls, Classes, ComCtrls, Grids, Clipbrd;

type
  TKBLEditForm = class(TForm)
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Px00Screen: TImage;
    Memo1: TMemo;
    ButtonOpen: TButton;
    ButtonSave: TButton;
    ButtonSaveAs: TButton;
    ButtonVisualize: TButton;
    Status: TListBox;
    SpinEdit1: TSpinEdit;
    LabelByMarkusBirth: TLabel;
    Unicodes: TStringGrid;
    ButtonNew: TButton;
    TrackR: TTrackBar;
    LabelR: TLabel;
    TrackG: TTrackBar;
    TrackB: TTrackBar;
    LabelG: TLabel;
    LabelB: TLabel;
    ButtonColorInsert: TButton;
    ButtonColorGet: TButton;
    ColorPanel: TPanel;
    LabelColorEditor: TLabel;
    LabelUnicodeTable: TLabel;
    LabelFile: TLabel;
    LabelSyntax: TLabel;
    TimerScroll: TTimer;
    procedure ButtonVisualizeClick(Sender: TObject);
    procedure ButtonOpenClick(Sender: TObject);
    procedure ButtonSaveAsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
    procedure UnicodesKeyPress(Sender: TObject; var Key: Char);
    procedure UnicodesDblClick(Sender: TObject);
    procedure ButtonNewClick(Sender: TObject);
    procedure TrackRChange(Sender: TObject);
    procedure TrackGChange(Sender: TObject);
    procedure TrackBChange(Sender: TObject);
    procedure ButtonColorInsertClick(Sender: TObject);
    procedure ButtonColorGetClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Memo1Change(Sender: TObject);
    procedure TimerScrollTimer(Sender: TObject);
    procedure Memo1Click(Sender: TObject);
    procedure Px00ScreenMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
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

const
  Hexmap = '0123456789ABCDEF';
  unicodefile = 'unicode-index.txt';
  debug = false;
  CRLF = Chr(13)+Chr(10);

type
  TArray = array of string;
  TSelection = record
                 map: integer;
                 row: integer;
                 key: integer;
               end;
  TKey = record
           typ: char;
           value: string;
           width: integer;
           keycap: TColor;
           ink: TColor;
           legend: string;
         end;
  TRow = record
           keys: array of TKey;
           keycap: TColor;
           ink: TColor;
         end;
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

var titlestore: AnsiString;
    exoc: boolean = false;

procedure ClearScreen;
var fn, t1, t2: string;
    tw, th: integer;
    hc, vc: integer;
begin
  fn := ChangeFileExt(Application.ExeName,'.bmp');
  with KBLEditForm.Px00Screen do begin
    if (FileExists(fn)) then begin
      Picture.LoadFromFile(fn);
      Picture.Bitmap.PixelFormat := pf24bit;
    end else begin
      t1 := ExtractFilename(fn);
      t2 := 'not found';
      Canvas.Brush.Color := clWhite;
      Canvas.Brush.Style := bsSolid;
      Canvas.FillRect(Rect(0,0,Width,Height));
      Canvas.Font.Color := clBlack;
      hc := width DIV 2;
      vc := height DIV 2;
      tw := Canvas.TextWidth(t1);
      th := Canvas.TextHeight(t1);
      Canvas.TextOut(hc-tw DIV 2,vc-th,t1);
      tw := Canvas.TextWidth(t2);
      Canvas.TextOut(hc-tw DIV 2,vc+2,t2);
    end;
  end;
end;

procedure Stat(s: string);
begin
  if (debug) then begin
    with KBLEditForm.Status do begin
      Items.Add(s);
      TopIndex := Items.Count-3;
    end;
  end;
end;

procedure UpdateTitle;
begin
  with KBLEditForm do begin
    if (Length(titlestore)=0) then titlestore := Caption;
    if (Length(LabelFile.Caption)>0) then Caption := titlestore + ' - [' + LabelFile.Caption + ']' else Caption := titlestore;
  end;
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

function Split(x, s: string): TArray;
var i,p,o: integer;
    r: TArray;
begin
  i := 0;
  o := 1;
  SetLength(r, 50);
  p := PosEx(s,x,o);
  while (p>0) do begin
    r[i] := Copy(x,o,p-o);
    Inc(i);
    o := p+1;
    p := PosEx(s,x,o);
  end;
  r[i] := Copy(x,o,Length(x)-o+1);
  Inc(i);
  SetLength(r, i);
  Result := r;
end;

function GetCursorPos: TSelection;
var cp, i: integer;
    t: AnsiString;
    test: char;
    m, r, k: integer;
begin
  m := 0;
  r := 0;
  k := 0;
  t := KBLEditForm.Memo1.Lines.Text;
  cp := KBLEditForm.Memo1.SelStart;
  for i:=1 to cp+1 do begin
    test := UpCase(t[i]);
    if ((i=1) OR (Ord(t[i-1])=10)) AND (test='M') then begin
      Inc(m);
      r := 0;
      k := 0;
    end;
    if ((i=1) OR (Ord(t[i-1])=10)) AND (test='R') then begin
      Inc(r);
      k := 0;
    end;
    if ((i=1) OR (Ord(t[i-1])=10)) AND ((test='K') OR (test='L') OR (test='S')) then Inc(k);
  end;
  Result.map := m;
  Result.row := r;
  Result.key := k;
end;

function Hex2Col(h: string): TColor;
var r,g,b: integer;
begin
  h := UpperCase(h);
  r := (Pos(h[1],hexmap)-1)*16 + (Pos(h[2],hexmap)-1);
  g := (Pos(h[3],hexmap)-1)*16 + (Pos(h[4],hexmap)-1);
  b := (Pos(h[5],hexmap)-1)*16 + (Pos(h[6],hexmap)-1);
  Stat('In:'+h+' --- Out r:'+IntToStr(r)+' g:'+IntToStr(g)+' b:'+IntToStr(b));
  Result := rgb(r, g, b);
end;

function Dec2Hex(i: integer): string;
var s: string;
begin
  s := '';
  while i>15 do begin
    s := s + Hexmap[(i MOD 16)+1];
    i := i DIV 16;
  end;
  s := Hexmap[i+1] + s;
  while Length(s) MOD 2>0 do s := '0' + s;
  Result := LowerCase(s);
end;

function Hex2Str(h: string): string;
var c: integer;
    t: widestring;
begin
  h := UpperCase(h);
  c := (Pos(h[1],hexmap)-1)*4096 + (Pos(h[2],hexmap)-1)*256 + (Pos(h[3],hexmap)-1)*16 + (Pos(h[4],hexmap)-1);
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
      l := Split(m[i], ',');
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
          if (rows>0) then SetLength(r.Data[rows-1].keys, keys);
          Inc(rows);
          with r.Data[rows-1] do begin
            SetLength(keys, 100);
            if (Length(l)>2) then keycap := Hex2Col(l[2]) else keycap := r.keycap;
            if (Length(l)>3) then ink := Hex2Col(l[3]) else ink := r.ink;
          end;
          keys := 0;
        end else if (l[0]='L') OR (l[0]='K') OR (l[0]='S') then begin
          with r.Data[rows-1].keys[keys] do begin
            typ := l[0][1];
            value := l[1];
            if (Length(l)>2) then width := StrToInt(l[2]) else width := 1;
            if (Length(l)>3) then keycap := Hex2Col(l[3]) else keycap := r.Data[rows-1].keycap;
            if (Length(l)>4) then ink := Hex2Col(l[4]) else ink := r.Data[rows-1].ink;
            if (Length(l)>5) then legend := l[5] else legend := Hex2Str(l[1]);
          end;
          Inc(keys);
        end;
      end;
    end;
  end;
  if (rows>0) then begin
    SetLength(r.Data[rows-1].keys, keys);
    SetLength(r.Data, rows);
  end;
  Result := r;
end;

function GetKeyRect(map: TMap; i,j: integer): TRect;
const space = 1.5;
var key: TKey;
    dt, dl, db, dr: double; // final rect as double
    mw, mh: double; // keymap width/height
    k, ki: integer; // key-index
begin
  try
    ki := 1;
    for k:=0 to j-1 do ki := ki + map.Data[i].keys[k].width;
    key := map.Data[i].keys[j];
    Stat('map: ('+IntToStr(map.left)+','+IntToStr(map.top)+'),('+IntToStr(map.right)+','+IntToStr(map.bottom)+')');
    mw := map.right-map.left;
    mh := map.bottom-map.top;
    Stat('map: width:'+FloatToStr(mw)+' height:'+FloatToStr(mh));
    dl := map.left + (mw/map.cols) * (ki-1) + space;
    dr := map.left + (mw/map.cols) * (ki-1+key.width) - space;
    dt := map.top + (mh/(map.rows)) * i + space;  // ki=keyindex 1..x; i=row 0..x
    db := map.top + (mh/(map.rows)) * (i+1) - space;
    Result.left := Round(dl);
    Result.right := Round(dr)+1;
    Result.top := Round(dt);
    Result.bottom := Round(db)+1;
  except
    on e: Exception do begin
      ShowMessage('Exception: '+e.Message+CRLF+CRLF+'Something seems to be wrong with this map.');
      exoc := true;
      Exit;
    end;
  end;
end;

procedure KeyRect(map: TMap; i,j,ki: integer; lbl: string; hicol: TColor);
var top, left, bottom, right: integer;  // final rect for key
    tw, th: integer; // Text width/height
    ow, oh: double; // output key width/height
    key: TKey;
    keyrect: TRect;
begin
  try
    key := map.Data[i].keys[j];
    keyrect := GetKeyRect(map, i, j);
    ow := keyrect.Right - keyrect.Left;
    oh := keyrect.Bottom - keyrect.Top;
    left := keyrect.Left;
    right := keyrect.Right;
    top := keyrect.Top;
    bottom := keyrect.Bottom;
    with KBLEditForm.Px00Screen.Canvas do begin
      Brush.Color := map.Data[i].keys[j].keycap;
      Font.Color := map.Data[i].keys[j].ink;
      Pen.Color := hicol;
      Pen.Style := psSolid;
      RoundRect(left, top, right, bottom,(right-left) DIV 4, (bottom-top) DIV 3);
      Brush.Style := bsClear;
      th := TextHeight(key.legend);
      tw := TextWidth(key.legend);
      TextRect(Rect(left,top,right,bottom),Round(left+(ow-tw)/2),Round(top+(oh-th)/2),key.legend);
    end;
  except
    on e: Exception do begin
      ShowMessage('Exception: '+e.Message+CRLF+CRLF+'Something seems to be wrong with this map.');
      exoc := true;
      Exit;
    end;
  end;
end;

procedure VisMap(x: integer; highlight: TSelection);
var m: TArray;
    map: TMap;
    i, j: integer;
    keyindex: integer;
    hicol: TColor;
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
      for j:=0 to Length(map.Data[i].keys)-1 do begin
        if (x=highlight.map) AND (i+1=highlight.row) AND (j+1=highlight.key) then begin
          hicol := clRed;
          Pen.Width := 2;
        end else begin
          hicol := clBlack;
          Pen.Width := 1;
        end;
        Keyrect(map, i, j, keyindex, map.Data[i].keys[j].legend, hicol);
        if (exoc) then begin
          exoc := false;
          Exit;
        end;
        Inc(keyindex, map.Data[i].keys[j].width);
      end;
    end;
  end;
end;

procedure TKBLEditForm.ButtonVisualizeClick(Sender: TObject);
var pos: TSelection;
begin
  ClearScreen;
  pos := GetCursorPos;
  VisMap(SpinEdit1.Value, pos);
  Memo1.SetFocus;
end;

procedure TKBLEditForm.ButtonOpenClick(Sender: TObject);
var r: integer;
begin
  if (Memo1.Modified) then begin
    r := Application.MessageBox('Do you want to save your work first?','Please confirm',MB_YESNO);
    if (r=IDYES) then begin
      if (ButtonSave.Enabled) then ButtonSaveClick(Sender) else ButtonSaveAsClick(Sender);
    end;
  end;
  if (OpenDialog1.Execute) then begin
    Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
    Memo1.Modified := false;
    LabelFile.Caption := ExtractFileName(OpenDialog1.FileName);
    UpdateTitle;
    ButtonSave.Enabled := true;
    SpinEdit1.Value := 1;
    ClearScreen;
  end;
end;

procedure TKBLEditForm.ButtonSaveAsClick(Sender: TObject);
begin
  SaveDialog1.FileName := OpenDialog1.FileName;
  if (SaveDialog1.Execute) then begin
    Memo1.Lines.SaveToFile(SaveDialog1.FileName);
    Memo1.Modified := false;
  end;
end;

procedure AddUnicode(code, desc: AnsiString);
begin
  with KBLEditForm.Unicodes do begin
    RowCount := RowCount + 1;
    Cells[0, RowCount-1] := desc;
    Cells[1, RowCount-1] := code;
  end;
end;

procedure LoadUnicodes;
var f: TextFile;
    t: AnsiString;
    d: integer;
    t2: TArray;
begin
  d := 1;
  with KBLEditForm.Unicodes do begin
    SetLength(t2, 50);
    Cells[0,0] := 'Description';
    Cells[1,0] := 'Unicode';
    if (FileExists(unicodefile)) then begin
      try
        AssignFile(f, unicodefile);
        Reset(f);
        while Not Eof(f) do begin
          ReadLn(f, t);
          t2 := Split(t, Chr(9));
          if (Length(t2[1])>2) then begin
            if (d>0) then Dec(d) else RowCount := RowCount + 1;
            Cells[0, RowCount-1] := Trim(t2[0]);
            Cells[1, RowCount-1] := Trim(t2[1]);
          end;
        end;
        CloseFile(f);
      except
        on e: Exception do ShowMessage('ERROR: Couldn''t load unicode list from '+unicodefile+'. ('+e.Message+')');
      end;
    end;
    AddUnicode('', '-------------- useful PopOnTop codes follow here ---------------');
    AddUnicode('0008', 'BS Backspace');
    AddUnicode('000D', 'CR Carriage Return');
    AddUnicode('F6DC', 'Next - Move cursor to next field');
    AddUnicode('F6DD', 'Prev - Move cursor to previous field');
    AddUnicode('F802', 'Home - Move cursor to start of field/line');
    AddUnicode('F803', 'End - Move cursor to end of field/line');
    AddUnicode('F807', 'Left - Move cursor left one character');
    AddUnicode('F808', 'Right - Move cursor right one character');
    AddUnicode('F809', 'Up - Move cursor up one character');
    AddUnicode('F80A', 'Down - Move cursor down one character');
    AddUnicode('F7FE', 'Horizontal - Move keyboard horizontally');
    AddUnicode('F7FF', 'Vertical - Move keyboard vertically');
  end;
end;

procedure TKBLEditForm.FormCreate(Sender: TObject);
begin
  if (debug) then Status.Visible := true;
  TimerScroll.Enabled := false;
  LabelFile.Caption := '';
  LabelSyntax.Caption := '';
  ClearScreen;
  LoadUnicodes;
end;

procedure TKBLEditForm.ButtonSaveClick(Sender: TObject);
begin
  if (Length(OpenDialog1.FileName)>0) then begin
    Memo1.Lines.SaveToFile(OpenDialog1.FileName);
    Memo1.Modified := false;
  end;
end;

procedure TKBLEditForm.UnicodesKeyPress(Sender: TObject; var Key: Char);
var i: integer;
    s: TGridRect;
begin
  for i:=1 to Unicodes.RowCount-1 do begin
    if (UpCase(Unicodes.Cells[0,i][1])=UpCase(Key)) then begin
      s.Left := 0;
      s.Right := 1;
      s.Top := i;
      s.Bottom := i;
      Unicodes.Selection := s;
      Unicodes.TopRow := i;
      Break;
    end;
  end;
end;

procedure InsertIntoMemo(x: AnsiString);
var m: AnsiString;
    ss, sl: longint;
    tmp: TClipboard;
begin
  tmp := Clipboard;
  with KBLEditForm.Memo1 do begin
    m := Lines.Text;
    ss := SelStart;
    sl := SelLength;
    if (sl>0) then begin
      CutToClipboard;
      // Delete(m, ss+1, sl);
    end;
{    Insert(x, m, ss+1);
    Lines.Text := m; }
    Clipboard.SetTextBuf(PChar(x));
    PasteFromClipboard;
    SelStart := ss;
    SelLength := Length(x);
    SetFocus;
  end;
  SetClipboard(tmp);
end;

procedure TKBLEditForm.UnicodesDblClick(Sender: TObject);
var s: TGridRect;
    r: integer;
    c: string;
begin
  s := Unicodes.Selection;
  r := s.Top;
  c := Unicodes.Cells[1,r];
  InsertIntoMemo(c);
end;

procedure TKBLEditForm.ButtonNewClick(Sender: TObject);
begin
  if (Memo1.Modified) then if (Application.MessageBox('Are you sure to clear everything?', 'Please confirm', MB_YESNO)=IDNO) then Exit;
  Memo1.Clear;
  Memo1.SetFocus;
  ButtonSave.Enabled := false;
  Memo1.Modified := false;
  LabelFile.Caption := '';
  UpdateTitle;
end;

procedure UpdateColor;
var r,g,b: integer;
begin
  with KBLEditForm do begin
    r := TrackR.Position;
    g := TrackG.Position;
    b := TrackB.Position;
    ColorPanel.Caption := Dec2Hex(r)+Dec2Hex(g)+Dec2Hex(b);
    ColorPanel.Color := rgb(r,g,b);
    ColorPanel.Font.Color := rgb(r XOR $FF, g XOR $FF, b XOR $FF);
  end;
end;

procedure UpdateColorFromHex(s: string);
var col: TColor;
    r,g,b: integer;
begin
  with KBLEditForm do begin
    col := Hex2Col(s);
    r := (col AND $0000FF);
    g := (col AND $00FF00) DIV $FF;
    b := (col AND $FF0000) DIV $FFFF;
    TrackR.Position := r;
    TrackG.Position := g;
    TrackB.Position := b;
    ColorPanel.Color := col;
    ColorPanel.Font.Color := col XOR $FFFFFF;
  end;
end;

procedure TKBLEditForm.TrackRChange(Sender: TObject);
begin
  UpdateColor;
end;

procedure TKBLEditForm.TrackGChange(Sender: TObject);
begin
  UpdateColor;
end;

procedure TKBLEditForm.TrackBChange(Sender: TObject);
begin
  UpdateColor;
end;

procedure TKBLEditForm.ButtonColorInsertClick(Sender: TObject);
begin
  InsertIntoMemo(ColorPanel.Caption);
end;

function StringIsNum(s: string): boolean;
var i: integer;
begin
  for i:=1 to Length(s) do begin
    if Pos(UpCase(s[i]),Hexmap)=0 then begin
      Result := false;
      Exit;
    end;
  end;
  Result := true;
end;

procedure TKBLEditForm.ButtonColorGetClick(Sender: TObject);
var s: AnsiString;
begin
  s := Copy(Memo1.Lines.Text, Memo1.SelStart+1, Memo1.SelLength);
  if (Length(s)=6) AND (StringIsNum(s)) then begin
    UpdateColorFromHex(s);
  end else begin
    ShowMessage('Please select a color value first. (6-digit hexadecimal number)');
  end;
end;


procedure TKBLEditForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (Memo1.Modified) then begin
    CanClose := (Application.MessageBox('You have not saved your work. Are you sure to quit?', 'Please confirm', MB_YESNO)=IDYES);
  end;
end;

function GetFirstCharInLine(s: AnsiString; i: integer): char;
var j: integer;
begin
  Result := Chr(0);
  for j:=i downto 1 do begin
    if (Ord(s[j])=13) OR (Ord(s[j])=10) then Break;
    Result := s[j];
  end;
end;

procedure SetSyntax(s: AnsiString);
var tw: integer;
begin
  with KBLEditForm do begin
    if (s<>'') then s := 'Syntax: ' + s;
    LabelSyntax.Caption := s;
    Px00Screen.Canvas.Font := LabelSyntax.Font;
    tw := Px00Screen.Canvas.TextWidth(s);
    if (tw>LabelSyntax.Width) then TimerScroll.Enabled := true else TimerScroll.Enabled := false;
  end;
end;

function GetHelpByKey(x: char): AnsiString;
begin
  case UpCase(x) of
    'T': Result := 'T,Title Text';
    'M': Result := 'M,landscape,full,top,left,bottom,right,rows,cols,top,left,bottom,right,keycap,ink,highlight,background';
    'R': Result := 'R,keycap,ink';
    'K': Result := 'K,value,width,keycap,ink,legend';
    'L': Result := 'L,map,width,keycap,ink,legend';
    'S': Result := 'S,map,width,keycap,ink,legend';
    '!': Result := '! Helpful Text';
  else
    Result := '';
  end;
end;

procedure TKBLEditForm.Memo1Change(Sender: TObject);
var x: char;
begin
  x := GetFirstCharInLine(Memo1.Lines.Text, Memo1.SelStart);
  SetSyntax(GetHelpByKey(x));
end;

procedure TKBLEditForm.TimerScrollTimer(Sender: TObject);
var x: AnsiString;
begin
  x := LabelSyntax.Caption;
  if (Pos(' +++ ',x)=0) then x := x + ' +++ ';
  LabelSyntax.Caption := Copy(x,2,Length(x)-1)+x[1];
end;

procedure TKBLEditForm.Memo1Click(Sender: TObject);
begin
  Memo1Change(Sender);
end;

function GetClickedKey(mapnum, x, y: integer): TSelection;
var m: TArray;
    map: TMap;
    keyrect: TRect;
    i,j: integer;
    found: boolean;
begin
  m := GetMap(mapnum);
  map := ParseMap(m);
  Result.map := 0;
  Result.row := 0;
  Result.key := 0;
  found := false;
  for i:=0 to Length(map.Data)-1 do begin
    for j:=0 to Length(map.Data[i].keys)-1 do begin
      keyrect := GetKeyRect(map, i, j);
      if (x>=keyrect.Left) AND (x<=keyrect.Right) AND (y>=keyrect.Top) AND (y<=keyrect.Bottom) then begin
        Result.map := mapnum;
        Result.row := i+1;
        Result.key := j+1;
        found := true;
        Break;
      end;
    end;
    if (found) then Break;
  end;
end;

procedure MemoJumpTo(map, row, key: integer);
var t: AnsiString;
    i: integer;
    test: char;
begin
  with KBLEditForm.Memo1 do begin
    t := Lines.Text;
    for i:=1 to Length(t) do begin
      test := UpCase(t[i]);
      if (i>1) AND (Ord(t[i-1])=10) then begin
        if (test='M') AND (map>0) then map := map - 1;
        if (test='R') AND (map=0) AND (row>0) then row := row - 1;
        if ((test='K') OR (test='L') OR (test='S')) AND (map=0) AND (row=0) AND (key>0) then key := key - 1;
      end;
      if (map=0) AND (row=0) AND (key=0) then begin
        SelStart := i-1;
        SetFocus;
        Break;
      end;
    end;
  end;
end;

procedure TKBLEditForm.Px00ScreenMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var sel: TSelection;
begin
  if (Button=mbLeft) AND (Shift=[ssLeft]) then begin
    sel := GetClickedKey(SpinEdit1.Value,x,y);
    if (sel.map>0) then begin
      MemoJumpTo(sel.map, sel.row, sel.key);
    end;
  end;
end;

end.
