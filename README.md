# 🍯 SlimSoda - CogniHoney Landing Pages

Páginas de presell e produto para o suplemento CogniHoney.

## 📦 Estrutura do Projeto

```
slimsoda-vsl/
├── index.html              # Página presell (homepage)
├── cognihoney-pdp.html     # Página de produto (PDP)
├── cognihoney19,99.html    # Variação de preço R$19,99
├── images/                 # Imagens do produto
├── media/                  # Vídeos e mídia
├── fonts/                  # Fontes customizadas
├── ss/                     # Screenshots e assets
└── deploy-slimsoda.sh     # Script de deploy
```

## 🌐 Sites ao Vivo

- **Presell**: https://slimsodafitdrink.store
- **PDP**: https://slimsodafitdrink.store/cognihoney-pdp.html
- **PDP R$19,99**: https://slimsodafitdrink.store/cognihoney19,99.html

## 🚀 Deploy

### Via AAPanel Terminal

```bash
cd /www/wwwroot/slimsodafitdrink.store
git clone https://github.com/privadokauan2020-cpu/slimsoda-vsl.git temp
mv temp/* . && rm -rf temp
chown -R www:www .
chmod -R 755 .
```

## 🔄 Atualizar Site

```bash
cd /www/wwwroot/slimsodafitdrink.store
git pull origin master
```

## 📱 Páginas

### 1. Presell (index.html)
- Landing page principal
- VSL integrado
- CTA para produto

### 2. PDP - Product Display Page (cognihoney-pdp.html)
- Página de venda completa
- Reviews e depoimentos
- Garantia de 60 dias
- Desconto de 70%

### 3. PDP Variação (cognihoney19,99.html)
- Mesma estrutura do PDP
- Preço promocional R$19,99

## 🛠️ Tecnologias

- HTML5
- CSS3
- JavaScript vanilla
- Responsive design

## 📊 Servidor

- **VPS**: DigitalOcean
- **Painel**: AAPanel
- **Servidor Web**: Nginx
- **SSL**: Let's Encrypt

## 📝 Notas

- Todas as imagens estão otimizadas
- Site 100% responsivo
- SSL configurado
- Backups automáticos no AAPanel
