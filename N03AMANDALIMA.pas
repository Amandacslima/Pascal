Program N03AmandaLima;
//TRABALHO FEITO POR AMANDA CRISTINA DA SILVA DE LIMA

uses
  tardenoite;

const
  Meses: array[1..12] of string = ('JANEIRO', 'FEVEREIRO', 'MARÇO', 'ABRIL', 'MAIO', 'JUNHO', 'JULHO', 
	'AGOSTO', 'SETEMBRO', 'OUTUBRO', 'NOVEMBRO', 'DEZEMBRO');

var
  Dia, Mes, Ano, Resp: Integer;

begin
  repeat
    repeat
      writeln('Digite o dia:');
      readln(Dia);
      writeln('Digite o mês:');
      readln(Mes);
      writeln('Digite o ano:');
      readln(Ano);
      if not ValData(Dia, Mes, Ano) then
        writeln('Data inválida, digite novamente.');
    until ValData(Dia, Mes, Ano);

    writeln('CURITIBA, ', Dia, ' DE ', Meses[Mes], ' DE ', Ano, '.');

    writeln('Quer continuar? Digite 1 para SIM ou outro número para NÃO.');
    readln(Resp);
  until Resp <> 1;
  WRITELN('ENTER PARA SAIR:');
  READLN;
End.