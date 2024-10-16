Program N02AMANDALIMA;
//TRABALHO FEITO POR AMANDA CRISTINA DA SILVA DE LIMA

uses
  tardenoite;

var
  dian, mesn, anon, diaa, mesa, anoa: Integer;
  anov, mesv, diav, mesant, Dmax: Integer;
  idade_anos, idade_meses, idade_dias: Integer;

begin
  writeln('Digite seu dia de nascimento:');
  readln(dian);

  writeln('Digite seu mês de nascimento:');
  readln(mesn);

  writeln('Digite seu ano de nascimento:');
  readln(anon);

  repeat
    writeln('Digite o dia de hoje:');
    readln(diaa);
  until (diaa >= 1) and (diaa <= 31);

  repeat
    writeln('Digite o mês de hoje:');
    readln(mesa);
  until (mesa >= 1) and (mesa <= 12);

  repeat
    writeln('Digite o ano de hoje:');
    readln(anoa);
  until (anoa >= 1);

  // Calculando idade em anos, meses e dias
  anov := anoa - anon;
  mesv := mesa - mesn;
  diav := diaa - dian;

  // Verificando se diav é negativo, se for, ajustando
  if diav < 0 then
  begin
    mesant := mesa - 1;
    if mesant = 0 then
    begin
      mesant := 12;
      anov := anov - 1;
    end;
    Dmax := diamaxm(mesant, anoa);
    diav := Dmax + diav;
  end;

  // Verificando se mesv é negativo, se for, ajustando
  if mesv < 0 then
  begin
    mesv := mesv + 12;
    anov := anov - 1;
  end;

  // Exibindo resultado
  writeln('Data de nascimento válida.');
  writeln('Você tem ', anov, ' anos, ', mesv, ' meses e ', diav, ' dias.');
  write('Enter para encerrar.');
  readln;
End.