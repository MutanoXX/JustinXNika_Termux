# 🤖 Justin X Nika - Bot WhatsApp para Termux

> **Versão:** 3.2 (Termux Optimized)  
> **Autor:** Justin X Nika  
> **Adaptado para Termux por:** MutanoX  
> **Última atualização:** 10 de Junho de 2026

---

## 📋 Índice

| Seção | Descrição |
|-------|-----------|
| [Sobre o Bot](#sobre-o-bot) | Recursos principais |
| [Requisitos](#requisitos) | O que você precisa |
| [Instalação Rápida](#instalação-rápida) | Comando único |
| [Configuração Inicial](#configuração-inicial) | Número do dono |
| [Comandos Essenciais](#comandos-essenciais) | Como usar |
| [Problemas Comuns](#problemas-comuns--soluções) | Erros e soluções |
| [Atualizações](#atualizações) | Como manter atualizado |

---

## 📌 Sobre o Bot

O **Justin X Nika** é um bot WhatsApp completo baseado em **@whiskeysockets/baileys** (multi-device).

### ✨ Principais Recursos

#### 👑 Owner Menu
- `.addprem` — Adicionar usuário Premium
- `.delprem` — Remover usuário Premium
- `.addown` — Adicionar novo Owner
- `.tagsw` — Marcar Status
- `.private` — Modo Privado
- `.public` — Modo Público

#### ⚔️ Geprek Menu (Combos / Ataques)
- `.nikspam`
- `.tinvis`
- `.jusui`
- `.nikfreze`
- `.delayxcombobox`
- `.xcombogod`

#### 🔥 All Petinggi
- **Justin**
- **Depay**

---

## 🛠 Requisitos

### Mínimo
- Termux atualizado
- Node.js ≥ 18
- FFmpeg
- Yarn ou npm
- Git

### Recomendado
- Pelo menos **2GB de RAM** livre
- Conexão estável com internet

---

## 🚀 Instalação Rápida

### Método Recomendado (1 comando)

```bash
pkg update -y && pkg install -y nodejs ffmpeg git yarn python libwebp tmux && \
git clone https://github.com/MutanoXX/JustinXNika_Termux.git && \
cd JustinXNika_Termux && \
bash termux-setup.sh
```

### Passo a Passo Manual

```bash
# 1. Atualizar Termux
pkg update -y && pkg upgrade -y

# 2. Instalar dependências
pkg install -y nodejs ffmpeg git yarn python libwebp tmux

# 3. Clonar repositório
git clone https://github.com/MutanoXX/JustinXNika_Termux.git
cd JustinXNika_Termux

# 4. Executar script de instalação
bash termux-setup.sh
```

---

## ⚙️ Configuração Inicial

Durante a instalação o script vai perguntar:

```
════════════════════════════════════════
     CONFIGURAÇÃO DO DONO DO BOT
════════════════════════════════════════

Deseja configurar o número do dono agora?
  [1] Sim   → Inserir meu número
  [2] Não   → Usar configuração padrão
```

### Se escolher **Sim**:
- Digite seu número (ex: `5511999999999`)
- O script atualiza automaticamente:
  - `setting/config.js`
  - `Access/Own.json`

### Se escolher **Não**:
- Mantém a configuração padrão

---

## ▶️ Comandos Essenciais

### Iniciar o Bot

```bash
# Forma simples
yarn start

# Ou
node connect.js
```

### Recomendado (tmux)

```bash
# Criar sessão
tmux new -s bot

# Rodar o bot
node connect.js

# Minimizar (deixar rodando)
# Pressione: Ctrl + B → D

# Voltar para a sessão
tmux attach -t bot
```

### Parar o Bot
Pressione `CTRL + C`

### Após Fechar o Termux

Se você fechou o Termux e quer voltar o bot:

```bash
# 1. Abra o Termux

# 2. Entre na pasta do bot
cd JustinXNika_Termux

# 3. Volte para a sessão do tmux
tmux attach -t bot
```

Se a sessão não existir mais:

```bash
# Crie uma nova sessão
tmux new -s bot

# Rode o bot
yarn start
```

---

## ❗ Problemas Comuns + Soluções

### 1. Erro do Sharp (mais comum)

```
npm error sharp: Prebuilt libvips binaries are not yet available for android-arm64v8
```

**Solução:**
```bash
npm rebuild sharp --build-from-source
```

### 2. Erro de FFmpeg

```
ffmpeg not found / spawn ffmpeg ENOENT
```

**Solução:**
```bash
pkg install ffmpeg -y
```

### 3. Bot não gera QR Code

**Solução:**
```bash
rm -rf session
node connect.js
```

### 4. Bot cai após alguns minutos

**Solução (usar tmux):**
```bash
pkg install tmux -y
tmux new -s bot
node connect.js
```

### 5. Erro de permissão

**Solução:**
```bash
chmod +x termux-setup.sh
termux-setup-storage
```

### 6. Erro de libwebp

```
libwebp.so.7: cannot open shared object file
```

**Solução:**
```bash
pkg install libwebp -y
```

---

## 🔄 Atualizações

```bash
cd JustinXNika_Termux
git pull
yarn install
```

---

## 📞 Suporte

- **Repositório Oficial:** https://github.com/MutanoXX/JustinXNika_Termux
- **Canal WhatsApp:** https://whatsapp.com/channel/0029VbArk5aBVJl7HTKxKw0j

---

## 👤 Créditos

**Adaptado para Termux por:** MutanoX  
**Repositório:** https://github.com/MutanoXX/JustinXNika_Termux

---

**Feito com ❤️ por MutanoX**