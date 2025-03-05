#!/bin/bash


# -------------------------------------------------------------------------------------------------------------------------- #

#curl instalado?
[ ! -x "$(which curl)" ] && {
  echo -e "\n${AMARELO}Verificando dependências...\n${SEMCOR}"
  echo -e "Precisamos instalar o ${VERDE}Curl${SEMCOR}\n"
  sudo apt install curl -y
}

#rclone instalado?
[ ! -x "$(which rclone)" ] && {
  echo -e "\n${AMARELO}Instalação do rclone\n"${SEMCOR}
  curl -O https://downloads.rclone.org/rclone-current-linux-amd64.deb
  sudo apt install ./rclone-current-linux-amd64.deb -y && sudo apt -f install
  rm rclone-current-linux-amd64.deb
}
# -------------------------------------------------------------------------------------------------------------------------- #

# Sincronizando Área de Trabalho
chmod +x GLAreaTrabalho.sh
echo "Sincronizando Área de Trabalho..."
./GLAreaTrabalho.sh -s
if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Área de Trabalho. Verifique o log para mais detalhes."
    exit 1
fi
echo "Area de Trabalho já foi"

# -------------------------------------------------------------------------------------------------------------------------- #

chmod +x DLAreaTrabalho.sh
echo "Sincronizando Área de Trabalho..."
./DLAreaTrabalho.sh -s
if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Área de Trabalho. Verifique o log para mais detalhes."
    exit 1
fi
echo "Area de Trabalho já foi"
# -------------------------------------------------------------------------------------------------------------------------- #

# -------------------------------------------------------------------------------------------------------------------------- #
chmod +x GLImagens.sh
echo "Sincronizando Imagens..."
./GLImagens.sh -s
if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Área de Trabalho. Verifique o log para mais detalhes."
    exit 1
fi
echo "Imagens.sh foi"

# -------------------------------------------------------------------------------------------------------------------------- #
chmod +x DLImagens.sh
echo "Sincronizando Imagens..."
./DLImagens.sh -s
if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Área de Trabalho. Verifique o log para mais detalhes."
    exit 1
fi
echo "Imagens.sh foi"
# -------------------------------------------------------------------------------------------------------------------------- #

# -------------------------------------------------------------------------------------------------------------------------- #
# Sincronizando Músicas
chmod +x GLMusicas.sh
echo "Sincronizando Músicas..."
./GLMusicas.sh -s
if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Músicas. Verifique o log para mais detalhes."
    exit 1
fi
echo "Musicas já foi"
# -------------------------------------------------------------------------------------------------------------------------- #
chmod +x DLMusicas.sh
echo "Sincronizando Músicas..."
./DLMusicas.sh -s
if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Músicas. Verifique o log para mais detalhes."
    exit 1
fi
echo "Musicas já foi"

# -------------------------------------------------------------------------------------------------------------------------- #

# -------------------------------------------------------------------------------------------------------------------------- #
# Sincronizando Vídeos
chmod +x GLVideos.sh
echo "Sincronizando Vídeos..."
./GLVideos.sh -s
if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Vídeos. Verifique o log para mais detalhes."
    exit 1
fi
echo "Videos já foi"

# -------------------------------------------------------------------------------------------------------------------------- #
chmod +x DLVideos.sh
echo "Sincronizando Vídeos..."
./DLVideos.sh -s
if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Vídeos. Verifique o log para mais detalhes."
    exit 1
fi
echo "Videos já foi"
# -------------------------------------------------------------------------------------------------------------------------- #

# -------------------------------------------------------------------------------------------------------------------------- #
# Sincronizando Documentos
chmod +x GLDocumentos.sh
echo "Sincronizando Documentos..."
./GLDocumentos.sh -s
if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Documentos. Verifique o log para mais detalhes."
    exit 1
fi
echo "Documentos já foi"

# -------------------------------------------------------------------------------------------------------------------------- #
chmod +x DLDocumentos.sh
echo "Sincronizando Documentos..."
./DLDocumentos.sh -s
if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Documentos. Verifique o log para mais detalhes."
    exit 1
fi
echo "Documentos já foi"
# -------------------------------------------------------------------------------------------------------------------------- #

# Finalizar
echo "!!!!!BACKUP CONCLUÍDO!!!!!!"
