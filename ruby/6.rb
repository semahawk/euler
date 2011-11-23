#!/usr/bin/ruby

puts (1..100).inject{ |s, e| s += e } ** 2 - (1..100).inject{ |s, e| s += e ** 2 }
