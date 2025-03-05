#!/usr/bin/env bash
#
# -------------------------------------------------------------------------------------------------------------------------- #


# Altere aqui para o seu serviço remoto. O padrão é o sincronismo da máquina para nuvem

# Inverta os diretórios se você costuma sincronizar da nuvem para sua máquina

DIR_ORIGEM="$HOME/Documentos" #<-- Alterar aqui (esse diretório é o que você quer sincronizar)

DIR_DESTINO="OneDrive:/Linux/Documentos"         #<-- Alterar aqui (esse é o drive que você configurou)

DIR_MONTAGEM="$HOME/"      #<- Alterar aqui (esse é o diretório para a montagem; ele deve estar vazio)

VERDE="\033[32;1m"
AMARELO="\033[33;1m"
VERMELHO="\033[31;1m"
SEMCOR="\033[0m"

LOG="$(date +%m%Y)"
ARQUIVO_LOG="rcl-$LOG.log"
MENSAGEM_LOG="#$(date "+%A, %d %B %Y")#" 


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
echo -e "\n Sincronização com rclone \n $MENU"
while [ -n "$1" ]; do
  case "$1" in
    -r)
      clear && echo -e "${AMARELO}Receber arquivos da nuvem \n" && tput sgr0
      Receber
      ;;
    -s)
      clear && echo -e "${AMARELO}Sincronizar na nuvem \n" && tput sgr0
      Sincronizar
      ;;
    -u)
      clear && echo -e "${AMARELO}Atualização do Rclone\n" && tput sgr0
      Atualizar
      ;;
    *)
      echo -e "${VERMELHO}Opção inválida. Digite $0 [-OPÇÃO] \n" && tput sgr0
      exit 1
      ;;
  esac
  shift
done
# -------------------------------------------------------------------------------------------------------------------------- #
