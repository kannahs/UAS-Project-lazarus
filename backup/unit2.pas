unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { Tform2 }

  Tform2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    edtkategori: TEdit;
    edtnama: TEdit;
    edtbeli: TEdit;
    edtjual: TEdit;
    edtstok: TEdit;
    edtgambar: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    SQLQuery1: TSQLQuery;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  form2: Tform2;

implementation

{$R *.lfm}

{ Tform2 }

procedure Tform2.Button1Click(Sender: TObject);
begin
  try

    with SQLQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('INSERT INTO data_barang (kategori, nama, gambar, harga_beli, harga_jual, stok)');
      SQL.Add('VALUES (:kategori, :nama, :gambar, :harga_beli, :harga_jual, :stok)');
      Params.ParamByName('kategori').AsString:=edtkategori.Text;
      Params.ParamByName('nama').AsString:=edtnama.Text;
      Params.ParamByName('harga_beli').AsInteger:=StrToint(edtbeli.Text);
      Params.ParamByName('harga_jual').AsInteger:=StrToint(edtjual.Text);
      Params.ParamByName('stok').AsInteger:=StrToint(edtstok.Text);
      Params.ParamByName('gambar').AsString:=edtgambar.Text;
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

