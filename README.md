(semanaAnio)
==========

Fuentes diversas en Python, MySQL, Ruby y Bash que te digan la semana del año en la que te encuentras.

BASH
====
```
#/usr/bin/bash

echo " "
fecha=`date '+%V'`
echo "Estamos en la semana ${fecha} de este año."
```
[vvv](http://www.google.es/imgres?imgurl=http://gutl.jovenclub.cu/wp-content/uploads/2012/08/i-love-bin-bash_by-kzkggaara.png%253F980efb&imgrefurl=http://gutl.jovenclub.cu/wallpaper-i-love-binbash/&h=1200&w=1600&tbnid=aEYsP3YTqPWbnM:&zoom=1&docid=lx8wewDRPGKa1M&ei=JwYjVZumPIrfU6f4gPgO&tbm=isch&ved=0CDoQMygIMAg)
[bash](data:image/jpeg;base64,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)

RUBY
====

```
#encoding: utf-8
require "date"
time = Time.new
puts " "
puts "Estamos en la semana " + (time.strftime("%W").to_i + 1).to_s + " de este año."
```