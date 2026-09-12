# 🚀 Guia de Deploy - SlimSoda no AAPanel

## 📋 Pré-requisitos
- ✅ Repositório GitHub: https://github.com/privadokauan2020-cpu/slimsoda-vsl
- ✅ AAPanel configurado
- ✅ Domínio: slimsodafitdrink.store

---

## 🎯 Passo a Passo

### 1. Acessar o Terminal do AAPanel

1. Acesse: https://64.227.158.157:28474/3ef081fd
2. Login:
   - Username: `hikemejv`
   - Password: `ae97ad69`
3. No menu lateral, clique em **Terminal**

---

### 2. Executar os comandos abaixo no Terminal

```bash
# Ir para o diretório do site
cd /www/wwwroot/slimsodafitdrink.store

# Limpar arquivos antigos (se houver)
rm -rf *

# Clonar o repositório
git clone https://github.com/privadokauan2020-cpu/slimsoda-vsl.git temp

# Mover arquivos para raiz
mv temp/* .
rm -rf temp

# Ajustar permissões
chown -R www:www /www/wwwroot/slimsodafitdrink.store
chmod -R 755 /www/wwwroot/slimsodafitdrink.store

# Verificar arquivos
ls -la
```

---

### 3. Verificar se os arquivos estão no lugar

Você deve ver:
- ✅ `index.html` (presell)
- ✅ `cognihoney-pdp.html` (página de produto)
- ✅ `cognihoney19,99.html` (variação de preço)
- ✅ Pastas: `images/`, `media/`, `fonts/`, `ss/`

---

### 4. Configurar SSL (HTTPS)

No AAPanel:

1. Vá em **Website** → clique no site `slimsodafitdrink.store`
2. Aba **SSL**
3. Clique em **Let's Encrypt**
4. Marque o domínio `slimsodafitdrink.store` e `www.slimsodafitdrink.store`
5. Clique em **Apply**
6. Aguarde 1-2 minutos

---

### 5. Testar os sites

Após o deploy:

- **Presell**: https://slimsodafitdrink.store
- **PDP (Produto)**: https://slimsodafitdrink.store/cognihoney-pdp.html
- **PDP R$19,99**: https://slimsodafitdrink.store/cognihoney19,99.html

---

## 🔄 Atualizações Futuras

Para atualizar o site com novas mudanças do GitHub:

```bash
cd /www/wwwroot/slimsodafitdrink.store
git pull origin master
chown -R www:www .
chmod -R 755 .
```

---

## 📦 Estrutura do Site

```
slimsodafitdrink.store/
├── index.html              # Página presell (homepage)
├── cognihoney-pdp.html     # Página de produto
├── cognihoney19,99.html    # Variação de preço R$19,99
├── images/                 # Imagens do produto
├── media/                  # Vídeos/mídia
├── fonts/                  # Fontes customizadas
└── ss/                     # Screenshots/assets
```

---

## ✅ Checklist Final

- [ ] Arquivos clonados do GitHub
- [ ] Permissões ajustadas (www:www)
- [ ] SSL configurado (HTTPS)
- [ ] Site presell funcionando
- [ ] Página PDP funcionando
- [ ] Imagens carregando
- [ ] DNS apontado corretamente

---

## 🆘 Troubleshooting

### Site não carrega?
```bash
# Verificar se nginx está rodando
systemctl status nginx

# Reiniciar nginx
systemctl restart nginx
```

### Imagens não aparecem?
```bash
# Ajustar permissões
chmod -R 755 /www/wwwroot/slimsodafitdrink.store/images
```

### Erro 502/503?
```bash
# Verificar logs
tail -f /www/wwwlogs/slimsodafitdrink.store.error.log
```

---

## 📞 Próximos Passos

Depois que o site estiver no ar:
1. Testar todos os links
2. Verificar responsividade mobile
3. Configurar Google Analytics (se necessário)
4. Configurar Facebook Pixel (se necessário)
5. Fazer backup inicial do site no AAPanel
