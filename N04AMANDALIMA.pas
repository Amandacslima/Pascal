program N04AMANDALIMA;
//TRABALO FEITO POR AMANDA CRISTINA DA SILVA DE LIMA

var
  cpf, cpfDigitado: string;
  i, j, k, somaJ, somaK, restoJ, restoK: integer;
  valido: boolean;

begin
  repeat
    valido := true;
    write('Digite o CPF (ou "00000000000" para encerrar): ');
    readln(cpfDigitado);
    
    // Verifica se o CPFDigitado � "00000000000" para encerrar o programa
    if cpfDigitado = '00000000000' then
    begin
      writeln('Programa encerrado.');
      break;
    end;
    
    // Verifica se o CPFDigitado possui 11 d�gitos
    if length(cpfDigitado) <> 11 then
    begin
      writeln('CPF inv�lido. Deve conter 11 d�gitos.');
      valido := false;
    end;
    
    // Verifica se o CPFDigitado cont�m apenas d�gitos
    for i := 1 to length(cpfDigitado) do
    begin
      if not (cpfDigitado[i] in ['0'..'9']) then
      begin
        writeln('CPF inv�lido. Deve conter apenas n�meros.');
        valido := false;
        break;
      end;
    end;
    
    // Calcula o d�gito J
    somaJ := 0;
    for i := 1 to 9 do
      somaJ := somaJ + (ord(cpfDigitado[i]) - ord('0')) * (11 - i);
    restoJ := somaJ mod 11;
    if (restoJ = 0) or (restoJ = 1) then
      j := 0
    else
      j := 11 - restoJ;
    
    // Verifica se o d�gito J � igual ao d�cimo d�gito do CPFDigitado
    if j <> (ord(cpfDigitado[10]) - ord('0')) then
    begin
      writeln('CPF inv�lido. D�gito J calculado: ', j);
      valido := false;
    end;
    
    // Calcula o d�gito K
    somaK := 0;
    for i := 1 to 10 do
      somaK := somaK + (ord(cpfDigitado[i]) - ord('0')) * (12 - i);
    restoK := somaK mod 11;
    if (restoK = 0) or (restoK = 1) then
      k := 0
    else
      k := 11 - restoK;
    
    // Verifica se o d�gito K � igual ao d�cimo primeiro d�gito do CPFDigitado
    if k <> (ord(cpfDigitado[11]) - ord('0')) then
    begin
      writeln('CPF inv�lido. D�gito K calculado: ', k);
      valido := false;
    end;
    
    // Se o CPF for v�lido, exibe mensagem de CPF v�lido
    if valido then
      writeln('CPF v�lido.');
      
  until false;
end.