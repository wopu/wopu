module NeedDecorator

  def status
    self.open ? 'Open' : 'Close'
  end
end