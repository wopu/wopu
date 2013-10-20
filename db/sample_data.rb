
Mongoid.raise_not_found_error = false

def category; Category.all.sample end
def available_tag_ids; AvailableTag.all.sample(2).map(&:id) end

password = '123123'

puts "Creating test user and foundations for this user"
unless user = User.find_by(name: 'test')
  user = User.create(name: 'test', email: 'test@test.com', password: password)
  print '.'
end

if user.foundations.empty?
  3.times do
    foundation = user.foundations.create category: category, name: Faker::Company.name,
      available_tag_ids: available_tag_ids, mission: Faker::Lorem.paragraph(3), population: '25 people with...',
      start_date: Date.today - 2.years, certified: [true, false].sample, country: Faker::Lorem.words(1)[0], city:  Faker::Lorem.word
    print 'f'

    if foundation.needs.empty?
      3.times do
        need = foundation.needs.create description: Faker::Lorem.sentence,
          title: Faker::Lorem.words.join(' ')
        print 'n'

        3.times do
          need.helps.create description: Faker::Lorem.sentence,
            helper: User.all.sample
          print '.'
        end
      end
    end

  end
end
puts ''

puts "Creating users"
4.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email,
    password: password)
  print '.'
end
puts ''

puts "Creating foundations, needs and helps"
3.times do
  foundation = Foundation.find_by(name: Faker::Company.name)

  unless foundation
    foundation = Foundation.create(category: category, name: Faker::Company.name,
      available_tag_ids: available_tag_ids, mission: Faker::Lorem.paragraph(3), population: '25 people with...',
      start_date: Date.today - 2.years, certified: [true, false].sample, country: Faker::Lorem.words(1)[0], city:  Faker::Lorem.word)
    print 'f'
  end

  if foundation.needs.empty?
    3.times do
      need = foundation.needs.create description: Faker::Lorem.sentence, title: Faker::Lorem.words.join(' ')
      print 'n'

      3.times do
        need.helps.create description: Faker::Lorem.sentence,
          helper: User.all.sample
        print '.'
      end
    end
  end
end
puts ''

