#!/bin/bash
tput init
tput smcup 
clear

#/bin/bash
for STYLE in 0 1 2 3 4 5 6 7; do
	echo
	echo $STYLE
	for FG in 30 31 32 33 34 35 36 37; do
		for BG in 40 41 42 43 44 45 46 47; do
			CTRL="\033[${STYLE};${FG};${BG}m"
			echo -en "${CTRL}"
			echo -n "${FG} : ${BG}	"
			echo -en "\033[0m"
		done
	echo
	done
done
# Reset
echo -e "\033[0m"


RESET="$(tput sgr0)";

for color in {0..255} 
do
	B_COLOR="$(tput setab ${color})"
	echo -n "${B_COLOR}${F_COLOR}${color}	${RESET}"
	if [ `echo "(${color}+2)%18"|bc` -eq 17 ]; then
		echo
	fi
	if [ `echo "(${color}+2)%36"|bc` -lt 17 ]; then
		F_COLOR="$(tput setaf 0)"
	else
		F_COLOR="$(tput setaf 7)"
	fi
done


read x l
tput rmcup

