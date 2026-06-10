# 🤖 Justin X Nika Termux

Bot WhatsApp Multi-Device adaptado para rodar no **Termux**.

> Repositório: https://github.com/MutanoXX/JustinXNika_Termux

---

## 📌 O que este projeto faz

O **Justin X Nika** é um bot WhatsApp baseado em Baileys, com recursos para grupos, mídia, downloads, administração e comandos de owner.

Esta versão foi ajustada para facilitar a instalação no Android usando **Termux**, incluindo correções para dependências problemáticas como o `sharp`.

---

## ✅ Melhorias do setup Termux

O arquivo principal de preparação é:

```bash
termux-setup.sh
```

Ele faz automaticamente:

- atualiza os pacotes do Termux;
- instala dependências do sistema;
- instala dependências Node.js do bot;
- corrige o erro do módulo **Sharp** no Android/Termux;
- remove sessões antigas **somente se existirem**:

```bash
session/
sessions/
auth_info/
```

- pergunta se o usuário deseja iniciar o bot no final;
- se o usuário responder `s`, inicia com:

```bash
node connect.js
```

---

## 📲 Instalação rápida

Copie e cole no Termux:

```bash
pkg update -y && pkg upgrade -y
pkg install -y nodejs ffmpeg git yarn python libwebp tmux build-essential clang
git clone https://github.com/MutanoXX/JustinXNika_Termux.git
cd JustinXNika_Termux
bash termux-setup.sh
```

---

## 🧩 Instalação passo a passo

### 1. Atualizar o Termux

```bash
pkg update -y && pkg upgrade -y
```

### 2. Instalar dependências

```bash
pkg install -y nodejs ffmpeg git yarn python libwebp tmux build-essential clang
```

### 3. Clonar o projeto

```bash
git clone https://github.com/MutanoXX/JustinXNika_Termux.git
cd JustinXNika_Termux
```

### 4. Rodar o setup

```bash
bash termux-setup.sh
```

No final, digite `s` se quiser iniciar o bot imediatamente.

---

## ▶️ Como iniciar o bot

### Método recomendado

Sempre que quiser preparar o ambiente, limpar sessões antigas e corrigir o Sharp antes de iniciar:

```bash
cd ~/JustinXNika_Termux
bash termux-setup.sh
```

Se você responder `s` no final, o bot será iniciado com:

```bash
node connect.js
```

### Iniciar direto

Se o ambiente já estiver preparado e você quiser iniciar direto:

```bash
cd ~/JustinXNika_Termux
node connect.js
```

ou:

```bash
yarn start
```

> Observação: iniciar direto com `node connect.js` ou `yarn start` não roda a limpeza/correção do setup. Para limpar `session`, `sessions` e `auth_info`, use `bash termux-setup.sh`.

---

## 🔄 Após fechar o Termux

Se fechou o Termux e quer abrir o bot novamente com ambiente limpo:

```bash
cd ~/JustinXNika_Termux
bash termux-setup.sh
```

O setup vai verificar e remover somente se existirem:

```bash
session/
sessions/
auth_info/
```

Depois ele pergunta se deseja iniciar o bot.

---

## 🖥️ Usando tmux

Para deixar o bot rodando mesmo após sair da tela do Termux:

```bash
cd ~/JustinXNika_Termux
tmux new -s bot
bash termux-setup.sh
```

Para minimizar a sessão:

```text
Ctrl + B, depois D
```

Para voltar:

```bash
tmux attach -t bot
```

Se a sessão antiga travar:

```bash
tmux kill-session -t bot
tmux new -s bot
bash termux-setup.sh
```

---

## ⚙️ Configuração opcional do número

Edite o arquivo:

```bash
setting/config.js
```

Procure ou defina:

```js
global.myNumber = ['55SEU_NUMERO']
```

Exemplo:

```js
global.myNumber = ['5567999999999']
```

---

## 🧾 Comandos principais

### 👑 Owner Menu

| Comando | Descrição |
|---|---|
| `.addprem` | Adicionar usuário Premium |
| `.delprem` | Remover usuário Premium |
| `.addown` | Adicionar novo Owner |
| `.tagsw` | Marcar Status |
| `.private` | Ativar modo privado |
| `.public` | Ativar modo público |

### ⚔️ Geprek Menu

| Comando | Descrição |
|---|---|
| `.nikspam` | Spam de mensagens |
| `.tinvis` | Invisível |
| `.jusui` | Comando do bot |
| `.nikfreze` | Congelar |
| `.delayxcombobox` | Combo com delay |
| `.xcombogod` | Combo poderoso |

---

## 🛠️ Problemas comuns

### Erro do Sharp

Erro exemplo:

```text
Cannot find module '../build/Release/sharp-android-arm64v8.node'
Something went wrong installing the "sharp" module
```

Solução:

```bash
cd ~/JustinXNika_Termux
bash termux-setup.sh
```

O setup recria o stub compatível com Termux/Android.

---

### Bot não gera QR Code ou não conecta

Rode:

```bash
cd ~/JustinXNika_Termux
bash termux-setup.sh
```

O script remove as pastas de sessão apenas se elas existirem:

```bash
session/
sessions/
auth_info/
```

---

### `already-exists` ao entrar em grupo

Significa que o bot provavelmente já está no grupo ou o convite já foi usado.

---

### `rate-limit` ao entrar em grupo

Significa que o WhatsApp limitou muitas tentativas em sequência. Aguarde um tempo antes de tentar novamente.

---

## 📁 Estrutura básica

```text
JustinXNika_Termux/
├── Access/
├── System/
├── setting/
├── connect.js
├── justin.js
├── package.json
├── readme.md
└── termux-setup.sh
```

Pastas como `session`, `sessions`, `auth_info`, `temp` e `node_modules` são geradas durante o uso e não devem ser enviadas para o GitHub.

---

## 📢 Canal oficial

```text
https://whatsapp.com/channel/0029VbArk5aBVJl7HTKxKw0j
```

---

## 👤 Créditos

Adaptado para Termux por **MutanoX**.

GitHub: https://github.com/MutanoXX

---

**Feito com ❤️ por MutanoX**
