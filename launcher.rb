#!/usr/bin/env ruby
require_relative 'data_generator.rb'
require_relative 'data_sorter.rb'

class Launcher
  def self.help
    print "You must pass in the total number of data.
    Usage: #{__FILE__} num"
  end

  if ARGV.empty?
    if File.file?('data.csv')
      puts "Deducing most common data variable"
      data_sorter = DataSorter.new
      data_sorter.sort
    else
      Launcher.help
      exit
    end
  else
    total_data = ARGV[0]
    data_generator = DataGenerator.new
    data_generator.generate(total_data)
  end
end

launcher = Launcher.new
