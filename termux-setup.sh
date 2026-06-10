#!/data/data/com.termux/files/usr/bin/bash
# ============================================
#   JUSTIN X NIKA - BOT WHATSAPP PARA TERMUX
#   Versão 3.6 - Defensiva e Robusta (por MutanoX)
# ============================================

set +e

# Cores
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
CYAN='\e[36m'
MAGENTA='\e[35m'
WHITE='\e[97m'
BOLD='\e[1m'
NC='\e[0m'

clear

echo -e "${CYAN}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║     ██████╗  ██████╗ ████████╗    ██╗  ██╗    ███╗   ██╗    ║"
echo "║           🤖 BOT WHATSAPP MULTI-DEVICE 🤖                    ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "${NC}"
echo -e "${MAGENTA}${BOLD}        Adaptado para Termux por MutanoX${NC}\n"

echo -e "${GREEN}[INFO]${NC} Iniciando instalação do Justin X Nika..."

# 1. Atualizar pacotes
echo -e "\n${YELLOW}[1/10]${NC} Atualizando pacotes..."
pkg update -y && pkg upgrade -y

# 2. Instalar dependências principais
echo -e "\n${YELLOW}[2/10]${NC} Instalando dependências..."
pkg install -y nodejs ffmpeg git yarn python libwebp tmux build-essential clang

# 3. Verificar Node.js
echo -e "\n${YELLOW}[3/10]${NC} Verificando Node.js..."
if ! command -v node &> /dev/null; then
    echo -e "${RED}[ERRO]${NC} Node.js não encontrado!"
    exit 1
fi
node --version

# 4. Instalar dependências do bot
echo -e "\n${YELLOW}[4/10]${NC} Instalando dependências do bot (pode demorar)..."

if yarn install 2>/dev/null; then
    echo -e "${GREEN}[OK]${NC} Yarn instalado com sucesso!"
elif npm install --legacy-peer-deps 2>/dev/null; then
    echo -e "${GREEN}[OK]${NC} npm instalado com sucesso!"
else
    echo -e "${RED}[ERRO]${NC} Falha ao instalar dependências."
    echo -e "${YELLOW}[DICA]${NC} Tente rodar manualmente: yarn install"
    exit 1
fi

# 5. Tentar compilar Sharp
echo -e "\n${YELLOW}[5/10]${NC} Tentando compilar Sharp..."
if npm rebuild sharp --build-from-source 2>/dev/null; then
    echo -e "${GREEN}[✓]${NC} Sharp compilado!"
else
    echo -e "${YELLOW}[AVISO]${NC} Sharp pode precisar de compilação manual depois."
fi

# 6. Criar pastas
echo -e "\n${YELLOW}[6/10]${NC} Criando pastas..."
mkdir -p session temp Access

# 7. Permissões
chmod +x termux-setup.sh 2>/dev/null || true
termux-setup-storage

# 8. Configuração do Owner (opcional)
echo -e "\n${CYAN}════════════════════════════════════════${NC}"
echo -e "${CYAN}   CONFIGURAÇÃO DO DONO (OPCIONAL)${NC}"
echo -e "${CYAN}════════════════════════════════════════${NC}\n"

echo -e "${YELLOW}Deseja configurar o número do dono agora? (recomendado)${NC}"
echo -e "  ${GREEN}[1] Sim${NC}"
echo -e "  ${RED}[2] Não${NC}"
echo ""
read -p "Escolha: " CONFIG_OWNER

if [ "$CONFIG_OWNER" == "1" ]; then
    echo ""
    read -p "Digite seu número (ex: 5511999999999): " OWNER_NUMBER
    
    if [ ! -z "$OWNER_NUMBER" ]; then
        # Atualiza config.js se existir
        if [ -f setting/config.js ]; then
            sed -i "s/global.owner = \['[^']*'\]/global.owner = ['$OWNER_NUMBER']/" setting/config.js 2>/dev/null || true
        fi
        echo "[\"$OWNER_NUMBER\"]" > Access/Own.json
        echo -e "${GREEN}[✓]${NC} Número salvo: $OWNER_NUMBER"
    fi
fi

# 9. Verificar FFmpeg
echo -e "\n${YELLOW}[9/10]${NC} Verificando FFmpeg..."
ffmpeg -version | head -1 || echo -e "${YELLOW}[AVISO]${NC} FFmpeg não encontrado"

# 10. Final
echo -e "\n${GREEN}════════════════════════════════════════${NC}"
echo -e "${GREEN}     ✓ INSTALAÇÃO CONCLUÍDA!${NC}"
echo -e "${GREEN}════════════════════════════════════════${NC}\n"

echo -e "${WHITE}Para iniciar o bot:${NC}"
echo -e "  ${BLUE}yarn start${NC}   ou   ${BLUE}node connect.js${NC}"
echo ""
echo -e "${WHITE}Recomendado:${NC}"
echo -e "  tmux new -s bot"
echo -e "  node connect.js"
echo ""
echo -e "${CYAN}Canal oficial: https://whatsapp.com/channel/0029VbArk5aBVJl7HTKxKw0j${NC}"
echo ""
echo -e "${MAGENTA}Adaptado por MutanoX${NC}"
echo -e "${GREEN}════════════════════════════════════════${NC}"