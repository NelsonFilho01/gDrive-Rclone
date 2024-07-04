#!/bin/bash





#Sincronizando Imagens
chmod +x Imagens.sh
echo "Sincronizando Imagens..."


./WImagens.sh -r


if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Área de Trabalho. Verifique o log para mais detalhes."
    exit 1
fi
echo "Imagens.sh foi"



# Sincronizando Músicas
chmod +x Musicas.sh
echo "Sincronizando Músicas..."


./WMusicas.sh -r


if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Músicas. Verifique o log para mais detalhes."
    exit 1
fi
echo "Musicas já foi"


# Sincronizando Vídeos
chmod +x Videos.sh
echo "Sincronizando Vídeos..."


./WVideos.sh -r


if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Vídeos. Verifique o log para mais detalhes."
    exit 1
fi
echo "Videos já foi"


# Sincronizando Documentos
chmod +x Documentos.sh
echo "Sincronizando Documentos..."


./WDocumentos.sh -r


if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Documentos. Verifique o log para mais detalhes."
    exit 1
fi
echo "Documentos já foi"

# Finalizar
echo "!!!!!BACKUP CONCLUÍDO!!!!!!"
