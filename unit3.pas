unit Unit3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    edtbeli: TEdit;
    edtgambar: TEdit;
    edtjual: TEdit;
    edtkategori: TEdit;
    edtnama: TEdit;
    edtstok: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    SQLQuery1: TSQLQuery;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form3: TForm3;

implementation

{$R *.lfm}

{ TForm3 }

procedure TForm3.FormCreate(Sender: TObject);
begin
  edtkategori.Text := SQLQuery1.FieldByName('kategori').AsString;
  edtnama.Text := SQLQuery1.FieldByName('nama').AsString;
  edtbeli.Text := SQLQuery1.FieldByName('harga_beli').AsString;
  edtjual.Text := SQLQuery1.FieldByName('harga_jual').AsString;
  edtstok.Text := SQLQuery1.FieldByName('stok').AsString;
  edtgambar.Text := SQLQuery1.FieldByName('gambar').AsString;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
  try

    with SQLQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE data_barang SET kategori=:kategori, nama=:nama, gambar=:gambar,');
      SQL.Add('harga_beli=:harga_beli, harga_jual:=harga_jual, stok:=stok)');
      SQL.Add('WHERE id=:id');
      Params.ParamByName('kategori').AsString:=edtkategori.Text;
      Params.ParamByName('nama').AsString:=edtnama.Text;
      Params.ParamByName('harga_beli').AsInteger:=StrToint(edtbeli.Text);
      Params.ParamByName('harga_jual').AsInteger:=StrToint(edtjual.Text);
      Params.ParamByName('stok').AsInteger:=StrToint(edtstok.Text);
      Params.ParamByName('gambar').AsString:=edtgambar.Text;
      Params.ParamByName('id').AsInteger:=idBarang;
      ExecSQL;

      ShowMessage('Data Berhasil Ditambah.');
      edtnama.Text:='';
      edtbeli.Text:='';
      edtjual.Text:='';
      edtstok.Text:='';
      edtgambar.Text:='';
    end;

  except
    on E: Exception do
    ShowMessage('Terjadi kesalahan: '+E.Message);
  end;
end;

end.

