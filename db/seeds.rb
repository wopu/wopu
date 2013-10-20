# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

Mongoid.raise_not_found_error = false

%w( asd qwe tre gfd ).each do |name|
  unless AvailableTag.find_by name: name
    AvailableTag.create name: name
  end
end

%w( dsa ewq ).each do |name|
  unless Category.find_by name: name
    Category.create name: name
  end
end
