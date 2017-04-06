#!/bin/bash

IFS="|"

DEVELOPER='Lentil Sun'
EMAIL="t_sunyk@channelsoft.com"
DATE=`date +%Y-%m-%d`

OS=`head -n 1 /etc/issue`
KERNEL="`uname -s` `uname -r`"
HOST=`hostname`
USER=`whoami`

CC=`g++ --version|grep g++|awk '{print $2,$3}'`
BOOST=`cat /usr/include/boost/version.hpp|grep '#define'|grep LIB_VERSION|awk '{print $3}'|sed 's/\"//g'|sed 's/\_/./g'`
LUA=`lua -v 2>&1|awk '{print $2}'`
HASK=`ghc --version|awk '{print $8}'`

tput init

BL="$(tput setaf 25)"
OR="$(tput setaf 214)"
RE="$(tput setaf 7)"

tput bold;

function vecho()
{
	
	RE="$(tput setaf 7)"
	YE="$(tput setaf 11)"
	GR="$(tput setaf 250)"
	if [ -n $2 ] ;
	then
		echo ${YE}$1: ${GR}$2${RE}
	else
		echo ${RED}$1: ${GR}Not found${RE}
	fi
}

echo
echo "                    ${OR}.=Ds(${RE}                            "
echo "                   ${OR}'NNNNNNB-${RE}                         "
echo "        ${BL}~<<-${RE}       ${OR}.NNNNNNNNz${RE}         ${OR}-~.${RE}         "
echo "      ${BL}(NNNNNNN+${RE}     ${OR}~NNNNNNNNs${RE}      ${OR}-NNNNN+${RE}       " `vecho Developer $DEVELOPER`
echo "      ${BL}hNNNNNNNNN=${RE}    ${OR}'NNNNNNNN'${RE}     ${OR}'NNNNNND.${RE}     " `vecho E-mail $EMAIL`
echo "      ${BL}=NNNNNNNNNNB.${RE}    ${OR}'hNNNN+${BL}'(-.${RE}   ${OR}'NNNNNNh${RE}     " `vecho Date $DATE`
echo "       ${BL}DNNNNNNNNNNB.${RE}        ${BL}'NNNNNN+${RE}   ${OR}(NNNN=${RE}     " 
echo "        ${BL}hNNNNNNNNNN(${RE}        ${BL}~NNNNNNNN~${RE}            " `vecho OS $OS`
echo "         ${BL}'BNNNNNNNN~${RE}         ${BL}hNNNNNNNN(${RE}           " `vecho Kernel $KERNEL`
echo "            ${BL}(DNNNN- ${OR}~(<-${RE}      ${BL}=NNNNNNNB.${RE}          " `vecho Host $HOST`
echo "                  ${OR}=NNNNNNN<${RE}    ${BL}.sNNNNNs${RE}           " `vecho User $USER`
echo "                 ${OR}.BNNNNNNNNN(${RE}     ${BL}.~~${OR}'hNNNN=.${RE}     "
echo "                  ${OR}zNNNNNNNNNNz${RE}       ${OR}(NNNNNNNh.${RE}   " `vecho CC $CC`
echo "                  ${OR}.BNNNNNNNNNNh${RE}      ${OR}.BNNNNNNNN'${RE}  " `vecho Boost $BOOST`
echo "                    ${OR}hNNNNNNNNNN~${RE}      ${OR}.BNNNNNNNz${RE}  " `vecho Lua $LUA`
echo "    ${BL}-=hh=(.${RE}          ${OR}-NNNNNNNNN-${RE}        ${OR}<NNNNNNh${RE}  " `vecho Haskell $HASK`
echo "  ${BL}'NNNNNNNNNh-${RE}         ${OR}.<DNNND'${BL}.((('${RE}      ${OR}.<zs(${RE}   "
echo "  ${BL}zNNNNNNNNNNNN-${RE}              ${BL}zNNNNNNN(${RE}           "
echo "  ${BL}hNNNNNNNNNNNNND.${RE}           ${BL}-NNNNNNNNNN-${RE}         "
echo "  ${BL}(NNNNNNNNNNNNNNN'${RE}          ${BL}.BNNNNNNNNNNz${RE}        "
echo "   ${BL}=NNNNNNNNNNNNNNN.${RE}          ${BL}'NNNNNNNNNNNs${RE}       "
echo "    ${BL}=NNNNNNNNNNNNNNz${RE}           ${BL}.BNNNNNNNNNN'${RE}      "
echo "     ${BL}-NNNNNNNNNNNNNB.${RE}            ${BL}(NNNNNNNNN'${RE}      "
echo "       ${BL}(NNNNNNNNNNNs${RE}               ${BL}.=BNNND'${RE}       "
echo "         ${BL}.+NNNNNNN<${RE}                               "
echo "            ${BL}-=+=>.${RE}                               "
echo

tput sgr0

