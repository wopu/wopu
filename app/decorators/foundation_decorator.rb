module FoundationDecorator
  def category_name
    category.try(:name)
  end

  def tags
    super.map(&:name).join ', '
  end
end
