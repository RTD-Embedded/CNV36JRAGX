#!/bin/bash
flash_log=Flash_log.log
rm $flash_log


RTD_FLASH(){
	# Local Variables for apt package handling logic 

	# Echo results to user
	printf "RTD CNV36AGX Flash Wrapper Program\n"
	printf "Choose an Image to Flash:\n"
	printf "    1) Standard (for CNV36AGX-40 or 50)\n"
	printf "    2) Industrial (for CNV36AGX-80)\n"
	printf "> "
	local kbinput=n
	read kbinput
	if [[ "$kbinput" == "1" ]]; then
		printf "Flashing Standard Image..." 
		sudo ./flash.sh CNV36JRAGX internal
	elif [[ "$kbinput" == "2" ]]; then
		printf "Flashing Industrial Image..." 
		sudo ./flash.sh CNV36JRAGX_IND internal
	else
		printf "Unknown Target halting...\n"
	fi
}
	
# MAIN
pushd Linux_for_Tegra
	RTD_FLASH
popd
