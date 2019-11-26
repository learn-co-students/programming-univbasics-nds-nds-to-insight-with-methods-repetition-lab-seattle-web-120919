$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'
require 'pp'
require 'pry'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  # Write this implementation
  names_array = []
  row_index = 0 
  while row_index < source.length do 
    names_array.push(source[row_index][:name])
    row_index += 1
end
return names_array
end

def total_gross(source)
    grand_total = 0 
  column_index = 0
  #binding.pry
  while column_index < directors_totals(source).size do 
 grand_total += directors_totals(source)[list_of_directors(source)[column_index]]
    column_index += 1 
  end
  return grand_total
end
  
  
  
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total



