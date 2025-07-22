alias archbox="distrobox enter archbox"
alias torsk="echo '><((((°>'"
alias py="./venv/bin/python"
alias doas="sudo"

function gccr
	if test (count $argv) -gt 0
		set gccr_file $argv[1]
	else
		set gccr_file "main.c"
	end
	
	rm /tmp/gccr.bin
	gcc -o /tmp/gccr.bin $gccr_file -lm && /tmp/gccr.bin
end

function ffmpreg
	picture
	ffmpeg -i $argv[1] -i $argv[3] -map 0 -map 1 -metadata:s:v title="Album cover" -metadata:s:v comment="Cover (front)" -disposition:v attached_pic -c:v mjpeg -metadata title=$argv[2] converted-$argv[1].mp3
end
