Program N05AMANDALIMA ;
//TRABALHO FEITO POR AMANDA CRISTINA DA SILVA DE LIMA 

USES TARDENOITE;
VAR 
  NOME: ARRAY[1..50] OF STRING[30];
  NOTA: ARRAY[1..100] OF INTEGER;
  NOL: STRING[30];
  NTL, A, B, C, TOT: INTEGER;
  TROCA: BOOLEAN;
  AUX: STRING[30];

BEGIN
  C := 0;

  WRITE('ESCREVA O NOME ("FIM" PARA ENCERRAR): ');
  READLN(NOL);
  NOL := UPCASE(NOL);

  WHILE (NOL <> 'FIM') AND (C < 50) DO
  BEGIN
    C := C + 1;
    NOME[C] := NOL;
    
    REPEAT
      LEIA('NOTA: ', NTL);
      IF (NTL < 0) OR (NTL > 100) THEN
        WRITELN('NOTAS DEVEM ESTAR ENTRE 0 E 100. POR FAVOR, DIGITE NOVAMENTE.')
      ELSE
        NOTA[C] := NTL;
    UNTIL (NTL >= 0) AND (NTL <= 100);
    
    WRITE('NOME: ');
    READLN(NOL);
    NOL := UPCASE(NOL);
  END;

  // Ordenação dos alunos em ordem alfabética 
  FOR A := 1 TO C - 1 DO
  BEGIN
    FOR B := 1 TO C - A DO
    BEGIN
      IF NOME[B] > NOME[B + 1] THEN
      BEGIN
        AUX := NOME[B];
        NOME[B] := NOME[B + 1];
        NOME[B + 1] := AUX;

        TOT := NOTA[B];
        NOTA[B] := NOTA[B + 1];
        NOTA[B + 1] := TOT;
      END;
    END;
  END;

  // Exibição dos alunos menores ou iguais a "LUIZ SALGADO" em ordem alfabética
  WRITELN('Alunos com nota menor ou igual a LUIZ SALGADO:');
  FOR A := 1 TO C DO
  BEGIN
    IF NOME[A] <= 'LUIZ SALGADO' THEN
    BEGIN
      WRITELN(NOME[A], ' - ', NOTA[A]);
    END;
  END;

  // Exibição dos alunos maiores que "LUIZ SALGADO" em ordem alfabética reversa
  WRITELN('Alunos com nota maior que LUIZ SALGADO:');
  FOR A := C DOWNTO 1 DO
  BEGIN
    IF NOME[A] > 'LUIZ SALGADO' THEN
    BEGIN
      WRITELN(NOME[A], ' - ', NOTA[A]);
    END;
  END;
  WRITE('ENTER PARA SAIR');
  READLN;
END.