module FoundationsHelper

  def can_manage?(foundation)
    foundation.user == current_user
  end

  def certified?(foundation)
    if foundation.certified
      content_tag(:span, nil, class: 'glyphicon glyphicon-check', title: 'Certified')
    else
      content_tag(:span, nil, class: 'glyphicon glyphicon-unchecked', title: 'Not certified')
    end
  end
end
