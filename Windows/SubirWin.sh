

chmod +x WImagens.sh
echo "Sincronizando Imagens..."
./WImagens.sh -s
if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Área de Trabalho. Verifique o log para mais detalhes."
    exit 1
fi
echo "Imagens foi"



# Sincronizando Músicas
chmod +x WMusicas.sh
echo "Sincronizando Músicas..."
./WMusicas.sh -s
if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Músicas. Verifique o log para mais detalhes."
    exit 1
fi
echo "Musicas já foi"



# Sincronizando Vídeos
chmod +x WVideos.sh
echo "Sincronizando Vídeos..."
./WVideos.sh -s
if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Vídeos. Verifique o log para mais detalhes."
    exit 1
fi
echo "Videos já foi"


# Sincronizando Documentos
chmod +x WDocumentos.sh
echo "Sincronizando Documentos..."
./WDocumentos.sh -s
if [ $? -ne 0 ]; then
    echo "Erro ao sincronizar Documentos. Verifique o log para mais detalhes."
    exit 1
fi
echo "Documentos já foi"

# Finalizar
echo "!!!!!BACKUP CONCLUÍDO!!!!!!"




while [ -n "$1" ]; do
  case "$1" in
    -a)  echo -e "${AMARELO}Agendamento da sincronização \n" && tput sgr0
        Agendar
     ;; 
    -c)  echo -e "${AMARELO}Configuração do rclone \n" && tput sgr0
        Configurar
     ;;
    -d)  echo -e "${AMARELO}Montagem do dispositivo remoto \n"
        Montar
     ;;
    -h | --help) echo -e "${AMARELO}$AJUDA \n" && tput sgr0 && exit 0        
     ;;  
    -i)  echo -e "${AMARELO}Informações de armazenamento \n" && tput sgr0
        Informacao
     ;;  
    -l)  echo -e "${AMARELO}Listar arquivos e diretórios \n" && tput sgr0
        Listar
     ;;
    -m)  Manual
     ;;
    -r)  echo -e "${AMARELO}Receber arquivos da nuvem \n" && tput sgr0
        Receber
     ;;
    -s)  echo -e "${AMARELO}Sincronizar na nuvem \n" && tput sgr0
        Sincronizar
     ;;
    -u)  echo -e "${AMARELO}Atualização do Rclone\n" && tput sgr0
        Atualizar
     ;;
    -v)  echo -e "${AMARELO}Verificação de arquivos \n" && tput sgr0
        Verificar     
     ;;    
     *) echo -e "${VERMELHO}Opção inválida. Digite $0 [-OPÇÃO] \n" && tput sgr0
        exit 1
     ;;   
  esac
done  