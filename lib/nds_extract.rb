$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source) # input gross_for_director to AoH: { dir_name => gross }
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d) # calculate gross per director
  # d = already drilled down into first index.
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end
  total
end

def list_of_directors(source) # Array of directors names
  names_index = 0
  names = []
  while names_index < source.length do
    names << source[names_index][:name] #append(shovel) string to array
    names_index += 1
  end
  names
end

def total_gross(source) #loop thru list_of_directors to access AoH directors_totals to total all gross
grand_total = 0
i = 0
  while i < source.size do
    access_director = list_of_directors(source)[i] #director name as string
    grand_total += directors_totals(source)[access_director]
    i += 1
  end
  grand_total
end
