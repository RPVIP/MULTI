
barra="\033[0m\e[34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "/root/multi.sh" > /bin/mko && chmod +x /bin/mko > /dev/null 2>&1

##SCRIPTS A INSTALAR

##TEAM-ILUUMINATI

VPSMANAGER () {
     apt-get update -y; apt-get upgrade -y; wget https://raw.githubusercontent.com/fabricio94b/VPS-MANAGER/main/Plus; chmod +x Plus; ./Plus
}
SLOWDNS () {
      wget https://raw.githubusercontent.com/fabricio94b/VPS-MANAGER/main/SlowDNS/install; chmod +x install; ./install
}
PAINELV20 () {
    wget https://raw.githubusercontent.com/fabricio94b/Painel-v20/main/install; chmod +x install; ./install
}
HABILITARROOT () {
    wget -y; bash <(wget -qO- https://raw.githubusercontent.com/fabricio94b/HabilitarRoot/main/senharoot.sh)
}
BOTFREE () {
    wget https://raw.githubusercontent.com/fabricio94b/botfree/main/iniciar.sh -O iniciar.sh; chmod +x iniciar.sh; ./iniciar.sh
}
ATTSSL () {
    apt install wget -y; wget --no-check-certificate https://www.dropbox.com/s/wnoljkx97pixs6v/ssl.sh; chmod +x ssl.sh; ./ssl.sh
}
MENU () {
    clear
    menu
}

while true $x != "ok"
do
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[41;1;37m            ○ MULTI SCRIPTS MANAGER ○             \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;31m  [\033[1;36m 01 \033[1;31m] \033[1;37m• \033[1;33mVPS MANAGER
\033[1;31m  [\033[1;36m 02 \033[1;31m] \033[1;37m• \033[1;33mSLOWDNS
\033[1;31m  [\033[1;36m 03 \033[1;31m] \033[1;37m• \033[1;33mPAINEL v20   
\033[1;31m  [\033[1;36m 04 \033[1;31m] \033[1;37m• \033[1;33mHABILITAR ROOT
\033[1;31m  [\033[1;36m 05 \033[1;31m] \033[1;37m• \033[1;33mBOT (CRIADOR DE CONTA FREE)
\033[1;31m  [\033[1;36m 06 \033[1;31m] \033[1;37m• \033[1;33mATUALIZAR CERTIFICADO SSL
\033[1;31m  [\033[1;36m 07 \033[1;31m] \033[1;37m• \033[1;33mMENU
\033[1;31m  [\033[1;36m 00 \033[1;31m] \033[1;37m• \033[1;37mSAIR"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo -ne "\033[1;32m O QUE DESEJA FAZER \033[1;33m?\033[1;31m?\033[1;37m : "; read x

case "$x" in 
   1 | 01)
   clear
   VPSMANAGER
   exit;
   ;;
    2 | 02)
   clear
   SLOWDNS
   exit;
   ;;
   3 | 03)
   clear
   PAINELV20
   exit;
   ;;
    4 | 04)
   clear
   HABILITARROOT
   exit;
   ;;
   5 | 05)
   clear
   BOTFREE
   exit;
   ;;
   6 | 06)
   clear
   ATTSSL
   exit;
   ;;
    7 | 07)
   clear
   MENU
   exit;
   ;;
   0 | 00)
   echo -e "\033[1;31mSaindo...\033[0m"
   sleep 2
   clear
   exit;
   ;;
   *)
   echo -e "\n\033[1;31mOpcao invalida !\033[0m"
   sleep 2
esac
done
}
#fim