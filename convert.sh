rate=$1
rate=${rate:-2}
for file in ./target_video/*
do 
    a=`ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of default=nw=1:nk=1 "${file}"`
    ARR=(${a//,/ })
    width=$((ARR[0]/rate+ARR[0]/rate%2))
    height=$((ARR[1]/rate+ARR[1]/rate%2))
    ffmpeg -i "${file}" -codec:v libx264 -s ${width}x${height} ./save_video/"${file##*/}" 
done