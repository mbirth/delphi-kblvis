program KBLEdit;

uses
  Forms,
  KBLEditU in 'KBLEditU.pas' {KBLEditForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'PopOnTop Keyboard Layout Editor';
  Application.CreateForm(TKBLEditForm, KBLEditForm);
  Application.Run;
end.
