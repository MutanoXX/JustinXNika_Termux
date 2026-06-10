#!/data/data/com.termux/files/usr/bin/bash
# ============================================
#   JUSTIN X NIKA - BOT WHATSAPP PARA TERMUX
#   Versão 4.6 - Sharp Stub + Limpeza de sessão no setup
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

clean_auth_dirs() {
    echo -e "${YELLOW}[INFO]${NC} Limpando sessões antigas, se existirem..."

    local removed=0
    for dir in session sessions auth_info; do
        if [ -e "$dir" ]; then
            rm -rf "$dir"
            echo -e "      ${GREEN}[OK]${NC} Removido: $dir"
            removed=1
        fi
    done

    if [ "$removed" -eq 0 ]; then
        echo -e "      ${CYAN}[INFO]${NC} Nenhuma sessão antiga encontrada."
    fi
}

install_sharp_stub() {
    echo -e "${YELLOW}[INFO]${NC} Aplicando Sharp stub compatível com Termux/Android..."

    mkdir -p node_modules/sharp/lib

    cat > node_modules/sharp/package.json << 'EOF'
{
  "name": "sharp",
  "version": "0.32.6-termux-stub",
  "description": "Stub do sharp para evitar erro de binário nativo no Termux/Android",
  "main": "index.js",
  "type": "commonjs"
}
EOF

    cat > node_modules/sharp/index.js << 'EOF'
'use strict';

function createSharpStub(input) {
  const state = { input };
  let proxy;

  const api = {
    metadata: async function () {
      return { width: 0, height: 0, format: 'unknown' };
    },
    toFile: async function (file) {
      const fs = require('fs');
      await fs.promises.writeFile(file, Buffer.isBuffer(state.input) ? state.input : Buffer.from(''));
      return { format: 'unknown', width: 0, height: 0, size: 0 };
    },
    toBuffer: async function () {
      if (Buffer.isBuffer(state.input)) return state.input;
      if (typeof state.input === 'string') {
        try { return require('fs').readFileSync(state.input); } catch (_) {}
      }
      return Buffer.from('');
    }
  };

  proxy = new Proxy(api, {
    get(target, prop) {
      if (prop in target) return target[prop];
      if (prop === 'then') return undefined;
      return function () { return proxy; };
    }
  });

  return proxy;
}

createSharpStub.cache = function () { return createSharpStub; };
createSharpStub.concurrency = function () { return 1; };
createSharpStub.simd = function () { return false; };
createSharpStub.format = {};
createSharpStub.versions = { sharp: '0.32.6-termux-stub' };

module.exports = new Proxy(createSharpStub, {
  get(target, prop) {
    if (prop in target) return target[prop];
    return function () { return target; };
  }
});
EOF

    # Alguns códigos/bibliotecas importam arquivos internos do Sharp diretamente.
    for file in lib/index.js lib/sharp.js lib/constructor.js lib/input.js lib/output.js lib/resize.js lib/composite.js lib/operation.js lib/colour.js lib/channel.js lib/utility.js; do
        cat > "node_modules/sharp/$file" << 'EOF'
'use strict';
module.exports = require('../index.js');
EOF
    done

    echo -e "      ${GREEN}[✓]${NC} Sharp stub criado com sucesso!"
}

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

echo -e "${YELLOW}[1/8]${NC} Atualizando pacotes..."
pkg update -y && pkg upgrade -y > /dev/null 2>&1

echo -e "${YELLOW}[2/8]${NC} Instalando dependências do sistema..."
pkg install -y nodejs ffmpeg git yarn python libwebp tmux build-essential clang > /dev/null 2>&1

echo -e "${YELLOW}[3/8]${NC} Verificando Node.js..."
if ! command -v node &> /dev/null; then
    echo -e "${RED}[ERRO]${NC} Node.js não encontrado!"
    exit 1
fi
echo -e "      ${GREEN}Node.js:${NC} $(node --version)"

echo -e "\n${YELLOW}[4/8]${NC} Instalando dependências do bot (pode demorar)..."

if yarn install --network-timeout 180000 > /dev/null 2>&1; then
    echo -e "      ${GREEN}[OK]${NC} Dependências instaladas com Yarn"
elif npm install --legacy-peer-deps > /dev/null 2>&1; then
    echo -e "      ${GREEN}[OK]${NC} Dependências instaladas com npm"
else
    echo -e "${RED}[ERRO]${NC} Falha na instalação das dependências."
    echo -e "${YELLOW}[DICA]${NC} Tente novamente com internet estável: bash termux-setup.sh"
    exit 1
fi

# ============================================
#           CORRIGIR SHARP NO TERMUX
# ============================================
echo -e "\n${YELLOW}[5/8]${NC} Corrigindo módulo Sharp..."
install_sharp_stub

# ============================================
#           LIMPAR SESSÕES ANTIGAS
# ============================================
echo -e "\n${YELLOW}[6/8]${NC} Preparando autenticação limpa..."
clean_auth_dirs

# ============================================
#           CRIAR PASTAS
# ============================================
echo -e "\n${YELLOW}[7/8]${NC} Criando pastas necessárias..."
mkdir -p temp Access
chmod +x termux-setup.sh 2>/dev/null || true

echo -e "      ${GREEN}[OK]${NC} Pastas prontas"

# ============================================
#           PERMISSÃO DE ARMAZENAMENTO
# ============================================
echo -e "\n${YELLOW}[8/8]${NC} Configurando permissão de armazenamento..."
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
echo -e "  ${CYAN}2.${NC} cd ~/JustinXNika_Termux"
echo -e "  ${CYAN}3.${NC} Rode novamente: ${BLUE}bash termux-setup.sh${NC}"
echo -e "  ${CYAN}4.${NC} Se ainda existir tmux antigo: ${BLUE}tmux attach -t bot${NC}"
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
    echo -e "\n${GREEN}[INFO]${NC} Limpando sessões antigas antes de iniciar..."
    echo -e "${YELLOW}[DICA]${NC} Para minimizar use: Ctrl+B → D"
    echo -e "${YELLOW}[DICA]${NC} Para voltar use: tmux attach -t bot"
    echo ""
    sleep 2
    clean_auth_dirs
    install_sharp_stub
    node connect.js
fi
