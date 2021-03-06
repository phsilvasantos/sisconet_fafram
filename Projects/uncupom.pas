unit uncupom;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  RxCtrls, IniFiles, Printers;

type
  TForm1 = class(TForm)
    RxLabel1: TRxLabel;
    Panel3: TPanel;
    sbGravar: TSpeedButton;
    btnsaida: TBitBtn;
    Label12: TLabel;
    eporta: TEdit;
    Impre: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure sbGravarClick(Sender: TObject);
    procedure btnsaidaClick(Sender: TObject);
    procedure eportaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ImpreChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnsaidaClick(Sender: TObject);
begin
close;
end;

procedure TForm1.eportaClick(Sender: TObject);
begin
   impre.Items.Assign(Printer.Printers);
end;

procedure TForm1.FormCreate(Sender: TObject);
var Arquivo: TIniFile;
begin
  Arquivo:= TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'cupom.ini');
  Impre.Text       := Arquivo.ReadString('IMPRESSORA','NOME',' ');
  Arquivo.Free;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  impre.Items.Assign(Printer.Printers);
end;

procedure TForm1.ImpreChange(Sender: TObject);
begin
   eporta.Text:= IntToStr(impre.ItemIndex);
end;

procedure TForm1.sbGravarClick(Sender: TObject);
var Arquivo: TiniFile;
begin
Arquivo:= TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'cupom.ini');
Arquivo.WriteString('IMPRESSORA','NOME',Impre.Text);
Arquivo.Free;
end;

end.
