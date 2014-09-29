#encoding: utf-8

require "date"

time = Time.new

puts " "
puts "Estamos en la semana " + (time.strftime("%W").to_i + 1).to_s + " de este año."
