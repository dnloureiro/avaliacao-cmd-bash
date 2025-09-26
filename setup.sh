#!/bin/bash
# Script para criar a estrutura inicial da prova em /home/aluno/TRABALHO_BASH

DIR_RAIZ="/home/aluno/TRABALHO_BASH"

echo "======================================================="
echo "Preparando o ambiente em $DIR_RAIZ"
echo "======================================================="

# 1. Limpar e Criar o diretório principal
if [ -d "$DIR_RAIZ" ]; then
    echo "Aviso: Limpando conteudo anterior de $DIR_RAIZ..."
    rm -rf "$DIR_RAIZ" # rm -rf é o equivalente a rd /s /q no Windows
fi
mkdir -p "$DIR_RAIZ" # O -p garante que ele crie se não existir

# 2. Criar todos os subdiretorios
echo "Criando subdiretorios: DADOS, DOCS, IMG, TEMP..."
mkdir -p "$DIR_RAIZ"/{DADOS,DOCS,IMG,TEMP}

# 3. Criar os arquivos
echo "Criando arquivos..."

# Arquivo na raiz
echo "README do Projeto" > "$DIR_RAIZ/README.md"

# Arquivos em DADOS
echo "Configuracao inicial" > "$DIR_RAIZ/DADOS/config.ini"
touch "$DIR_RAIZ/DADOS/logs.log" # touch cria o arquivo vazio

# Arquivos em DOCS
touch "$DIR_RAIZ/DOCS/rascunho.tpm" # touch cria o arquivo vazio
echo "Relatorio final" > "$DIR_RAIZ/DOCS/Relatorio.txt"

# Arquivo em IMG
touch "$DIR_RAIZ/IMG/Foto.jpg" # touch cria o arquivo vazio

echo
echo "Estrutura de arquivos e diretorios criada com sucesso em:"
echo "$DIR_RAIZ"
echo "Para LIMPAR, use o comando: rm -rf $DIR_RAIZ"
echo

# AQUI VOCÊ PODE INSERIR UM COMANDO PARA PARAR, como 'read -p "Pressione [Enter] para continuar..."'