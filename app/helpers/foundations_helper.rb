module FoundationsHelper

  def can_manage?(foundation)
    foundation.user == current_user
  end
end
