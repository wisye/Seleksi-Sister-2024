program InverseMatrixGaussJordan;

uses
  SysUtils;

const
  MaxN = 200;

type
  TMatrix = array[1..MaxN, 1..MaxN * 2] of Double;

var
  Matrix: TMatrix;
  N: Integer;

procedure ReadMatrix(var M: TMatrix; var Size: Integer; FileName: String);
var
  F: TextFile;
  i, j: Integer;
begin
  AssignFile(F, FileName);
  Reset(F);
  ReadLn(F, Size);
  for i := 1 to Size do
  begin
    for j := 1 to Size do
    begin
      Read(F, M[i, j]);
      M[i, j + Size] := 0;
    end;
    M[i, i + Size] := 1;
    ReadLn(F);
  end;
  CloseFile(F);
end;

procedure SwapRows(var M: TMatrix; Row1, Row2, Size: Integer);
var
  Temp: Double;
  j: Integer;
begin
  for j := 1 to Size * 2 do
  begin
    Temp := M[Row1, j];
    M[Row1, j] := M[Row2, j];
    M[Row2, j] := Temp;
  end;
end;

procedure GaussJordan(var M: TMatrix; Size: Integer);
var
  i, j, k: Integer;
  Temp: Double;
begin
  for i := 1 to Size do
  begin
    if M[i, i] = 0 then
      for j := i + 1 to Size do
        if M[j, i] <> 0 then
        begin
          SwapRows(M, i, j, Size);
          Break;
        end;

    for j := 1 to Size do
    begin
      if i <> j then
      begin
        Temp := M[j, i] / M[i, i];
        for k := 1 to Size * 2 do
          M[j, k] := M[j, k] - Temp * M[i, k];
      end;
    end;
  end;

  for i := 1 to Size do
  begin
    Temp := M[i, i];
    for j := 1 to Size * 2 do
      M[i, j] := M[i, j] / Temp;
  end;
end;

procedure WriteMatrix(M: TMatrix; Size: Integer; FileName: String);
var
  F: TextFile;
  i, j: Integer;
begin
  AssignFile(F, FileName);
  Rewrite(F);
  for i := 1 to Size do
  begin
    for j := Size + 1 to Size * 2 do
    begin
      // Use Format function to print in scientific notation
      Write(F, Format('%0.4e', [M[i, j]]), ' ');
    end;
    WriteLn(F);
  end;
  CloseFile(F);
end;

begin
  ReadMatrix(Matrix, N, 'input.txt');
  GaussJordan(Matrix, N);
  WriteMatrix(Matrix, N, 'output.txt');
end.