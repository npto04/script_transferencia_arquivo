#!/bin/bash

echo "Iniciando teste de conexão"

echo "################### INFORME AS MENSAGENS DE ERRO ABAIXO ###################"

# Attempt to connect to the SFTP server
if sftp -i $ID -P $SFTP_PORT $SFTP_USER@$SFTP_HOST:$SFTP_PATH </dev/null; then
  echo "SFTP connection successful"
else
  echo "SFTP connection failed"
fi

echo "################### INFORME AS MENSAGENS DE ERRO ACIMA ###################"

echo "Teste finalizado"