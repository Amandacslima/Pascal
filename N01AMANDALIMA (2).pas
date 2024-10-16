Program N01AMANDACRISTINA;
//FEITO POR AMANDA CRISTINA DA SILVA DE LIMA 
var
Numero, Divisor: Integer;

begin
  repeat
    Write('Digite um número (0 para sair): ');
    Readln(Numero);

    if Numero <> 0 then
    begin
      Write('Divisores de ', Numero, ': ');
      for Divisor := 1 to Numero do
      begin
        if (Numero mod Divisor) = 0 then
          Write(Divisor, ' ');
      end;
      Writeln;
    end;
  until Numero = 0;
	End.