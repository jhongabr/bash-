#!/usr/bin/env bash

#=========== chamada de configurações ======================
source "login_system"
. biblioteca
#================================================================  functions  ==========================================================================================
_login(){                                               #=========login do menu===========
	read -sp "qual o seu user" _login
	
	read -st 5 -sp $'\nqual a senha' _pass
	
	read -sp $'\nqual seu cpf' _cpf

#conferindo se os dados coencidem


if [[ "$_login" = $user ]] && [[ "$_pass" -eq "$senha" ]] && [[ "$_cpf" -eq "$cpf" ]]; 
then
	 echo "bem vindo"
	 return 0
else
	echo $'\credencais inávlidas'
	return 1
fi  #fecha bloco -l, --login
}
###########################################################

_help(){ 
	echo "-l|--login open the login menu"
	echo "-h|--help open "
}




#chamada em linha===========>
case $1 in                  #chamando função login
	-l|--login) _login && clear || exit #se login falhar, o script é fechado   
	;;
	-h|--help) _help && exit 0  #chamando funçãp help
	;; #fecha bloco _h|--help
    *) echo "use a opção -h|--help para uma ajuda geral" && exit 0
;;
esac

#============================================================== menu  =======================================
echo "
1: abrir nvidia-settings
2: abrir brave
3: abrir visualcode
4: abrir o discord
5: sair 
" ;
	read -p "escolha 1 opção " menu;

	case "$menu" in
	1) { cd Área\ de\ trabalho/ ; nvidia-settings ; } 
	;;
	2) brave
	;;
	3) code
	;;
	4) discord
	;;
	5) exit
	;;
	*) echo "opção inválida"
	exit 1
	;;
	esac
	