module FoundationDecorator
  def category_name
    category.try(:name)
  end

  def tags
    super.map(&:name).join ', '
  end

  def certified?
    if self.certified
      content_tag(:span, nil, class: 'glyphicon glyphicon-thumbs-up', title: 'Certified')
    end
  end
end
