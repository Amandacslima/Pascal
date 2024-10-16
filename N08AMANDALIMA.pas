Program Pzim ;
Begin
   Program N08AMANDALIMA ;
//FEITO POR AMANDA CRISTINA DA SILVA DE LIMA

uses tardenoite;
var
  //arquivos
  arq: file of regis;
  reg: regis;
  NOTAS: text;
  //outras
  vet: vetor;
  a, b, c, d, posiv, np, ii, tot, tc, tt, aux: integer;
  numa, num, insc: string[4];
  nota: array[1..6] of integer;
  somaNotas: array[1..6] of integer;
  contRegistros: integer;
  mediaNotas: array[1..6] of real;
  disciplinas: array[1..6] of string;
Begin
  assign(arq, 'cand.ind');
  assign(NOTAS, 'NOTAS.txt');
  reset(arq);
  reset(NOTAS);
  a := 0;
  for b := 1 to 6 do
    somaNotas[b] := 0; // Inicializa somas das notas com 0
  contRegistros := 0; // Inicializa contagem de registros com 0
  disciplinas[1] := 'L.E.M';
  disciplinas[2] := 'MATEMATICA';
  disciplinas[3] := 'LOGICA';
  disciplinas[4] := 'CONHECIMENTO ESPEC.';
  disciplinas[5] := 'INFORMATICA';
  disciplinas[6] := 'ATUALIDADES';
  writeln('Aguarde, ordenando...');
  repeat
    read(arq, reg);
    ii := a + 1; // ii = indice do vetor
    vet[ii].pf := a; // a = posicao fisica do registro no arquivo
    str(reg.num, num);
    tc := length(num);
    for b := 1 to 4 - tc do
      insert('0', num, 1); // insere zeros a esquerda para ficar compativel com o numero lido em faltas
    vet[ii].cc := num; 
    a := a + 1;
  until(eof(arq)); 
  // fim da montagem
  tot := ii;
  ordem(vet, tot); // Adicionando a ordenação aqui para garantir que o vetor esteja ordenado
  repeat        
    tt := tt + 1;
    readln(NOTAS, insc, nota[1], nota[2], nota[3], nota[4], nota[5], nota[6]);
    numa := copy(insc, 1, 4); // Corrigido para extrair corretamente o número de inscrição
    pebin1(vet, numa, tot, posiv); // Procura NUMA em VET com TOT elementos - pesq binaria 
    if posiv > 0 then // Verifica se o número foi encontrado no vetor
    begin
      seek(arq, vet[posiv].pf); 
      read(arq, reg);
      for d := 1 to 6 do
      begin 
        reg.NOTAS[d] := nota[d];
        somaNotas[d] := somaNotas[d] + nota[d]; // Acumula a soma de cada nota
      end;
      reg.som := 0; // Inicializa o somatório
      for d := 1 to 6 do
      begin 
        reg.som := reg.som + reg.NOTAS[d];
      end;
      seek(arq, vet[posiv].pf); // Retorna apontador para inicio do registro
      write(arq, reg);
      contRegistros := contRegistros + 1; // Incrementa o contador de registros processados
    end;
  until eof(NOTAS);
  Writeln('Total de candidatos com notas lançadas -- ', contRegistros, ' candidatos');
  writeln;
  // Calcula as médias
  for d := 1 to 6 do
  begin
    if contRegistros > 0 then
      mediaNotas[d] := somaNotas[d] / contRegistros
    else
      mediaNotas[d] := 0; // Evita divisão por zero
  end;
  // Exibe as médias
  writeln('            DICIPLINAS                         MÉDIA');
  writeln;
  for d := 1 to 6 do
  begin
    writeln(disciplinas[d]:20, ': ', mediaNotas[d]:30:2);
  end;
  writeln;
  termine; 
  close(NOTAS);
  close(arq);
End.