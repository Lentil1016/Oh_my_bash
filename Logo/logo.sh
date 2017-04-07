#!/bin/bash

LOGO_FILE="/logo/${1}_logo"

MSG_LINES=(
""
""
""
"Developer"
"Email"
"Date"
""
"OS"
"Kernel"
"Host"
"User"
""
"CC"
"Boost"
"Lua"
"Haskell"
)


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
HASKELL=`ghc --version|awk '{print $8}'`

tput init
IFS="|"

BL="$(tput setaf 4)"
DBL="$(tput setaf 33)"
SBL="$(tput setaf 12)"
OR="$(tput setaf 214)"
RE="$(tput setaf 7)"
DOR="$(tput setaf 196)"
SOR="$(tput setaf 226)"

tput bold;

function vecho()
{
	RE="$(tput setaf 7)"
	YE="$(tput setaf 11)"
	GR="$(tput setaf 250)"
		
	if [ -n "$1" ] ;
	then
		eval value=\$"$(echo $1|tr '[:lower:]' '[:upper:]')"
		if [ -n "$value" ] ;
		then
			echo ${YE}$1: ${GR}$value${RE}
		else
			echo ${RED}$1: ${GR}Not found${RE}
		fi
	else
		echo
	fi
}

i=0
echo
while read line
do
	eval echo -n $line
	vecho ${MSG_LINES[$i]}
	let i+=1
done < $LOGO_FILE

echo
tput sgr0

