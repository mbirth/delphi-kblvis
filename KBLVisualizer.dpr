program KBLVisualizer;

uses
  Forms,
  KBLVisualizerU in 'KBLVisualizerU.pas' {KBLEditForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'PopOnTop Keyboard Layout Visualizer';
  Application.CreateForm(TKBLEditForm, KBLEditForm);
  Application.Run;
end.
