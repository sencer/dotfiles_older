#!/usr/bin/env ruby
require 'fileutil'
$cell = []
class Atom
  attr_reader :e, :pos
  def initialize *args
    @e = args[0].shift
    @pos = args[0]
  end
  def to_s 
    "%-5s %12.8f %12.8f %12.8f" % ([@e]+ @pos)
  end
  def dist other
    ret = 0
    3.times do |i|
      dif = (@pos[i] - other.pos[i]).abs
      dif = dif - dif.floor
      dif = 1 - dif if dif > 0.5
      ret += ($cell[i]*dif)**2
    end
    Math.sqrt ret
  end
end

nat = 0
list1 = []
list2 = []
File.open 'input.txt' do |f|
  nat = f.ff(/nat/).readline.scan(/\d+/)[0].to_i
  f.seek 0
  $cell << f.ff(/celldm/).readline.scan(/\d+\.\d+/)[0].to_f*0.51918
  $cell << f.ff(/celldm/).readline.scan(/\d+\.\d+/)[0].to_f*$cell[0]
  $cell << f.ff(/celldm/).readline.scan(/\d+\.\d+/)[0].to_f*$cell[0]
  f.ff(/atomic_positions/i).readline
  nat.times do 
    list1 << Atom.new(f.readline.chomp.split.map{|v| Float(v) rescue v})
  end
  f.ff(/atomic_positions/i).readline
  nat.times do 
    list2 << Atom.new(f.readline.chomp.split.map{|v| Float(v) rescue v})
  end
end

list = []
large = []
list3 = list2.dup
rmsdi = 0
rmsdf = 0
nat.times do |i|
  rmsdi += list1[i].dist(list3[i])**2
  min = 100
  sel = nil
  list2.each do |b|
    dist = list1[i].dist(b)
    if min > dist
      sel = b
      min = dist
    end
  end
  if min > 1
    large << [1 + list3.index(sel), list.length+1, sel, min]
  end
  list << sel
  rmsdf += min**2
  list2.delete sel
end
list.each.with_index{|l,i| puts l}
$stderr.puts ">>>   These should be checked manually"
$stderr.puts " II  FI                 INFO                           Dist"
large.each do |l|
  $stderr.puts "%3d %3d  %-40s %6.4f" % l
  $stderr.puts "         %-40s" % [list1[l[1]-1]]
end
$stderr.puts "Connection matrix:"
large.each do |l|
  large.each do  |k|
    $stderr.print "%6.4f " % l[2].dist(list1[k[1]-1])
  end
  $stderr.puts ""
end
$stderr.puts ">>>   RMSD initial: %.4f, final: %.4f" % [Math.sqrt(rmsdi)/nat,Math.sqrt(rmsdf)/nat]




