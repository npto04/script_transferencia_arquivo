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
FILE_UPLOAD=<seu-arquivo-a-ser-enviado>
FILE_DOWNLOAD=<seu-arquivo-a-ser-baixado>
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


5. Serviços disponíveis:


    5.1 Upload de arquivo para o servidor SFTP:

    Este é um script Bash usado para testar o envio de arquivos por SFTP. A localização do arquivo a ser enviado precisa ser adicionada ao arquivo `.env` na variável `FILE_UPLOAD` e deve estar dentro do diretório especifico montado no contêiner que está disponível no caminho `/data`. 
    
    ```yaml
    - <path/to/your/data>:/app/data:rw
    ```

    Alem da variável `FILE_UPLOAD`, deve fornecer valores para as variáveis relacionados ao SFTP (SFTP_USER, SFTP_HOST, SFTP_PORT, SFTP_PATH).

    5.2 Download de arquivo do servidor SFTP:

    Este bloco de código é um script Bash que realiza uma operação de download. Ele define o caminho do arquivo de onde o arquivo será baixado com `$FILE_DOWNLOAD`. A localização do arquivo a ser baixado precisa ser conhecida ao adicionar no arquivo `.env` e será descarregado dentro de diretório a ser especificado e montado no contêiner - este está disponível no caminho `/data`. 

    ```yaml
    - <path/to/your/data>:/app/data:rw
    ```
    
    Este script pode ser usado para testar se os arquivos podem ser baixados corretamente de um servidor SFTP.



6. Execute o seguinte comando em um terminal shell para construir a imagem e executar os contêiners:

```bash
docker compose up -d
```

Se você quiser apenas um dos serviços, execute o seguinte comando em um terminal shell:

```bash
docker compose up -d <service-name>
```

