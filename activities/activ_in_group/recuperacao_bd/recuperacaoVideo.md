+ Restauraar ao seu ultimo estado consistente antes de uma falha. sempre preservando ACID(atomicidade, consistencia, isolamento e durabilidade)

* Tipos de falhas:
- Sem dano fisico ao BD:
. O computador falhar
. Um erro de transacao ou sistema
. Erros locais ou condicoes de excecao detectadas pela transacao
. Imposicao do controle de concorrencia
- Com dano fisico ao BD
. Falha de disco
. Problemas fisicos e catastrofes

+ Cache
. Baseado em paginas de disco mantidas pelo SO
. SGBD chama rotinas de baixo nivel do SO
. Bit sujo mostra se a pagina foi ou nao alterada
. Bit preso-solto mostra se a pagina pode ser gravada ou ainda nao pode ser gravada
. atualizacao shadow x in-place - shadow: nao modifica o item original -- in-place: sobrescreve anterior (recuperacao por log)

Log eh um registro que guarda tudo o q foi feito no BD sequencialmente
pode usar o log pra desfazer acoes de uma transacao abortada, recuperar o sistema de falhas, auditoria
o Log eh mantido em disco e so eh afetado por falhas em disco ou catastroficas
Recomenda-se um disco separado

Protocolo Write-Ahead Logging (WAL)
. grava no log antes que a modificacao seja gravada em disco (garante atomicidade)
. Todas as operacoes de uma transacao sao gravadas no disco de log antes do commit (garante durabilidade)

log possui os seguintes registros
start_transaction diz que a transacao comecou
write_item item gravado no disco, transacao, quem esta sendo gravado, valor antigo e novo valor
read_item quem foi lido, qual a transacao e o item
commit gravado no momento q o commit termina
abort grava que a transaacao foi abortada
checkpoint - indica gravacao de todos os dados modificdos do buffer em disco - entrada de log gravada periodicamente - begin e end checkpoint no log

cada transacao ganha um identificador unico gerado automaticamente pelo sistema

BFIM (antes da alteracao) - usado para UNDO
AFIM (depois da alteraco) - usado para o REDO

gravaando cache em disco 
- forcar gravacao dos itens alterados no disco quaaando alterados? (force / no force)
- permitir alguma gravacao antes do commit? (steal / no steal)

force - no redo (nao precisa refazer transacoes que deram commit)

no steal - no undo (nao precisa desfazer)

combinacoes
steal/no force - undo/redo
steal/force - undo/no redo
no stel/no force - no undo/redo
no steal/force - no undo/no undo





