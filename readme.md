# 🤖 Justin X Nika

> **Bot WhatsApp Multi-Device** • Otimizado para **Termux**

---

## 📋 Índice

| Seção | Descrição |
|-------|-----------|
| [Sobre](#sobre) | O que é o bot |
| [Instalação](#instalação) | Como instalar |
| [Comandos](#comandos) | Lista de comandos |
| [Após Fechar o Termux](#após-fechar-o-termux) | Como voltar o bot |
| [Problemas Comuns](#problemas-comuns) | Soluções de erros |

---

## Sobre

**Justin X Nika** é um bot WhatsApp completo baseado em **@whiskeysockets/baileys**.

Ele oferece recursos avançados de **grupo**, **downloads**, **mídia** e **administração**.

---

## Instalação

### Método Rápido (Recomendado)

```bash
pkg update -y && pkg install -y nodejs ffmpeg git yarn python libwebp tmux build-essential clang && \
git clone https://github.com/MutanoXX/JustinXNika_Termux.git && \
cd JustinXNika_Termux && \
bash termux-setup.sh
```

### Passo a Passo

```bash
# 1. Atualizar Termux
pkg update -y && pkg upgrade -y

# 2. Instalar dependências
pkg install -y nodejs ffmpeg git yarn python libwebp tmux build-essential clang

# 3. Clonar o repositório
git clone https://github.com/MutanoXX/JustinXNika_Termux.git
cd JustinXNika_Termux

# 4. Executar o instalador
bash termux-setup.sh
```

---

## Comandos

### 👑 Owner Menu

| Comando | Descrição |
|---------|-----------|
| `.addprem` | Adicionar usuário Premium |
| `.delprem` | Remover usuário Premium |
| `.addown` | Adicionar novo Owner |
| `.tagsw` | Marcar Status |
| `.private` | Ativar modo privado |
| `.public` | Ativar modo público |

### ⚔️ Geprek Menu

| Comando | Descrição |
|---------|-----------|
| `.nikspam` | Spam de mensagens |
| `.tinvis` | Invisível |
| `.jusui` | — |
| `.nikfreze` | Congelar |
| `.delayxcombobox` | Combo com delay |
| `.xcombogod` | Combo poderoso |

### 🔥 All Petinggi

- **Justin**
- **Depay**

---

## Após Fechar o Termux

Se você fechou o Termux e quer voltar o bot:

```bash
# 1. Abra o Termux

# 2. Entre na pasta
cd JustinXNika_Termux

# 3. Volte para a sessão
tmux attach -t bot
```

Se a sessão não existir:

```bash
tmux new -s bot
yarn start
```

---

## Problemas Comuns

### Erro do Sharp

```bash
npm rebuild sharp --build-from-source
```

### Bot não gera QR Code

```bash
rm -rf session
node connect.js
```

### Bot cai após fechar Termux

Use **tmux**:

```bash
tmux new -s bot
node connect.js
```

Para voltar depois:

```bash
tmux attach -t bot
```

---

## Créditos

**Adaptado para Termux por:** [MutanoX](https://github.com/MutanoXX)  
**Repositório Oficial:** https://github.com/MutanoXX/JustinXNika_Termux

---

**Feito com ❤️ por MutanoX**