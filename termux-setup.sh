#!/data/data/com.termux/files/usr/bin/bash
# ============================================
#   JUSTIN X NIKA - BOT WHATSAPP PARA TERMUX
#   Versão 3.2 - Otimizado por MutanoX
# ============================================

set -e

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

# ============================================
#           CABEÇALHO DECORADO
# ============================================
echo -e "${CYAN}"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                                                              ║"
echo "║     ██████╗  ██████╗ ████████╗    ██╗  ██╗    ███╗   ██╗    ║"
echo "║     ██╔══██╗██╔═══██╗╚══██╔══╝    ╚██╗██╔╝    ████╗  ██║    ║"
echo "║     ██████╔╝██║   ██║   ██║        ╚███╔╝     ██╔██╗ ██║    ║"
echo "║     ██╔══██╗██║   ██║   ██║        ██╔██╗     ██║╚██╗██║    ║"
echo "║     ██████╔╝╚██████╔╝   ██║       ██╔╝ ██╗    ██║ ╚████║    ║"
echo "║     ╚═════╝  ╚═════╝    ╚═╝       ╚═╝  ╚═╝    ╚═╝  ╚═══╝    ║"
echo "║                                                              ║"
echo "║           🤖 BOT WHATSAPP MULTI-DEVICE 🤖                    ║"
echo "║                                                              ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

echo -e "${MAGENTA}${BOLD}        Adaptado para Termux por MutanoX${NC}"
echo -e "${CYAN}              https://github.com/MutanoXX${NC}\n"

echo -e "${GREEN}[INFO]${NC} Iniciando instalação e configuração do Justin X Nika..."

# ============================================
#           INSTALAÇÃO DAS DEPENDÊNCIAS
# ============================================

echo -e "\n${YELLOW}════════════════════════════════════════${NC}"
echo -e "${YELLOW}  [1/8] Atualizando pacotes do Termux...${NC}"
echo -e "${YELLOW}════════════════════════════════════════${NC}"
pkg update -y && pkg upgrade -y

echo -e "\n${YELLOW}════════════════════════════════════════${NC}"
echo -e "${YELLOW}  [2/8] Instalando dependências do sistema...${NC}"
echo -e "${YELLOW}════════════════════════════════════════${NC}"
pkg install -y nodejs ffmpeg git yarn python libwebp libjpeg-turbo libpng python-pip tmux

echo -e "\n${YELLOW}════════════════════════════════════════${NC}"
echo -e "${YELLOW}  [3/8] Verificando Node.js e Yarn...${NC}"
echo -e "${YELLOW}════════════════════════════════════════${NC}"
node --version || { echo -e "${RED}[ERRO]${NC} Node.js não encontrado!"; exit 1; }
yarn --version || { echo -e "${RED}[ERRO]${NC} Yarn não encontrado!"; exit 1; }

echo -e "\n${YELLOW}════════════════════════════════════════${NC}"
echo -e "${YELLOW}  [4/8] Instalando dependências do bot...${NC}"
echo -e "${YELLOW}════════════════════════════════════════${NC}"
echo -e "${BLUE}[INFO]${NC} Isso pode demorar alguns minutos..."
npm config set python python
if yarn install; then
    echo -e "${GREEN}[OK]${NC} Dependências instaladas com sucesso!"
else
    echo -e "${YELLOW}[AVISO]${NC} Tentando com npm..."
    npm install --legacy-peer-deps
fi

echo -e "\n${YELLOW}════════════════════════════════════════${NC}"
echo -e "${YELLOW}  [5/8] Criando pastas e permissões...${NC}"
echo -e "${YELLOW}════════════════════════════════════════${NC}"
mkdir -p session temp
chmod +x termux-setup.sh
chmod +x connect.js 2>/dev/null || true
termux-setup-storage

# ============================================
#       CONFIGURAÇÃO INTERATIVA DO OWNER
# ============================================
echo -e "\n${CYAN}════════════════════════════════════════${NC}"
echo -e "${CYAN}       CONFIGURAÇÃO DO DONO DO BOT${NC}"
echo -e "${CYAN}════════════════════════════════════════${NC}\n"

echo -e "${YELLOW}Deseja configurar o número do dono agora?${NC}"
echo -e "  ${GREEN}[1] Sim${NC}   → Inserir meu número"
echo -e "  ${RED}[2] Não${NC}   → Usar configuração padrão"
echo ""
read -p "Escolha (1 ou 2): " CONFIG_OWNER

if [ "$CONFIG_OWNER" == "1" ]; then
    echo ""
    echo -e "${BLUE}Digite o número do dono (sem + e sem espaços):${NC}"
    echo -e "Exemplo: ${YELLOW}5511999999999${NC}"
    read -p "Número: " OWNER_NUMBER
    
    if [ ! -z "$OWNER_NUMBER" ]; then
        sed -i "s/global.owner = \['[^']*'\]/global.owner = ['$OWNER_NUMBER']/" setting/config.js
        echo "[\"$OWNER_NUMBER\"]" > Access/Own.json
        echo -e "${GREEN}[✓]${NC} Número configurado com sucesso: ${YELLOW}$OWNER_NUMBER${NC}"
    else
        echo -e "${YELLOW}[!]${NC} Número vazio. Mantendo padrão."
    fi
else
    echo -e "${YELLOW}[!]${NC} Mantendo configuração padrão."
fi

# ============================================
#              FINALIZAÇÃO
# ============================================
echo -e "\n${YELLOW}════════════════════════════════════════${NC}"
echo -e "${YELLOW}  [6/8] Verificando FFmpeg...${NC}"
echo -e "${YELLOW}════════════════════════════════════════${NC}"
ffmpeg -version | head -1 || echo -e "${YELLOW}[AVISO]${NC} FFmpeg pode precisar de reinstalação"

echo -e "\n${GREEN}════════════════════════════════════════${NC}"
echo -e "${GREEN}     ✓ INSTALAÇÃO CONCLUÍDA COM SUCESSO!${NC}"
echo -e "${GREEN}════════════════════════════════════════${NC}\n"

echo -e "${WHITE}${BOLD}COMO INICIAR O BOT:${NC}"
echo -e "  ${CYAN}▶${NC}  ${BLUE}yarn start${NC}"
echo -e "  ${CYAN}▶${NC}  ${BLUE}node connect.js${NC}"
echo ""
echo -e "${WHITE}${BOLD}RECOMENDADO (usar tmux):${NC}"
echo -e "  ${CYAN}1.${NC} tmux new -s bot"
echo -e "  ${CYAN}2.${NC} node connect.js"
echo -e "  ${CYAN}3.${NC} (Ctrl+B → D para minimizar)"
echo ""
echo -e "${WHITE}${BOLD}CANAL OFICIAL DO BOT:${NC}"
echo -e "  ${CYAN}https://whatsapp.com/channel/0029VbArk5aBVJl7HTKxKw0j${NC}"
echo ""
echo -e "${MAGENTA}${BOLD}Adaptado para Termux por MutanoX${NC}"
echo -e "${CYAN}https://github.com/MutanoXX/JustinXNika_Termux${NC}"
echo ""
echo -e "${GREEN}════════════════════════════════════════${NC}"