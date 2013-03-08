#!/usr/bin/ruby

file_restart = File.open('tmp/restart.txt','w+')
file_restart.puts Time.now
file_restart.close
puts "Reiniciado OK..."
