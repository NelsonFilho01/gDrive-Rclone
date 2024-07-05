#!/bin/bash



<<<<<<< HEAD:Windows/WRecuperar.sh
chmod +x WImagens.sh
echo "Sincronizando Imagens..."
./WImagens.sh -r
=======
#Sincronizando Imagens
chmod +x Imagens.sh
echo "Sincronizando Imagens..."


./WImagens.sh -s


>>>>>>> f3246fc86652ecc748e34ca15afa5ee3052ef08c:Windows/SubirWin.sh
if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Imagens. Verifique o log para mais detalhes."
    exit 1
fi
echo "Imagens.sh foi"




# Sincronizando Músicas
chmod +x WMusicas.sh
echo "Sincronizando Músicas..."
<<<<<<< HEAD:Windows/WRecuperar.sh
./WMusicas.sh -r
=======


./WMusicas.sh -s


>>>>>>> f3246fc86652ecc748e34ca15afa5ee3052ef08c:Windows/SubirWin.sh
if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Músicas. Verifique o log para mais detalhes."
    exit 1
fi
echo "Musicas já foi"



# Sincronizando Vídeos
chmod +x WVideos.sh
echo "Sincronizando Vídeos..."
<<<<<<< HEAD:Windows/WRecuperar.sh
./WVideos.sh -r
=======


./WVideos.sh -s


>>>>>>> f3246fc86652ecc748e34ca15afa5ee3052ef08c:Windows/SubirWin.sh
if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Vídeos. Verifique o log para mais detalhes."
    exit 1
fi
echo "Videos já foi"


# Sincronizando Documentos
chmod +x WDocumentos.sh
echo "Sincronizando Documentos..."
<<<<<<< HEAD:Windows/WRecuperar.sh
./WDocumentos.sh -r
=======


./WDocumentos.sh -s


>>>>>>> f3246fc86652ecc748e34ca15afa5ee3052ef08c:Windows/SubirWin.sh
if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Documentos. Verifique o log para mais detalhes."
    exit 1
fi
echo "Documentos já foi"

# Finalizar
echo "!!!!!RECUPERAÇÃO CONCLUÍDO!!!!!!"
