#!/bin/bash
# SCRIPT DE CORREÇÃO PARA PROVA BASH (50 PONTOS)

DIR_RAIZ="/home/aluno/TRABALHO_BASH"
PONTUACAO_TOTAL=0
MAX_PONTOS=50

# Função auxiliar para verificar e pontuar
function verifica_tarefa {
    DESCRICAO=$1
    PONTOS=$2
    TESTE=$3

    # Executa o comando de teste. Se for sucesso (exit code 0), pontua.
    if eval "$TESTE"; then
        PONTUACAO_TOTAL=$((PONTUACAO_TOTAL + PONTOS))
        echo " [OK] ($PONTOS pts) $DESCRICAO"
    else
        echo " [ERRO] (0 pts) $DESCRICAO"
    fi
}

echo -e "\n========================================"
echo "     AVALIACAO BASH - TOTAL: 50 PONTOS"
echo "   Corrigindo a pasta: $DIR_RAIZ"
echo "========================================\n"

cd "$DIR_RAIZ" || { echo "Erro: Não foi possível navegar para $DIR_RAIZ. Abortando."; exit 1; }

# --- VERIFICAÇÃO DAS TAREFAS ---

# 1. Criar Backup e Relatorios_Finais (6 pts)
verifica_tarefa "Diretorios 'Backup' e 'Relatorios_Finais' criados" 6 "[ -d Backup ] && [ -d Relatorios_Finais ]"

# 2. Copiar README.md para Backup (5 pts)
verifica_tarefa "Arquivo 'Backup/README.md' copiado" 5 "[ -f Backup/README.md ]"

# 3. Mover/Renomear rascunho.tmp (8 pts)
# Deve existir o lixo.txt no TEMP E o rascunho.tpm NÃO deve existir no DOCS
verifica_tarefa "Arquivo 'lixo.txt' movido e renomeado" 8 "[ -f TEMP/lixo.txt ] && [ ! -f DOCS/rascunho.tpm ]"

# 4. Arquivo 'saida.txt' criado e vazio (5 pts)
# -f verifica que é um arquivo, ! -s verifica que o arquivo está vazio
verifica_tarefa "Arquivo 'saida.txt' criado e vazio" 5 "[ -f DOCS/saida.txt ] && [ ! -s DOCS/saida.txt ]"

# 5. Apagar logs.log (6 pts)
verifica_tarefa "Arquivo 'logs.log' removido" 6 "[ ! -f DADOS/logs.log ]"

# 6. Apagar IMG recursivamente (10 pts)
verifica_tarefa "Diretorio 'IMG' removido recursivamente" 10 "[ ! -d IMG ]"

# 7. Mover/Renomear config.ini para final.cfg (10 pts)
# Deve existir o final.cfg no Relatorios_Finais E o config.ini NÃO deve existir no DADOS
verifica_tarefa "Arquivo 'final.cfg' movido e renomeado" 10 "[ -f Relatorios_Finais/final.cfg ] && [ ! -f DADOS/config.ini ]"


# --- RESULTADO FINAL ---

echo -e "\n========================================"
echo " PONTUACAO FINAL DO ALUNO: $PONTUACAO_TOTAL / $MAX_PONTOS"
echo "========================================\n"