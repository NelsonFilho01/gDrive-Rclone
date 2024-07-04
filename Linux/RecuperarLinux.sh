#!/bin/bash




# Sincronizando Área de Trabalho
chmod +x AreaTrabalho.sh
echo "Sincronizando Área de Trabalho..."
./AreaTrabalho.sh -r
if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Área de Trabalho. Verifique o log para mais detalhes."
    exit 1
fi
echo "Area de Trabalho já foi"


chmod +x Imagens.sh
echo "Sincronizando Imagens..."
./Imagens.sh -r
if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Área de Trabalho. Verifique o log para mais detalhes."
    exit 1
fi
echo "Imagens.sh foi"



# Sincronizando Músicas
chmod +x Musicas.sh
echo "Sincronizando Músicas..."
./Musicas.sh -r
if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Músicas. Verifique o log para mais detalhes."
    exit 1
fi
echo "Musicas já foi"


# Sincronizando Vídeos
chmod +x Videos.sh
echo "Sincronizando Vídeos..."
./Videos.sh -r
if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Vídeos. Verifique o log para mais detalhes."
    exit 1
fi
echo "Videos já foi"


# Sincronizando Documentos
chmod +x Documentos.sh
echo "Sincronizando Documentos..."
./Documentos.sh -r
if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Documentos. Verifique o log para mais detalhes."
    exit 1
fi
echo "Documentos já foi"

# Finalizar
echo "!!!!!BACKUP CONCLUÍDO!!!!!!"
