require_relative 'dslhash'

h = DSLHash.build do
  first_name "Andrey"
  last_name "Viktorov"
  
  social do
    vk "andvandv"
    github "4ndv"
    medium "@andv"
  end

  tags "Krasnoyarsk", "Ruby", "Hello, world"
end

puts h

h = DSLHash.build do
  inner do
    subinner do
      subsubinner do
        hello "World"
      end
    end
  end

  who_am_i "None", "of", "your", "business"
end

puts h

clusterduck = DSLHash.build { a 1 and b 2 and c 3 }

puts clusterduck