#!/bin/bash
# Deploy Script COMPLETO para SlimSoda no AAPanel
# Remove proteção de senha + Deploy + SSL

set -e  # Para em caso de erro

echo "🚀 Iniciando deploy COMPLETO do SlimSoda..."

# Variáveis
SITE_DIR="/www/wwwroot/slimsodafitdrink.store"
SITE_NAME="slimsodafitdrink.store"
NGINX_CONF="/www/server/panel/vhost/nginx/${SITE_NAME}.conf"
REPO_URL="https://github.com/privadokauan2020-cpu/slimsoda-vsl.git"

# ========================================
# 1. REMOVER PROTEÇÃO DE SENHA
# ========================================
echo ""
echo "🔓 Removendo proteção de senha do site..."

# Backup da configuração
cp $NGINX_CONF ${NGINX_CONF}.backup

# Remover linhas de autenticação básica
sed -i '/auth_basic/d' $NGINX_CONF
sed -i '/auth_basic_user_file/d' $NGINX_CONF

# Testar configuração do Nginx
echo "🔍 Testando configuração..."
nginx -t

# Se o teste passou, recarregar Nginx
if [ $? -eq 0 ]; then
    echo "✅ Configuração válida! Recarregando Nginx..."
    systemctl reload nginx
    echo "✅ Proteção removida com sucesso!"
else
    echo "❌ Erro na configuração. Restaurando backup..."
    cp ${NGINX_CONF}.backup $NGINX_CONF
    systemctl reload nginx
    exit 1
fi

# ========================================
# 2. DEPLOY DOS ARQUIVOS
# ========================================
echo ""
echo "📦 Fazendo deploy dos arquivos..."

# Criar diretório se não existir
mkdir -p $SITE_DIR

# Ir para o diretório
cd $SITE_DIR

# Remover arquivos antigos (exceto .user.ini)
find . -mindepth 1 ! -name '.user.ini' -delete

# Clonar repositório do GitHub
echo "📥 Clonando repositório..."
git clone $REPO_URL temp_repo

# Mover arquivos para o diretório raiz
echo "📂 Movendo arquivos..."
shopt -s dotglob
mv temp_repo/* . 2>/dev/null || true
shopt -u dotglob

# Remover pasta temporária
rm -rf temp_repo

# Ajustar permissões
echo "🔐 Ajustando permissões..."
chown -R www:www $SITE_DIR
chmod -R 755 $SITE_DIR

# ========================================
# 3. CONFIGURAR SSL (LET'S ENCRYPT)
# ========================================
echo ""
echo "🔒 Configurando SSL..."

# Verificar se certbot está instalado
if ! command -v certbot &> /dev/null; then
    echo "⚠️  Certbot não encontrado. Instalando..."
    apt-get update
    apt-get install -y certbot python3-certbot-nginx
fi

# Solicitar certificado SSL
echo "📜 Solicitando certificado SSL para ${SITE_NAME}..."
certbot --nginx -d ${SITE_NAME} -d www.${SITE_NAME} --non-interactive --agree-tos --email admin@${SITE_NAME} --redirect

# Verificar se SSL foi configurado
if [ $? -eq 0 ]; then
    echo "✅ SSL configurado com sucesso!"
else
    echo "⚠️  Não foi possível configurar SSL automaticamente."
    echo "Configure manualmente no AAPanel: Website → SSL → Let's Encrypt"
fi

# ========================================
# 4. VERIFICAÇÃO FINAL
# ========================================
echo ""
echo "🔍 Verificação final..."
echo "Arquivos no site:"
ls -lh $SITE_DIR

echo ""
echo "═══════════════════════════════════════"
echo "✅ DEPLOY CONCLUÍDO COM SUCESSO!"
echo "═══════════════════════════════════════"
echo ""
echo "🌐 Sites disponíveis:"
echo "   • https://${SITE_NAME}"
echo "   • https://${SITE_NAME}/cognihoney-pdp.html"
echo "   • https://${SITE_NAME}/cognihoney19,99.html"
echo ""
echo "🔓 Proteção de senha: REMOVIDA"
echo "🔒 SSL/HTTPS: CONFIGURADO"
echo "📦 Arquivos: DEPLOYED"
echo ""
echo "🎉 Tudo pronto! Acesse o site agora!"
echo "═══════════════════════════════════════"
