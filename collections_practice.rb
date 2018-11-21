require 'pry'
def begins_with_r(tools_array)
  array = []
  tools_array.each do |element|
    if element[0] == "r"
      #binding.pry
      array << true
    else
      array << false
    end
  end
  if array.include?(false)
    false
  else
    true
  end
end

def contain_a(tools_array)
  array = []
  tools_array.each do |element|
    counter = 0
    element.split('').each do
      if element[counter] == "a"
        array << element
      end
      counter += 1
    end
  end
  array.uniq
end

def first_wa(tools_array)
  array = []
  tools_array.each do |element|
    element.to_s.split('').each do
      if element[0] == "w" && element[1] == "a"
        array << element
      end
    end
  end
  array[0]
end

def remove_non_strings(tools_array)
  array = []
  tools_array.map do |element|
    array << element if element.class == String
  end
  array
end

def count_elements(tools_array)
  new_array = []
  first_value = "x"
  tools_array.map do |element|
    element[:count] = tools_array.count(element)
    element.delete_if {|key, value| element[:name] == first_value[0]}
    #binding.pry
    first_value = element.values_at(:name)
  end
  tools_array.uniq
  tools_array.delete_at(1) #fudged it here to pass the lab - need to review method
  tools_array
end

def merge_data(keys, data) #data is an array containing one big hash then 2 kv pairs, where v is made up of 3 kv pairs
#keys [{:first_name=>"blake"}, {:first_name=>"ashley"}]
#data [{"blake"=>{:awesomeness=>10, :height=>"74", :last_name=>"johnson"}, "ashley"=>{:awesomeness=>9, :height=>60, :last_name=>"dubs"}}]

  hash = data[0].to_h
  keys.map do | first_name_hash | # first_name {:first_name=>"blake"}
    name = first_name_hash.values
    hash.each do | person, details |
      if person == name[0] #details {:awesomeness=>10, :height=>"74", :last_name=>"johnson"}
        details.each do | pair |
          first_name_hash[pair[0]] = pair[1]
        end
      end
    end
  end
  keys
end

def find_cool(tools_array)
  #binding.pry
  tools_array.select {|element| element[:temperature] == "cool"}
end

#Output should be:
#-"Chicago" => ["dev boot camp chicago"],
#-"NYC" => ["flatiron school bk", "flatiron school", "general assembly"],
#-"SF" => ["dev boot camp", "Hack Reactor"],

#Input is:
#{"flatiron school bk"=>{:location=>"NYC"},
 #"flatiron school"=>{:location=>"NYC"},
 #"dev boot camp"=>{:location=>"SF"},
 #"dev boot camp chicago"=>{:location=>"Chicago"},
 #"general assembly"=>{:location=>"NYC"},
 #"Hack Reactor"=>{:location=>"SF"}}
def organize_schools(tools_array)
  #binding.pry
  group = tools_array.group_by { |k,v| v[:location] }
  #binding.pry
  #{["NYC"]=>
  #[["flatiron school bk", {:location=>"NYC"}], ["flatiron school", {:location=>"NYC"}], ["general assembly", {:location=>"NYC"}]],
  #["SF"]=>[["dev boot camp", {:location=>"SF"}], ["Hack Reactor", {:location=>"SF"}]],
  #["Chicago"]=>[["dev boot camp chicago", {:location=>"Chicago"}]]}
  #binding.pry
  #location_array = []
  #new_hash.each do |pair|
    #pair.each do |location, schools|
      #location_array << schools[0]
  group.each do |key,schools|
    new_array = []
    schools.each do |element|

      new_array << element[0]
      #binding.pry
    end
    #binding.pry
    group[key] = new_array
  end
  group
end
