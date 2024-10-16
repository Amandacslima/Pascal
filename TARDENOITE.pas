UNIT TARDENOITE ;
//UNIT EH UMA BIBLIOTECA DE MODULOS, O NOME DA BIBLIOTECA (UNIT) TEM QUE SER IGUAL AO NOME DO ARQUIVO
//QUE A CONTERA...
//
INTERFACE
//
 FUNCTION POT(A,B:INTEGER):INTEGER;
 FUNCTION VALDATAF(X,Y,Z:INTEGER):BOOLEAN;
 PROCEDURE VALDATAP(X,Y,Z:INTEGER;VAR SAI:BOOLEAN);
 FUNCTION DMAX(MM,AA:INTEGER):INTEGER;
// 
IMPLEMENTATION
//
//PROCEDIMETO QUE VERIFICA SE DATA EH VALIDA OU NAO X<-DIA, Y<-MES, Z<-ANO
//SAI DEVOLVE TRUE SE VALIDA OU FALSE SE INVALIDA
//
//==================================================================
//
PROCEDURE VALDATAP(X,Y,Z:INTEGER;VAR SAI:BOOLEAN); //PARAMETROS FORMAIS
//X,Y,Z PASSAGEM POR VALOR e SAI POR REFERENCIA
  VAR DMAX:INTEGER;  //VARIAVEL LOCAL
      CHA:BOOLEAN; //IDEM
BEGIN
//COMECO VERIFICANDO SE O ANO � VALIDO
  CHA:=TRUE;
  IF(Z<1924) OR (Z>2025) THEN
   CHA:=FALSE
  ELSE
//VERIFICO O MES
   IF(Y<1) OR (Y>12) THEN
    CHA:=FALSE
//AGORA VERIFICO O DIA 
   ELSE
    BEGIN
//PRIMEIRO DETERMINO O NUMERO DE DIAS MAXIMOS DO MES LIDO
     DMAX:=31;
     IF(Y=4) OR (Y=6) OR (Y=9) OR (Y=11) THEN
      DMAX:=30;
     IF(Y=2)THEN
      BEGIN
       DMAX:=28;
       IF(Z MOD 4 = 0)THEN
        DMAX:=29;
      END;
//FIM DA DETERMINACAO
//AGORA SIM, VERIFICO O DIA
     IF(X<1) OR (X>DMAX) THEN
		  CHA:=FALSE;
		END;
	 SAI:=CHA;
END;
//
//========================================================================
//
FUNCTION VALDATAF(X,Y,Z:INTEGER):BOOLEAN; //PARAMETROS FORMAIS
//X,Y,Z PASSAGEM POR VALOR
  VAR  CHA:BOOLEAN; //VRIAVEL LOCAL
BEGIN
//COMECO VERIFICANDO SE O ANO � VALIDO
  CHA:=TRUE;
  IF(Z<1924) OR (Z>2025) THEN
   CHA:=FALSE
  ELSE
//VERIFICO O MES
   IF(Y<1) OR (Y>12) THEN
    CHA:=FALSE
//AGORA VERIFICO O DIA 
   ELSE
    BEGIN

//AGORA SIM, VERIFICO O DIA
     IF(X<1) OR (X>DMAX(Y,Z)) THEN
		  CHA:=FALSE;
		END;
	 VALDATAF:=CHA;
END;
//
//========================================================================
//
FUNCTION DMAX(MM,AA:INTEGER):INTEGER;//PARAMETROS FORMAIS, PASSADOS POR VALOR
// DETERMINA O NUMERO DE DIAS MAXIMOS DO MES 
 BEGIN
     DMAX:=31;
     IF(MM=4) OR (MM=6) OR (MM=9) OR (MM=11) THEN
      DMAX:=30;
     IF(MM=2)THEN
      BEGIN
       DMAX:=28;
       IF(AA MOD 4 = 0)THEN
        DMAX:=29;
      END;
 END;
//
//===========================================================================
//
FUNCTION POT(A,B:INTEGER):INTEGER;
//DEVOLVE O RESULTADO DE A ELEVADO A B (SOH INTEIROS e B POSITIVOS)
VAR C,X:INTEGER;//VARIAVEL LOCAL
BEGIN
  X:=1;
  FOR C:=1 TO B DO
   X := A*X;
  POT:=X;
END;
END.
