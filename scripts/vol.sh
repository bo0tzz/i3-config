#!/bin/bash

case $1 in
	"up")
		pulseaudio-control --volume-max 130 --volume-step 1 up		
		;;
	
	"down")
		pulseaudio-control --volume-max 130 --volume-step 1 down	
		;;

	"listen")
		pkill -f 'pulseaudio-control listen'
		pulseaudio-control listen | stdbuf -i0 -o0 cut -f1 -d '%' | stdbuf -i0 -o0 uniq | xob
		;;
esac

