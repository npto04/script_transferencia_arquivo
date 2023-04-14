#!/bin/bash

echo "Iniciando teste de upload"
# Generate a file
file=$(mktemp)
echo `date +%Y-%m-%d_%H:%M:%S`  > "$file"

echo "################### INFORME AS MENSAGENS DE ERRO ABAIXO ###################"

sftp_exec="put $file $SFTP_PATH/$(basename $file) ; exit"
sftp -i $ID -P $SFTP_PORT $SFTP_USER@$SFTP_HOST:$SFTP_PATH <<< $sftp_exec
echo "################### INFORME AS MENSAGENS DE ERRO ACIMA ###################"

# Remove the file
rm "$file"
echo "Teste finalizado"
