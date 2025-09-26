#!/bin/bash
# Script de modificacao com checagem extra de diretorios (equivalente a tarefas.bat).
# Este script assume que o diretório inicial foi criado em /home/aluno/TRABALHO_BASH.

TRABALHO_BASH="/home/aluno/TRABALHO_BASH"

echo
echo "======================================================="
echo "EXECUTANDO TAREFAS BASH - CORRECAO FINAL"
echo "Mudando para o diretorio: $TRABALHO_BASH"
echo "======================================================="

# Mudar para o diretorio de trabalho, essencial para rodar de qualquer lugar.
# O 'cd' no Linux é /home/aluno/TRABALHO_BASH. O '|| exit' garante que o script pare se falhar.
cd "$TRABALHO_BASH" || { echo "Erro: Não foi possível navegar para $TRABALHO_BASH. Abortando."; exit 1; }

# 1. Criar diretorios Backup e Relatorios_Finais
# 'mkdir' é o equivalente a 'md' no Windows.
mkdir -p Backup Relatorios_Finais

# ** CHECAGEM DE SEGURANCA: Garante que as pastas de destino existam (Se o setup inicial falhou) **
mkdir -p TEMP
mkdir -p DOCS
mkdir -p DADOS

# 2. Copiar o arquivo README.md para o diretorio Backup.
# 'cp' é o equivalente a 'copy' no Windows.
cp README.md Backup/

# 3. Mover o arquivo rascunho.tpm de DOCS para TEMP e renomea-lo para lixo.txt.
# 'mv' é o equivalente a 'move' no Windows, e faz a renomeação junto.
mv DOCS/rascunho.tpm TEMP/lixo.txt

# 4. Criar um arquivo de texto vazio chamado saida.txt dentro da pasta DOCS.
# 'touch' ou '>>' (redirecionamento) cria o arquivo vazio. Usaremos 'touch' que é a maneira padrão no Linux.
touch DOCS/saida.txt

# 5. Apagar o arquivo logs.log dentro do diretorio DADOS.
# 'rm' é o equivalente a 'del' no Windows.
rm DADOS/logs.log

# 6. Apagar (remover) o diretorio IMG e todo o seu conteudo, sem pedir confirmacao.
# 'rm -rf' é o equivalente a 'rd /s /q' no Windows.
rm -rf IMG

# 7. Mover o arquivo config.ini de DADOS para o diretorio Relatorios_Finais e renomea-lo para final.cfg.
# 'mv' novamente para mover e renomear.
mv DADOS/config.ini Relatorios_Finais/final.cfg

echo
echo "Todas as 7 tarefas foram concluidas com sucesso em $TRABALHO_BASH."

# No Linux, não usamos 'pause'. O script simplesmente termina.

# Para pausar: read -p "Pressione [Enter] para sair..."
