#!/bin/bash
# Deploy Script para SlimSoda no AAPanel

echo "🚀 Iniciando deploy do SlimSoda..."

# Diretório do site
SITE_DIR="/www/wwwroot/slimsodafitdrink.store"

# Criar diretório se não existir
mkdir -p $SITE_DIR

# Ir para o diretório
cd $SITE_DIR

# Remover arquivos antigos (se existir)
rm -rf *

# Clonar repositório do GitHub
echo "📥 Clonando repositório..."
git clone https://github.com/privadokauan2020-cpu/slimsoda-vsl.git temp_repo

# Mover arquivos para o diretório raiz
echo "📦 Movendo arquivos..."
mv temp_repo/* .
mv temp_repo/.* . 2>/dev/null

# Remover pasta temporária
rm -rf temp_repo

# Ajustar permissões
echo "🔐 Ajustando permissões..."
chown -R www:www $SITE_DIR
chmod -R 755 $SITE_DIR

echo "✅ Deploy concluído!"
echo "📍 Site disponível em: http://slimsodafitdrink.store"
echo ""
echo "Arquivos no site:"
ls -lh $SITE_DIR
