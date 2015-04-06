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
![bash](http://www.google.es/imgres?imgurl=http://www.muylinux.com/wp-content/uploads/2009/12/bash-500x375.png&imgrefurl=http://www.muylinux.com/2009/12/23/introduccion-a-bash&h=375&w=500&tbnid=xXLq0D-WBd0U6M:&zoom=1&docid=A778po2XLotdBM&ei=JwYjVZumPIrfU6f4gPgO&tbm=isch&ved=0CDMQMygBMAE)

RUBY
====

```
#encoding: utf-8
require "date"
time = Time.new
puts " "
puts "Estamos en la semana " + (time.strftime("%W").to_i + 1).to_s + " de este año."
```