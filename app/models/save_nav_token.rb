module SaveNavToken
  def set_nav_token
    self.nav_token = name.parameterize
  end
end
