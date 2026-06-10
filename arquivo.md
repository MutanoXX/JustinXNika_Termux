# 🤖 Justin X Nika - Bot WhatsApp para Termux

**Versão:** 3.0  
**Autor:** Justin X Nika  
**Adaptado para Termux em:** 10 de Junho de 2026

---

## 📋 Índice

1. [Sobre o Bot](#sobre-o-bot)
2. [Requisitos](#requisitos)
3. [Instalação no Termux](#instalação-no-termux)
4. [Comandos de Uso](#comandos-de-uso)
5. [Configuração](#configuração)
6. [Estrutura de Arquivos](#estrutura-de-arquivos)
7. [Comandos do Bot](#comandos-do-bot)
8. [Solução de Problemas](#solução-de-problemas)
9. [Atualizações](#atualizações)

---

## 📌 Sobre o Bot

O **Justin X Nika** é um bot WhatsApp completo baseado em **@whiskeysockets/baileys** (multi-device).

### Principais Recursos:
- ✅ Suporte a **múltiplos dispositivos**
- ✅ Download de **YouTube, Instagram, TikTok, Facebook**
- ✅ Comandos de **grupo** (kick, promote, demote, etc.)
- ✅ **Sticker** e **meme** maker
- ✅ **OCR** (reconhecimento de texto em imagens)
- ✅ **TTS** (texto para voz)
- ✅ Sistema de **Premium** e **Owners**
- ✅ Comandos de **administração** de grupo
- ✅ **Auto-resposta** e **boas-vindas**
- ✅ Suporte a **áudio** e **vídeo**

---

## 🛠 Requisitos

### No Termux (Android):
- Termux atualizado
- Node.js ≥ 18
- FFmpeg
- Yarn ou npm
- Git
- Armazenamento (para salvar sessão)

### Recomendado:
- Pelo menos **2GB de RAM** livre
- Conexão estável com internet

---

## 🚀 Instalação no Termux

### Método 1: Instalação Automática (Recomendado)

```bash
# 1. Clone o repositório
git clone https://github.com/MutanoXX/JustinXNika.git
cd JustinXNika

# 2. Execute o script de instalação
bash termux-setup.sh
```

### Método 2: Instalação Manual

```bash
# Atualizar pacotes
pkg update -y && pkg upgrade -y

# Instalar dependências
pkg install -y nodejs ffmpeg git yarn

# Clonar o bot
git clone https://github.com/MutanoXX/JustinXNika.git
cd JustinXNika

# Instalar dependências do bot
yarn install

# Dar permissão de armazenamento
termux-setup-storage
```

---

## ▶️ Comandos de Uso

### Iniciar o Bot

```bash
# Opção 1 (recomendada)
yarn start

# Opção 2
node connect.js
```

### Parar o Bot

Pressione `CTRL + C` no terminal.

### Reiniciar após atualização

```bash
yarn install
node connect.js
```

---

## ⚙️ Configuração

### Arquivo `setting/config.js`

```javascript
global.connect = true
global.publicX = true 
global.owner = ['6288103781881']   // Números dos donos (sem +)
global.prefa = ['','!','.',',','🐤','🗿']  // Prefixos aceitos
```

### Arquivos de Acesso

- **`Access/Own.json`** → Lista de owners (números)
- **`Access/Prem.json`** → Lista de usuários premium

**Exemplo de Own.json:**
```json
["6288103768282", "5511999999999"]
```

---

## 📁 Estrutura de Arquivos

```
JustinXNika/
├── connect.js          # Arquivo principal de conexão
├── justin.js           # Lógica principal do bot (obfuscado)
├── package.json        # Dependências
├── termux-setup.sh     # Script de instalação automática
├── arquivo.md          # Este arquivo de documentação
├── Access/
│   ├── Own.json        # Owners do bot
│   └── Prem.json       # Usuários premium
├── System/
│   ├── x1.js           # Funções auxiliares
│   ├── justin.jpg
│   └── Thumb.jpg
├── setting/
│   └── config.js       # Configurações globais
└── session/            # Pasta criada automaticamente (sessão)
```

---

## 🤖 Comandos do Bot

### Comandos Gerais

| Comando | Descrição |
|---------|-----------|
| `!menu` | Mostra o menu principal |
| `!help` | Ajuda |
| `!ping` | Testa latência |
| `!owner` | Contato dos donos |

### Comandos de Download

| Comando | Descrição |
|---------|-----------|
| `!yt <link>` | Download YouTube |
| `!ig <link>` | Download Instagram |
| `!tt <link>` | Download TikTok |
| `!fb <link>` | Download Facebook |

### Comandos de Grupo (Admin)

| Comando | Descrição |
|---------|-----------|
| `!kick @user` | Expulsar membro |
| `!add @user` | Adicionar membro |
| `!promote @user` | Promover a admin |
| `!demote @user` | Rebaixar admin |
| `!tagall` | Marcar todos |
| `!welcome on/off` | Ativar/desativar boas-vindas |

### Comandos de Mídia

| Comando | Descrição |
|---------|-----------|
| `!sticker` | Criar sticker (responda imagem) |
| `!toimg` | Converter sticker em imagem |
| `!tts <texto>` | Texto para voz |
| `!ocr` | Extrair texto de imagem |

---

## ❗ Solução de Problemas

### Erro: "Cannot find module"

```bash
yarn install
```

### Bot não responde após scan do QR

- Verifique se o número está correto em `config.js`
- Delete a pasta `session` e escaneie novamente

### FFmpeg não encontrado

```bash
pkg install ffmpeg -y
```

### Bot cai após alguns minutos

- Use um **screen** ou **tmux**:
```bash
pkg install tmux
tmux new -s bot
node connect.js
```
Para voltar: `tmux attach -t bot`

### Erro de permissão

```bash
chmod +x termux-setup.sh
termux-setup-storage
```

---

## 🔄 Atualizações

Para atualizar o bot:

```bash
cd JustinXNika
git pull
yarn install
```

---

## 📞 Suporte

- **GitHub:** https://github.com/MutanoXX/JustinXNika
- **Dúvidas:** Abra uma issue no repositório

---

**Feito com ❤️ por MutanoXX - Adaptado para Termux**