#!/bin/bash
# Atualizar pacotes existentes
apt update -y

# Instalar Nginx
amazon-linux-extras install nginx1.12 -y

# Criar uma página HTML simples
echo "<html>
<head>
    <title>Servidor Nginx</title>
</head>
<body>
    <h1>Bem-vindo ao servidor Nginx criado por Jorge Junior!</h1>
    <p>Este servidor está sendo executado em uma instância Amazon Linux configurada automaticamente.
    Seja Bem-vindo(a)</p>
</body>
</html>" > /usr/share/nginx/html/index.html

# Iniciar o serviço Nginx
systemctl start nginx

# Configurar Nginx para iniciar automaticamente na inicialização
systemctl enable nginx

