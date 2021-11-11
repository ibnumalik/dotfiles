# run gaudible to get reminder sound 
echo "Running gaudible"
~/scripts/gaudible/gaudible.py &

# run greenclip daemon to listen to copy event
echo "Running greenclip daemon"
greenclip daemon &

# swap ctrl and caps
echo "Swapping ctrl key"
setxkbmap -option ctrl:swapcaps &
