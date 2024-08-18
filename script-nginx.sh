#!/bin/bash
# Atualizar pacotes existentes
apt update -y

# Instalar Nginx
amazon-linux-extras install nginx1.12 -y

# Criar uma página HTML simples
echo "<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Servidor Nginx</title>
    <link rel="stylesheet" href="./style.css" />
  </head>
  <body>
    <h1>Bem-vindo ao servidor Nginx!</h1>
    <p>
      Este servidor está sendo executado em uma instância Amazon Linux
      configurada automaticamente. Seja Bem-vindo(a).
    </p>
    <br />

    <h1>Aluno: Jorge LuizTeixeira Da Silva Junior</h1>
    <br />
    <p>Id: 1182024</p>
    <p>Curso DevOps - A.d.a tech - Santander</p>
  </body>
</html>
" > /usr/share/nginx/html/index.html

# Iniciar o serviço Nginx
systemctl start nginx

# Configurar Nginx para iniciar automaticamente na inicialização
systemctl enable nginx

