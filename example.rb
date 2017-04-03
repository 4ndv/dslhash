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