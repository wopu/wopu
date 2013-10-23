
Mongoid.raise_not_found_error = false

def category; Category.all.sample end
def available_tag_ids; AvailableTag.all.sample(2).map(&:id) end

def password; '123123' end

Dir[Rails.root.join('db', 'sample_data', '**', '*.rb')].each do |file|
  unless File.directory? file
    load file
  end
end





