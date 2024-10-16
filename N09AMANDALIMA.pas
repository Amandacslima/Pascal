Program N09AMANDALIMA;
//TRABALHO FEITO POR AMANDA CRISTINA DA SILVA DE LIMA

uses tardenoite;
var
  arq: file of regis;
  reg: regis;
  vagas:text;
  vet: vetor;
  a, b, c, d,e, posiv, np, ii, tot, tc, tt, aux, clag: integer;
  numcar:array[1..12] of integer; 
  vv:string[31];
  dataint, regcont:integer;
  datastr:string[8];
	auxstr:string[6];
	somstr:string[3];
	discistr:array[1..6] of string[3];
	clcar:array[1..12] of integer;
Begin
  assign(arq, 'cand.ind');
  assign(VAGAS, 'VAGAS.txt');
  reset(arq);
  reset(VAGAS);
	for a:=1 to 12 do
		begin
		readln(vagas, vv);
		val(copy(vv, 30, 2), numcar[a], e);
		end;
		d:=0;
	//montagem do vetor
	while (not eof(arq)) do
	begin
	read(arq, reg);
  datastr:=reg.data.ano+reg.data.mes+reg.data.dia;
  val(datastr, dataint, e);
	aux:=20200000-dataint;
	str(aux:6, auxstr);
	str(reg.som:3, somstr); 
	for a:=1 to 6 do
		str(reg.notas[a]:3, discistr[a]);
	
	ii:=d+1;
	vet[ii].pf:=d;
	vet[ii].cc:=somstr+discistr[4]+discistr[5]+discistr[3]+discistr[2]+discistr[6]+discistr[1]+auxstr;
	d:=d+1
	end;
	
	tot:=ii;
	ordem(vet, tot);
	writeln('Ordenado');
	
	for a:=tot downto 1 do
	begin
	seek(arq, vet[a].pf);
	read(arq, reg);
	clag:=clag+1;
	clcar[reg.car]:=clcar[reg.car]+1;
	if clcar[reg.car]<=numcar[reg.car] then
		reg.ccl:=reg.car;
	reg.clg:=clag;
	reg.clc:=clcar[reg.car];
	seek(arq, vet[a].pf); // Retorna apontador para inicio do registro
  write(arq, reg);
	end;	 	   
close(arq);
close(vagas);
End.