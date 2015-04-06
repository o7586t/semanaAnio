semanaAnio
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
RUBY
====

```
#encoding: utf-8
require "date"
time = Time.new
puts " "
puts "Estamos en la semana " + (time.strftime("%W").to_i + 1).to_s + " de este año."
```