#!/bin/bash

echo "Iniciando teste de upload"

# Adicione o caminho do arquivo que deseja enviar.
file=$FILE_UPLOAD 

echo "################### INFORME AS MENSAGENS DE ERRO ABAIXO ###################"

sftp_exec="put $file $SFTP_PATH/$(basename $file) ; exit"
sftp -i $ID -P $SFTP_PORT $SFTP_USER@$SFTP_HOST:$SFTP_PATH <<< $sftp_exec
echo "################### INFORME AS MENSAGENS DE ERRO ACIMA ###################"

echo "Teste finalizado"
