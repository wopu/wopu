module FoundationDecorator
  def category_name
    category.try(:name)
  end
end
