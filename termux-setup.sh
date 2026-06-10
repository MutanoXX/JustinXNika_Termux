#!/data/data/com.termux/files/usr/bin/bash
# ============================================
#   JUSTIN X NIKA - BOT WHATSAPP PARA TERMUX
#   Versão 3.7 - Instalação Mais Robusta (por MutanoX)
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

# ============================================
#           INSTALAÇÃO DAS DEPENDÊNCIAS
# ============================================

echo -e "\n${YELLOW}[1/9]${NC} Atualizando pacotes..."
pkg update -y && pkg upgrade -y

echo -e "\n${YELLOW}[2/9]${NC} Instalando dependências do sistema..."
pkg install -y nodejs ffmpeg git yarn python libwebp tmux build-essential clang

echo -e "\n${YELLOW}[3/9]${NC} Verificando Node.js..."
if ! command -v node &> /dev/null; then
    echo -e "${RED}[ERRO]${NC} Node.js não encontrado!"
    exit 1
fi
echo -e "${GREEN}[OK]${NC} Node.js: $(node --version)"

# ============================================
#     INSTALAÇÃO DAS DEPENDÊNCIAS DO BOT
# ============================================
echo -e "\n${YELLOW}[4/9]${NC} Instalando dependências do bot (pode demorar 5-15 min)..."

DEPS_INSTALLED=false

# Tenta com Yarn primeiro
echo -e "${BLUE}[INFO]${NC} Tentando com Yarn..."
if yarn install --network-timeout 100000 2>&1; then
    echo -e "${GREEN}[✓]${NC} Dependências instaladas com Yarn!"
    DEPS_INSTALLED=true
else
    echo -e "${YELLOW}[AVISO]${NC} Yarn falhou. Tentando com npm..."
    
    # Tenta com npm
    if npm install --legacy-peer-deps 2>&1; then
        echo -e "${GREEN}[✓]${NC} Dependências instaladas com npm!"
        DEPS_INSTALLED=true
    else
        echo -e "${RED}[ERRO]${NC} Falha ao instalar dependências."
        echo -e "${YELLOW}[DICA]${NC} Tente manualmente:"
        echo -e "       ${CYAN}cd ~/JustinXNika_Termux && yarn install${NC}"
        exit 1
    fi
fi

# ============================================
#           TRATAMENTO DO SHARP
# ============================================
echo -e "\n${YELLOW}[5/9]${NC} Tentando compilar Sharp..."

if npm rebuild sharp --build-from-source 2>&1; then
    echo -e "${GREEN}[✓]${NC} Sharp compilado com sucesso!"
else
    echo -e "${YELLOW}[AVISO]${NC} Sharp pode precisar de compilação manual depois."
    echo -e "${YELLOW}[DICA]${NC} Rode: ${CYAN}npm rebuild sharp --build-from-source${NC}"
fi

# ============================================
#           CRIAR PASTAS E PERMISSÕES
# ============================================
echo -e "\n${YELLOW}[6/9]${NC} Criando pastas..."
mkdir -p session temp Access

echo -e "\n${YELLOW}[7/9]${NC} Configurando permissões..."
chmod +x termux-setup.sh 2>/dev/null || true
termux-setup-storage

# ============================================
#       CONFIGURAÇÃO DO DONO (OPCIONAL)
# ============================================
echo -e "\n${CYAN}════════════════════════════════════════${NC}"
echo -e "${CYAN}   CONFIGURAÇÃO DO DONO (OPCIONAL)${NC}"
echo -e "${CYAN}════════════════════════════════════════${NC}\n"

echo -e "${YELLOW}Deseja configurar o número do dono agora?${NC}"
echo -e "  ${GREEN}[1] Sim${NC}"
echo -e "  ${RED}[2] Não${NC}"
echo ""
read -p "Escolha: " CONFIG_OWNER

if [ "$CONFIG_OWNER" == "1" ]; then
    echo ""
    read -p "Digite seu número (ex: 5511999999999): " OWNER_NUMBER
    
    if [ ! -z "$OWNER_NUMBER" ]; then
        if [ -f setting/config.js ]; then
            sed -i "s/global.owner = \['[^']*'\]/global.owner = ['$OWNER_NUMBER']/" setting/config.js 2>/dev/null || true
        fi
        echo "[\"$OWNER_NUMBER\"]" > Access/Own.json
        echo -e "${GREEN}[✓]${NC} Número salvo: $OWNER_NUMBER"
    fi
fi

# ============================================
#              FINALIZAÇÃO
# ============================================
echo -e "\n${YELLOW}[8/9]${NC} Verificando FFmpeg..."
ffmpeg -version | head -1 || echo -e "${YELLOW}[AVISO]${NC} FFmpeg não encontrado"

echo -e "\n${GREEN}════════════════════════════════════════${NC}"
echo -e "${GREEN}     ✓ INSTALAÇÃO CONCLUÍDA COM SUCESSO!${NC}"
echo -e "${GREEN}════════════════════════════════════════${NC}\n"

echo -e "${WHITE}${BOLD}Para iniciar o bot:${NC}"
echo -e "  ${BLUE}yarn start${NC}   ou   ${BLUE}node connect.js${NC}"
echo ""
echo -e "${WHITE}${BOLD}Recomendado (tmux):${NC}"
echo -e "  tmux new -s bot"
echo -e "  node connect.js"
echo ""
echo -e "${CYAN}Canal oficial: https://whatsapp.com/channel/0029VbArk5aBVJl7HTKxKw0j${NC}"
echo ""
echo -e "${MAGENTA}Adaptado por MutanoX${NC}"
echo -e "${GREEN}════════════════════════════════════════${NC}"