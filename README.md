# Cliente SFTP usando Docker

Este projeto permite que você transfira arquivos com segurança para um servidor SFTP de um contêiner Docker. Para usar este projeto, por favor, siga estas instruções:


## Pré-requisitos


Docker instalado na sua máquina

> Como instalar o [Docker](https://docs.docker.com/get-docker/) no seu sistema operacional.


## Começando


1. Clone este repositório para a sua máquina local.



2. Crie um arquivo .env na raiz do seu projeto com as seguintes variáveis:




```bash
SFTP_PORT=<sua-porta-sftp>
SFTP_USER=<seu-nome-de-usuario-sftp>
SFTP_HOST=<seu-host-sftp>
SFTP_PATH=<seu-caminho-sftp>
```

3. Se a sua chave privada tiver uma frase de acesso, certifique-se de que tenha configurado o ssh-agent e adicionado a frase de acesso ao ssh-agent. Se você adicionar tempo de vida ao ssh-agent, certifique-se de dar tempo suficiente ao docker para construir a imagem e executar o contêiner.

```bash
eval $(ssh-agent)
ssh-add </caminho/chave/privada>
```


4. No arquivo docker-compose.yml, forneça o caminho para a sua chave privada na seção de SECRETS, criando um novo docker secret ou alterando o nome IDENTITY_KEY para o nome do seu docker secret. Siga as instruções conforme comentadas.

```yaml
secrets:
  IDENTITY_FILE:
    # external: true # If the docker secret has already been created previously, uncomment this line and comment the next one, THEN replace IDENTITY_FILE with the name of your own secret. This name must as well be switched in the environment section as entry for the ID variable. 
    file: <path/to/your/ssh/key> # If the secret has not been created yet, uncomment this line, comment the previous one and replace the <path/to/your/ssh/key> with the path to your private key
```




## Ações


5. TODO: Adicionar ações ao fluxo de trabalho.


    5.1 TODO: Adicionar uma etapa de upload.


    5.2 TODO: Adicionar uma etapa de download.



6. Execute o seguinte comando em um terminal shell para construir a imagem e executar o contêiner:

```bash
docker compose up -d
```

