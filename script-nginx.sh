#!/bin/bash
# Atualizar pacotes
sudo yum update -y

# Instalar Nginx usando yum
sudo yum install nginx -y

# Verificar se a instalação foi bem-sucedida
if ! command -v nginx &> /dev/null
then
    echo "Nginx não foi instalado com sucesso" >&2
    exit 1
fi

# Iniciar o serviço Nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# Criar o diretório se não existir
sudo mkdir -p /usr/share/nginx/html

# Criar a página HTML
sudo bash -c 'cat > /usr/share/nginx/html/index.html' << 
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="shortcut icon" href="https://ada-site-frontend.s3.sa-east-1.amazonaws.com/home/header-logo.svg" type="image/x-icon">
    <title>Projeto 03</title>
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

# Criar o arquivo CSS

sudo bash -c 'cat > /usr/share/nginx/html/style.css' << EOF
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: Arial, sans-serif;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100vh;
  margin: 0;
  background-color: #f0f0f0;
  animation: backgroundChange 10s infinite alternate;
}

h1 {
  color: #2c3e50;
  animation: slideInLeft 1s ease-out, textColorChange 5s infinite alternate;
  margin-bottom: 20px;
}

p {
  color: #34495e;
  font-size: 1.2em;
  animation: pulse 2s infinite, float 4s ease-in-out infinite;
}

/* Animação de slide in da esquerda */
@keyframes slideInLeft {
  from {
    transform: translateX(-100%);
    opacity: 0;
  }
  to {
    transform: translateX(0);
    opacity: 1;
  }
}

/* Animação de mudança de cor do texto */
@keyframes textColorChange {
  0% {
    color: #2c3e50;
  }
  50% {
    color: #e74c3c;
  }
  100% {
    color: #16a085;
  }
}

/* Animação de pulse */
@keyframes pulse {
  0% {
    transform: scale(1);
  }
  50% {
    transform: scale(1.05);
  }
  100% {
    transform: scale(1);
  }
}

/* Animação de flutuação */
@keyframes float {
  0% {
    transform: translateY(0);
  }
  50% {
    transform: translateY(-10px);
  }
  100% {
    transform: translateY(0);
  }
}

/* Animação de mudança de cor de fundo */
@keyframes backgroundChange {
  0% {
    background-color: #f0f0f0;
  }
  25% {
    background-color: #2c3e50;
  }
  50% {
    background-color: #e74c3c;
  }
  75% {
    background-color: #16a085;
  }
  100% {
    background-color: #f39c12;
  }
}

# Reiniciar o Nginx para garantir que as mudanças sejam aplicadas
sudo systemctl restart nginx

# Configurar Nginx para iniciar automaticamente na inicialização
systemctl enable nginx

