# 🤖 Justin X Nika - Bot WhatsApp para Termux

**Versão:** 3.1 (Termux Optimized)  
**Autor:** Justin X Nika  
**Última atualização:** 10 de Junho de 2026

---

## ⚠️ AVISO IMPORTANTE

Este bot foi **obfuscado** (código protegido), o que dificulta algumas adaptações.  
Algumas funcionalidades podem apresentar problemas no Termux.

---

## 📋 Índice

1. [Problemas Conhecidos no Termux](#problemas-conhecidos-no-termux)
2. [Instalação Correta](#instalação-correta)
3. [Solução de Problemas Comuns](#solução-de-problemas-comuns)
4. [Comandos Essenciais](#comandos-essenciais)
5. [Configuração](#configuração)

---

## 🔴 Problemas Conhecidos no Termux

### 1. **Erro de Sharp (mais comum)**
```
Error: Cannot find module '../build/Release/sharp-linux-arm64v8.node'
```

**Solução:**
```bash
npm rebuild sharp --build-from-source
# ou
yarn add sharp --ignore-engines
```

### 2. **Erro de FFmpeg**
```
ffmpeg not found / spawn ffmpeg ENOENT
```

**Solução:**
```bash
pkg install ffmpeg -y
```

### 3. **Erro de Permissão**
```
bash: termux-setup.sh: No such file or directory
```

**Causa:** Você clonou o repositório **antes** dos arquivos serem adicionados.

**Solução:**
```bash
rm -rf JustinXNika
git clone https://github.com/MutanoXX/JustinXNika.git
cd JustinXNika
bash termux-setup.sh
```

### 4. **Bot não gera QR Code**
**Solução:**
```bash
rm -rf session
node connect.js
```

### 5. **Erro de memória**
```
FATAL ERROR: Reached heap limit Allocation failed
```

**Solução:**
```bash
export NODE_OPTIONS="--max-old-space-size=2048"
node connect.js
```

### 6. **Erro de libwebp**
```
Error: libwebp.so.7: cannot open shared object file
```

**Solução:**
```bash
pkg install libwebp -y
```

---

## 🚀 Instalação Correta (Passo a Passo)

### Método Recomendado (2026)

```bash
# 1. Atualizar Termux
pkg update -y && pkg upgrade -y

# 2. Instalar dependências básicas
pkg install -y nodejs ffmpeg git yarn python libwebp

# 3. Clonar repositório ATUALIZADO
git clone https://github.com/MutanoXX/JustinXNika.git
cd JustinXNika

# 4. Executar script de instalação
bash termux-setup.sh

# 5. Iniciar o bot
yarn start
```

### Se der erro de Sharp:

```bash
# Depois de rodar o script, execute:
npm rebuild sharp --build-from-source

# Depois rode novamente:
yarn start
```

---

## 🛠 Solução de Problemas Comuns

### Bot fecha sozinho após alguns minutos

**Use tmux:**

```bash
# Instalar tmux
pkg install tmux -y

# Criar sessão
tmux new -s bot

# Rodar o bot
node connect.js

# Para minimizar (deixar rodando em background):
# Pressione: Ctrl + B, depois solte e pressione D

# Para voltar:
tmux attach -t bot
```

### Bot não responde a comandos

1. Verifique se o número está em `setting/config.js`
2. Verifique se você é owner ou admin
3. Reinicie o bot

### QR Code não aparece

```bash
# Delete a sessão antiga
rm -rf session

# Rode novamente
node connect.js
```

### Erro ao baixar vídeos/áudios

```bash
# Reinstale ffmpeg
pkg install ffmpeg -y --reinstall
```

---

## ▶️ Comandos Essenciais

| Comando | Descrição |
|---------|-----------|
| `yarn start` | Inicia o bot |
| `node connect.js` | Inicia o bot (alternativo) |
| `tmux new -s bot` | Cria sessão tmux |
| `tmux attach -t bot` | Volta para a sessão |
| `rm -rf session` | Reseta a sessão do WhatsApp |
| `npm rebuild sharp` | Corrige erro do sharp |

---

## ⚙️ Configuração

### `setting/config.js`

```javascript
global.connect = true
global.publicX = true 
global.owner = ['6288103781881']        // SEU NÚMERO AQUI
global.prefa = ['','!','.',',','🐤','🗿']
```

### `Access/Own.json`

```json
["6288103768282", "SEU_NUMERO_AQUI"]
```

---

## 📦 Arquivos Incluídos na Adaptação

| Arquivo | Função |
|---------|--------|
| `termux-setup.sh` | Instalação automática |
| `arquivo.md` | Esta documentação |
| `session/` | Pasta criada automaticamente |

---

## ❓ Ainda com problemas?

1. **Tire print do erro**
2. **Verifique se rodou todos os comandos**
3. **Tente reinstalar o Termux** (último recurso)

---

**Bot adaptado para Termux por Arena.ai • 2026**