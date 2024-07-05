#!/bin/bash





<<<<<<<< HEAD:Windows/wSubir-Tudo.sh
chmod +x WImagens.sh
echo "Sincronizando Imagens..."
./WImagens.sh -s
========
#Sincronizando Imagens
chmod +x Imagens.sh
echo "Sincronizando Imagens..."


./WImagens.sh -r


>>>>>>>> f3246fc86652ecc748e34ca15afa5ee3052ef08c:Windows/RecuperarWin.sh
if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Área de Trabalho. Verifique o log para mais detalhes."
    exit 1
fi
echo "Imagens foi"



# Sincronizando Músicas
chmod +x WMusicas.sh
echo "Sincronizando Músicas..."
<<<<<<<< HEAD:Windows/wSubir-Tudo.sh
./WMusicas.sh -s
========


./WMusicas.sh -r


>>>>>>>> f3246fc86652ecc748e34ca15afa5ee3052ef08c:Windows/RecuperarWin.sh
if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Músicas. Verifique o log para mais detalhes."
    exit 1
fi
echo "Musicas já foi"


# Sincronizando Vídeos
chmod +x WVideos.sh
echo "Sincronizando Vídeos..."
<<<<<<<< HEAD:Windows/wSubir-Tudo.sh
./WVideos.sh -s
========


./WVideos.sh -r


>>>>>>>> f3246fc86652ecc748e34ca15afa5ee3052ef08c:Windows/RecuperarWin.sh
if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Vídeos. Verifique o log para mais detalhes."
    exit 1
fi
echo "Videos já foi"


# Sincronizando Documentos
chmod +x WDocumentos.sh
echo "Sincronizando Documentos..."
<<<<<<<< HEAD:Windows/wSubir-Tudo.sh
./WDocumentos.sh -s
========


./WDocumentos.sh -r


>>>>>>>> f3246fc86652ecc748e34ca15afa5ee3052ef08c:Windows/RecuperarWin.sh
if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Documentos. Verifique o log para mais detalhes."
    exit 1
fi
echo "Documentos já foi"

# Finalizar
echo "!!!!!BACKUP CONCLUÍDO!!!!!!"
