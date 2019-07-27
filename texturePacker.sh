#! /bin/bash
curr_dir=$(pwd)
preCurr_dir=$(cd `dirname $0`; cd ..;pwd )$'/CatchFish'

if [ ! -d "$preCurr_dir/outImages" ]; then
  mkdir $preCurr_dir/outImages
fi

if [ ! -d "$preCurr_dir/originalImages" ]; then
  mkdir $preCurr_dir/originalImages
fi

#需要打包的图片目录，创建一个目录originalImages,把需要打包的图片文件夹放进去
imagepath=$preCurr_dir/originalImages

#打包输出目录
outPath=$preCurr_dir/outImages

TP=TexturePacker

pack_textures() {
    ${TP} --smart-update\
    --texture-format png\
    --format cocos2d\
    --data "$1".plist\
    --sheet "$1".png\
    --enable-rotation\
    --scale 1\
    --max-size 2048\
    --opt RGBA8888\
    --trim \
    $1/*.png
}

for i in $imagepath/*
do
   if [ -d $i ];then
     pack_textures $i
   fi
   dir=$(basename $i)

   echo $dir

   if [ ! -d $outPath/$dir ]; then
     mkdir $outPath/$dir
   fi
   
   outdir=$outPath/$dir

   mv $i.plist $outdir 
   mv $i.png $outdir
   
done
