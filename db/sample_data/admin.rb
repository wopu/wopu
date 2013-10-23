
email = 'admin@wopu.co'
password = '123123'

puts 'Creating admin@wopu.co pass: 123123'
unless Admin.find_by email: email
  Admin.create email: email, password: password
  print '.'
end
puts ''

