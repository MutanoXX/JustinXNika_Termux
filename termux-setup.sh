#!/data/data/com.termux/files/usr/bin/bash
# ============================================
#   JUSTIN X NIKA - BOT WHATSAPP PARA TERMUX
#   Versão 4.5 - Sharp Fake + Sem Input de Número (por MutanoX)
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
echo "║           🤖  JUSTIN X NIKA - WHATSAPP BOT  🤖               ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "${NC}"

echo -e "${MAGENTA}${BOLD}           Adaptado para Termux por MutanoX${NC}"
echo -e "${CYAN}         https://github.com/MutanoXX/JustinXNika_Termux${NC}\n"

echo -e "${GREEN}[INFO]${NC} Iniciando instalação do Justin X Nika...\n"

# ============================================
#           INSTALAÇÃO
# ============================================

echo -e "${YELLOW}[1/7]${NC} Atualizando pacotes..."
pkg update -y && pkg upgrade -y > /dev/null 2>&1

echo -e "${YELLOW}[2/7]${NC} Instalando dependências do sistema..."
pkg install -y nodejs ffmpeg git yarn python libwebp tmux build-essential clang > /dev/null 2>&1

echo -e "${YELLOW}[3/7]${NC} Verificando Node.js..."
if ! command -v node &> /dev/null; then
    echo -e "${RED}[ERRO]${NC} Node.js não encontrado!"
    exit 1
fi
echo -e "      ${GREEN}Node.js:${NC} $(node --version)"

echo -e "\n${YELLOW}[4/7]${NC} Instalando dependências do bot (pode demorar)..."

if yarn install --network-timeout 180000 > /dev/null 2>&1; then
    echo -e "      ${GREEN}[OK]${NC} Dependências instaladas com Yarn"
elif npm install --legacy-peer-deps > /dev/null 2>&1; then
    echo -e "      ${GREEN}[OK]${NC} Dependências instaladas com npm"
else
    echo -e "${RED}[ERRO]${NC} Falha na instalação das dependências."
    exit 1
fi

# ============================================
#           CRIAR SHARP FAKE
# ============================================
echo -e "\n${YELLOW}[5/7]${NC} Criando módulo Sharp fake (necessário para Termux)..."

mkdir -p node_modules/sharp

cat > node_modules/sharp/index.js << 'EOF'
module.exports = {
  resize: () => ({ toBuffer: async () => Buffer.from('') }),
  png: () => ({ toBuffer: async () => Buffer.from('') }),
  jpeg: () => ({ toBuffer: async () => Buffer.from('') }),
  webp: () => ({ toBuffer: async () => Buffer.from('') }),
};
EOF

echo -e "      ${GREEN}[✓]${NC} Sharp fake criado com sucesso!"

echo -e "\n${YELLOW}[6/7]${NC} Criando pastas..."
mkdir -p session temp Access
chmod +x termux-setup.sh 2>/dev/null || true

# ============================================
#           PERMISSÃO DE ARMAZENAMENTO
# ============================================
echo -e "\n${YELLOW}[7/7]${NC} Configurando permissão de armazenamento..."
echo -e "${YELLOW}[DICA]${NC} Pode aparecer uma janela pedindo permissão. Toque em 'Permitir'."
termux-setup-storage

# ============================================
#           FINALIZAÇÃO
# ============================================
echo -e "\n${GREEN}════════════════════════════════════════${NC}"
echo -e "${GREEN}     ✓ INSTALAÇÃO CONCLUÍDA COM SUCESSO!${NC}"
echo -e "${GREEN}════════════════════════════════════════${NC}\n"

echo -e "${WHITE}${BOLD}COMO INICIAR O BOT:${NC}"
echo -e "  ${CYAN}▶${NC}  ${BLUE}yarn start${NC}"
echo -e "  ${CYAN}▶${NC}  ${BLUE}node connect.js${NC}"
echo ""
echo -e "${WHITE}${BOLD}RECOMENDADO (tmux):${NC}"
echo -e "  ${CYAN}1.${NC} tmux new -s bot"
echo -e "  ${CYAN}2.${NC} node connect.js"
echo -e "  ${CYAN}3.${NC} (Ctrl+B → D para minimizar)"
echo ""
echo -e "${WHITE}${BOLD}APÓS FECHAR O TERMUX:${NC}"
echo -e "  ${CYAN}1.${NC} Abra o Termux novamente"
echo -e "  ${CYAN}2.${NC} Rode: ${BLUE}tmux attach -t bot${NC}"
echo ""
echo -e "${WHITE}${BOLD}CONFIGURAR NÚMERO (opcional):${NC}"
echo -e "  Edite o arquivo ${BLUE}setting/config.js${NC} e defina:"
echo -e "  ${CYAN}global.myNumber = ['55SEU_NUMERO']${NC}"
echo ""
echo -e "${CYAN}Canal oficial: https://whatsapp.com/channel/0029VbArk5aBVJl7HTKxKw0j${NC}"
echo ""
echo -e "${MAGENTA}${BOLD}Adaptado para Termux por MutanoX${NC}"
echo -e "${GREEN}════════════════════════════════════════${NC}"

# ============================================
#           INICIAR O BOT AGORA?
# ============================================
echo ""
read -p "Deseja iniciar o bot agora? (s/n): " START_NOW

if [[ "$START_NOW" =~ ^[Ss]$ ]]; then
    echo -e "\n${GREEN}[INFO]${NC} Iniciando o bot..."
    echo -e "${YELLOW}[DICA]${NC} Para minimizar use: Ctrl+B → D"
    echo -e "${YELLOW}[DICA]${NC} Para voltar use: tmux attach -t bot"
    echo ""
    sleep 2
    yarn start
fi
