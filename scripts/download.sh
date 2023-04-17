#!/bin/bash

echo "Iniciando teste download"
file=$FILE_DOWNLOAD

echo "################### INFORME AS MENSAGENS DE ERRO ABAIXO ###################"
sftp_exec="get $SFTP_PATH/$(basename $file) /app/data ; exit"
sftp -i $ID -P $SFTP_PORT $SFTP_USER@$SFTP_HOST:$SFTP_PATH <<< $sftp_exec
echo "################### INFORME AS MENSAGENS DE ERRO ACIMA ###################"
ls -l download/
echo "Teste download finalizado"