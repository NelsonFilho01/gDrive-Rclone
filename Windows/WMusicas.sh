#!/usr/bin/env bash
#
# -------------------------------------------------------------------------------------------------------------------------- #
# ------------------------------------------------ VARIÁVEIS------------------------------------------------- #

# Altere aqui para o seu serviço remoto. O padrão é o sincronismo da máquina para nuvem

# Inverta os diretórios se você costuma sincronizar da nuvem para sua máquina

DIR_ORIGEM="C:/Users/Rothmans/Music"  #<-- Alterar aqui (esse diretório é o que você quer sincronizar)
DIR_DESTINO="gDrive:/Windows/Musicas"   #<-- Alterar aqui (esse é o drive que você configurou)
DIR_MONTAGEM="C:/Users/Rothmans/mount"  #<- Alterar aqui (esse é o diretório para a montagem; ele deve estar vazio)

VERDE="\033[32;1m"
AMARELO="\033[33;1m"
VERMELHO="\033[31;1m"
SEMCOR="\033[0m"

LOG="$(date +%m%Y)"
ARQUIVO_LOG="rcl-$LOG.log"
MENSAGEM_LOG="#$(date "+%A, %d %B %Y")#" 


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

Agendar () { crontab -e && exit; }

Atualizar() { 
  if [ "$(curl -s https://downloads.rclone.org/version.txt)" == "$(rclone version | grep rclone)" ]; then
    echo -e "$(rclone version | grep rclone)\n"
    echo -e "Sua versão é a mais recente\n" && exit 0
  else
    echo -e "Existe uma versão mais recente no repositório"
    echo -e "\nDeseja atualizar para a versão mais recente? [s/n]"
    read resposta
    case "$resposta" in
      Sim|sim|s|S) curl -O https://downloads.rclone.org/rclone-current-linux-amd64.deb
                   sudo apt install ./rclone-current-linux-amd64.deb -y && sudo apt -f install
                   rm rclone-current-linux-amd64.deb
                   echo -e "\nrclone atualizado com sucesso\n" && exit 0 ;;
      Nao|nao|n|N) exit 1                                                ;;
                *) echo "Selecione 'sim' ou 'nao'"                       ;;
    esac
  fi
}

Configurar () { rclone config && clear && exit; }

Informacao () { rclone about "$DIR_DESTINO" && exit; }

Listar () { rclone tree "$DIR_DESTINO" && exit; }

Manual () { man rclone && exit; }

Montar () {
  rclone mount "$DIR_DESTINO" "$DIR_MONTAGEM" &
  echo -e "${SEMCOR}Drive montado em: ${VERDE}"$DIR_MONTAGEM"\n" && tput sgr0
  exit 0
}

Verificar () { 
  rclone check "$DIR_ORIGEM" "$DIR_DESTINO" 
  exit
}

Sincronizar () { 
  echo "$MENSAGEM_LOG" >> "$ARQUIVO_LOG"
  rclone -vP sync --progress "$DIR_ORIGEM" "$DIR_DESTINO" --log-file="$ARQUIVO_LOG"
  Verifica_status
}

Receber () {
  echo "$MENSAGEM_LOG" >> "$ARQUIVO_LOG"
  rclone -vP sync --progress "$DIR_DESTINO" "$DIR_ORIGEM" --log-file="$ARQUIVO_LOG"
  Verifica_status
}

Verifica_status () {
  tail "$ARQUIVO_LOG" | grep "ERROR" 
  if [ ! $? -eq 0 ]; then
    echo -e "\n${VERDE}Sincronismo concluído com sucesso. \n" && tput sgr0 && exit 0
  else
    echo -e "\n${VERMELHO}Erros encontrados. Verifique o arquivo $ARQUIVO_LOG. \n" && tput sgr0 && exit 1
  fi
}
# -------------------------------------------------------------------------------------------------------------------------- #

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